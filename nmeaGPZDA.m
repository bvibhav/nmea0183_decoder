function [ GPZDA ] = nmeaGPZDA( tline )
% This function handles NMEA GP*** messages
%
% # input:
%    - tline:           The NMEA $GP*** message
%
% # output:
%    - GPZDA:           Output data structure
%
% Author: Vibhav Bharti, Heriot-Watt University, Edinburgh
% Email: vb97@hw.ac.uk  

data = strsplit(tline, ',', 'CollapseDelimiters', 0);
data(1) = [];

GPZDA.time = data{1};
GPZDA.Date = data{2};
GPZDA.Month = data{3};
GPZDA.Year = data{4};
GPZDA.Zone = data{5};

% 1    = UTC of Position
% 2    = Date
% 3    = Month
% 4    = Year
% 5    = Local zone description, Time zone 00 +- 13hrs
% 6   = Checksum

end

