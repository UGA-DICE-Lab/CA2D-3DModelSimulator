function [iterDataRet] = layerFrm3D(epthMat,epthTim,wbcMat,wbcTim,ThetaR,P_hc,P_hd,N_hd,P_eid,P_dh,T_ce,T_ei,T_limHrs,gridSz,lifeWBC,Life_lim)
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
iterDataRet.epthMat=epthMat;
iterDataRet.wbcMat=wbcMat;
end