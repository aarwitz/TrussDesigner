function main()
%calculate forces
[force_identifiers,forces] = calc_forces();

% display two figures:
% (1) graphic of trass (2) data table of forces in members 
graphics(force_identifiers,forces);

% main printout
fprintf('\n\nNote: Changes are not reflected in design.m\n');
fprintf('      Running design.m returns .mat file to original design\n');
fprintf('**For function details type: help\n');

check_specs();
end