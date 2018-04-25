function [ outString ] = messageTypeString( Message_Type )
%MESSAGETYPESTRING Summary of this function goes here
%   Returns the type of AIS report message
%
% Author: Vibhav Bharti, Heriot-Watt University, Edinburgh
% Email: vb97@hw.ac.uk  

switch(num2str(Message_Type))
case '1'
    outString = 'Position Report Class A';
case '2'
    outString = 'Position Report Class A (Assigned schedule)';
case '3'
    outString = 'Position Report Class A (Response to interrogation)';
case '4'
    outString = 'Base Station Report';
case '5'
    outString = 'Static and Voyage Related Data';
case '6'
    outString = 'Binary Addressed Message';
case '7'
    outString = 'Binary Acknowledge';
case '8'
    outString = 'Binary Broadcast Message';
case '9'
    outString = 'Standard SAR Aircraft Position Report';
case '10'
    outString = 'UTC and Date Inquiry';
case '11'
    outString = 'UTC and Date Response';
case '12'
    outString = 'Addressed Safety Related Message';
case '13'
    outString = 'Safety Related Acknowledgement';
case '14'
    outString = 'Safety Related Broadcast Message';
case '15'
    outString = 'Interrogation';
case '16'
    outString = 'Assignment Mode Command';
case '17'
    outString = 'DGNSS Binary Broadcast Message';
case '18'
    outString = 'Standard Class B CS Position Report';
case '19'
    outString = 'Extended Class B Equipment Position Report';
case '20'
    outString = 'Data Link Management';
case '21'
    outString = 'Aid-to-Navigation Report';
case '22'
    outString = 'Channel Management';
case '23'
    outString = 'Group Assignment Command';
case '24'
    outString = 'Static Data Report';
case '25'
    outString = 'Single Slot Binary Message';
case '26'
    outString = 'Multiple Slot Binary Message With Communications State';
case '27'
    outString = 'Position Report For Long-Range Applications';
otherwise
    outString = 'Error: Not a valid message';
end

end