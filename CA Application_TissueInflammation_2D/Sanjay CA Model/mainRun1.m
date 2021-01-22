%% Initialization
clear all;
close all;
clc;
tissueSz=[100 100 100];
infReg=[10 10 20 20 30 30];
wbcMaxNumb=100;
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

P_hc=0.6;
T_ce=2;
T_ei=4;
ThetaR=9;
gridSz=11;
P_hd=0.5;
N_hd=4;
P_eid=0.45;
P_dh=0.45;
T_limHrs=10;
Life_lim=20;
%% Simulation



for i=1:10
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
iterData{i}= layerFrm3D(epthMat,epthTim,wbcMat,wbcTim,ThetaR,P_hc,P_hd,N_hd,P_eid,P_dh,T_ce,T_ei,T_limHrs,gridSz,lifeWBC,Life_lim);

i
end
%% graphics
h1=figure;
h2=figure;
for i=1:10
epthMat=iterData{i}.epthMat;
wbcMat=iterData{i}.wbcMat;
graphicGen(epthMat(1:100,1:100,30),wbcMat,tissueSz,h1,h2);
pause(0.1)
end



