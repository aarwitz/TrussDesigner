function Lengths = get_lengths()

load Design.mat

[r,c] = size(C);
Lengths = zeros(1,c);
for j = 1:c
    for i = 1:r
        if C(i,j) == 1
            for k = 1:r
                if C(k,j) == 1 && k~=i
                    Lengths(j) = round(sqrt((X(k)-X(i))^2+(Y(k)-Y(i))^2),3,'significant');
                end
            end
        end
    end
end

end