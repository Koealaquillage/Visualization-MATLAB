function fig_pcolor= display_bathy(Lon,Lat,Depth,title_fig,max_axis)
%display_bathy returns a pcolor map of a bathymetry
%   Lon,Lat,Depth represent respectively long, lat and depth
%   Max axis is a [min max] vector for the maximum
%   Depth we plot . Also we return the figure so that we can go on
%   Plotting masks on it

fig_pcolor=figure;
figure(fig_pcolor); % So we assign the figure and the rest will be plotted on it

pcolor(Lon,Lat,Depth);% We take the opposite because here
% we have measurements of altitude, not depth. So it has to be adapted to our situation

shading flat;% So that we clean up this awful interpolation

col=colorbar;
caxis(max_axis);

title(col,'Depth (m)');

title(title_fig);

xlabel('longitude');
ylabel('latitude');

hold on;

end