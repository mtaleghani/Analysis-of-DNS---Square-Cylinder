clear all;

mypath1=[pwd,'\Cyl22K\profiles']; %path of data files containing flow field variables at different axial locations.


%%%%%%%%%%%%%%%%%%%%%%%%
% 1-Example of profile plots
%%%%%%%%%%%%%%%%%%%%%%%%

filename='Cyl22K_x150'; %file containing flow field variables.
A=readtable(fullfile(mypath1,filename),'Delimiter', 'space','HeaderLines', 2, 'ReadVariableNames', false); %read the profiles data into the matrix A

%% plot for different xs
 
x=A.Var1;y=A.Var2;u=A.Var3;v=A.Var4;p=A.Var5;uu=A.Var6;vv=A.Var7;ww=A.Var8;uv=A.Var9;eps=A.Var10; % assign an intuitive variable to each column of the matrix A
Dx=0.5*(circshift(x,-1)-circshift(x,1));Dx(1)= Dx(2); Dx(end)= Dx(end-1); %size of control volumes in x-direction % here the first and last elements of Dx or Dy may be
% negative values. therefore we equate them to their neighboring cell's value.
% positive value of Dx and Dy.
% by using array shift function rather than for loops, we save
% computational expense.
Dy=0.5*(circshift(y,-1)-circshift(y,1));Dy(1)= Dy(2); Dy(end)= Dy(end-1); %size of control volumes in y-direction
figure(1)
plot(u,y,'LineWidth',1.1)
ylabel('y');
xlabel('<u>')
title('Horizontal velocity profiles');
hold on
legend('x = 0.0' , 'x = 1.5' , 'x = 0.5' ,'x = -0.5')


figure(2)
plot(uu,y,'LineWidth',1.1)
ylabel('y');
xlabel('<u''u''>')
title('Stream-Wise Normal Reynolds Stress');
hold on
legend('x = 0.0' , 'x = 1.5' , 'x = 0.5' , 'x = -0.5')

figure(3)
plot(vv,y,'LineWidth',1.1)
ylabel('y');
xlabel('<v''v''>')
title('Cross-Stream Normal Reynolds Stress');
hold on
legend('x = 0.0' ,'x = 1.0' , 'x = 0.5' ,'x = -0.5')

figure(4)
plot(ww,y,'LineWidth',1.1)
ylabel('y');
xlabel('<w''w''>')
title('Span-Wise Normal Reynolds Stress');
hold on
legend('x = 0.0' , 'x = 1.0' , 'x = 0.5' ,'x = -0.5')

figure(5)
plot(uv,y,'LineWidth',1.1)
ylabel('y');
xlabel('<u''v''>')
title('Shear Reynolds Stress');
hold on
legend('x = 0.0' , 'x = 1.0' , 'x = 0.5' ,'x = -0.5')

nu=1/22000; %kinematic viscosity L=1 U=1 Re=UL/nu=22000

% plot the ratio of the CROSS-STREAM grid spacing to the Kol scale
figure(6)
Kol=(nu^3./abs(nu*eps)).^0.25; %Kolmogorov length scale
plot(Dy./Kol,y,'LineWidth',1.1)
ylabel('y');
xlabel('\Delta_y/kol')
title('Ratio between cross-stream grid spacing and Kolmogorov length scale');
hold on
legend('x = 0.0' , 'x = 1.0' , 'x = 0.5' , 'x = -0.5')

%% plot for different ys

x=A.Var1;y=A.Var2;u=A.Var3;v=A.Var4;p=A.Var5;uu=A.Var6;vv=A.Var7;ww=A.Var8;uv=A.Var9;eps=A.Var10; % assign an intuitive variable to each column of the matrix A
Dx=0.5*(circshift(x,-1)-circshift(x,1));Dx(1)= Dx(2); Dx(end)= Dx(end-1); %size of control volumes in x-direction % here the first and last elements of Dx or Dy may be
% negative values. therefore we equate them to their neighboring cell's value.
% positive value of Dx and Dy.
% by using array shift function rather than for loops, we save
% computational expense.
Dy=0.5*(circshift(y,-1)-circshift(y,1));Dy(1)= Dy(2); Dy(end)= Dy(end-1); %size of control volumes in y-direction
% here the first and last elements of Dx or Dy may be
% negative values. therefore we set any negative value to the smallest
% positive value of Dx and Dy.
% by using array shift function rather than for loops, we save
% computational expense.

