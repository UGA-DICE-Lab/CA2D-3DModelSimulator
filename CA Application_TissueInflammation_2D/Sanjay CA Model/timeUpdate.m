function [epthTim,wbcTim]=timeUpdate(epthMat,epthTim,wbcMat,wbcTim)
epthTim=(epthTim+1).*(epthMat~=0 & epthMat~=-1);
wbcTim=(wbcTim+1).*(wbcMat==2);
end

