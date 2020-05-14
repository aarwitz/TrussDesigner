function add_member(j1,j2)

    load Design.mat

    [r,c] = size(C);
    
    C(:,c+1)=zeros(r,1);
    
    C(j1,c+1) = 1;
    C(j2,c+1)=1;
    
    save('Design.mat','C','Sx','Sy','X','Y','L')
    
    %recursive main
    main();

end