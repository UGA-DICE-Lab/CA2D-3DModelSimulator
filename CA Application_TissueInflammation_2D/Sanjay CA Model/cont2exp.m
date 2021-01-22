function [epthMat]=cont2exp(epthMat,epthTim,T_ce)

dumMat=epthMat==1;
dumTim=epthTim.*dumMat;


[dx,dy,dz]= ind2sub(size(dumTim),find(dumTim==T_ce));


lTotal=length(dx);
for lCnt=1:lTotal
   epthMat(dx(lCnt),dy(lCnt),dz(lCnt))=2; 
end
end