var share = new Object();
share.more="M�s...";
share.productname1="Enrutador de banda ancha Wireless-G";
share.productname2="Enrutador de banda ancha Wireless-G con SpeedBooster";
share.firmwarever="Versi�n del Firmware";
share.interipaddr="Direcci�n IP de &nbsp;Internet";
share.ipaddr="Direcci�n IP";
share.submask="M�scara de <br>&nbsp;subred";
share.gateway="Puerta de enlace";
share.defgateway="Puerta de enlace predeterminada";
share.macaddr="Direcci�n MAC";
share.usrname="Usuario";
share.usrname1="Nombre de usuario";
share.passwd="Contrase�a";
share.tzo_passwd="Clave TZO";
share.clihostname="Nombre de host cliente";
share.routename="Nombre del <br>&nbsp;enrutador";
share.hostname="Nombre de host";
share.domainname="Nombre de <br>&nbsp;dominio";
share.srvname="Nombre del servicio";
share.dhcpsrv="Servidor DHCP";
share.enable="Activar";
share.enabled="Activado"; //amin add
share.disable="Desactivar";
share.disabled="Desactivado";
share.inter_face="Interfaz";
share.auto="Autom�tico";
share.protocol="Protocolo";
share.tcp="TCP";
share.udp="UDP";
share.both="Ambos";
share.icmp="ICMP"
share.yes="S�";
share.no="No";
share.ddns="DDNS";
share.dmz="DMZ";
share.timezone="Zona horaria";
share.mtu="MTU";
share.mtuauto="Autom�tico";
share.mtumanual="Manual";
share.mtusize="Tama�o";
share.internet="Internet";
share.cfgtype="Tipo de configuraci�n";
share.staticip="IP fija";
share.pppoe="PPPoE";
share.pptp="PPTP";
share.dns="DNS";
share.startipaddr="Direcci�n IP inicial";
share.clileasetime="Tiempo concesi�n &nbsp;cliente";
share.wins="WINS";
share.macclone="Clonaci�n MAC";
share.start="Inicio";
share.optmode="Modo de funcionamiento";
share.router="Enrutador";
share.lanwireless="LAN e Inal�mbrica";
share.firewall="Servidor de seguridad";
share.vpn="VPN";
share.policy="Directiva de acceso a Internet";
share.summary="Resumen";
share.none="None";
share.extport="External Port";
share.intport="Internal Port";
share.protocol="Protocol";
share.toipaddr="To IP Address";
share.enableBK="Enable";
share.singelforward="Single Port Forward";

var bmenu= new Object();
bmenu.setup="Configuraci�n";
bmenu.wireless="Inal�mbrica";
bmenu.security="Seguridad";
bmenu.accrestriction="Restricciones de acceso";
bmenu.applications="Aplicaciones";
bmenu.gaming="Juegos";
bmenu.admin="Administraci�n";
bmenu.statu="Estado";

var sbutton = new Object();
sbutton.save="Guardar configuraci�n";
sbutton.cancel="Cancelar cambios";
sbutton.refresh="Actualizar";
sbutton.close="Cerrar";
sbutton.del="Eliminar";
sbutton.continue1="Continuar";
sbutton.update="Actualizar";

var other = new Object();
other.setsuc="La configuraci�n es correcta.";
other.renewip="Libere/renove la direcci�n IP.";
other.setfail="Los valores introducidos no son v�lidos. Vuelva a intentarlo."

