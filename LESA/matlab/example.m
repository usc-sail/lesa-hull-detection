%Demo of hull detection on a sample image

img=imread('hand.png');
img=~im2bw(img,graythresh(img));

[ptsr,ptsc]=find(img);
pts=[ptsr ptsc];
lesa=computeLESA(pts);

lesa_img=zeros(size(img));

for i=1:length(ptsr)
	lesa_img(ptsr(i),ptsc(i))=lesa(i);
end

subplot(221);
imagesc(img);
title('Image');

%Show the largest empty sector angle representation
subplot(222);
imagesc(lesa_img);
colorbar;
title('LESA(\theta)');


%Threshold LESA at 180 degree to get convex hull
th=180;
pts_convex=pts(lesa>th,:);
subplot(223);
idx=sortRadially(pts_convex);
imagesc(img);hold on;
plot(pts_convex(idx,2),pts_convex(idx,1),'r*-');hold off;
title('\theta>180^\circ');



%Threshold at a different angle now
th=190;
pts_th=pts(lesa>th,:);
subplot(224);
idx=sortRadially(pts_th);
imagesc(img);hold on;
plot(pts_th(idx,2),pts_th(idx,1),'r*-');hold off;
title('\theta>190^\circ');
