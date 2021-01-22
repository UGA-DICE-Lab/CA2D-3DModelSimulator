function [epthMat,epthTim]=eid2deadPatho(epthMat,epthTim,wbcMat,T_limHrs)

[xs,ys,zs]= ind2sub(size(epthMat),find(epthMat>1));

lenx=length(xs);


for cntr=1:lenx
   
    if epthTim(xs(cntr),ys(cntr),zs(cntr))>T_limHrs
       
        epthMat(xs(cntr),ys(cntr),zs(cntr))=-1;
        epthTim(xs(cntr),ys(cntr),zs(cntr))=0;
    end
    
    
    
    
end





end