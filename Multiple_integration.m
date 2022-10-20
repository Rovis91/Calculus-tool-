clear; close all; clc;
syms x y z rho


%test
f=x*y*z

variables=[x,y,z]
bornes=[0 1;2 3;4 5]
inter=volume(f, variables, bornes)


%verification 
function verif=verification(arg,variables, bornes)
    if not(size(variables)==height(bornes))
        error("the number of bounds and variables must be equal")
    end
    switch arg
        case 2
            if not(size(variables)==2)
                error("Require double integration")
            end
    end
end

%Volume
function v=volume(f, variables, bornes)
    verification(2,variables, bornes)
    v=integration(f, variables, bornes)
end

%Masse 
function m=masse(density, variables, bornes)
    verification(2,variables, bornes)
    m=integration(density, variables, bornes)
end

%Moment (x and y)
function M=moment(density, variables, bornes, dimension)
    verification(2,variables, bornes)
    M=integration(dimension*density, variables, bornes)
end
%center of masse (x and y)
function c=center(density, variables, bornes, dimension)
    verification(2,variables, bornes)
    c=(moment(density, variables, bornes, dimension))/(masse(density, variables, bornes))
end

%Moment of inertia
function I=inertia(density, variables, bornes, dimension)
    verification(2,variables, bornes)
    if ~exist('dimension','var')
        dimension=(x.^2+y.^2)
    end
    I=integration((dimension.^2)*density, variables, bornes)
end
%Integration 
function f=integration(f, variables, bornes)
    for i=1:height(bornes)
        f=int(f,variables(i),bornes(i,1),bornes(i,2));
    end
end    