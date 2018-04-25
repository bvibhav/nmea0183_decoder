function [ varString,outputData ] = ais4( binData )
% This function handles AIS message of type 4
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
YearUTC = bin2dec(binData(39:52));
MonthUTC = bin2dec(binData(53:56));
DayUTC = bin2dec(binData(57:61));
HourUTC = bin2dec(binData(62:66));
MinuteUTC = bin2dec(binData(67:72));
SecondUTC = bin2dec(binData(73:78));
Fix_quality = bin2dec(binData(79));
[Longitude,Latitude] = computeLatLonAIS( binData(80:134) );
Type_of_EPFD = bin2dec(binData(135:138));
Spare = bin2dec(binData(139:148));
RAIM_flag = bin2dec(binData(149));
SOTDMA_state = bin2dec(binData(150:168));

Report_Type = messageTypeString(Message_Type);

varString = {'Message_Type','Repeat_Indicator','MMSI','YearUTC','MonthUTC','DayUTC','HourUTC','MinuteUTC','SecondUTC','Fix_quality','Longitude','Latitude','Type_of_EPFD','Spare','RAIM_flag','SOTDMA_state','Report_Type'};
outputData = {Message_Type,Repeat_Indicator,MMSI,YearUTC,MonthUTC,DayUTC,HourUTC,MinuteUTC,SecondUTC,Fix_quality,Longitude,Latitude,Type_of_EPFD,Spare,RAIM_flag,SOTDMA_state,Report_Type};

end

