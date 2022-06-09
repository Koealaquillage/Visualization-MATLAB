%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In this script, we use a preexisting and compa %
% -tible CROCO grid file and we compare our data %
% From an external file in it. By Guillaume      %
% Koenig, the 22/11/2017                         %
% Display_bathy and mask_over_bathy are functions%
% External to this script                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Load the data and the grid file %

DATA=load('../DONNEES/Export_Output.mat');% Those data are superdense, so 
% We will have a little work to do with them later. It is also a structured
% data with X and Y and H being longitudes,latitudes and depth.
Bathy_Netcdf=netcdf('../DONNEES/grd.nc','NoWrite');

% figure and other data variables

Lon=Bathy_Netcdf{'lon_rho'}(:);
Lat=Bathy_Netcdf{'lat_rho'}(:);% We will plot all the bathys interpolated on the same grid

dens=100; % It is the density of values we want to extract from Export_Output.m

% In every case, to make a plottable grid, we will interpolate on what we
% have in grid

DATA.H_interp=griddata(DATA.X(1:dens:end),DATA.Y(1:dens:end),DATA.H(1:dens:end),Lon,Lat);

% To deal with some things, it will very quickly get easier to use masks.
% However, we will have to check if the mask strategy of the original grid.nc
% Is to put 0 at land or at sea
DATA.Land_Mask=zeros(size(DATA.H_interp));
DATA.reef_Mask=Bathy_Netcdf{'mask_reef'}(:);% We copy directly the mask we got in mask_reef, because, why not ?

%Now we have to treat the case above 0 meters. But since we have important
% tides and that corral reef, we will keep things up to 2 m just to see.
DATA.Land_Mask(DATA.H_interp>=0 & Bathy_Netcdf{'mask_reef'}(:)==0)=1;


%Modelled bathy
name='Model Bathy';
Model_bat=display_bathy(Lon,Lat,Bathy_Netcdf{'h'}(:),name,[0 50]);  

%Masks
mask_over_bathy(Model_bat,Lon,Lat,Bathy_Netcdf{'mask_rho'}(:),10);
hold on;
mask_over_bathy(Model_bat,Lon,Lat,40*Bathy_Netcdf{'mask_reef'}(:),40);
hold off;

% in situ interpolated on modelled's grid bathy
name='In-situ interpolated bathy';
In_situ_bat=display_bathy(Lon,Lat,-DATA.H_interp,name,[0 300]);

% Masks
mask_over_bathy(In_situ_bat,Lon,Lat,DATA.Land_Mask,10);
hold on;
mask_over_bathy(In_situ_bat,Lon,Lat,DATA.reef_Mask,40);
hold off

% I want to see the main discrepancies between the modelled bathy and the
% one from Adrien

name='Discrepancies between in-situ and modelled bathymetry';
Disc_bathy=display_bathy(Lon,Lat,-DATA.H_interp-Bathy_Netcdf{'h'}(:),name,[-50 50]);

%Masks
mask_over_bathy(Disc_bathy,Lon,Lat,DATA.Land_Mask,10);
hold on;
mask_over_bathy(Disc_bathy,Lon,Lat,40*DATA.reef_Mask,40);
hold off;

% Now I want to print a strong a beautiful bathy with the Masks of Fabien
% And the file of Adrien

name='In-situ bathymetry with Fabien masks';
Fab_bat=display_bathy(Lon,Lat,-DATA.H_interp,name,[0 300]);

% Masks
mask_over_bathy(Fab_bat,Lon,Lat,Bathy_Netcdf{'mask_rho'}(:),10);
hold on;
mask_over_bathy(Fab_bat,Lon,Lat,40*Bathy_Netcdf{'mask_reef'}(:),40);
hold off;

close(Bathy_Netcdf);