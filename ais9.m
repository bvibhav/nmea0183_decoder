function [ varString,outputData ] = ais9( binData )
% This function handles AIS message of type 9
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
Altitude = bin2dec(binData(39:50));
Speed_Over_Ground = bin2dec(binData(51:60));
Position_Accuracy = bin2dec(binData(61));
[Longitude,Latitude] = computeLatLonAIS( binData(62:116) );
Course_Over_Ground = bin2dec(binData(117:128));
Time_Stamp = bin2dec(binData(129:134));
Regional_reserved = bin2dec(binData(135:142));
DTE = bin2dec(binData(143));
Spare = bin2dec(binData(144:146));
Assigned = bin2dec(binData(147));
RAIM_flag = bin2dec(binData(148));
Radio_status = bin2dec(binData(149:168));

Report_Type = messageTypeString(Message_Type);

varString = {'Message_Type','Repeat_Indicator','MMSI','Altitude','Speed_Over_Ground','Position_Accuracy','Longitude','Latitude','Course_Over_Ground','Time_Stamp','Regional_reserved','DTE','Spare','Assigned','RAIM_flag','Radio_status','Report_Type'};
outputData = {Message_Type,Repeat_Indicator,MMSI,Altitude,Speed_Over_Ground,Position_Accuracy,Longitude,Latitude,Course_Over_Ground,Time_Stamp,Regional_reserved,DTE,Spare,Assigned,RAIM_flag,Radio_status,Report_Type};

end

