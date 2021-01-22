function [wbcMat,wbcTim,lifeWBC]=wbc2dead(wbcMat,wbcTim,lifeWBC,Life_lim)
    
[xs ys zs] = ind2sub(size(wbcMat),find(wbcMat == 2)); 


cntx=length(xs);

for cntr=1:cntx
   if lifeWBC(xs(cntr),ys(cntr),zs(cntr))==0
      lifeWBC(xs(cntr),ys(cntr),zs(cntr))=round(rand(1)*(Life_lim-1))+1;
   end
   if wbcTim(xs(cntr),ys(cntr),zs(cntr))>=lifeWBC(xs(cntr),ys(cntr),zs(cntr))
      wbcMat(xs(cntr),ys(cntr),zs(cntr))=0;
      wbcTim(xs(cntr),ys(cntr),zs(cntr))=0;
   end
    
    
    
    
    
    
end







end