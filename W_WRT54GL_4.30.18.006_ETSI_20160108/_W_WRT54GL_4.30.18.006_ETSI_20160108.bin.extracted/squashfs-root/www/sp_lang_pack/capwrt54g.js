var firewall2 = new Object();
firewall2.natredir="Filtrar redirecci�n NAT de Internet";
firewall2.ident="Filtrar IDENT (puerto 113)";
firewall2.multi="Filtrar multidifusi�n";

var hupgrade = new Object();
hupgrade.right1="Haga clic en el bot�n Examinar para seleccionar el archivo de firmware que desea cargar en el enrutador.";
hupgrade.right2="Haga clic en el bot�n Actualizar para iniciar el proceso de actualizaci�n. Dicho proceso no puede ser interrumpido.";
hupgrade.wrimage="Archivo de imagen incorrecto.";

var hfacdef = new Object();
hfacdef.right1="Se restablecer�n todos los valores predeterminados de f�brica y se borrar�n todos los valores que haya establecido el usuario.";
hfacdef.warning="Aviso. Si hace clic en Aceptar, el dispositivo restablecer� todos los valores predeterminados de f�brica y se borrar� cualquier configuraci�n anterior.";

var hdiag = new Object();
hdiag.right1="Introduzca la direcci�n IP o el nombre de dominio que desea sondear y haga clic en el bot�n Sondear.";
hdiag.right2="Introduzca la direcci�n IP o el nombre de dominio en los que desea realizar el seguimiento y haga clic en el bot�n Ruta de seguimiento.";

var hlog = new Object();
hlog.right1="Puede activar o desactivar el uso de los registros <b>de entrada</b> y <b>de salida</b> mediante la selecci�n del bot�n de opci�n correspondiente.";

var manage2 = new Object();
manage2.webacc="Acceso Web";
manage2.accser="Servidor de &nbsp;acceso";
manage2.wlacc="Web de acceso &nbsp;inal�mbrico";
manage2.vapass="La contrase�a confirmada no coincide con la introducida. Vuelva a introducir la contrase�a";
manage2.passnot="Las contrase�as no coinciden.";
manage2.selweb="Debe seleccionar al menos un servidor Web.";
manage2.changpass="Actualmente el enrutador tiene establecida la contrase�a predeterminada. Como medida de seguridad, deber� cambiar la contrase�a antes de poder activar la funci�n Administraci�n remota. Haga clic en el bot�n Aceptar para cambiar la contrase�a. Haga clic en el bot�n Cancelar para dejar la funci�n Administraci�n remota desactivada.";

var hmanage2 = new Object();
hmanage2.right1="<b>Acceso a enrutador local: </b>Desde aqu� puede cambiar la contrase�a del enrutador. Introduzca una nueva contrase�a y, a continuaci�n, vuelva a escribirla en el campo Confirmar contrase�a.<br>";
hmanage2.right2="<b>Acceso Web: </b>Permite configurar las opciones de acceso a la utilidad Web del enrutador.";
hmanage2.right3="<b>Acceso a enrutador remoto: </b>Permite acceder al enrutador de forma remota.  Seleccione el puerto que desea utilizar. Debe cambiar la contrase�a si el enrutador sigue utilizando la contrase�a predeterminada.";
hmanage2.right4="<b>UPnP: </b>Utilizado por determinados programas para abrir puertos autom�ticamente para realizar la comunicaci�n.";

var hstatwl2 = new Object();
hstatwl2.right1="<b>Direcci�n MAC</b>. Direcci�n MAC del enrutador, tal y como se observa en la red local inal�mbrica.";
hstatwl2.right2="<b>Modo</b>. Al seleccionarlo desde la ficha Inal�mbrica, mostrar� el modo inal�mbrico (Mixto, S�lo G o Desactivado) que se utiliza en la red.";

