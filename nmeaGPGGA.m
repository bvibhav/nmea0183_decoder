function [ GPGGA ] = nmeaGPGGA( tline )
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

GPGGA.Time = data{1};
GPGGA.Latitude = str2num(data{2}(1:2)) + str2num(data{2}(3:end))/60;
GPGGA.Longitude = str2num(data{4}(1:3)) + str2num(data{4}(4:end))/60;

if isequal(data{3},'S')
    GPGGA.Latitude = -GPGGA.Latitude;
end
if isequal(data{5},'W')
    GPGGA.Longitude = -GPGGA.Longitude;
end

GPGGA.Quality = str2num(data{6});
switch GPGGA.Quality
    case 0
        GPGGA.QualityString = 'invalid';
    case 1
        GPGGA.QualityString = 'GPS fix';
    case 2
        GPGGA.QualityString = 'Diff. GPS fix';
end
GPGGA.nSatellites = str2num(data{7});
GPGGA.HorizontalDilutionPosition = str2num(data{8});
GPGGA.AntennaAltitude = str2num(data{9});
GPGGA.AntennaAltitudeUnit = data{10};
GPGGA.GeodoidalSeperation = str2num(data{11});
GPGGA.GeodoidalSeperationUnit = data{12};
GPGGA.TimeSinceLastReferenceUpdate = str2num(data{13});

% 1    = UTC of Position
% 2    = Latitude
% 3    = N or S
% 4    = Longitude
% 5    = E or W
% 6    = GPS quality indicator (0=invalid; 1=GPS fix; 2=Diff. GPS fix)
% 7    = Number of satellites in use [not those in view]
% 8    = Horizontal dilution of position
% 9    = Antenna altitude above/below mean sea level (geoid)
% 10   = Meters  (Antenna height unit)
% 11   = Geoidal separation (Diff. between WGS-84 earth ellipsoid and
%        mean sea level.  -=geoid is below WGS-84 ellipsoid)
% 12   = Meters  (Units of geoidal separation)
% 13   = Age in seconds since last update from diff. reference station
% 14   = Diff. reference station ID#
% 15   = Checksum


end

