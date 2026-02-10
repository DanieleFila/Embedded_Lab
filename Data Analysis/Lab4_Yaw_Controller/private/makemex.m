function makemex(basedir)

%%
% Riccardo Antonello (riccardo.antonello@unipd.it)
%
% December 09, 2025
%
% Dept. of Information Engineering, University of Padova
%

%   get full path of current dir
mfilepath = mfilename('fullpath');
[fullpath, ~, ~] = fileparts(mfilepath);

%   get relative path from toolbox base dir
relpath = strrep(fullpath, strcat(basedir, filesep), '');

%   Generate platform-specific mex files
fprintf('- Compile file: %s\n', fullfile(relpath, 'cobsEncode.c'));
mex -Ilib cobsEncode.c lib/cobs.c

fprintf('- Compile file: %s\n', fullfile(relpath, 'cobsDecode.c'));
mex -Ilib cobsDecode.c lib/cobs.c


end  %  makemex