var hstatlan2 = new Object();
hstatlan2.right1="<b>Direcci�n MAC</b>. Direcci�n MAC del enrutador, tal y como se observa en la red local Ethernet.";
hstatlan2.right2="<b>Direcci�n IP</b>. Muestra la direcci�n IP del enrutador, tal y como aparece en la red local Ethernet.";
hstatlan2.right3="<b>M�scara de subred</b>. Muestra la m�scara de subred cuando el enrutador utiliza una.";
hstatlan2.right4="<b>Servidor DHCP</b>. Muestra el servidor DHCP si el enrutador utiliza uno.";

var hstatrouter2 = new Object();
hstatrouter2.wan_static="Static";
hstatrouter2.l2tp="L2TP";
//hstatrouter2.hb="Se�al de latido";
hstatrouter2.hb="Cable Telstra";
hstatrouter2.connecting="Conectando";
hstatrouter2.disconnected="Desconectado";
hstatrouter2.disconnect="Desconectar";
hstatrouter2.right1="<b>Versi�n del firmware. </b>Versi�n actual del firmware del enrutador.";
hstatrouter2.right2="<b>Hora actual. </b>Muestra la hora, tal y como ha establecido en la ficha Instalar.";
hstatrouter2.right3="<b>Direcci�n MAC. </b>Direcci�n MAC del enrutador, como la observa su ISP.";
hstatrouter2.right4="<b>Nombre del enrutador. </b>Nombre espec�fico del enrutador establecido en la ficha Instalar.";
hstatrouter2.right5="<b>Tipo de configuraci�n. </b>Muestra informaci�n que necesita el ISP para realizar la conexi�n a Internet. Esta informaci�n se introdujo en la ficha Instalar. Puede <b>Conectar</b> o <b>Desconectar</b> desde aqu� haciendo clic en el bot�n correspondiente.";
hstatrouter2.authfail=" fallo de autenticaci�n";
hstatrouter2.noip="No se puede obtener una direcci�n IP de ";
hstatrouter2.negfail=" fallo de negociaci�n";
hstatrouter2.lcpfail=" fallo de negociaci�n LCP";
hstatrouter2.tcpfail="No se puede crear una conexi�n TCP a ";
hstatrouter2.noconn="No se puede conectar a ";
hstatrouter2.server=" servidor";

var hdmz2 = new Object();
hdmz2.right1="<b>DMZ: </b>Al activar esta opci�n, el enrutador quedar� expuesto a Internet.  Se podr� acceder a todos los puertos desde Internet";

var hforward2 = new Object();
hforward2.right1="<b>Reenv�o a intervalo de puertos: </b>Puede que determinadas aplicaciones necesiten abrir puertos espec�ficos para que funcionen correctamente, como por ejemplo, servidores y determinados juegos en l�nea. Cuando se recibe una solicitud de un puerto concreto desde Internet, el enrutador dirigir� los datos al ordenador especificado.  Por razones de seguridad, tal vez desee limitar el reenv�o de puertos s�lo a los puertos que est� utilizando, y desactivar la casilla de verificaci�n <b>Activar</b> cuando termine.";

var hfilter2 = new Object();
hfilter2.delpolicy="�Desea eliminar la directiva?";
hfilter2.right1="<b>Directiva de acceso a Internet: </b>Puede definir hasta 10 directivas de acceso. Haga clic en <b>Eliminar</b> para eliminar una directiva, o en <b>Resumen</b> para ver un resumen de la directiva.";
hfilter2.right2="<b>Estado: </b>Activa o desactiva una directiva.";
hfilter2.right3="<b>Nombre de la directiva: </b>Si lo desea, puede asignar un nombre a la directiva.";
hfilter2.right4="<b>Tipo de directiva: </b>Seleccione entre Acceso a Internet o Tr�fico de entrada.";
hfilter2.right5="<b>D�as: </b>Seleccione el d�a de la semana en el que desea aplicar la directiva.";
hfilter2.right6="<b>Horas: </b>Introduzca la hora del d�a en la que desea aplicar la directiva.";
hfilter2.right7="<b>Servicios bloqueados: </b>Puede elegir bloquear el acceso a determinados servicios. Haga clic en <b>Agregar/Editar</b> servicios para modificar estos valores.";
hfilter2.right8="<b>Bloqueo de sitios Web por direcci�n URL: </b>Puede bloquear el acceso a determinados sitios Web mediante la introducci�n de sus direcciones URL.";
hfilter2.right9="<b>Bloqueo de sitios Web por palabra clave: </b>Puede bloquear el acceso a determinados sitios Web por las palabras clave contenidas en su p�gina Web.";

