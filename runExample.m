nmeaFile = 'someFile.ais';
nmeaFile = fopen(nmeaFile);

tline = fgets(nmeaFile);
while ischar(tline)
    tStamp = tline(1:15);
    tline(1:15) = [];
    
    if strcmp(tline(1:3),'!AI')
        fprintf('NMEA AIS Message: %s', tline(1:end-1));
        reportAIS = nmea_decodeAIS(tline, nmeaFile);
    elseif strcmp(tline(1:3),'$GP')
        fprintf('NMEA GPS Message: %s', tline(1:end-1));
        reportGPS = nmea_decodeGPS(tline);
    end
    tline = fgets(nmeaFile);
end