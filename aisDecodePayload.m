function [ payloadString, payloadData ] = aisDecodePayload( payload )
% This function extracts the data out of payload in AIS message
%
% # input:
%    - payload:         main 6-bit form data contained in an AIS message
%
% # output:
%    - payloadString:   Cell array containing AIS variable names
%    - payloadData:     Cell array containing corresponing values
%
% Author: Vibhav Bharti, Heriot-Watt University, Edinburgh
% Email: vb97@hw.ac.uk  

% Converting data to binary format, handling 6-bit form
decData = double(payload);
decData = decData - 48;
Idx = find(decData>40);
decData(Idx) = decData(Idx)-8;
binData = dec2bin(decData);
binData = binData';
binData = binData(:);
binData = binData';

% Taking out data from payload
Message_Type = bin2dec(binData(1:6));   % message type is always first 6-bit of message
if Message_Type < 4
    [payloadString, payloadData] = ais123(binData);
elseif Message_Type == 4
    [payloadString, payloadData] = ais4(binData);
elseif Message_Type == 5
    [payloadString, payloadData] = ais5(binData);
elseif Message_Type == 9
    [payloadString, payloadData] = ais9(binData);
elseif Message_Type == 18
    [payloadString, payloadData] = ais18(binData);
else
    payloadString = {'Report_Type'};
    payloadData = {'No Decoder'};
end

end

