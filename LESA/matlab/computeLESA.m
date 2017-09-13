%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Author : Naveen Kumar
%%	Email : komathnk@usc.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%	Publication : Hull Detection Based on Largest Empty Sector Angle with application to analysis of real-time MR images, ICASSP 2014
%% 	Please cite the related ublication as follows
%%	@inproceedings{kumar2014largestanglehull,
%%	author = {Kumar, N., and Narayanan, S.S.},
%%	title = {Hull Detection Based on Largest Empty Sector Angle with application to analysis of real-time MR images},
%%	booktitle = {Acoustics, Speech and Signal Processing (ICASSP), 2014 IEEE International Conference on},
%%	year = {2014},}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function lesa=computeLESA(pts)

%Transforms a set of 2D points into their Largest Empty Sector Angle Representation

	N=size(pts,1);
	lesa=zeros(N,1);

	for i=1:N
		%Store the largest empty sector angle (LESA) corresponding to each point
		lesa(i)=largestAngle(pts,i)*180/pi;
	end



%Return the largest empty angular sector among the points pts around the point pts(idx)

function ang=largestAngle(pts,idx)

	N=size(pts,1);
	pt=pts(idx,:);
	pts(idx,:)=[];

	%Compute the angle from all other points to pts(idx)
	pts=pts-repmat(pt,N-1,1);
	%[theta,rho]=cart2pol(pts(:,1),pts(:,2));
	theta=atan2(pts(:,1),pts(:,2));

	theta_sorted=sort(theta);

	dtheta=diff(theta_sorted);
	dtheta=[dtheta;2*pi-theta_sorted(end)+theta_sorted(1)];

	%Find the largest gap in sorted angles
	ang=max(dtheta);
