function packedData = dataPack(unpackedData, packetInfo)

%%
% Riccardo Antonello (riccardo.antonello@unipd.it)
%
% December 09, 2025
%
% Dept. of Information Engineering, University of Padova
%


%%  Check input arguments
arguments
    unpackedData cell {mustBeNumeric}
    packetInfo struct {mustBeValidPacketInfo}
end


%%  Pack data

%   init packed data array
packedDataLen = packetInfo.byteSize;
packedData = zeros(1, packedDataLen, 'uint8');

%   start index to packed data of current cell element
inIdx = 1;

for n = 1:packetInfo.cellsNum

    %   cell must match the specified type
    if ~isa(unpackedData{n}, packetInfo.cellDType{n})
        error('Element %d of unpacked data does not match the specified type in the packetInfo structure.', n);
    end

    %   cell must match the specified width
    if length(unpackedData{n}) ~= packetInfo.cellWidth(n)
        error('Element %d of unpacked data does not match the specified width in the packetInfo structure.', n);
    end

    %   pack data
    for m = 1:packetInfo.cellWidth(n)

        %   start index to packed data of next cell element
        nextInIdx = inIdx + packetInfo.cellDTypeSize(n);

        %   pack single cell element
        packedData(inIdx:nextInIdx-1) = typecast(unpackedData{n}(m), 'uint8');

        %   update start index
        inIdx = nextInIdx;

    end

end

end


%%  Auxiliary functions

%   validate packetInfo struct
function mustBeValidPacketInfo(packetInfo)
    if ~all( isfield(packetInfo, ...
            {'byteSize', 'cellsNum', 'cellDType', 'cellDTypeSize', 'cellWidth'}) )
        error('The 2nd argument must be a valid packetInfo structure.');
    end
end
