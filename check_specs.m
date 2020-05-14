function check_specs()

load Design.mat
[r,c] = size(C);

% joint-to-joint span 9<L<16
Lengths = get_lengths();
if any(Lengths < 9)
    fprintf('Error: Member %d is too short\n',find(Lengths < 9));
elseif any(Lengths>16)
    fprintf('Error: Member %d is too long\n',find(Lengths > 16));
end

% Total cost <350
sum_lengths=sum(Lengths);
cost=10*r + sum_lengths;
if cost >= 350
    fprintf("Error: Truss costs too much\n");
end

%check M=2J-3
if c~=2*r-3
    disp('Error: M=2J-3 not satisfied');
end


% truss span: 56cm
% find truss endpoints
s1_i=0;
s2_i=0;
[sr,sc]=size(Sx);
for i = 1:sr
    if Sx(i,1) == 1
        s1_i=i;
    elseif Sy(i,3) == 1
        s2_i=i;
    end
end
Span = sqrt((X(s2_i)-X(s1_i))^2+(Y(s2_i)-Y(s1_i))^2);
if Span ~= 56
    fprintf("Error: Truss span not = 56\n");
end


% Load to pin joint span: 25-27cm +-.5cm
%This assumes pin joint is on left, at joint 1
%It is also not joint-to-joint distance but only horizontal distance
for i = 1:length(L)
    if L(i)==1
        i = i - r; % because L vector has both x and y componenents
        Length = sqrt((X(1)-X(i))^2);
        if Length < 24.5
            fprintf('Error: Distance from pin to load is too short\n');
        elseif Length > 27.5
            fprintf('Error: Distance from pin to load is too long\n');
        end
    end     
end
end