
%%% Truss design

% Connection matrix
C = ...
[1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
 1 0 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
 0 0 0 1 1 0 1 1 0 0 0 0 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 1 1 1 0 0 0 0 0 0 0 0 0;
 0 0 0 0 0 1 1 0 1 0 1 1 0 0 0 0 0 0 0;
 0 0 0 0 0 0 0 0 0 1 1 0 1 1 0 0 0 0 0;
 0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 1 0 0 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 1 1 0;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 1;
 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 1];


% Support matrix in X direction, j rows and 3 cols
Sx = ...
[1 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0];

%Support matrix in Y direction, j rows and 3 cols
Sy = ...
[0 1 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 0;
 0 0 1];

%Location vectors of joints, with orientation: (0,0) bottom left, below joint 1
X = [0 9 12.93 18 27 27.15 36.15 40 46 51 56];
Y = [10 10 .5707 10 10 -3 10 0 10 1 10];

% Load vector, known forces that act on each joint (2*j columns)
L = [0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;0;0;0;0;0];

save('Design.mat','C','Sx','Sy','X','Y','L')

