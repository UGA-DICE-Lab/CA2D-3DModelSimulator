function [epthMat]=dead2hel(epthMat,P_dh)


[xs,ys,zs]= ind2sub(size(epthMat),find(epthMat==-1));


lenxs=length(xs);

for cntrx=1:lenxs
   dumMat=epthMat(xs(cntrx)-1:xs(cntrx)+1,ys(cntrx)-1:ys(cntrx)+1,zs(cntrx)-1:zs(cntrx)+1);
   cntHeal=sum(sum(sum(dumMat==0)));
   P_cal=1-(1-rand(1)).^cntHeal;
   if P_cal>=P_dh
      
       epthMat(xs(cntrx),ys(cntrx),zs(cntrx))=0;
       
   end
   
    
    
    
end









end