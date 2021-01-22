%% Initialization
function mainRun(PathName,FileName)
clc;
load(strcat(PathName,FileName));
tissueSz=[xCoor yCoor zCoor];
infReg=[round(xCoor/2)-10 round(yCoor/2)-10 round(zCoor/2)-10 round(xCoor/2)+10 round(yCoor/2)+10 round(zCoor/2)+10];
wbcMaxNumb=wbcCnt;
epthMat=zeros(tissueSz);
epthTim=zeros(tissueSz);
wbcMat=zeros(tissueSz);
wbcTim=zeros(tissueSz);
lifeWBC=zeros(tissueSz);
% wbcInit
wbcX=round(rand(1,wbcMaxNumb)*(tissueSz(1)-1))+1;
wbcY=round(rand(1,wbcMaxNumb)*(tissueSz(2)-1))+1;
wbcZ=round(rand(1,wbcMaxNumb)*(tissueSz(3)-1))+1;
for wbcCnt=1:wbcMaxNumb
   wbcMat(wbcX(wbcCnt),wbcY(wbcCnt),wbcZ(wbcCnt))=1; 
end
% Infection Initialization
for infInitX=infReg(1):infReg(4)
    for infInitY=infReg(2):infReg(5)
        for infInitZ=infReg(3):infReg(6)
        epthMat(infInitX,infInitY,infInitZ)=3;
        end
    end
end

% Parameters
T_ce=exprssRte;
T_ei=infRte;
ThetaR=ThR;
gridSz=11;
T_limHrs=T_lim;
Life_lim=L_lim;
%% Simulation

h=waitbar(0,'Please Wait... Iterations in Progress');

for i=1:itrCnt
[wbcMat]=inact2act(wbcMat,epthMat,ThetaR);
[epthMat]=hel2cont(epthMat,P_hc);
[epthTim,wbcTim]=timeUpdate(epthMat,epthTim,wbcMat,wbcTim);
[epthMat]=cont2exp(epthMat,epthTim,T_ce);
[epthMat]=exp2inf(epthMat,epthTim,T_ei);
[epthMat]=hel2dead(epthMat,wbcMat,P_hd,N_hd);
[wbcMat,wbcTim]=wbcRandMove(wbcMat,wbcTim,gridSz);
[epthMat,epthTim]=eid2dead(epthMat,epthTim,wbcMat,P_eid);
[epthMat]=dead2hel(epthMat,P_dh);
[epthMat,epthTim]=eid2deadPatho(epthMat,epthTim,wbcMat,T_limHrs);
[wbcMat,wbcTim,lifeWBC]=wbc2dead(wbcMat,wbcTim,lifeWBC,Life_lim);
iterData{i}.epthMat=epthMat;
iterData{i}.wbcMat=wbcMat;
healCnt(i)=sum(sum(sum(epthMat==0)));
infCnt(i)=sum(sum(sum(epthMat==3)));
deaCnt(i)=sum(sum(sum(epthMat==-1)));
immCnt(i)=sum(sum(sum(wbcMat)==1))+sum(sum(sum(wbcMat)==2));
waitbar(i/itrCnt,h)
end
close(h);
clear h;
%%
save('TempReader.mat','PATHNAME','FILENAME');
save(strcat(PATHNAME,FILENAME));
Test1(1,PATHNAME,FILENAME);


