%% GET DATA NAME

function target_name = getDataName(structName)
%
% GET DATA NAME
%
% This function searches through the fields of a given structure
% to identify the specific field name that starts with the prefix 'data'.
% It is used to handle dynamic variable naming in .mat files 
% (e.g.: 'data_01', 'data_02') automatically.
%
% === Input parameters ===
% structName  = (Struct) Input structure containing the loaded data
%
% === Output parameters ===
% target_name = (String) Name of the first field starting with 'data'

    fields_name = fieldnames(structName);
    for i = 1:length(fields_name)
        if startsWith(fields_name{i}, 'data')
            target_name = fields_name{i};
            break;
        end
    end

end