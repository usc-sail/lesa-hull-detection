function idx=sortRadially(pts)
% Sort the point radially in a counter-clockwise direction about their center

center=mean(pts,1);
N=size(pts,1);
pts=pts-repmat(center,N,1);

theta=atan2(pts(:,1),pts(:,2));

[~,idx]=sort(theta);

%Adds the first point to the last to close loop while plotting
idx=[idx;idx(1)];
