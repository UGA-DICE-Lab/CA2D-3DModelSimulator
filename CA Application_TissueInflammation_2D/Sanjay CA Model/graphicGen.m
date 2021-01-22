

% WBC check
function graphicGen(epthMat,tissueSz,h)

szepth=size(epthMat);

axes(h);
grid(h,'on');
h.XMinorGrid='on';
h.YMinorGrid='on';hold on;



% dead check
[deadX deadY]=find(epthMat==-1);
plot(0,0,tissueSz(1),tissueSz(2),deadX-1,deadY-1,'.k');hold on;


% inf Check
[infInitX infInitY]=find(epthMat==3);
plot(0,0,tissueSz(1),tissueSz(2),infInitX-1,infInitY-1,'.r');
% cont check
[contX contY]=find(epthMat==1);
plot(contX-1,contY-1,'.g');

% exp check
[expX expY]=find(epthMat==2);
plot(expX-1,expY-1,'.c');hold off;

end

%% Time
% Time Test
% [infInitX infInitY]=find(wbcTim>0);

% figure;plot(infInitX-1,infInitY-1,'.r');