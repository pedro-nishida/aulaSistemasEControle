clc, close all, clear all;

%% parametros
l1= 1;
l2= 1.2;
b = 0.5;
m = 1.35;
g = 9.81;

J = m*l1^2;

x1_eq = 45*pi/180;

F = m*g*(l1/l2)*sin(x1_eq);

%% Linearização

A = [0,    1;
     -m*g*l1*cos(x1_eq)/J, -b/J];

B = [0;
     l2/J];

C = [1, 0;
     0, 1];

D = [0;
     0];

Gss = ss(A,B,C,D);

[num, den] = ss2tf(A,B,C,D);

Theta_s = tf(num(1,:),den);
Omega_s = tf(num(2,:),den);

