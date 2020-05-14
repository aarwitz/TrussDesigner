function help()

fprintf('\n**Format for manipulating joints:\n');
fprintf('move_joint(joint#,magnitude,direction), where magnitude is in cm and direction is in radians\n');
fprintf('add_joint(x,y), where x and y are coords of new joint\n');
fprintf('remove_joint(joint#)\n');

fprintf('**Format for manipulating members:\n');
fprintf('reconnect(member#,j1,j2), moves member attachment from j1 to j2 \n'); %from,to refer to joint numbers
fprintf('add_member(j1,j2), connects new member from j1 to j2\n');
fprintf('remove_member(member#)\n');

fprintf('**Format for changing load size/location:\n');
fprintf('change_load(newtons,joint#), removes old load, creates new load of newtons at joint#\n');

fprintf('**To print details of current Design.mat:\n');
fprintf('print_design()\n'); %prints member lengths and joint coordinates

fprintf('**Truss specifications (with respect to manual) are automatically checked when changes are made. But to manually do so:\n');
fprintf('check_specs()\n');

end