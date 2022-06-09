function [ I,J ] = Dist_R2(Mat_1,Mat_2,X1,X2)
%Find the index of the closest grid point of a given position X1 or X2
%   Here we use to matrix of latitude and longitude. X1 and X2 represents
%   the position of our sensor in Lon/Lat coordinate and we want to locate
%   it. In order to achieve that we use a simple R2 metric

Dist_R2=(Mat_1-X1).*(Mat_1-X1)+(Mat_2-X2).*(Mat_2-X2);
[I,J]=find(Dist_R2==min(min(Dist_R2)));
end

