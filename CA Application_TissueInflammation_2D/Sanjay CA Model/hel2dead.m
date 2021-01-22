function [epthMat]=hel2dead(epthMat,wbcMat,P_hd,N_hd)

szEpt=size(epthMat);


for xs=2:szEpt(1)-1
    for ys=2:szEpt(2)-1
       for zs=2:szEpt(3)-1 
        if epthMat(xs,ys,zs)==0
        dumMat= wbcMat(xs-1:xs+1,ys-1:ys+1,zs-1:zs+1);
        wbcCnt=sum(sum(sum(dumMat==2)));
        
        if wbcCnt>=N_hd 
            
           if rand(1)>P_hd
               epthMat(xs,ys,zs)=-1;
           end
               
            
        end
        
        end
        
        
    end
end
end






end