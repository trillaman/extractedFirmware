//Basic Setup
var hsetup = new Object();
hsetup.phase1="La pantalla <i>Configuraci�n</i> \
		es la primera que aparece al acceder al enrutador. La mayor�a de los usuarios  \
		podr�n configurar el enrutador y hacer que funcione correctamente con tan solo \
		los par�metros de esta pantalla. Algunos proveedores de servicios de Internet (ISPs) necesitar�n  \
		que introduzca informaci�n espec�fica, como el usuario, la contrase�a, la direcci�n IP,  \
		la direcci�n de puerta de enlace predeterminada o la direcci�n IP de DNS. Podr� obtener esta informaci�n \
		de su ISP, si es necesario.";
hsetup.phase2="Nota: despu�s \
		de configurar estos par�metros, deber�a establecer una nueva contrase�a para el enrutador  \
		mediante la pantalla <i>Seguridad</i>. De este modo habr� mayor seguridad ya que el \
		enrutador estar� protegido de modificaciones no autorizadas. Todos los usuarios que intenten acceder a \
		la utilidad basada en Web o al asistente para instalaci�n del enrutador deber�n introducir la contrase�a del mismo.";
hsetup.phase3="Seleccione la \
		zona horaria correspondiente a su residencia. Si en su zona se aplica el horario de verano, \
    		active la casilla de verificaci�n situada junto a <i>Ajustar reloj autom�ticamente \
    		al horario de verano</i>.";
hsetup.phase4="MTU es la  \
    		unidad m�xima de transmisi�n y especifica el tama�o de paquete m�s grande que se permite \
    		en la transmisi�n por Internet. Mantenga el valor predeterminado, <b>Autom�tico</b>, o permita \
    		que el enrutador seleccione la mejor MTU para su conexi�n a Internet. Para especificar un \
    		tama�o de MTU, seleccione <b>Manual</b> e introduzca el valor deseado (el valor predeterminado es <b> \
    		1400</b>).&nbsp; Deber�a dejar este valor en un intervalo de 1200 a 1500.";
hsetup.phase5="Algunos ISP necesitan este valor y se lo pueden proporcionar.";
hsetup.phase6="El enrutador admite cuatro tipos de conexi�n:";
hsetup.phase7="Configuraci�n autom�tica DHCP";
hsetup.phase8="PPPoE (Protocolo punto a punto por Ethernet)";
hsetup.phase9="PPTP (Protocolo de t�nel punto a punto)";
hsetup.phase10="Estos tipos se pueden seleccionar del men� desplegable situado junto a COnexi�n a Internet. \
    		La informaci�n necesaria y las funciones disponibles variar�n en funci�n \
    		del tipo de conexi�n seleccionado. A continuaci�n se \
    		incluyen algunas descripciones de esta informaci�n:";		
hsetup.phase11="Direcci�n IP de Internet y m�scara de subred";
hsetup.phase12="Es la direcci�n IP y la m�scara de subred del enrutador \
    		tal como la observan los usuarios externos de Internet (incluso su \
    		ISP). Si su conexi�n a Internet requiere una direcci�n IP fija, su ISP \
    		le proporcinar� entonces una direcci�n IP y una m�scara de subred fijas.";
hsetup.phase13="Su ISP le proporcionar� la direcci�n IP de la puerta de enlace."
hsetup.phase14="(Servidor de nombres de dominio)";
hsetup.phase15="Su ISP le proporcionar� al menos una direcci�n IP de DNS.";
hsetup.phase16="Usuario y contrase�a";
hsetup.phase17="Introduzca el <b>usuario</b> y la \
		<b>contrase�a</b> que utiliza para conectarse a su ISP a trav�s de una \
    		 conexi�n PPPoE o PPTP.";
hsetup.phase18="Conectar a petici�n";
hsetup.phase19="Puede configurar el enrutador para que \
    		desconecte la conexi�n a Internet despu�s de un per�odo de inactividad especificado \
    		(Tiempo m�ximo de inactividad). Si la conexi�n a Internet se ha cerrado porque ha estado \
    		inactiva, Conectar a petici�n permite al enrutador volver a establecer la \
   		conexi�n autom�ticamente en el momento en el que intenta volver a acceder a Internet.\
   		Si desea activar Conectar a petici�n, active el bot�n de opci�n. Si \
    		desea que la conexi�n a Internet siga activa todo el tiempo, introduzca <b>0</b> \
    		en el campo <i>Tiempo m�ximo de inactividad</i>. De lo contrario, introduzca el n�mero de minutos \
    		que desea que transcurran antes de cerrar la conexi�n a Internet.";
