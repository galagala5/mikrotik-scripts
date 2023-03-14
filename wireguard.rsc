:global peerNumber 0;
:log info "Wireguard peer $peerNumber is restarting ....";
interface wireguard peer disable $peerNumber; 
:delay 5s;
interface wireguard peer enable $peerNumber; 
:log info "Wireguard peer $peerNumber is ready!";

:local peers [/interface wireguard peer]