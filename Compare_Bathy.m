%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script used to compare our bathymetry with  the %
% Bathymetry we actually use in our model %
% By Guillaume Koenig. The 21/11/2017 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Variables declaring

Ouano_name='../DONNEES/BathyOuano.txt';
Bathy_25m_name='../DONNEES/bathy_25m_recif_points.csv';
grd_name='../DONNEES/grd.nc'; 

% Importing data linked to the bathymetry map %

% Opening of the netcdf file %

Grid=netcdf(grd_name,'NoWrite');

Grid_data.lon=Grid{'lon_rho'}(:);
Grid_data.lat=Grid{'lat_rho'}(:);
Grid_data.Z=Grid{'h'}(:);

% Importing the data from other files %

Ouano=importdata(Ouano_name,';',1);

Ouano_data.lon=Ouano.data(:,2);
Ouano_data.lat=Ouano.data(:,3);
Ouano_data.Z=Ouano.data(:,4);

Bathy_25m=importdata(Bathy_25m_name,';',1);

Bathy_25m_data.lon=Bathy_25m.data(:,2);
Bathy_25m_data.lat=Bathy_25m.data(:,3);
Bathy_25m_data.Z=Bathy_25m.data(:,4);
 % Now we can plot  it %
figure;

plot(Grid_data.lon,Grid_data.lat,'r.');
hold on;
plot(Ouano_data.lon,Ouano_data.lat,'b.');
hold on;
plot(Bathy_25m_data.lon,Bathy_25m_data.lat,'g*');
hold off;

legend(['Grille de calcul'],[Ouano_name],[Bathy_25m_name]); % Non_functional for now

xlabel('Degrés Est');
ylabel('Degrés Nord');

disp('Sorry, the legend is not implemented correctly and does not work right now');