hsetup.phase20="Opci�n Mantener conexi�n ";
hsetup.phase21="Esta opci�n le mantiene conectado \
    		a Internet de forma indefinida, aunque la conexi�n permanezca inactiva. Para utiliar \
    		esta opci�n, active el bot�n de opci�n situado junto a <i>Mantener conexi�n</i>. El \
    		per�odo de marcado predeterminado es de 30 segundos (es decir, el enrutador comprobar� la \
    		conexi�n a Internet cada 30 segundos).";
hsetup.phase22="Nota: algunos \
    		proveedores de cable requieren una direcci�n MAC espec�fica poara realizar la conexi�n a \
    		Internet. Para obtener m�s informaci�n, haga clic en la ficha <b>Sistema</b> . A continuaci�n, \
    		haga clic en el bot�n <b>Ayuda</b> y lea la informaci�n que se proporciona sobre la funci�n de clonaci�n MAC.";
hsetup.phase23="LAN";
hsetup.phase24="Direcci�n IP y M�scara de subred";
hsetup.phase25="Se trata de\
    		la direcci�n IP y la m�scara de subred del enrutador tal y como se ve en la LAN interna. El \
    		valor predeterminado es 192.168.1.1 para direcci�n IP y 255.255.255.0 para la m�scara de subnet.";
hsetup.phase26="DHCP";
hsetup.phase27="Mantenga el valor \
    		predeterminado, <b>Activar</b>, para activar la opci�n DHCP del enrutador. Si ya \
    		tiene un servidor DHCP en la red y no desea uno, \
    		seleccione <b>Desactivar</b>.";
hsetup.phase28="Introduzca un \
    		valor num�rico con el que debe comenzar el servidor DHCP cuando emita direcciones IP. \
    		No empiece con 192.168.1.1 (la direcci�n IP del enrutador).";
hsetup.phase29="N�mero m�ximo de usuarios de DHCP";
hsetup.phase30="Introduzca el \
    		n�mero m�ximo de ordenadores al que el servidor DHCP debe asignar direcciones IP.\
    		El m�ximo absoluto es 253--es posible si 192.168.1.2 es su direcci�n IP inicial.";
hsetup.phase31="El tiempo de \
    		concesi�n de cliente es la cantidad de tiempo durante el que un usuario de la red tiene permiso \
    		para conectarse al entutador con su direcci�n IP din�mica actual. Introduzca la cantidad de\
    		tiempo en minutos que se \"conceder�\" al usuario esta direcci�n IP din�mica.";
hsetup.phase32="DNS 1-3 fijo ";
hsetup.phase33="El sistema \
    		de nombres de dominio (DNS) es la forma en la que Internet traduce nombres de dominio o de sitios Web \
    		en direcciones de Internet o direcciones URL. Su ISP le proporcionar� al menos una \
    		direcci�n IP del servidor DNS. Si desea utilizar otra, introduzca esa direcci�n IP \
    		en uno de estos campos. Puede introducir hasta tres direcciones IP de servidor DNS \
    		aqu�. El enrutador las utilizar� para tener un acceso m�s r�pido a los servidores DNS \
    		en funcionamiento.";
hsetup.phase34="El servicio de nombres de Internet de Windows (WINS) gestiona la intereacci�n de cada uno de los PC con \
    		Internet. Si utiliza un servidor WINS, introduzca su direcci�n IP aqu�. \
    		De lo contrario, deje el campo en blanco.";
hsetup.phase35="Compruebe todos los \
		valores y haga clic en <b>Guardar configuraci�n</b> para guardar la configuraci�n. Haga clic en el bot�n <b>Cancelar \
		cambios</b> para \
		cancelar los cambios sin guardar. Con�ctese a Internet para probar la \
		configuraci�n. ";    		    		    		

//DDNS
var helpddns = new Object();
helpddns.phase1="El enrutador ofrece una funci�n DDNS (Dynamic Domain Name System). DDNS permite asignar un host \
		y un nombre de dominio fijos a una direcci�n IP din�mica de Internet. Resulta �til cuando \
		aloja su propio sitio Web, servidor FTP y otro dispositivo detr�s del enrutador. Antes \
		de utilizar esta funci�n, debe suscribirse al servicio DDNS en <i>www.dyndns.org</i>, \
		un proveedor de servicios DDNS.";
