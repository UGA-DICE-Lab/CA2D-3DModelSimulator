function [epthMat,epthTim]=eid2dead(epthMat,epthTim,wbcMat,P_eid)
szepth=size(epthMat);

[xs,ys,zs]= ind2sub(size(epthMat),find(epthMat>1));


celen=length(xs);
for cntrx=1:celen
    dumMat=wbcMat(xs(cntrx)-1:xs(cntrx)+1,ys(cntrx)-1:ys(cntrx)+1,zs(cntrx)-1:zs(cntrx)+1);
    wbcCnt=sum(sum(sum(dumMat==2)));
    P_comp=1-(1-rand(1)).^wbcCnt;
    if P_comp>=P_eid
       epthMat(xs(cntrx),ys(cntrx),zs(cntrx))=-1;
       epthTim(xs(cntrx),ys(cntrx),zs(cntrx))=0;
    end
end
end