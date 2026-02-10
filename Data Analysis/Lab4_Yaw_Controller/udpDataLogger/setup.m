function setup()

%%
% Riccardo Antonello (riccardo.antonello@unipd.it)
%
% December 09, 2025
%
% Dept. of Information Engineering, University of Padova
%

%   base dir
basedir = pwd;

%   create MEX files
fprintf('Create MEX files: \n');
cd( fullfile(basedir, "private") );

%   Generate platform-specific mex files
fprintf('\n- Compile file: %s\n', 'cobsEncode.c');
mex -Ilib cobsEncode.c lib/cobs.c

fprintf('\n- Compile file: %s\n', 'cobsDecode.c');
mex -Ilib cobsDecode.c lib/cobs.c

%   configure search paths
fprintf('\nAdd to path: %s \n', basedir);
addpath(basedir);

%   copy cobEncode MEX file to example folder
filename = strcat('cobsEncode', '.', mexext);
fprintf('\nCopy %s to example folder.\n\n', filename);
copyfile(filename, fullfile(basedir, '..', 'example', 'HOST'));

%   save search path
savepath;

%   move back to original working directory
cd(basedir);
fprintf('Setup completed. \n\n');

end