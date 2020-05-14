

function graphics(force_identifiers,Forces)

figure(1);
clf;
figure(2);
clf;

load 'Design.mat'

[r,c] = size(C);



figure(1)
%plot joints
plot(X,Y,'*');

txt = sprintf("Compression");
text(49,-3,txt,'Color','red');
txt = sprintf("Tension");
text(49,-3.5,txt,'Color','blue');
txt = sprintf("Zero-Force");
text(49,-4,txt,'Color','black');


%plot members
hold on
for i = 1:r
    % Labeling members
    txt = sprintf("    J%d",i);
    text(X(i)-.8,Y(i)+.5,txt);
    for j = 1:c
        if C(i,j)==1
            for k = 1:r
                if k~=i && C(k,j)==1
                    % Labeling members
                    midpointx = (X(i)+X(k))/2;
                    midpointy = (Y(i)+Y(k))/2;
                    txt = sprintf("  M%d",j);
                    text(midpointx-.8,midpointy+.5,txt);
                    
                    %%% Member code colors
                    % Members in compression: red
                    % Members in tension: blue
                    % Zero-force: black
                    if sign(Forces(j)) == -1
                        plot([X(i),X(k)],[Y(i),Y(k)],'r-','LineWidth',5);
                        hold on
                    elseif sign(Forces(j)) == 1
                        plot([X(i),X(k)],[Y(i),Y(k)],'b-','LineWidth',5);
                        hold on
                    else
                        plot([X(i),X(k)],[Y(i),Y(k)],'k-','LineWidth',5);
                        hold on
                    end
                end
            end
        end
    end            
end
xlim([-3, 60]);
ylim([-6, 12]);


%plot load as mass hung from string
for i = 1:length(L)
    if L(i)~=0
        i = i - r; % because L vector has both x and y componenents
        plot([X(i),X(i)],[Y(i),Y(i)-1],'k-','LineWidth',1);
        x1 = X(i)-2;
        x2 = X(i)+2;
        y1 = Y(i)-2;
        y2 = Y(i)-1;
        x = [x1,x2, x2, x1,x1];
        y = [y1, y1, y2, y2,y1];
        plot(x, y, 'k-', 'LineWidth', 1);
        txt = sprintf("%.1fN",L(i+r));
        text(X(i)-1.5,Y(i)-1.5,txt);
    end
end

%get lengths
Lengths = get_lengths();

%Just putting in zeros for supports 'length' to allow arrays to be
%concatenated
Lengths(j+1)=0;Lengths(j+2)=0;Lengths(j+3)=0;

%Transpose
Lengths = Lengths';



%plot Force and Length data in figure 2
figure(2)
T = table(Forces,Lengths,'RowNames',force_identifiers);
uitable('Data',T{:,:},'ColumnName',T.Properties.VariableNames,...
     'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]); 


end

