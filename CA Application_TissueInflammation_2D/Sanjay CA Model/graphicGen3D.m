

% WBC check
function graphicGen(epthMat,wbcMat,tissueSz,h1,h2)
figure(h1);

grid on;hold on;


szepth=size(epthMat);
[wbcXInact wbcYInact wbcZInact] = ind2sub(size(wbcMat),find(wbcMat == 1)); 
plot3(wbcXInact-1,wbcYInact-1,wbcZInact-1,'.b');
[wbcXact wbcYact wbcZact] = ind2sub(size(wbcMat),find(wbcMat == 2)); 

plot3(wbcXact-1,wbcYact-1,wbcZact-1,'.r');
hold off;

figure(h2);
grid on;hold on;
% dead check

[deadX deadY deadZ]= ind2sub(size(wbcMat),find(wbcMat == -1)); 
plot3(0,0,0,tissueSz(1),tissueSz(2),tissueSz(3),deadX-1,deadY-1,deadZ-1,'.k');


% inf Check

[infInitX infInitY infInitZ]= ind2sub(size(wbcMat),find(epthMat == 3)); 

plot3(0,0,0,tissueSz(1),tissueSz(2),tissueSz(3),infInitX-1,infInitY-1,infInitZ-1,'.r');

% cont check
[contX contY contZ]= ind2sub(size(wbcMat),find(epthMat == 1));
plot3(contX-1,contY-1,contZ-1,'.g');

% exp check
[expX expY expZ]= ind2sub(size(wbcMat),find(epthMat == 2));
plot3(expX-1,expY-1,expZ-1,'.c');hold off;

end

%% Time
% Time Test
% [infInitX infInitY]=find(wbcTim>0);

% figure;plot(infInitX-1,infInitY-1,'.r');