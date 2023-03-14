# Variables
:local DeviceName [/system identity get name];
:local Time [/system clock get time];
:local Date [/system clock get date];

:local main "$Text \r\n $Date $Time";
:log info $DeviceName; 
 
# Main script code
:tool e-mail send to=$SendTo from="Device $DeviceName" subject=$Subject body=$main;