helpddns.phase2="Servicio DDNS";
helpddns.phase3="Para desactivar el servicio DDNS, mantenga el valor predeterminado, <b>Desactivar</b>. Para activar el servicio DDNS,\
		siga estas instrucciones:";
helpddns.phase4="Suscr�base al servicio DDNS en <i>www.dyndns.org</i> y anote \
		su nombre de usuario,<i> </i>contrase�a y la informaci�n del <i> </i>nombre de host.";
helpddns.phase5="En la pantalla <i>DDNS</i>, seleccione <b>Activar.</b>";
helpddns.phase6="Rellene los campos <i>Nombre de usuario</i>,<i> Contrase�a</i> y <i> Nombre de host</i>.";
helpddns.phase7="Haga clic en el bot�n <b>Guardar configuraci�n</b> para guardar los cambios. Haga clic en el bot�n <b>Cancelar cambios</b> para \
		cancelar los cambios no guardados.";
helpddns.phase8="Aqu� se muestra la direcci�n IP de Internet actual del enrutador.";
helpddns.phase9="Aqu� se muestra la conexi�n al servicio DDNS.";
		
//MAC Address Clone
var helpmac =  new Object();
helpmac.phase1="Clonaci�n MAC";
helpmac.phase2="La direcci�n MAC del enrutador es un c�digo de 12 d�gitos asignando a un componente \
    		de hardware para su identificaci�n. Algunos ISP requieren que registre la direcci�n MAC \
    		de su tarjeta o adaptador de red, que estaba conectado a su m�dem DSL o de cable \
    		durante la instalaci�n. Si su ISP require que registre la direcci�n MAC, \
    		busque la direcci�n MAC del adaptador siguiendo las \
    		instrucciones del sistema operativo de su ordenador.";
helpmac.phase3="Para Windows 98 y Millennium:";
helpmac.phase4="1.  Haga clic en el bot�n <b>Inicio</b> y seleccione <b>Ejecutar</b>.";
helpmac.phase5="2.  Escriba <b>winipcfg </b> en el campo proporcionado y pulse la tecla <b>Aceptar</b>.";
helpmac.phase6="3.  Seleccione el adaptador Ethernet que est� utilizando.";
helpmac.phase7="4.  Haga clic en <b>M�s informaci�n</b>.";
helpmac.phase8="5.  Anote la direcci�n MAC del adaptador.";
helpmac.phase9="1.  Haga clic en el bot�n <b>Inicio</b> y seleccione <b>Ejecutar</b>.";
helpmac.phase10="2.  Escriba <b>cmd </b> en el campo proporcionado y pulse la tecla <b>Aceptar</b>.";
helpmac.phase11="3.  En el s�mbolo de comandos, ejecute <b>ipconfig /all</b> y observe la direcci�n f�sica del adaptador.";
helpmac.phase12="4.  Anote la direcci�n MAC del adaptador.";
helpmac.phase13="Para clonar la direcci�n MAC del adaptador de red en el enrutador y evitar tener que llamar a \
    		su ISP para cambiar la direcci�n MAC registrada, siga estas instrucciones:";
helpmac.phase14="Para Windows 2000 y XP:";
helpmac.phase15="1.  Seleccione <b>Activar</b>.";
helpmac.phase16="2.  Introduzca la direcci�n MAC del adaptador en en campo <i>Direcci�n MAC</i>.";
helpmac.phase17="3.  Haga clic en el bot�n <b>Guardar configuraci�n</b>.";
helpmac.phase18="Para desactivar la clonaci�n de direcciones MAC, mantenga el valor predeterminado, <b>Desactivar</b>.";

//Advance Routing
var hrouting = new Object();
hrouting.phase1="Enrutamiento";
hrouting.phase2="En la pantalla <i>Enrutamiento</i> puede establecer el modo de enrutamiento y la configuraci�n del enrutador. \
		 El modo de puerta de enlace es el recomendado para la mayor�a de los usuarios.";
hrouting.phase3="Seleccione el modo de trabajo correcto. Mantenga el valor predeterminado, <b> \
    		 Puerta de enlace</b>, si el enrutador est� alojando la conexi�n de red a Internet (el modo Puerta de enlace es el recomendado para la mayor�a de los usuarios). Seleccione <b> \
    		 Enrutador</b> si el enrutador se encuentra en una red con otros enrutadores.";
