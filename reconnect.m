function reconnect(member,from,to)
clf
load 'Design.mat'

C(from,member) = 0;
C(to,member) = 1;

save('Design.mat','C','Sx','Sy','X','Y','L')

main() %recursive call
end