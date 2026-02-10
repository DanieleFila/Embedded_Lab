function unpackedData = dataUnpack(packedData, packetInfo)

%%
% Riccardo Antonello (riccardo.antonello@unipd.it)
%
% December 09, 2025
%
% Dept. of Information Engineering, University of Padova
%


%%  Check input arguments
arguments
    packedData {mustBeVector, mustBeA(packedData, "uint8")}
    packetInfo struct {mustBeValidPacketInfo}
end


%%  Data unpack

%   init unpacked data cell array
unpackedDataLen = packetInfo.cellsNum;
unpackedData = cell(unpackedDataLen, 1);

%   init packed data length 
packedDataLen = length(packedData);

%   packedData length must be equal to the byte size specified in packetInfo
if packedDataLen ~= packetInfo.byteSize
    error('The length of packed data array does not match the byte size specified in packetInfo.');    
end

%   start index to packed data of current cell
inIdx = 1;

%   unpack data
for n = 1:unpackedDataLen

    %   start index to packed data of next cell    
    nextInIdx = inIdx + packetInfo.cellDTypeSize(n) * packetInfo.cellWidth(n);
    
    %   unpack data
    inData = packedData( inIdx:(nextInIdx-1) );
    outData = typecast( uint8(inData), packetInfo.cellDType{n});
    
    %   update start index
    inIdx = nextInIdx;

    %   store unpacked data to output cell array
    unpackedData{n} = outData;
    
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