hrouting.phase4="Enrutamiento din�mico (RIP)";
hrouting.phase5="Nota: esta funci�n no est� disponible en el modo Puerta de enlace.";
hrouting.phase6="El enrutamiento din�mico permite al enrutador ajustar de forma autom�tica los cambios f�sicos en \
    		 el dise�o de la red e intercambiar tablas de enrutamiento con otros enrutadores. El \
    		 enrutador determina la ruta de los paquetes de red seg�n el menor n�mero de \
    		 saltos entre el origen y el destino. ";
hrouting.phase7="Para activar la funci�n de enrutamiento din�mico para el lado WAN, seleccione <b>WAN</b>. \
    		 Para activar esta funci�n para el lado LAN e inal�mbrico, seleccione <b>LAN e inal�mbrica</b>. \
    		 Para activar la funci�n tanto en WAN como en LAN, seleccione <b> \
    		 Ambos</b>. Para desactivar la funci�n de enrutamiento din�mico para todas las transmisiones de datos, mantenga \
    		 el valor predeterminado, <b>Desactivar</b>. ";
hrouting.phase8="Enrutamiento est�tico,&nbsp; Direcci�n IP de destino, M�scara de subred, Puerta de enlace e Interfaz";
hrouting.phase9="Para configurar una ruta est�tica entre el enrutador y otra red, \
    		 seleccione un n�mero en la lista desplegable <i>Enrutamiento est�tico</i>. (Una ruta \
    		 est�tica es un camino predetemrinado por la que debe viajar la informaci�n de red para \
    		 alcanzar un host o una red espec�ficos.)";
hrouting.phase10="Introduzca estos datos:";
hrouting.phase11="Direcci�n IP de destino </b>- \
		  La direcci�n IP de destino es la direcci�n de la red o del host al que desea asignar una ruta est�tica.";
hrouting.phase12="M�scara de subred </b>- \
		  La m�scara de subred determina qu� secci�n de una direcci�n IP es la porci�n de red y qu� \
    		  secci�n es la porci�n de host. ";
hrouting.phase13="Puerta de enlace </b>- \
		  Es la direcci�n IP del dispositivo de puerta de enlace que permite establecer el contacto entre el enrutador y la red o el host.";
hrouting.phase14="Dependiendo de la ubicaci�n de la direcci�n IP de destino, seleccione \
    		  <b>LAN e Inal�mbrica </b>o <b>WAN </b>en el men� desplegable <i>Interfaz</i>.";
hrouting.phase15="Para guardar los cambios, haga clic en el bot�n <b>Aplicar</b>. Para cancelar los cambios sin guardar, haga clic en el bot�n <b> \
    		  Cancelar</b>.";
hrouting.phase16="Para agregar m�s rutas est�ticas, repita los pasos 1 al 4.";
hrouting.phase17="Eliminar esta entrada";
hrouting.phase18="Para eliminar una entrada de ruta est�tica:";
hrouting.phase19="En la lista lista desplegable <i>Enrutamiento est�tico</i>, seleccione un n�mero de entrada de la ruta est�tica.";
hrouting.phase20="Haga clic en el bot�n <b>Eliminar esta entrada</b>.";
hrouting.phase21="Para guardar un elemento eliminado, haga clic en el bot�n <b>Aplicar</b>. Para cancelar un elemento eliminado, haga clic en el bot�n <b> \
    		  Cancelar</b>. ";
hrouting.phase22="Mostrar tabla de enrutamiento";
hrouting.phase23="Haga clic en el bot�n \
    		  <b>Mostrar tabla de enrutamiento</b> para ver todas las entradas de ruta v�lidas en uso. La direcci�n IP de destino, la m�scara de subred, \
    		  la puerta de enlace y la interfaz se mostrar�n en cada entrada. Haga clic en el bot�n <b>Actualizar</b> para actualizar los datos visualizados. Haga clic en el bot�n <b> \
    		  Cerrar</b> para volver a la pantalla <i>Enrutamiento</i>.";
hrouting.phase24="Direcci�n IP de destino </b>- \
		  La direcci�n IP de destino es la direcci�n de la red o del host a la que est� asignada la ruta est�tica. ";
hrouting.phase25="M�scara de subred </b>- \
		  La m�scara de subred determina qu� secci�n de una direcci�n IP es la porci�n de red y qu� secci�n es la porci�n de host.";