var hportser2 = new Object();
hportser2.submit="Aplicar";

var hwlad2 = new Object();
hwlad2.authtyp="Tipo de autenticaci�n";
hwlad2.basrate="Velocidad b�sica";
hwlad2.mbps="Mbps";
hwlad2.def="Predet.";
hwlad2.all="Todo";
hwlad2.defdef="(Predet.: Valor predeterminado)";
hwlad2.fburst="R�faga de tramas";
hwlad2.milli="Milisegundos";
hwlad2.range="Intervalo";
hwlad2.frathrh="Umbral de fragmentaci�n";
hwlad2.apiso="Aislamiento de PA";
hwlad2.off="Desactivado";
hwlad2.on="Activado";
hwlad2.right1="<b>Tipo de autenticaci�n: </b>Puede elegir entre Autom�tico o Clave compartida.  La autenticaci�n por clave compartida es m�s segura, pero todos los dispositivos de la red deber�n admitir este tipo de autenticaci�n.";

var hwlbas2 = new Object();
hwlbas2.right1="<b>Modo de red inal�mbrica: </b>SpeedBooster se activa autom�ticamente en los modos <b>Mixto</b> y <b>S�lo G</b>. Si desea excluir clientes Wireless-G, seleccione el modo <b>S�lo B</b>.  Si desea desactivar el acceso inal�mbrico, seleccione <b>Desactivar</b>.";

var hwlsec2 = new Object();
hwlsec2.wpapsk="Clave previamente compartida de WPA";
hwlsec2.wparadius="RADIUS WPA";
hwlsec2.wpapersonal="WPA Personal";
hwlsec2.wpaenterprise="WPA Enterprise";
//new wpa2
hwlsec2.wpa2psk="S�lo clave previamente compartida de WPA2";
hwlsec2.wpa2radius="S�lo WPA2 RADIUS";
hwlsec2.wpa2pskmix="Clave previamente compartida de WPA2 mixta";
hwlsec2.wpa2radiusmix="WPA2 RADIUS mixto";
hwlsec2.wpa2personal="WPA2 Personal";
hwlsec2.wpa2enterprise="WPA2 Enterprise";
//new wpa2
hwlsec2.right1="<b>Modo de seguridad: </b>Puede optar entre Desactivar, WEP, Clave previamente compartida de WPA, RADIUS WPA o RADIUS. Todos los dispositivos de la red deben usar el mismo modo de seguridad para poder comunicarse.";

var hwmac2 = new Object();
hwmac2.right1="<b>Clonaci�n de direcciones MAC: </b>Algunos proveedores de servicios de Internet (ISP) le pedir�n que registre la direcci�n MAC de su ordenador. Si no desea volver a registrar su direcci�n MAC, puede hacer que el enrutador clone la direcci�n MAC que est� registrada con su ISP.";

