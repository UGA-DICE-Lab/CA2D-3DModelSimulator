function [epthMat]=hel2cont(epthMat,P_hc)

szepthMat=size(epthMat);
for scanEpthX=2:szepthMat(1)-1
    for scanEpthY=2:szepthMat(2)-1
        for scanEpthZ=2:szepthMat(3)-1
            if epthMat(scanEpthX,scanEpthY,scanEpthY)==0
            epthSubMat=epthMat(scanEpthX-1:scanEpthX+1,scanEpthY-1:scanEpthY+1,scanEpthZ-1:scanEpthZ+1);
            infNSum=sum(sum(sum(epthSubMat==3)));
            P_h2c=1-((1-P_hc).^infNSum);
            P_rand=rand(1);
            if P_h2c>P_rand
             epthMat(scanEpthX,scanEpthY,scanEpthZ)=1;  
           end
        end
    end
end






end