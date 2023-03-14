:local id [system/identity get name];
:local topic "mikrotik/info/$id";
:local broker emqx;
:global publicIp;

:local ether1 [/ip address get [:pick [find interface="ether1"] 0] address]
:local temp [/system health get 1 value]
:local voltage [/system health get 0 value]
:local cpuLoad [/system resource get cpu-load]
:local serialNumber [/system routerboard get value-name=serial-number]
:local upTime [/system resource get uptime]

:local msg \
"{\"routerId\":\"$id\",\
\"temperature\":\"$temp\",\
\"voltage\":\"$voltage\",\
\"interfaces\":{\
\"ether1\":\"$ether1\",\
\"publicIp\":\"$publicIp\"},\
\"cpuLoad\":\"$cpuLoad\",\
\"upTime\":\"$upTime\",\
\"serialNum\":\"$serialNumber\"}";



:log info $msg

/iot mqtt publish broker=$broker topic=$topic message=$msg