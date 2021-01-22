% rng(1,'twister');
% s=rng;
clear;
clc;
clf;

%%%%%%%
%strain levels
strain=0.5;%Ns
initialPopulation= 0.5; %ratio of healthy to damaged cells


%%%%%% dimensions of box
xdim=20;
ydim=20;
zdim=20;
totaltime=5;
timestep=1;
%%%% grid size in the min box dimension
griddim=10;

%%%%% grid dimensions
griddimx=xdim/griddim;
griddimy=ydim/griddim;
griddimz=zdim/griddim;
[val,pos]=min([griddimx,griddimy,]);

%%%%% build grid
xx=0:val:xdim;
yy=0:val:ydim;
zz=0:val:zdim;
xloop=size(xx);
yloop=size(yy);
zloop=size(zz);

%%%%% build grid centres
for ii=2:xloop(2)
    xx1(ii-1)=((xx(ii)-xx(ii-1))/2)+xx(ii-1);
end

for ii=2:yloop(2)
    yy1(ii-1)=((yy(ii)-yy(ii-1))/2)+yy(ii-1);
end

for ii=2:zloop(2)
    zz1(ii-1)=((zz(ii)-zz(ii-1))/2)+zz(ii-1);
end

%%%% build cube
count=1;
for ii=1:xloop(2)-1
    for jj=1:yloop(2)-1
        for kk=1:zloop(2)-1
            cube3d(:,:,count)=[xx1(ii) yy1(jj) zz1(kk)];
            cube3dleft(:,:,count)=[xx1(ii)-xdim yy1(jj) zz1(kk)];
            cube3dright(:,:,count)=[xx1(ii)+xdim yy1(jj) zz1(kk)];
            cube3dtop(:,:,count)=[xx1(ii) yy1(jj)+ydim zz1(kk)];
            cube3dbottom(:,:,count)=[xx1(ii) yy1(jj)-ydim zz1(kk)];
            cube3dfront(:,:,count)=[xx1(ii) yy1(jj) zz1(kk)-zdim];
            cube3dback(:,:,count)=[xx1(ii) yy1(jj) zz1(kk)+zdim];
            count=count+1;
        end
    end
end

cubePeriodic=cat(3,cube3d,cube3dleft,cube3dright,cube3dtop,cube3dbottom,cube3dfront,cube3dback);

%%%% find neighbours of each cube
neighbours=zeros(26*7,count-1);

for ii=1:count-1
    centre=cube3d(:,:,ii);
    counter2=1;
    countnow=0;
    %addnew=0;
    for jj=1:(count-1)*7
        kk=jj-(count-1)*countnow;%+addnew;
        if kk~=ii
            cubeNow=cubePeriodic(:,:,jj);
            distance1=sqrt((cubeNow(1)-centre(1))^2 + (cubeNow(2)-centre(2))^2 + (cubeNow(3)-centre(3))^2);
            if distance1<= sqrt(3)*val
                neighbours(counter2,ii)=kk;
                counter2=counter2+1;
            end
        end
        
        if rem(jj,count-1)==0
            countnow=countnow+1;
        end
        
    end
end

%%%% STRAIN LEVELS
stra=strain+strain*rand(1,count-1);


%%% CA RULES
Texpress=2*60*60; %seconds
Tinfecteous=4*60*60; % seconds
Nd=4;
Lac=20*60*60;%seconds immune cell life span
tethaR=9;
P1i=rand;
P1h=0.45;
P1p=0.45;
Pd=0.5;
Pk=0.6;
P1s=0.3;%strain probability

%%%% initialize immune cell states
cellStates=randi(7,1,count-1);
%currentcellStates=zeros(1,count-1);
currentcellStates=cellStates;
timecount=ones(1,count-1).*timestep;
immuneState=randi(3,1,count-1);



