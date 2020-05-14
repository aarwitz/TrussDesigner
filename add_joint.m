function add_joint(x,y)

    load Design.mat

    [r,c] = size(C);
    l = length(L);

    %Make new row in C matrix
    newline = zeros(1,c);
    C(r+1,:)=newline;

    %Make x,y cords
    X(r+1) = x;
    Y(r+1)= y;
    
    %Make new load joints, and re-enter load
    new_L=zeros(r*2+2,1);
    new_L(1:r) = L(1:r);
    new_L(r+1)=0;
    for i = r+2:r*2+1
        new_L(i)=L(i-1);
    end
    new_L(r*2+2) = 0;
    L=new_L;
    
    %Make new Sx,Sy
    Sx(end+1,:)=[0 0 0];
    Sy(end+1,:)=[0 0 0];

    save('Design.mat','C','Sx','Sy','X','Y','L')
    
    %recursive main
    main();
end