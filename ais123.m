function [ varString,outputData ] = ais123( binData )
% This function handles AIS message of type 1,2 and 3
%
% # input:
%    - binData:         6-bit form binary payload data
%
% # output:
%    - varString:       Cell array containing AIS variable names
%    - outputData:      Cell array containing corresponing values
%
% Author: Vibhav Bharti, Heriot-Watt University, Edinburgh
% Email: vb97@hw.ac.uk  

Message_Type = bin2dec(binData(1:6));
Repeat_Indicator = bin2dec(binData(7:8));
MMSI = bin2dec(binData(9:38));
Navigation_Status = bin2dec(binData(39:42));
Rate_of_Turn = bin2dec(binData(43:50));
Speed_Over_Ground = bin2dec(binData(51:60));
Position_Accuracy = bin2dec(binData(61));
[Longitude,Latitude] = computeLatLonAIS( binData(62:116) );
Course_Over_Ground = bin2dec(binData(117:128));
True_Heading = bin2dec(binData(129:137));
Time_Stamp = bin2dec(binData(138:143));
Maneuver_Indicator = bin2dec(binData(144:145));
Spare = bin2dec(binData(146:148));
RAIM_flag = bin2dec(binData(149));
Radio_status = bin2dec(binData(150:168));

Report_Type = messageTypeString(Message_Type);

varString = {'Message_Type','Repeat_Indicator','MMSI','Navigation_Status','Rate_of_Turn','Speed_Over_Ground','Position_Accuracy','Longitude','Latitude','Course_Over_Ground','True_Heading','Time_Stamp','Maneuver_Indicator','Spare','RAIM_flag','Radio_status','Report_Type'};
outputData = {Message_Type,Repeat_Indicator,MMSI,Navigation_Status,Rate_of_Turn,Speed_Over_Ground,Position_Accuracy,Longitude,Latitude,Course_Over_Ground,True_Heading,Time_Stamp,Maneuver_Indicator,Spare,RAIM_flag,Radio_status,Report_Type};

end

