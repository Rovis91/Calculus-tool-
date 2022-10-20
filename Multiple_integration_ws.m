clear; close all; clc;


%test
f=@(x,y,z) x.*y.*z


bornes=[0 1;2 3;4 5]

xmin = -1;
xmax = 1;
ymin_2 = "-sqrt(1 - x.^2)";
ymin = "@(x)"+ymin_2;
ymin=str2func(ymin);
ymax = @(x) sqrt(1 - x.^2);
zmin = @(x,y)-sqrt(1 - x.^2 - y.^2);
zmax = @(x,y) sqrt(1 - x.^2 - y.^2);

q = integral3(f,xmin,xmax,ymin,ymax,zmin,zmax)


