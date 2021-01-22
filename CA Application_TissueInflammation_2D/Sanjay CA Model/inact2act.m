function [wbcMat]=inact2act(wbcMat,epthMat,ThetaR)
szwbcMat=size(wbcMat);
[wx,wy,wz] = ind2sub(size(wbcMat),find(wbcMat == 1)); 
totalWBC=length(wx);
for cntWBC=1:totalWBC
    
        if wx(cntWBC)-1>0 && wx(cntWBC)+1<szwbcMat(1) && wy(cntWBC)-1>0 && wy(cntWBC)+1<szwbcMat(2) && wz(cntWBC)-1>0 && wz(cntWBC)+1<szwbcMat(3)
            
            dumMat=epthMat(wx(cntWBC)-1:wx(cntWBC)+1,wy(cntWBC)-1:wy(cntWBC)+1,wz(cntWBC)-1:wz(cntWBC)+1);
            dumMat=dumMat>1;
            szCells=sum(sum(sum(dumMat)));
            
            if szCells>0
                randMat=(rand(3,3,3)>rand(1));
                wbcMat(wx(cntWBC)-1:wx(cntWBC)+1,wy(cntWBC)-1:wy(cntWBC)+1,wz(cntWBC)-1:wz(cntWBC)+1)=randMat*2;
            end
       end    
   
end






end