var errmsg = new Object();
errmsg.err0="Debe introducir un usuario.";
errmsg.err1="Debe introducir un nombre de enrutador.";
errmsg.err2="Fuera del intervalo, modifique la direcci�n IP inicial o los n�meros del usuario.";
errmsg.err3="Debe seleccionar al menos un d�a."
errmsg.err4="La hora de finalizaci�n debe ser posterior a la hora de inicio.";
errmsg.err5="La longitud de la direcci�n MAC no es correcta.";
errmsg.err6="Debe introducir una contrase�a.";
errmsg.err7="Debe introducir un nombre de host.";
errmsg.err8="Debe introducir una direcci�n IP o un nombre de dominio.";
errmsg.err9="La direcci�n IP de DMZ no es v�lida.";
errmsg.err10="La contrase�a confirmada no coincide con la introducida. Vuelva a introducir la contrase�a";
errmsg.err11="No se admiten espacios en la contrase�a";
errmsg.err12="La contrase�a confirmada no coincide con la introducida. Vuelva a introducir la contrase�a";
errmsg.err13="Fallo en la actualizaci�n.";
//common.js error message
errmsg.err14=" el valor est� fuera del intervalo ";
errmsg.err15="La direcci�n MAC de WAN est� fuera del intervalo [00 - FF].";
errmsg.err16="El segundo car�cter de MAC debe ser un n�mero par: [0, 2, 4, 6, 8, A, C, E]";
errmsg.err17="La direcci�n MAC no es correcta.";
errmsg.err18="La longitud de la direcci�n MAC no es correcta.";
errmsg.err19="La direcci�n MAC no puede ser la direcci�n de emisi�n."
errmsg.err20="Introduzca la direcci�n MAC en el formato (xx:xx:xx:xx:xx:xx).";
errmsg.err21="El formato de la direcci�n MAC no es v�lido.";
errmsg.err22="La direcci�n MAC de WAN no es correcta.";
errmsg.err23="El valor hexadecimal no es v�lido ";
errmsg.err24=" encontrado en direcci�n MAC ";
errmsg.err25="El valor de la clave no es correcto.";
errmsg.err26="La longitud de la clave no es correcta.";
errmsg.err27="La m�scara de subred no es v�lida.";
errmsg.err28=" tienen caracteres no v�lidos, deben ser [ 0 - 9 ]";
errmsg.err29=" tienen c�digo ASCII no v�lido."
errmsg.err30=" tienen d�gitos hexadecimales no v�lidos.";
errmsg.err31=" valor no v�lido.";
errmsg.err32="La direcci�n IP y la puerta de enlace no est�n en la misma m�scara de subred.";
errmsg.err33="La direcci�n IP y la puerta de enlace no pueden ser iguales.";
errmsg.err34="IP";
errmsg.err35="Puerta de enlace";
errmsg.err36="DNS";
errmsg.err37="M�scara de red";
errmsg.err38="Tiempo de inactividad";
errmsg.err39="Per�odo de marcado";
errmsg.err40="Direcci�n IP inicial de DHCP";
errmsg.err41="N�mero de usuarios de DHCP";
errmsg.err42="Tiempo de concesi�n de DHCP";
errmsg.err43="URL";
errmsg.err44="Palabra clave";
errmsg.err45="Nombre";
errmsg.err46="Puerto";
errmsg.err47="N�mero%20puerto";
errmsg.err48="No puede utilizar la direcci�n de difusi�n, red o IP del router.";
errmsg.err52="La puerta de enlace no puede ser una direcci�n IP de WAN.";
errmsg.err60="Introduzca una direcci�n de correo electr�nico.";
errmsg.err61="Direcci�n IP no v�lida.";
errmsg.err62="En este momento no hay ninguna direcci�n IP de WAN.";
errmsg.err63="Direcci�n IP de destino no v�lida.";
errmsg.err64="La puerta de enlace no puede ser una direcci�n IP de LAN.";
errmsg.err65="Direcci�n IP de puerta de enlace no v�lida.";
errmsg.err66="M�scara de subred o IP de destino no v�lidas.";
errmsg.err68="La direcci�n IP no puede ser una direcci�n IP de LAN.";
errmsg.err70="Intervalo de puertos superpuesto.";
errmsg.err71="Valores no v�lidos.";
errmsg.err75="La direcci�n IP inicial no puede ser una direcci�n IP de LAN.";
errmsg.err82="Ruta est�tica no v�lida.";
errmsg.err90="La direcci�n IP no puede ser una direcci�n IP privada.";
errmsg.err91="La puerta de enlace no puede ser una direcci�n IP privada.";
errmsg.err92="La puerta de enlace no puede ser una direcci�n IP p�blica.";
errmsg.err93="Esta direcci�n MAC ya est� reservada. No puede agregarse dos veces.";
errmsg.err94="Esta direcci�n IP ya est� reservada. No puede agregarse dos veces.";
errmsg.err95="El intervalo de puertos ya existe.";
errmsg.erremail="Direcci�n de correo electr�nico no v�lida.";
errmsg.errkey="Introduzca una clave TZO.";
errmsg.errdomain="Introduzca un nombre de dominio.";
errmsg.qossamemac="Introduzca direcciones MAC distintas.";
errmsg.qossameport="Introduzca puertos espec�ficos distintos.";
errmsg.qosbanderr="El ancho de banda de flujo ascendente est� fuera del intervalo [1 - 100000].";
errmsg.errdomainformat="Nombre de dominio no v�lido.";
errmsg.errkeylen="La clave TZO debe tener al menos 16 caracteres.";
errmsg.errdhcpnetip="La direcci�n IP del router es id�ntica a una direcci�n de red de subred. Aj�stela.";
errmsg.errdhcpbroip="La direcci�n IP del router es id�ntica a una direcci�n de difusi�n de red de subred. Aj�stela.";
errmsg.pptpnodns="Introduzca al menos una direcci�n DNS correcta";
errmsg.pptpservererr="La direcci�n IP del servidor PPTP y la direcci�n IP de LAN est�n en la misma subred";
errmsg.pptpsameserver="La direcci�n IP del servidor PPTP y la direcci�n IP de LAN no pueden ser iguales";
errmsg.err74="La direcci�n IP de WAN y la direcci�n IP de LAN est�n en la misma subred";
errmsg.l2tpservererr="La direcci�n IP del servidor L2TP y la direcci�n IP de LAN est�n en la misma subred";


var session = new Object();
session.title="Router Access";
session.logout="Session Failure.";
session.timeout="Session Timeout.";
session.invlidlogin="Invalid Username or Password.";
session.tryagain="Please Try Again.";
session.loginagain="Please log in again.";

var pctrl=new Object();
pctrl.pwderrmsg2="The passwords do not match.";
