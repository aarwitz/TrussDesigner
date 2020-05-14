function remove_joint(joint)

    load Design.mat
    [r,c]=size(C);
    
    %Remove row from C matrix
    C(joint,:)=[];

    %Remove x,y coords
    X(joint) = [];
    Y(joint)= [];
    
    %Remove both entries to load vector
    L(r+joint) = [];
    L(joint) = [];
    
    %Remove entry to Sx,Sy
    Sx(joint,:)=[];
    Sy(joint,:)=[];

    save('Design.mat','C','Sx','Sy','X','Y','L')
    
    %recursive main
    main();
end