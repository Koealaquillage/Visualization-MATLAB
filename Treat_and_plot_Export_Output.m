%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Script to import heavy data from Export_Output %
% And plot them as a color plot. The main issue  %
% Being that Export_Output contains 5 millions   %
% Points, making him extremely heavy to handle   %
% By Guillaume Koenig, the 21/11/2017 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Since the data are extremely dense, we have to define a density of data 
% because we are not able to import all of them
% We also have to define a precision of our plotting grid

dens=100; % We take one of point of data out of a hundred
prec=1e-3; % We work with the hundredth of a degree

% Importing data %

load('../DONNEES/Export_Output.mat'); % Reconstructed by Adrien

Ouano=importdata('../DONNEES/BathyOuano.txt',';',1); % Collected in-situ

Ouano_data.lon=Ouano.data(:,2);
Ouano_data.lat=Ouano.data(:,3);
Ouano_data.Z=Ouano.data(:,4);

% The data are called X,Y and H and correspond to longitude
% Latitude and height. In degrees East, North and meters respectively


% Now we create some vector to make a plottable grid %

 X_min=min(min(X));
 X_max=max(max(X));
 Y_min=min(min(Y));
 Y_max=max(max(Y));

X_vec=(X_min:prec:X_max);
Y_vec=(Y_min:prec:Y_max);

% We create our grid and interpolate our data on grid

[X_c,Y_c]=meshgrid(X_vec,Y_vec); % We create the grid

H_c=griddata(X(1:dens:end),Y(1:dens:end),H(1:dens:end),X_c,Y_c); % We interpolate H data on our grid

% We are going to suppress everything that corresponds to land by
% Putting it in NaN value
H_c(H_c>4.)=NaN;
% And at last, we plot it


figure;
pcolor(X_c,Y_c,H_c);
shading flat;
col=colorbar;
title(col,'Depth (m)');
xlabel('Longitude');
ylabel('Latitude');
caxis([-980 0]);

hold on;

% We can try to add the location of the data we collected

IS_data=plot(Ouano_data.lon,Ouano_data.lat,'b.');

legend(IS_data,'Collected data');