% Code de Cristèle pour reporter les coordonnées de zones sur une photo dont 
% les 4 coins ont été géolocalisés.

[lon,lat]=ginput(1);

Lat=[Lat;lat];Lon=[Lon;lon];Val=[Val;1];



Val_=griddata(Lon,Lat,Val,lon_,lat_);figure,pcolor(lon_,lat_,Val_),shading flat,caxis([0.9999 1.0001]),hold on,plot(AA(:,2),AA(:,3),'.k')
