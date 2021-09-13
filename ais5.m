function [ varString,outputData ] = ais5( binData )
% This function handles AIS message of type 5
%
% # input:
%    - binData:         6-bit form binary payload data
%
% # output:
%    - varString:       Cell array containing AIS variable names
%    - outputData:      Cell array containing corresponing values

Message_Type = bin2dec(binData(1:6));
Repeat_Indicator = bin2dec(binData(7:8));
MMSI = bin2dec(binData(9:38));
AIS_Version = bin2dec(binData(39:40));
IMO_Number = bin2dec(binData(41:70));

Call_Sign = bin2dec(reshape(binData(71:112),6,[])');
Idx = find(Call_Sign<48);
Call_Sign(Idx) = Call_Sign(Idx) + 64;
Idx = find(Call_Sign>89);
Call_Sign(Idx) = Call_Sign(Idx) - 64;
Call_Sign = char(Call_Sign)';

Vessel_Name = bin2dec(reshape(binData(113:232),6,[])');
Idx = find(Vessel_Name<48);
Vessel_Name(Idx) = Vessel_Name(Idx) + 64;
Idx = find(Vessel_Name>89);
Vessel_Name(Idx) = Vessel_Name(Idx) - 64;
Vessel_Name = char(Vessel_Name)';

Ship_Type = bin2dec(binData(233:240));
Dimension_to_Bow = bin2dec(binData(241:249));
Dimension_to_Stern = bin2dec(binData(250:258));
Dimension_to_Port = bin2dec(binData(259:264));
Dimension_to_Starboard = bin2dec(binData(265:270));
Position_Fix_Type = bin2dec(binData(271:274));
ETA_monthUTC = bin2dec(binData(275:278));
ETA_dayUTC = bin2dec(binData(279:283));
ETA_hourUTC = bin2dec(binData(284:288));
ETA_minuteUTC = bin2dec(binData(289:294));
Draught = bin2dec(binData(295:302));

Destination = bin2dec(reshape(binData(303:422),6,[])');
Idx = find(Destination<48);
Destination(Idx) = Destination(Idx) + 64;
Idx = find(Destination>89);
Destination(Idx) = Destination(Idx) - 64;
Destination = char(Destination)';

DTE = bin2dec(binData(423));
Spare = bin2dec(binData(424));

Report_Type = messageTypeString(Message_Type);

varString = {'Message_Type','Repeat_Indicator','MMSI','AIS_Version','IMO_Number','Call_Sign','Vessel_Name','Ship_Type','Dimension_to_Bow','Dimension_to_Stern','Dimension_to_Port','Dimension_to_Starboard','Position_Fix_Type','ETA_monthUTC','ETA_dayUTC','ETA_hourUTC','ETA_minuteUTC','Draught','Destination','DTE','Spare','Report_Type'};
outputData = {Message_Type,Repeat_Indicator,MMSI,AIS_Version,IMO_Number,Call_Sign,Vessel_Name,Ship_Type,Dimension_to_Bow,Dimension_to_Stern,Dimension_to_Port,Dimension_to_Starboard,Position_Fix_Type,ETA_monthUTC,ETA_dayUTC,ETA_hourUTC,ETA_minuteUTC,Draught,Destination,DTE,Spare,Report_Type};

end