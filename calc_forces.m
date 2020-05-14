function [force_identifiers,forces] = calc_forces()

load 'Design.mat'

% Algorithm for creating A matrix (expressions of unit vectors in direction
% of the members connecting joints
[r,c] = size(C);
A = zeros(2*r,c+3);
for i = 1:r
    for j = 1:c
        if C(i,j)==1
            for k = 1:r
                if k~=i && C(k,j)==1
                    r_vect=sqrt((X(k)-X(i))^2+(Y(k)-Y(i))^2);
                    A(i,j)=(X(k)-X(i))/r_vect;
                    A(i+r,j)=(Y(k)-Y(i))/r_vect;
                end
            end
        end
    end            
end
% Support forces
m = c; % assign m to be number of members, to allow for new indexing values
[r,c] = size(Sx);
for i = 1:r
    for j = 1:c
        if Sx(i,j) == 1
            A(i,j+m) = 1;
        elseif Sy(i,j) == 1
            A(i+r,j+m) = 1;
        end
    end
end


% Solving for the forces by inverting A
T = A\L;

% Retrieving lengths of each member
Lengths = get_lengths();

% Using the formula (straw buckling strength as a function of straw length)
SR = zeros(1,m);
for i = 1:m
    if sign(T(i))==-1
        F_buckling = 1400/(Lengths(i))^2;
        SR(i) = T(i)/F_buckling;
    else %if in tension, not relevant to max load calculation
        SR(i)=0;
    end
end
F_failure = 1/max(abs(SR));
Failed_member_index = find(abs(SR)==max(abs(SR)));


% Calculating Cost of Trusss
[joints,c]=size(C);
cost=10*joints + sum(Lengths);

% Calculating Theoretical max load/cost ratio in N/$
LoadCostratio=F_failure/cost;



% Below is formatting and output printing

% Formatting to 3 sig-figs
for i = 1:length(T)
    T(i)=round(T(i),3,'significant');
    if abs(T(i)) < .0001  %Sometimes matlab inputs very small numbers rather than 0
        T(i)=0;
    end
end


% Force identifiers in same order as columns in A
Force_identifiers = cell(1,m+3);
for i = 1:m+3
    if i <= m
        Force_identifiers(i)={sprintf('m%d',i)};
    end
    Force_identifiers(m+1)={'Sx1'};
    Force_identifiers(m+2)={'Sy1'};
    Force_identifiers(m+3)={'Sy2'};
end

fprintf('\n');
fprintf('Updated truss info\n');
fprintf('Cost of truss: $%.0f\n',cost)

fprintf('Theoretical max load/cost ratio in N/$: %.4f\n',LoadCostratio)

%Printing which member fails first
fprintf('Members to fail first:');
fprintf(' %s',Force_identifiers{Failed_member_index});
fprintf('\n');

force_identifiers=Force_identifiers;
forces=T;
end