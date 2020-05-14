function remove_member(m)

    load Design.mat
    
    C(:,m)=[];

    save('Design.mat','C','Sx','Sy','X','Y','L')
    
    %recursive main
    main();

end