hrouting.phase26="Puerta de enlace</b> - Es la direcci�n IP del dispositivo de puerta de enlace que permite establecer el contacto entre el enrutador y la red o el host.";
hrouting.phase27="Interfaz</b> - Esta interfaz le indica si la direcci�n IP de destino est� en \
    		  <b> LAN e Inal�mbrica </b>(redes con cables e inal�mbricas internas), en <b>WAN</b> (Internet) o en <b> \
    		  Bucle invertido</b> (una red ficticia en la que un PC act�a como una red y que es necesaria para determinados programas de software). ";

//Firewall
var hfirewall = new Object();
hfirewall.phase1="Bloquear solicitud de WAN";
hfirewall.phase2="Mediante la activaci�n de la funci�n de bloqueo de solicitudes de WAN es posible evitar que se realicen \
    		 sondeos en su red o que �sta sea decectada por otros usuarios de Internet. La funci�n Bloquear solicitud de WAN \
    		 tambi�n refuerza la seguridad de la red ya que oculta los puertos. \
    		 Ambas funciones de Bloquear solicutud de WAN hacen m�s dificil que usuarios \
    		 externos consigan acceder a la red. Esta funci�n est� activada \
    		 de forma predeterminada. Seleccione <b>Desactivar</b> para desactivarla.";
hfirewall.right="Activar o desactivar el servidor de seguridad SPI.";

//VPN
var helpvpn = new Object();
helpvpn.phase1="Pasarela de VPN";
helpvpn.phase2="Las redes privadas virtuales (VPN) normalmente se utilizan para crear redes relacionadas con trabajos. En los \
    		t�neles VPN, en enrutador admite las pasarelas IPSec y PPTP.";
helpvpn.phase3="<b>IPSec</b> - Seguridad del protocolo de Internet (IPSec) es un<b> </b>conjunto de protocolos que se usan para implementar \
      		el intercambio seguro de paquetes a nivel de IP. Para permitir que los t�neles IPSec \
      		atraviesen el enrutrador, la pasarela IPSec est� activada de forma predetermianda. Para desactivarla, \
      		desactive la casilla de verificaci�n situada junto a <i>IPSec</i>.";
helpvpn.phase4="<b>PPTP </b>- El protocolo de t�nes punto a punto es el m�todo utilizado para habilitar sesiones VPN \
      		para un servidor Windows NT 4.0 o 2000. Para permitir que los t�neles PPTP atraviesen \
      		el enrutrador, la pasarela PPTP est� activada de forma predetermianda. Para desactivarla, \
      		desactive la casilla de verificaci�n situada junto a <i>PPTP</i>.";

helpvpn.right="Si lo desea, puede activar la pasarela PPTP, L2TP o IPSec para permitir que sus dispositivos de red\
		se comuniquen a trav�s de VPN.";
//Internet Access
var hfilter = new Object();
hfilter.phase1="Filtros";
hfilter.phase2="La pantalla <i>Filtros</i> permite bloquear o permitir tipos concretos de usos de Internet. \
		Puede configurar directivas de acceso a Internet en ordenadores concretos y configurar \
		filtros mediante el empleo de n�meros de puertos de red.";
hfilter.phase3="Esta funci�n permite personalizar hasta diez directivas diferentes de acceso a Internet \
    		para ordenadores concretos, que se identifican mediante sus direcciones IP o MAC. Para \
    		cada PC con directiva, especifique los d�as y per�odos de tiempo.";
hfilter.phase4="Para crear o editar una directiva, siga estas instrucciones:";
hfilter.phase5="Seleccione el n�mero de dierctiva \(1-10\) en el men� desplegable.";
hfilter.phase6="Introduzca un nombre en el campo <i>Introducir nombre de perfil</i>.";
hfilter.phase7="Haga clic en el bot�n <b>Editar lista de equipos</b>.";
hfilter.phase8="Haga clic en el bot�n <b>Aplicar</b> para guardar los cambios. Haga clic en el bot�n <b>Cancelar</b> para \
    		cancelar los cambios no guardados. Haga clic en el bot�n <b>Cerrar</b> para volver a la pantalla \
    		<i>Filtros</i>.";
