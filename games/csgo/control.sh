#!/bin/bash
# Counter Strike: Global Offensive
# Server Management Script
# Author: Daniel Gibbs
# Website: http://danielgibbs.co.uk
# Version: 011214

#### Variables ####

# Notification Email
# (on|off)
emailnotification="{{emailNot}}"
email="{{email}}"

# Steam login
steamuser="anonymous"
steampass=""

# Start Variables
# https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers#Starting_the_Server
# [Game Modes]           gametype    gamemode
# Arms Race                  1            0
# Classic Casual             0            0
# Classic Competitive        0            1
# Demolition                 1            1
# Deathmatch                 1            2
gamemode="{{gamemode}}"
gametype="{{gametype}}"
defaultmap="{{map}}"
mapgroup="random_classic"
maxplayers="{{maxplayers}}"
tickrate="{{tickrate}}"
port="{{port}}"
sourcetvport="{{sourcetvport}}"
clientport="{{clientport}}"
ip="{{ip}}"
# Optional: Workshop Parameters
# https://developer.valvesoftware.com/wiki/CSGO_Workshop_For_Server_Operators
# To get an authkey visit - http://steamcommunity.com/dev/apikey
# authkey=""
# ws_collection_id=""
# ws_start_map=""

# https://developer.valvesoftware.com/wiki/Command_Line_Options#Source_Dedicated_Server
fn_parms(){
parms="-game csgo -usercon -strictportbind -ip ${ip} -port ${port} +clientport ${clientport} +tv_port ${sourcetvport} -tickrate ${tickrate} +map ${defaultmap} +servercfgfile ${servercfg} -maxplayers_override ${maxplayers} +mapgroup ${mapgroup} +game_mode ${gamemode} +game_type ${gametype} +host_workshop_collection ${ws_collection_id} +workshop_start_map ${ws_start_map} -authkey ${authkey}"
}

#### Advanced Variables ####

# Steam
appid="740"

# Server Details
servicename="{{id}}"
gamename="Counter Strike: Global Offensive"
engine="source"

# Directories
rootdir="$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd )"
selfname="$0"
lockselfname=$(echo ".${servicename}.lock")
filesdir="${rootdir}/serverfiles"
systemdir="${filesdir}/csgo"
executabledir="${filesdir}"
executable="./srcds_run"
servercfgdir="${systemdir}/cfg"
servercfg="${servicename}.cfg"
servercfgfullpath="${servercfgdir}/${servercfg}"
defaultcfg="${servercfgdir}/server.cfg"
backupdir="backups"

# Server Details
servername="{{hostname}}"
rcon="{{rcon}}"

# Logging
logdays="7"
gamelogdir="${systemdir}/logs"
scriptlogdir="${rootdir}/log/script"
consolelogdir="${rootdir}/log/console"

scriptlog="${scriptlogdir}/${servicename}-script.log"
consolelog="${consolelogdir}/${servicename}-console.log"
emaillog="${scriptlogdir}/${servicename}-email.log"

scriptlogdate="${scriptlogdir}/${servicename}-script-$(date '+%d-%m-%Y-%H-%M-%S').log"
consolelogdate="${consolelogdir}/${servicename}-console-$(date '+%d-%m-%Y-%H-%M-%S').log"

##### Script #####
# Do not edit
# unless you know
# what you are doing

fn_scriptlog(){
	echo -e "$(date '+%b %d %H:%M:%S') ${servicename}: ${1}" >> "${scriptlog}"
}

# [ FAIL ]
fn_printfail(){
    echo -en "\r\033[K[\e[0;31m FAIL \e[0;39m] $@"
}

fn_printfailnl(){
    echo -e "\r\033[K[\e[0;31m FAIL \e[0;39m] $@"
}

# [  OK  ]
fn_printok(){
    echo -en "\r\033[K[\e[0;32m  OK  \e[0;39m] $@"
}

fn_printoknl(){
    echo -e "\r\033[K[\e[0;32m  OK  \e[0;39m] $@"
}

# [ INFO ]
fn_printinfo(){
    echo -en "\r\033[K[\e[0;36m INFO \e[0;39m] $@"
}

fn_printinfonl(){
    echo -e "\r\033[K[\e[0;36m INFO \e[0;39m] $@"
}

# [ WARN ]
fn_printwarn(){
	echo -en "\r\033[K[\e[1;33m WARN \e[0;39m] $@"
}

fn_printwarnnl(){
	echo -e "\r\033[K[\e[1;33m WARN \e[0;39m] $@"
}

# [ .... ]
fn_printdots(){
    echo -en "\r\033[K[ .... ] $@"
}

fn_rootcheck(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_syscheck(){
if [ ! -e "${systemdir}" ]; then
	fn_printfailnl "Cannot access ${systemdir}: No such directory"
	exit
fi
}

fn_autoip(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_logmanager(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_debugserver(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_console(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_backupserver(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_distro(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_uptime(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_load(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_emailnotification(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_emailtest(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_serverquery(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_monitorserver(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_updateserver(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_validateserver(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_restartserver(){
fn_scriptlog "Restarting ${servername}"
fn_stopserver
fn_startserver
}

fn_stopserver(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_startserver(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_details(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_runfunction(){
# Download function if missing
if [ ! -f "${rootdir}/functions/${functionfile}" ]; then
	cd "${rootdir}"
	if [ ! -d "functions" ]; then
		mkdir functions
	fi
	echo "loading ${functionfile}..."
	cd functions
	wget --no-check-certificate -nv -N https://raw.githubusercontent.com/dgibbs64/linuxgameservers/master/functions/${functionfile}
	chmod +x "${functionfile}"
	cd "${rootdir}"
	sleep 1
	echo ""
fi
# Run function
source "${rootdir}/functions/${functionfile}"
}

#
## Installer
#

fn_csgofix(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_header(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_steamdl(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_steaminstall(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_steamfix(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_loginstall(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_getquery(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_retryinstall(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_serverdirectory(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_serverconfig(){
functionfile="${FUNCNAME}"
fn_runfunction
}

fn_install(){
fn_rootcheck
fn_header
if [ -z "${autoinstall}" ]; then
	fn_serverdirectory
	fn_header
fi
fn_steamdl
fn_steaminstall
fn_steamfix
fn_loginstall
fn_getquery
fn_serverconfig
fn_csgofix
fn_header
fn_details
echo "================================="
echo "Install Complete!"
echo ""
echo "To start server type:"
echo "${selfname} start"
echo ""
}

fn_autoinstall(){
autoinstall=1
fn_install
}

case "$1" in
	start)
		fn_startserver;;
	stop)
		fn_stopserver;;
	restart)
		fn_restartserver;;
	update)
		fn_updateserver;;
	update-restart)
		fn_stopserver
		fn_updateserver
		fn_startserver;;
	validate)
		fn_validateserver;;
	validate-restart)
		fn_stopserver
		fn_validateserver
		fn_startserver;;
	monitor)
		fn_monitorserver;;
	email-test)
		fn_emailtest;;
	details)
		fn_details;;
	backup)
		fn_backupserver;;
	console)
		fn_console;;
	debug)
		fn_debugserver;;
	install)
		fn_install;;
	auto-install)
		fn_autoinstall;;
	*)
	echo "Usage: $0 {start|stop|restart|update|update-restart|validate|validate-restart|monitor|email-test|details|backup|console|debug|install|auto-install}"
	exit 1;;
esac
exit