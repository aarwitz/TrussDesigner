function change_load(newtons,joint)
    load Design.mat
    [r,c]=size(C);
    % Remove old load
    L(find(L~=0))=0;
    % Replace with new load 
    L(joint+r)=newtons; % + r because assumes load is in Y direection
    
    
    save('Design.mat','C','Sx','Sy','X','Y','L')
    
    %recursive main
    main();
end