hfilter.phase9="Si desea bloquear el acceso a Internet a los ordenadores de la lista durante los d�as y las horas \
    		designadas, mantenga el valor predeterminado, <b>Desactivar acceso a Internet para \
    		ordenadores de la lista</b>. Si desea permitir que los ordenadores de la lista accedan a Internet durante \
    		los d�as y las horas designadas, haga clic en el bot�n de opci�n situado junto a <i> Activar \
    		acceso a Internet para ordenadores de la lista</i>.";
hfilter.phase10="En la pantalla <i>Lista de equipos</i>, especifique los ordenadores mediante su direcci�n IP o MAC. Introduzca las \
    		direcciones IP adecuadas en los campos <i>IP</i>. Si tiene un intervalo de \
    		direcciones IP que desea filtrar, rellene los campos <i>Intervalo de IP</i> apropiados. \
    		Introduzca las direcciones MAC correspondientes en los campos <i>MAC</i>.";
hfilter.phase11="Defina la hora en la que se filtrar� el acceso. Seleccione <b>24 horas</b>,<b> </b>o active la casilla situada junto a <i>De</i> \
    		u utilice los cuadros desplegables para designar un per�odo de tiempo concreto. ";
hfilter.phase12="Defina los d�as en los que se filtrar� el acceso. Seleccione <b>Cada d�a</b> o los d�as apropiados de la semana. ";
hfilter.phase13="Haga clic en el bot�n <b>Agregar a directiva</b> para guardar los cambios y activarla.";
hfilter.phase14="Para crear o editar m�s directivas, repita los pasos 1 al 9.";
hfilter.phase15="Para eliminar una directiva de acceso a Internet, seleccione el n�mero de directiva y haga clic en el bot�n <b>Eliminar</b>.";
hfilter.phase16="Para ver un resumen de todas las directivas, haga clic en el bot�n <b>Resumen</b>. La pantalla <i> \
    		Resumen de directivas de Internet</i> mostrar� cada n�mero de directiva, el nombre \
    		de la directiva, los d�as y la hora del d�a. Para eliminar una directiva, haga clic en su casilla y, a continuaci�n, \
    		haga clic en el bot�n <b>Eliminar</b>. Haga clic en el bot�n <b>Cerrar</b> para volver a la \
    		pantalla <i>Filtros</i>.";
hfilter.phase17="Intervalo de puertos de Internet filtrados";
hfilter.phase18="Para filtrar ordenadores por n�mero de puerto de red, seleccione <b>Ambos</b>, <b>TCP</b> o <b>UDP</b>, \
    		dependiendo de los protocolos que desee filtrar. A continuaci�n<b> </b>introduzca los n�meros \
    		de puertos que desea filtrar en los campos de n�mero de puerto. Los ordenadores conectados al \
    		enrutador no podr�n acceder a ning�n puerto que aparezca en esta lista. Para \
    		desactivar un filtro, seleccione <b>Desactivar</b>.";

//share of help string
var hshare = new Object();
hshare.phase1="Compruebe todos los valores y haga clic en <b>Guardar configuraci�n</b> para guardar la configuraci�n. Haga clic en el bot�n <b>Cancelar \
		cambios</b> para cancelar los cambios no guardados.";


//DMZ
var helpdmz = new Object();
helpdmz.phase1="La funci�n de host DMZ permite exponer a un usuario local a Internet para que\
		pueda utilizar un servicio especial como juegos por Internet o videoconferencia. \
		El alojamiento DMZ reenv�a todos los puertos al mismo tiempo a un ordenador. La funci�n Reenv�o de puertos \
    		es m�s segura porque s�lo abre los puertos que el usuario \
    		desea tener abiertos, mientras que el alojamiento DMZ abre todos los puertos de un ordenador, \
    		deja expuesto al ordenador de modo que puede verse en Internet. ";    		
helpdmz.phase2="Cualquier ordenador cuyo puerto est� siendo reenviado debe tene desactivada la funci�n de cliente DHCP \
    		y debe tener asignada una nueva direcci�n IP fija porque tal vez \
    		cambie su direcci�n IP al utilizar la funci�n DHCP.";
/***To expose one PC, select enable.***/
helpdmz.phase3="Para exponer un PC, seleccione ";
helpdmz.phase4="introduzca la direcci�n IP del prdenador en el campo <i>Direcci�n IP del host DMZ</i>.";



//help number string
var hnum = new Object();
hnum.one="1."
hnum.two="2."
hnum.three="3."
hnum.four="4."
hnum.five="5."
hnum.six="5."
hnum.seven="6."
hnum.eight="7."
hnum.night="8."
 
