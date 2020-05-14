function move_joint(joint,magnitude,direction)
clf
load 'Design.mat'

dx = magnitude * cos(direction);
dy = magnitude * sin(direction);

X(joint) = X(joint) + dx;
Y(joint) = Y(joint) + dy;

save('Design.mat','C','Sx','Sy','X','Y','L')

main() %recursive call

end


