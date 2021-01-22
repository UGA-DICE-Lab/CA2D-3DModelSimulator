function [epthMat]=exp2inf(epthMat,epthTim,T_ei)

dumMat=epthMat==2;
dumTim=epthTim.*dumMat;
[dx dy dz]= ind2sub(size(dumTim),find(dumTim==T_ei));
lTotal=length(dx);
for lCnt=1:lTotal
   epthMat(dx(lCnt),dy(lCnt),dz(lCnt))=3; 
end



end