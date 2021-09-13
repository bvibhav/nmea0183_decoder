function [ varString,outputData ] = ais18( binData )
% This function handles AIS message of type 18
% # input:
%    - binData:         6-bit form binary payload data
%
% # output:
%    - varString:       Cell array containing AIS variable names
%    - outputData:      Cell array containing corresponing values

Message_Type = bin2dec(binData(1:6));
Repeat_Indicator = bin2dec(binData(7:8));
MMSI = bin2dec(binData(9:38));
Regional_Reserved = bin2dec(binData(39:46));
Speed_Over_Ground = bin2dec(binData(47:56));
Position_Accuracy = bin2dec(binData(57));
[Longitude,Latitude] = computeLatLonAIS( binData(58:112) );
Course_Over_Ground = bin2dec(binData(113:124));
True_Heading = bin2dec(binData(125:133));
Time_Stamp = bin2dec(binData(134:139));
Regional_reserved = bin2dec(binData(140:141));
CS_Unit = bin2dec(binData(142));
Display_flag = bin2dec(binData(143));
DSC_flag = bin2dec(binData(144));
Band_flag = bin2dec(binData(145));
Message_22_flag = bin2dec(binData(146));
Assigned = bin2dec(binData(147));
RAIM_flag = bin2dec(binData(148));
Radio_status = bin2dec(binData(149:168));

Report_Type = messageTypeString(Message_Type);

varString = {'Message_Type','Repeat_Indicator','MMSI','Regional_Reserved','Speed_Over_Ground','Position_Accuracy','Longitude','Latitude','Course_Over_Ground','True_Heading','Time_Stamp','Regional_reserved','CS_Unit','Display_flag','DSC_flag','Band_flag','Message_22_flag','Assigned','RAIM_flag','Radio_status','Report_Type'};
outputData = {Message_Type,Repeat_Indicator,MMSI,Regional_Reserved,Speed_Over_Ground,Position_Accuracy,Longitude,Latitude,Course_Over_Ground,True_Heading,Time_Stamp,Regional_reserved,CS_Unit,Display_flag,DSC_flag,Band_flag,Message_22_flag,Assigned,RAIM_flag,Radio_status,Report_Type};

end