var hddns2 = new Object();
hddns2.right1="<b>Servicio DDNS: </b>DDNS le permite acceder a su red mediante nombres de dominio, en lugar de usar direcciones IP. El servicio se encarga del cambio de direcci�n IP y actualiza la informaci�n del dominio de forma autom�tica.  Debe suscribirse al servicio a trav�s de TZO.com o de DynDNS.org.";
hddns2.right2="Click <b><a target=_blank href=http://Linksys.tzo.com>here</a></b> to SIGNUP with a <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TZO FREE TRIAL ACCOUNT";
hddns2.right3="Click <b><a target=_blank href=https://controlpanel.tzo.com>here</a></b> to Manage your <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TZO Account";
hddns2.right4="Click <b><a target=_blank href=https://www.tzo.com/cgi-bin/Orders.cgi?ref=linksys>here</a></b> to Purchase a TZO <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DDNS Subscription";
hddns2.right5="TZO DDNS <b><a target=_blank href=http://Linksys.tzo.com>Support/Tutorials</a></b>";

var hrouting2 = new Object();
hrouting2.right1="<b>Modo de funcionamiento: </b>Si el enrutador se encarga de la conexi�n a Internet, seleccione el modo <b>Puerta de enlace</b>.  Si hay otro enrutador en la red, seleccione el modo <b>Enrutador</b>.";
hrouting2.right2="<b>Seleccionar n�mero de conjunto: </b>Es el n�mero de ruta �nico; puede configurar un m�ximo de 20 rutas.";
hrouting2.right3="<b>Nombre de ruta:</b>  Introduzca el nombre que desea asignar a esta ruta.";
hrouting2.right4="<b>IP de LAN de destino: </b>Es el host remoto al que desea asignar la ruta fija.";
hrouting2.right5="<b>M�scara de subred: </b>Determina el host y la parte de red.";

var hindex2 = new Object();
hindex2.telstra="Cable Telstra";
hindex2.dns3="DNS 3 fijo";
hindex2.hbs="Servidor de &nbsp;latidos";
hindex2.l2tps="Servidor L2TP";
hindex2.hdhcp="<b>Configuraci�n autom�tica - DHCP: </b>este valor se utiliza principalmente con operadores de cable.<br><br>";
hindex2.hpppoe1="<b>PPPoE: </b>este valor se utiliza principalmente con proveedores DSL.<br>";
hindex2.hpppoe2="<b>Usuario: </b>Introduzca el nombre de usuario proporcionado por su ISP.<br>";
hindex2.hpppoe3="<b>Contrase�a: </b>Introduzca la contrase�a proporcionada por su ISP.<br>";

//hindex2.hpppoe4="<b><a target=_blank href=help/HSetup.asp>M�s...</a></b><br><br><br><br><br>";

hindex2.hstatic1="<b>IP fija: </b>este valor se utiliza principalmente con ISP para empresas.<br>";
hindex2.hstatic2="<b>Direcci�n IP de Internet: </b>Introduzca la direcci�n IP proporcionada por su ISP.<br>";
hindex2.hstatic3="<b>M�scara de subred: </b>Introduzca su m�scara de subred<br>";

//hindex2.hstatic4="<b><a target=_blank href=help/HSetup.asp>M�s...</a></b><br><br><br><br><br><br><br>";

hindex2.hpptp1="<b>PPTP: </b>este valor se utiliza principalmente con proveedores DSL.<br>";
hindex2.hpptp2="<b>Direcci�n IP de Internet: </b>Introduzca la direcci�n IP proporcionada por su ISP.<br>";
hindex2.hpptp3="<b>M�scara de subred: </b>Introduzca su m�scara de subred<br>";
hindex2.hpptp4="<b>Puerta de enlace: </b>Introduzca la direcci�n de la puerta de enlace de su ISP<br>";

//hindex2.hpptp5="<b><a target=_blank href=help/HSetup.asp>M�s...</a></b><br><br><br><br><br><br><br><br>";

hindex2.hl2tp1="<b>L2TP: </b>Este valor lo utilizan algunos ISP en Europa.<br>";
hindex2.hl2tp2="<b>Usuario: </b>Introduzca el nombre de usuario proporcionado por su ISP.<br>";
hindex2.hl2tp3="<b>Contrase�a: </b>Introduzca la contrase�a proporcionada por su ISP.<br>";

