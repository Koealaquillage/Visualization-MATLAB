%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Scripts pour pouvoir plotter le fichier%
% recif.txt . Il semble être la bathym %
% Métrie de Ouano mais toutes les valeurs %
% Sont étranges. Par Guillaume Koenig %
% Le 22/11/2017 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Import des données %

Bathy=importdata('../DONNEES/recif.txt',',',0);

% Et plot %

figure ;

pcolor(Bathy');
shading flat;

xlabel('x25 m'); % Ca n'est pas une vraie unité
ylabel('x25m'); % Non plus

axis ij; % Pour inverser l'axe

caxis([0 200]);
colorbar;