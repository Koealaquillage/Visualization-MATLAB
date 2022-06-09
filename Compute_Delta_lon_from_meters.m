function Delta_lon = Compute_Delta_lon_from_meters(Distance,lat)
%Here we compute the variation in longitude for a displacement given in
% in the zonal direction. Lat is to be given in degrees
% By Guillaume Koenig, the 22/11/2017

a=6378137; % Size of semi-major axis of Earth
b=6356752;% Size of semi-minor axis of Earth

% Now we will compute the length corresponding to one degree at a given
% latitude

Ref_Len_Lon= pi/180*a*cos(atan(b/a*tan(lat*pi/180)));

% And now we divide

Delta_lon=Distance/Ref_Len_Lon;

end

