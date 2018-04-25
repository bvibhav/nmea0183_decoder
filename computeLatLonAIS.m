function [ Longitude,Latitude ] = computeLatLonAIS( binPayload )
%COMPUTELATLONAIS Summary of this function goes here
%   Computes latitude and longitude of AIS payload
%
% Author: Vibhav Bharti, Heriot-Watt University, Edinburgh
% Email: vb97@hw.ac.uk  

%% longitude computation, taken into account negative degrees
LonSign = binPayload(1);
if LonSign=='1'
    Longitude = bin2dec(char(bitcmp(uint8(binPayload(1:28))-48)-254+48))+1;
    Longitude = -Longitude;
else
    Longitude = bin2dec(binPayload(1:28));
end
Longitude = Longitude/600000;

%% latitude computation, taken into account negative degrees
LatSign = binPayload(29);
if LatSign=='1'
    Latitude = bin2dec(char(bitcmp(uint8(binPayload(29:end))-48)-254+48))+1;
    Latitude = -Latitude;
else
    Latitude = bin2dec(binPayload(29:end));
end
Latitude = Latitude/600000;


end

