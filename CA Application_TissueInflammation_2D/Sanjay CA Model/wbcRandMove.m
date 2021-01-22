function [wbcMat,wbcTim]=wbcRandMove(wbcMat,wbcTim,gridSz)

[wx,wy,wz] = ind2sub(size(wbcMat),find(wbcMat == 1)); 

wbcMatold=wbcMat;
wbcTimOld=wbcTim;
wxold=wx;
wyold=wy;
wzold=wz;
ctWBCs=length(wx);
szWBC=size(wbcMat);



for cntWBCs=1:ctWBCs
shftx=round(rand(1).*(gridSz))-6;
shfty=round(rand(1).*(gridSz))-6;
shftz=round(rand(1).*(gridSz))-6;

if wx(cntWBCs)+shftx <1||wy(cntWBCs)+shfty <1||wz(cntWBCs)+shftz <1||wx(cntWBCs)+shftx >szWBC(1)||wy(cntWBCs)+shfty >szWBC(2)||wz(cntWBCs)+shftz >szWBC(3)
    if wx(cntWBCs)+shftx <1
       wx(cntWBCs)=szWBC(1)+(shftx+wx(cntWBCs));
    end
    if wy(cntWBCs)+shfty <1
        wy(cntWBCs)=szWBC(2)+(shfty+wy(cntWBCs));
    end
    if wz(cntWBCs)+shftz <1
        wz(cntWBCs)=szWBC(3)+(shftz+wz(cntWBCs));
    end
    
    if wx(cntWBCs)+shftx >szWBC(1)
       wx(cntWBCs)=shftx+wx(cntWBCs)-szWBC(1);
    end
    if wy(cntWBCs)+shfty >szWBC(2)
        wy(cntWBCs)=shfty+wy(cntWBCs)-szWBC(2);
    end
     if wz(cntWBCs)+shftz >szWBC(3)
        wz(cntWBCs)=shftz+wz(cntWBCs)-szWBC(3);
    end
else
    wx(cntWBCs)= wx(cntWBCs)+shftx;
    wy(cntWBCs)=wy(cntWBCs)+shfty;
    wz(cntWBCs)=wz(cntWBCs)+shftz;
end
end

for cntWBCs=1:ctWBCs
    wbcMat(wx(cntWBCs),wy(cntWBCs),wz(cntWBCs))=1;
    wbcMat(wxold(cntWBCs),wyold(cntWBCs),wzold(cntWBCs))=0;
    wbcTim(wxold(cntWBCs),wyold(cntWBCs),wzold(cntWBCs))=0;
    wbcTim(wx(cntWBCs),wy(cntWBCs),wz(cntWBCs))=wbcTimOld(wxold(cntWBCs),wyold(cntWBCs),wzold(cntWBCs));
    whos
end
















end