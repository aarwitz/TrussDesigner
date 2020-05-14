function print_design()
% prints lengths of members and joint coodinates

load 'Design.mat'
[r,c] = size(C);

Lengths = get_lengths();
fprintf('\n')
for j = 1:c
    fprintf('member %d has length %.3f\n',j,Lengths(j));
end

fprintf('\n');
for i = 1:r
   fprintf('joint %d coordinate: %.2f,%.2f\n',i,X(i),Y(i));
end

fprintf('\n');
L_j = find(L~=0);

fprintf('load is at joint %d\n',L_j-r);


end