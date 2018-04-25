function [ reportAIS ] = nmea_decodeAIS( cMessage, fileAIS )
% This function create an AIS report from single AIS message. 
%
% # input:
%    - cMessage:        AIS message    
%    - fileAIS:         AIS.txt file handle containing AIS messages for
%                       handling message contained in multiple network packets
%
% # output:
%    - reportAIS:      	Output AIS report
%
% Author: Vibhav Bharti, Heriot-Watt University, Edinburgh
% Email: vb97@hw.ac.uk  

Idx = find(cMessage==',');

% Main data extraction
packet = cMessage(2:Idx(1)-1);
mCount = str2num(cMessage(Idx(1)+1:Idx(2)-1));
mNum = cMessage(Idx(2)+1:Idx(3)-1);
mID = cMessage(Idx(3)+1:Idx(4)-1);
channel = cMessage(Idx(4)+1:Idx(5)-1);
payload = cMessage(Idx(5)+1:Idx(6)-1);
fillBits = cMessage(Idx(6)+1:end);

% Routine to get full message if message are in more than one packets
if(mCount>1)
    for ii = 1:mCount-1
        cMessage = fgets(fileAIS);
        Idx = find(cMessage==',');
        payload = [payload cMessage(Idx(5)+1:Idx(6)-1)];
    end
end

% Decoding the main payload message
[ payloadString, payloadData ] = aisDecodePayload( payload );

% Forming AIS report structure
reportAIS = struct();
for jj = 1:numel(payloadString)
    reportAIS.(payloadString{jj}) = payloadData{jj};
end

end