%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In this script we vizualize discrepancies betwe%
% En the Bathymetry we received and in-situ data %
% Modified the 23/11/2017 (G. Koenig)            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% VARIABLES AND IMPORTING %%%%%%%%%%%%

% Load the data and the grid file %

Bathy_DATA=load('../DONNEES/Export_Output.mat');% Those data are superdense, so 
% We will have a little work to do with them later. It is also a structured
% data with X and Y and H being longitudes,latitudes and depth.
Bathy_Netcdf=netcdf('../DONNEES/grd.nc','NoWrite');

Bathy_Ouano=importdata('../DONNEES/BathyOuano.txt',';',1)

% figure and other data variables

Lon=Bathy_Netcdf{'lon_rho'}(:);
Lat=Bathy_Netcdf{'lat_rho'}(:);% We will plot all the bathys interpolated on the same grid

mask_u=Bathy_Netcdf{'u'}(:);
mask_v=Bathy_Netcdf{'v'}(:);
mask_p=Bathy_Netcdf{'psi'}(:);

mask_land=Bathy_Netcdf{'mask_rho'}(:);
mask_reef=Bathy_Netcdf{'mask_reef'}(:);

dens=100; % It is the density of values we want to extract from Export_Output.m

%%%%%% INTERPOLATING %%%%%%%%%%%%%%%%%%

% In every case, to make a plottable grid, we will interpolate on what we
% have in grid

Bathy_DATA.H_interp=griddata(Bathy_DATA.X(1:dens:end),Bathy_DATA.Y(1:dens:end),Bathy_DATA.H(1:dens:end),Lon,Lat);


%%%% VISUALIZATION %%%%%%%%%%%%%%%%%%%%

% And we visualize it
name='Interpolated in-situ bathymetry';
fig_bat_IS=display_bathy(Lon,Lat,-Bathy_DATA.H_interp,name,[-10 10]);

% Masks
mask_over_bathy(fig_bat_IS,Lon,Lat,mask_land,10);
hold on;
mask_over_bathy(fig_bat_IS,Lon,Lat,mask_reef,40);
hold on;

plot(Bathy_Ouano.data(:,2),Bathy_Ouano.data(:,3),'.r'); % We plot the locations of measurements