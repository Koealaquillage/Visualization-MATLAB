function mask_over_bathy(figure_bat,Lon,Lat,Mask,int)
%mask_over_bathy displays a contour around a mask 
%on a given bathymetry map. Intensity correspond
% To the equivalent intensity in depth you want to
% give your contour, so that you can distinguish
% land from corral reef for example

figure(figure_bat); % We set the figure we want

contourf(Lon,Lat,int*Mask);

end

