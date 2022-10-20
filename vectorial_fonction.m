clear; close all; clc;
syms t

prompt = "Give the function \n";

r = input(prompt);

%Results
Derivate=derivate(r)
T=utv(r)
Arc_length_function=alf(r)
k=curvature(r)
Principal_Unit_Vector=pun(r)
Binormal_Vector=bv(r)

fplot3(r(1),r(2),r(3),[0 100]);
% hold on
% fplot3(Derivate(1),Derivate(2),Derivate(3));
% hold off
% text_title='x='+r(1)+'y='+r(2)+'z='+r(3);
% title(text_title)
% xlabel('x');
% ylabel('y');
% zlabel('z');


%Find definition and limits of a vectorial function (r)
function [l1,l2]=limits(f)    
l1 = limit(f, x, -inf);
l2 = limit(f, x, inf);
end

%Find the interaction of two function (function_1, function_2)
% check fzero

%Derivate of a vectorial function (r)
function dr_vector = derivate(vector)
    for i=1:length(vector)
        dr_vector(i)=diff(vector(i));
    end
    dr_vector=simplify(dr_vector);
end
%Unit tangeant vector (r,t)
function utv=utv(r,t)
    dr=derivate(r);
    utv=dr/len_pt(dr);
    utv=simplify(utv);
end
%Lenght of a vector at a point  (r,t)
function lenght_pt=len_pt(vector,t)
    S=0;
    for i=1:length(vector)
        S=S+(vector(i))^2;
    end
    lenght_pt=sqrt(S);
    lenght_pt=simplify(lenght_pt);
end
%Lenght of a vector between two points(r,a,b)
function lenght_vector=len(vector, a, b)
    S=0;
    dr_vector=derivate(vector);
    for i=1:length(dr_vector)
        S=S+(dr_vector(i))^2;
    end
    S=sqrt(S);
    lenght_vector=int(S, a, b);
end
%Arc length function (r)
function alf = alf(r)
    alf=int(len_pt(derivate(r)));
    alf=simplify(alf);
end
%Curvature of C (r)
function k=curvature(r)
    k=len_pt(derivate(utv(r)))/len_pt(derivate(r));
    k=simplify(k);
end
%Principal Unit Vector
function pun=pun(r)
    T_drv=derivate(utv(r));
    pun=T_drv/len_pt(T_drv);
    pun=simplify(pun);
end
%Binormal Vector
function bv=bv(r)
    bv=utv(r).*pun(r);
    bv=simplify(bv);
end