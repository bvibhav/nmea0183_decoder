function [ GPRMC ] = nmeaGPRMC( tline )
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
if ~isequal(data{3},'A')
    disp(['Validation of GPRMC Failed']);
    GPRMC.isValid = 0;
else
    GPRMC.isValid = 1;
    GPRMC.Time = str2num(data{2});
    GPRMC.Latitude = str2num(data{4}(1:2)) + str2num(data{4}(3:end))/60;
    GPRMC.Longitude = str2num(data{6}(1:3)) + str2num(data{6}(4:end))/60;
    if isequal(data{5},'S')
        GPRMC.Latitude = -GPRMC.Latitude;
    end
    if isequal(data{7},'W')
        GPRMC.Longitude = -GPRMC.Longitude;
    end
    GPRMC.Speed = str2num(data{8});
    GPRMC.TrueCourse = str2num(data{9});
    GPRMC.Date = str2num(data{10});
    GPRMC.Variation = str2num(data{11});
end