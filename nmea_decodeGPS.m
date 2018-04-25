function [ reportGPS ] = nmea_decodeGPS( tline )
% Just a wrapper to call other functions and checks if the type of message
% is implemented
%
% Author: Vibhav Bharti, Heriot-Watt University, Edinburgh
% Email: vb97@hw.ac.uk  

available_msgs = {'$GPRMC';
                  '$GPGGA';
                  '$GPVTG';
                  '$GPZDA'};             

msgType = tline(1:6);
if max(strcmp(msgType,available_msgs))==0
    reportGPS.Error = 'Message type not implemented by decoder';
    return
end

GP_Function = str2func(['nmea' tline(2:6)]);
reportGPS = GP_Function(tline);

end