for ii=timestep:timestep:totaltime
    
    
    for jj=1:count-1
        
        healthy=0;
        containing=0;
        infecteous=0;
        expressing=0;
        damaged=0;
        dead=0;
        immune=0;
        
        
        neighb=neighbours(:,jj);
        neighb1=neighb(neighb~=0);
        counter3=size(neighb1);
        
        for kk=1:counter3(1)
            
            cellState1=cellStates(neighb1(kk));
            
            if cellState1==1
                healthy=healthy+1;
            elseif cellState1==2
                containing=containing+1;
            elseif cellState1==3
                infecteous=infecteous+1;
            elseif cellState1==4
                expressing=expressing+1;
            elseif cellState1==5
                damaged=damaged+1;
            elseif cellState1==6
                dead=dead+1;
            elseif cellState1==7
                immune=immune+1;
            end
            
        end %for kk=1:counter3(1)
        
        
        %%% RULE 1
        P1=1-(1-P1i)^infecteous;
        
        %%% RULE 5
        Pp=1-(1-P1p)^immune;
        
        %%% RULE 6
        Ph=1-(1-P1h)^healthy;
        
        %%% RULE 1 strain
        Ps=1-(1-P1s)^strain;
        
        implement=1; % execute only one rule for each time step
        
        if cellStates (jj)==1 % healthy
            
            %%%% RULE 1
            contain=rand;
            if contain<=P1
                currentcellStates(jj)=2;
                timecount(jj)=timestep;
                implement=0;
            end
            
            %%% RULE 4
            if implement==1
                damed=rand;
                if immune>=Nd && damed<=Pd
                    currentcellStates(jj)=5;
                    timecount(jj)=timestep;
                end
            end
            
            %%% STRAIN
            strainKill=rand;
            if Ps<strainKill
                currentcellStates(jj)=5;
                timecount(jj)=timestep;
            end
            
        elseif cellStates (jj)==2 % containing
            
            %%% RULE 2
            %timecount(jj)=timecount(jj)+timestep;
            if timecount(jj)>=Texpress
                currentcellStates(jj)=4;
                timecount(jj)=timestep;
            end
            
            %%% STRAIN
            strainKill=rand;
            if Ps<strainKill
                currentcellStates(jj)=5;
                timecount(jj)=timestep;
            end
            
        elseif cellStates (jj)==3 % infecteous
            
            %%%% RULE 5
            death=rand;
            if Pp < death
                currentcellStates(jj)=6;
                timecount(jj)=timestep;
                implement=0;
            end
            
            %%% RULE 7
            if implement==1 && timecount(jj)>=2*60*60 % two hours
                if Pk < death
                    currentcellStates(jj)=6;
                    timecount(jj)=timestep;
                    implement=0;
                end
            end
            
        elseif cellStates (jj)==4 % expressing
            
            %%% RULE 3
            %timecount(jj)=timecount(jj)+timestep;
            if timecount(jj)>=Tinfecteous
                currentcellStates(jj)=3;
                timecount(jj)=timestep;
                implement=0;
            end
            
            %%%% RULE 5
            if implement==1
                death=rand;
                if Pp < death
                    currentcellStates(jj)=6;
                    timecount(jj)=timestep;
                end
            end
            
            %%% STRAIN
            strainKill=rand;
            if Ps<strainKill
                currentcellStates(jj)=5;
                timecount(jj)=timestep;
            end
            
        elseif cellStates (jj)==5 % damaged
            
            %%%% RULE 5
            death=rand;
            if Pp < death
                currentcellStates(jj)=6;
                timecount(jj)=timestep;
            end
            
        elseif cellStates (jj)==6 % dead
            
            %%%% RULE 6
            health=rand;
            if Ph< health
                currentcellStates(jj)=1;
                timecount(jj)=timestep;
            end
            
        elseif cellStates (jj)==7 % activated immune
            
            %%% RULE 7
            if (expressing>1 || infecteous>1) && immuneState(jj)==2
                
                if expressing>1
                    
                    for kk=1:counter3(1)
                        
                        cellState1=cellStates(neighb1(kk));
                        
                        if cellState1==4
                            currentcellStates(neighb1(kk))=6;
                        end
                        
                    end %for kk=1:counter3(1)
                    
                end
                
                if infecteous>1
                    
                    for kk=1:counter3(1)
                        
                        cellState1=cellStates(neighb1(kk));
                        
                        if cellState1==3
                            currentcellStates(neighb1(kk))=6;
                        end
                        
                    end %for kk=1:counter3(1)
                end
                
            end
            %%%%%%%%%%%
            
            %RULE 8
            
            if immuneState(jj)==1
                if infecteous>0 || expressing>0 || damaged>0;
                    cellsRecruited=counter3+1;
                    while cellsRecruited>counter3
                        cellsRecruited=randi(tethaR,1,1)-1;
                    end
                    for kk1=1:1:cellsRecruited
                        currentcellStates(neighb1(kk1))=7;
                        immuneState(jj)=2;
                    end
                end
            end
            
        end%cellStates (jj)==1
        
        
        if  currentcellStates(jj)==cellStates (jj) % track time of each cell in current state
            timecount(jj)=timecount(jj)+timestep;
        end
        
        %%% RULE 7
        if timecount(jj)>=Texpress+Tinfecteous+60*60 %seconds
            currentcellStates(jj)=6;
        end
        
        %%%% RULE 9
        if cellStates(jj)==7 && immuneState(jj)==2 && timecount(jj)>=Lac %seconds
            immuneState(jj)=3;
        end
        
    end%for jj=1:count-1
    
    % swap cell states
    cellStates=currentcellStates;
    
    %%%Immune cell marching
    for jj=1:count-1
        if cellStates(jj)==7
            neighb=neighbours(:,jj);
            neighb1=neighb(neighb~=0);
            counter3=size(neighb1);
            swapPos=randi(counter3(1),1,1);
            for kk=1:1:counter3(1)
                if neighb(kk)==swapPos;
                    dummy=cellStates(swapPos);
                    dummy2=immuneState(swapPos);
                    cellStates(swapPos)=7;
                    immuneState(swapPos)=immuneState(jj);
                    cellStates(jj)=dummy;
                    immuneState(jj)=dummy2;
                end
            end
        end
    end
    
    colour=lines(9);
    % draw the cell states
    for kolor=1:count-1
        drawPoint3d(cube3d(:,:,kolor),'MarkerFaceColor',colour(cellStates(kolor),:),'MarkerEdgeColor',colour(cellStates(kolor),:),'EraseMode','normal');
        hold on;
    end
    view(3);
    axis([0 xdim 0 ydim 0 zdim]);
    drawnow
    hold off
    
end %for ii=1:timestep:totaltime


