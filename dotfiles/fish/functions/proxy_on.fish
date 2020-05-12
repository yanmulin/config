# Defined in - @ line 1
function proxy_on --description 'turn on proxy'
	set -gx ALL_PROXY "socks5://localhost:1086" $argv;
end