figure(1)
plot(x,v,'LineWidth',1.1)
xlabel('x');
ylabel('<v>')
title('Vertical Velocity Profiles');
hold on
legend('y = -1.0','y = -0.5', 'y = 0.0' , 'y = 0.5','y = 1.0')


nu=1/22000; %kinematic viscosity L=1 U=1 Re=UL/nu=22000

% plot the ratio of the STEAM-WISE grid spacing to the Kol scale
figure(2)
Kol=(nu^3./abs(nu*eps)).^0.25; %Kolmogorov length scale
plot(x,Dx./Kol,'LineWidth',1.1)
xlabel('x');
ylabel('\Delta_x/kol')
title('Ratio between stream-wise grid spacing and Kolmogorov length scale');
hold on
legend('y = -1.0','y = -0.5', 'y = 0.0' , 'y = 0.5','y = 1.0')


%% Contour plots 

mypath2='D:\College\References 98\1.EMJMD\1. 2023-2024 01\Turbulence Modeling\My\Assignment 2\Cyl22K\XYsection'; %your path of data files


%%%%%%%%%%%%%%%%%%%%%%%%
% 2-Example of 2D average field plot
%%%%%%%%%%%%%%%%%%%%%%%%

filename='Cyl22K_XY.dat';
B=readtable(fullfile(mypath2,filename),'Delimiter', 'space','HeaderLines', 3, 'ReadVariableNames', false);
x=B.Var1;y=B.Var2;u=B.Var3;v=B.Var4;w=B.Var5;p=B.Var6;uu=B.Var7;vv=B.Var8;ww=B.Var9;uv=B.Var10;eps=B.Var11;
XY=[((1:size(x))'),x,y]; XYsortbyX=sortrows(XY,2); XYsortbyY=sortrows(XY,3);
%Size of control volumes in x-direction:
Dx=0.5*(circshift(XYsortbyY(:,2),-1)-circshift(XYsortbyY(:,2),1));Dx(Dx<0)=min(abs(Dx)); 
auxDx=sortrows([XYsortbyY(:,1),XYsortbyY(:,2),Dx],1);Dx=auxDx(:,3);
%Size of control volumes in y-direction:
Dy=0.5*(circshift(XYsortbyX(:,3),-1)-circshift(XYsortbyX(:,3),1));Dy(Dy<0)=min(abs(Dy)); 
auxDy=sortrows([XYsortbyX(:,1),XYsortbyX(:,2),Dy],1);Dy=auxDy(:,3);

% creating meshgrid
res=1000; %linspace resolution
numlevel=20; %number of contour levels
xv=linspace(min(x),max(x),res); 
yv=linspace(min(y),max(y),res); 
[X,Y] = meshgrid(xv,yv);

figure(3)
quiver(x,y,u,v);
axis equal;
title('Average velocity field');

figure(4)
VOL = griddata(x,y,Dx.*Dy,X,Y);
contourf(X,Y,VOL,numlevel);
axis equal
title('Volumes');
contourcbar

figure(5)
K = griddata(x,y,u.^2+v.^2,X,Y); % here, <w> is neglected since w averages around 0 in this setup of simulation
contourf(X,Y,K,numlevel);
axis equal
title('Kinetic energy of the average velocity field');
contourcbar

figure(6)
Kt = griddata(x,y,uu+vv+ww,X,Y);
contourf(X,Y,Kt,numlevel);
axis equal
title('Average turbulent kinetic energy');
contourcbar

%% Lift and Drag 

mypath2='D:\College\References 98\1.EMJMD\1. 2023-2024 01\Turbulence Modeling\My\Assignment 2\Cyl22K\dynamics'; %your path of data files


%%%%%%%%%%%%%%%%%%%%%%%%
% 2-Example of 2D average field plot
%%%%%%%%%%%%%%%%%%%%%%%%

filename='Cyl22K_drag_and_lift';
B=readtable(fullfile(mypath2,filename),'Delimiter', 'space','HeaderLines', 2, 'ReadVariableNames', false);
t=B.Var2;D=B.Var4;L=B.Var5;
figure(7)
title('Time Evolution of Lift and Drag Coefficient')
yyaxis left
plot(t,L)
ylabel('C_L')
xlabel('time (s)')

yyaxis right
plot(t,D)
ylabel('C_D')