//hindex2.hl2tp4="<b><a target=_blank href=help/HSetup.asp>M�s...</a></b><br><br><br><br><br><br><br><br>";

hindex2.hhb1="<b>Cable Telstra: </b>Este valor se utiliza principalmente con proveedores DSL.<br>";
hindex2.hhb2="<b>Usuario: </b>Introduzca el nombre de usuario proporcionado por su ISP.<br>";
hindex2.hhb3="<b>Contrase�a: </b>Introduzca la contrase�a proporcionada por su ISP.<br>";

//hindex2.hhb4="<b><a target=_blank href=help/HSetup.asp>M�s...</a></b><br><br><br><br><br><br>";

hindex2.right1="<b>Nombre de host: </b>Introduzca el nombre de host proporcionado por su ISP.<br>";
hindex2.right2="<b>Nombre de dominio: </b>Introduzca el nombre de dominio proporcionado por su ISP.<br>";
hindex2.right3="<b>Direcci�n IP local: </b>Es la direcci�n del enrutador.<br>";
hindex2.right4="<b>M�scara de subred: </b>Es la m�scara de subred del enrutador.<br><br><br>";
hindex2.right5="<b>Servidor DHCP: </b>Permite al enrutador gestionar las direcciones IP.<br>";
hindex2.right6="<b>Direcci�n IP inicial: </b>Direcci�n con la que desea comenzar.<br>";
hindex2.right7="<b>Configuraci�n horaria: </b>Seleccione la zona horaria donde se encuentra. El enrutador tambi�n se puede ajustar autom�ticamente al horario de verano.";
hindex2.hdhcps1="<b>N�mero m�ximo de usuarios DHCP: </b>Puede limitar el n�mero de direcciones que gestiona el enrutador.<br>";
hindex2.pptps="Servidor PPTP";

var errmsg2 = new Object();
errmsg2.err0="La direcci�n IP del servidor de latidos no es v�lida.";
errmsg2.err1="�Eliminar esta entrada?";
errmsg2.err2="Debe introducir un SSID.";
errmsg2.err3="Introduzca la clave compartida.";
errmsg2.err4=" tienen d�gitos hexadecimales no v�lidos o superan los 63 caracteres.";
errmsg2.err5="Clave no v�lida, debe tener entre 8 y 63 caracteres ASCII o 64 d�gitos hexadecimales";
errmsg2.err6="Debe introducir una clave para Clave ";
errmsg2.err7="Longitud no v�lida en la clave ";
errmsg2.err8="Introduzca una frase secreta.";
errmsg2.err9="El total de comprobaciones excede las 40.";
errmsg2.err10=" no es un espacio permitido.";
errmsg2.err11="Despu�s de realizar todas las acciones, haga clic en el bot�n Aplicar para guardar la configuraci�n.";
errmsg2.err12="Debe introducir un nombre de servicio.";
errmsg2.err13="El nombre del servicio debe existir.";
errmsg2.err14="Direcci�n IP de LAN o m�scara de subred no v�lidas.";

var trigger2 = new Object();
trigger2.ptrigger="Desencadenamiento de puertos";
trigger2.qos="QoS";
trigger2.trirange="Intervalo desencadenado";
trigger2.forrange="Intervalo reenviado";
trigger2.sport="Puerto inicial";
trigger2.eport="Puerto final";
trigger2.right1="Aplicaci�n Introduzca el nombre de la aplicaci�n del disparador. <b>Intervalo desencadenado</b> Para cada aplicaci�n, muestra el intervalo de n�mero de puertos desencadenados. Revise los n�meros de puerto necesarios en la documentaci�n de la aplicaci�n de Internet. <b>Puerto inicial</b> Introduzca el n�mero de puerto inicial del intervalo desencadenado. <b>Puerto final</b> Introduzca el n�mero de puerto final del intervalo desencadenado. <b>Intervalo reenviado</b> Para cada aplicaci�n, muestra el intervalo de n�meros de puerto reenviados. Revise los n�meros de puerto necesarios en la documentaci�n de la aplicaci�n de Internet. <b>Puerto inicial</b> Introduzca el n�mero de puerto inicial del intervalo reenviado. <b>Puerto final</b> Introduzca el n�mero de puerto final del intervalo reenviado.";

