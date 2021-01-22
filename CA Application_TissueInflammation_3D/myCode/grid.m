% rng(1,'twister');
% s=rng;
clear;
clc;
clf;
%%%%%% dimensions of box
xdim=50;
ydim=100;
zdim=150;
totaltime=20;
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
            count=count+1;
        end
    end
end

%%%% find neighbours of each cube
neighbours=zeros(26,count-1);

for ii=1:count-1
    centre=cube3d(:,:,ii);
    counter2=1;
    for jj=1:count-1
        if jj~=ii
            cubeNow=cube3d(:,:,jj);
            %             drawCube([cubeNow val]);
            %             hold on
            distance1=sqrt((cubeNow(1)-centre(1))^2 + (cubeNow(2)-centre(2))^2 + (cubeNow(3)-centre(3))^2);
            if distance1<= sqrt(3)*val%2*sqrt((sqrt(3)*val)^2-(0.5*val)^2)%sqrt(3)*val %diagonal of a cube (sqrt(3)*a)
                neighbours(counter2,ii)=jj;
                counter2=counter2+1;
            end
        end
    end
end

%%% CA RULES
Texpress=2*60*60; %seconds
Tinfecteous=4*60*60; % seconds
Nd=4;
Lac=20*60*60;%seconds
tethaR=9;
P1i=rand;
P1h=0.45;
P1p=0.45;
Pd=0.5;
Pk=0.6;

%%%% initialize cell states
cellStates=randi(6,1,count-1);
currentcellStates=zeros(6,1,count-1);

for ii=1:timestep:totaltime
    
    for jj=1:count-1
        
        healthy=0;
        containing=0;
        infecteous=0;
        expressing=0;
        damaged=0;
        dead=0;
        immune=0;
        
        if ii~=jj
            
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
            
        end %ii~=jj
        
        %%% RULE 1
        P1=1-(1-P1i)^infecteous;
        
        %%% RULE 5
        Pp=1-(1-P1p)^immune;
        
        %%% RULE 6
        Ph=1-(1-P1h)^healthy;
        
        if cellStates (ii)==1 % healthy
            
            contain=rand;
            if contain<=P1
                currentcellStates(ii)=2;
            end
            
            damed=rand;
            if immune>=Nd && damed<=Pd
                currentcellStates(ii)=5;
            end
            
        elseif cellStates (ii)==2 % containing
            
        elseif cellStates (ii)==3 % infecteous
            death=rand;
            if Pp < death
                currentcellStates(ii)=6;
            end
        elseif cellStates (ii)==4 % expressing
            death=rand;
            if Pp < death
                currentcellStates(ii)=6;
            end
        elseif cellStates (ii)==5 % damaged
            death=rand;
            if Pp < death
                currentcellStates(ii)=6;
            end
        elseif cellStates (ii)==6 % dead
            health=rand;
            if Ph< health
                currentcellStates(ii)=1;
            end
        elseif cellStates (ii)==7 % activated immune
            
        end%cellStates (ii)==1
        
    end%for jj=1:count-1
    
end %for ii=1:timestep:totaltime
