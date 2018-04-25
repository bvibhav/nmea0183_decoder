function [ GPVTG ] = nmeaGPVTG( tline )
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

GPVTG.TrackMadeGood = data{1};
GPVTG.SpeedOverGroundKnots = data{5};
GPVTG.SpeedOverGroundKmph = data{7};

% 1    = Track made good
% 2    = Fixed text 'T' indicates that track made good is relative to true north
% 3    = not used
% 4    = not used
% 5    = Speed over ground in knots
% 6    = Fixed text 'N' indicates that speed over ground in in knots
% 7    = Speed over ground in kilometers/hour
% 8    = Fixed text 'K' indicates that speed over ground is in kilometers/hour
% 9    = Checksum
end