var bakres2 = new Object();
bakres2.conman="Administraci�n de configuraci�n";
bakres2.bakconf="Realizar copia de seguridad de configuraci�n";
bakres2.resconf="Restaurar configuraci�n";
bakres2.file2res="Seleccione un archivo para realizar la restauraci�n";
bakres2.bakbutton="Copia de seguridad";
bakres2.resbutton="Restaurar";
bakres2.right1="Si lo desea, puede realizar una copia de seguridad de la configuraci�n actual en caso de que necesite restablecer el enrutador a su configuraci�n predeterminada de f�brica.";
bakres2.right2="Puede hacer clic en el bot�n Copia de seguridad para realizar una copia de seguridad de la configuraci�n actual.";
bakres2.right3="Haga clic en el bot�n Examinar para buscar y seleccionar un archivo de configuraci�n que est� guardado actualmente en su PC.";
bakres2.right4="Haga clic en Restaurar para sobrescribir la configuraci�n actual con la del archivo de configuraci�n.";

var qos = new Object();
qos.uband="Ancho de banda<br>de subida";
qos.bandwidth="Ancho de banda";
qos.dpriority="Prioridad de dispositivos";
qos.priority="Prioridad";
qos.dname="Nombre del dispositivo";
qos.low="Baja";
qos.medium="Media";
qos.high="Alta";
qos.highest="M�xima";
qos.eppriority="Prioridad de puertos Ethernet";
qos.flowctrl="Control de flujo";
qos.appriority="Prioridad de aplicaciones";
qos.specport="Puerto espec�fico";
//qos.appname="Nombre de la aplicaci�n";
qos.appname="Nombre de la aplicaci�n";
qos.alert1="El valor del puerto est� fuera del intervalo [0-65535]";
qos.alert2="El valor de puerto inicial es mayor que el valor de puerto final";
qos.confirm1="Configurar varios dispositivos, el puerto Ethernet o la aplicaci�n con prioridad alta puede negar el efecto de QoS.\n�Seguro que desea continuar?";
/*
qos.right1="WRT54G ofrece dos tipos de funciones QoS (calidad del servicio), basada en aplicaci�n y basada en puerto. Seleccione la opci�n adecuada a sus necesidades.";
qos.right2="<b>QoS basada en aplicaci�n: </b>Puede controlar el ancho de banda con respecto a la aplicaci�n que lo consume. Existen varias aplicaciones ya configuradas. Tambi�n puede personalizar hasta tres aplicaciones mediante la introducci�n del n�mero de puerto que utilizan.";
qos.right3="<b>QoS basada en puerto: </b>Puede controlar el ancho de banda seg�n el puerto de LAN f�sico al que est� conectado su dispositivo. Puede asignar una prioridad Alta o Baja a los dispositivos conectados a los puertos de LAN 1 a 4.";
*/
//wireless qos
qos.optgame="Optimizar aplicaciones de juegos";
qos.wqos="QoS de cable";
qos.wlqos="QoS inal�mbrico";
qos.edca_ap="Par�metros PA de EDCA";
qos.edca_sta="Par�metros STA de EDCA";
qos.wme="Soporte de WMM";
qos.noack="Sin acuse de recibo";
qos.defdis="(Predeterminado: Desactivar)";
qos.cwmin="CWmin";
qos.cwmax="CWmax";
qos.aifsn="AIFSN";
qos.txopb="TXOP(b)";
qos.txopag="TXOP(a/g)";
qos.admin="Admin";
qos.forced="Forzado";
qos.ac_bk="AC_BK";
qos.ac_be="AC_BE";
qos.ac_vi="AC_VI";
qos.ac_vo="AC_VO";


qos.right1="Est�n disponibles dos tipos de funciones QoS (Quality of Service), QoS de cable que controla los dispositivos conectados al enrutador mediante un cable Ethernet, y QoS inal�mbrico, que controla los dispositivos conectados de forma inal�mbrica al enrutador."
qos.right2="<b>Prioridad de dispositivos:</b> puede especificar la prioridad de todo el tr�fico desde un dispositivo de la red mediante la asignaci�n de un nombre de dispositivo a dicho dispositivo, especifique la prioridad e introduzca su direcci�n MAC."
qos.right3="<b>Prioridad de puertos Ethernet:</b> puede controlar la velocidad de los datos en funci�n del puerto LAN f�sico al que est� conectado el dispositivo. Puede asignar una prioridad Alta o Baja al tr�fico de datos de los dispositivos conectados a los puertos de LAN 1 a 4."
qos.right4="<b>Prioridad de aplicaciones:</b> puede controlar la velocidad de los datos con respecto a la aplicaci�n que consume ancho de banda. Active <b>Optimizar aplicaciones de juegos</b> para permitir que los puertos comunes de aplicaciones de juegos tengan una prioridad m�s alta. Puede personalizar hasta ocho aplicaciones mediante la introducci�n del n�mero de puerto que emplean."
qos.right5="QoS inal�mbrico tambi�n se conoce como <b>Wi-Fi MultiMedia<sup>TM</sup> (WMM)</b>, denominaci�n asignada por Wi-Fi Alliance<sup>TM</sup>. Seleccione Activar para usar WMM si emplea otros dispositivos inal�mbricos que disponen tambi�n de certificaci�n WMM."
qos.right6="<b>Sin acuse de recibo:</b> active esta opci�n si desea desactivar el acuse de recibo. Si esta opci�n est� activada, el enrutador no reenviar� los datos si se produce un error."


var vpn2 = new Object();
vpn2.right1="Si lo desea, puede activar la pasarela PPTP, L2TP o IPSec para permitir que sus dispositivos de red se comuniquen a trav�s de VPN.";

// for parental control

var pactrl = new Object();
pactrl.pactrl ="Control parental";
pactrl.accsign ="Suscripci�n de cuenta";
pactrl.center1 ="La soluci�n de control parental de Linksys permite mantener segura <br>a su familia mientras navegan por Internet";
pactrl.center2 ="<li>F�cil de configurar</li><br><li>Proteja cualquier ordenador de la casa desde el enrutador Linksys</li><br><li>Los informes le permiten controlar el uso del Web, del correo electr�nico y de la mensajer�a instant�nea</li>";
pactrl.center3 ="** La suscripci�n a este servicio desactivar� las directivas de acceso a Internet integradas en el enrutador";
pactrl.manageacc ="Gestionar cuenta";
pactrl.center4 ="Gesti�n de la cuenta de control parental";
pactrl.signparental ="Suscribirse al servicio de control parental";
pactrl.moreinfo ="M�s informaci�n";
pactrl.isprovision ="el dispositivo tiene una cuenta";
pactrl.notprovision ="el dispositivo no tiene ninguna cuenta ";
pactrl.right1 ="La pantalla Control parental permite suscribirse a una cuenta Control parental de Linksys y gestionarla. El servicio Parental Control de Linksys le ofrece unas potentes herramientas para controlar la disponibilidad de los servicios de Internet, el acceso y funciones, y permite personalizarlo para cada miembro de la familia.";

var satusroute = new Object();
satusroute.localtime ="No disponible";

var succ = new Object();
succ.autoreturn ="Volver� a la p�gina anterior tras varios segundos.";
