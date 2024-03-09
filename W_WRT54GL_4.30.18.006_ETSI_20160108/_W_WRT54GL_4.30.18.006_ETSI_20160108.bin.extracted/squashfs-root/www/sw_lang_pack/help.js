//Basic Setup
var hsetup = new Object();
hsetup.phase1="Sk�rmen <i>Inst�llningar</i> \
		�r den f�rsta sk�rmen du ser vid �tkomst till routern. De flesta \
		anv�ndare kommer att kunna konfigurera routern och f� den att fungera genom \
		inst�llningarna p� denna sk�rm. Vissa Internetleverant�rer kr�ver att du skriver in \
		specifik information som t.ex. anv�ndarnamn, l�senord, IP-adress, \
		standardadress till gateway eller DNS IP-adress. Denna information kan erh�llas fr�n \
		din Internetleverant�r om det beh�vs.";
hsetup.phase2="Observera: Efter \
		du har konfigurerat dessa inst�llningar b�r du st�lla in ett nytt l�senord f�r routern \
		i sk�rmbilden <i>S�kerhet</i>. Detta �kar s�kerheten och skyddar \
		routern mot obeh�riga �ndringar. Alla anv�ndare som f�rs�ker n� routerns \
		webbaserade verktyg eller installationsguide kommer att uppmanas om routerns l�senord.";
hsetup.phase3="V�lj den \
		tidszon f�r d�r du befinner dig. Om sommartid anv�nds ska du se till att kryssrutan \
    		�r markerad bredvid <i>Justera klockan automatiskt f�r sommartid \
    		</i>.";
hsetup.phase4="MTU st�r f�r \
   		st�rsta �verf�ringsenhet. Den anger den st�rsta till�tna paketstorleken \
    		f�r Internet�verf�ring. Beh�ll standardinst�llningen <b>Auto</b> f�r att \
    		l�ta routern v�lja b�sta MTU f�r din Internetanslutning. F�r att ange en \
    		MTU-storlek v�ljer du <b>Manuell</b> och skriver in �nskat v�rde (standardv�rdet �r <b> \
    		1400</b>).&nbsp; Detta v�rde b�r vara i intervallet 1200 till 1500.";
hsetup.phase5="Detta v�rde �r n�dv�ndig f�r vissa Internetleverant�rer och tillhandah�lls av dem.";
hsetup.phase6="Routern st�djer fyra anslutningstyper:";
hsetup.phase7="Automatisk konfiguration DHCP";
hsetup.phase8="(Point-to-Point Protocol over Ethernet)";
hsetup.phase9="(Point-to-Point Tunneling Protocol)";
hsetup.phase10="Dessa typer kan v�ljas fr�n den nedrullningsbara menyn bredvid Internetanslutning. \
    		N�dv�ndig information och tillg�ngliga funktioner varierar beroende p� \
    		vilken anslutningstyp du v�ljer. Kort beskrivning av denna \
    		information finns h�r:";		
hsetup.phase11="Internet IP-adress och n�tmask";
hsetup.phase12="Detta �r routerns IP-adress \
    		och n�tmask som visas f�r externa anv�ndare p� Internet (inklusive din \
    		Internetleverant�r). Om din Internetanslutning kr�ver en statisk IP-adress kommer din \
    		Internetleverant�r tillhandah�lla en statisk IP-adress och n�tmask.";
hsetup.phase13="Din Internetleverant�r kommer att tillhandah�lla en gateway IP-adress."
hsetup.phase14="(Dom�nnamnsserver)";
hsetup.phase15="Internetleverant�ren kommer att tillhandah�lla minst en DNS IP-adress.";
hsetup.phase16="Anv�ndarnamn och l�senord";
hsetup.phase17="Skriv in det <b>Anv�ndarnamn </b> och \
		<b>L�senord</b> som du anv�nder vid inloggning till din Internetleverant�r via en PPPoE- eller PPTP- \
    		anslutning.";
hsetup.phase18="Anslut p� beg�ran";
hsetup.phase19="du kan konfigurera routern att \
    		koppla ifr�n din Internetanslutning efter en viss period med inaktivitet \
    		(Max v�ntetid). Om Internetanslutningen har avbrutits p� grund av \
    		inaktivitet g�r Anslut p� beg�ran att routern automatiskt kan \
   		�teruppr�tta din anslutning s� fort du f�rs�ker n� Internet \
   		igen. Om du vill aktivera Anslut p� beg�ran klickar du p� alternativknappen. Om \
    		du vill att din Internetanslutning alltid ska vara aktiv skriver du <b>0</b> \
    		i f�ltet <i>Max v�ntetid</i>. Annars skriver du in det antal minuter \
    		som du vill ska passera innan din Internetanslutning avslutas.";
hsetup.phase20="Alternativet Beh�ll aktiv ";
hsetup.phase21="Detta alternativ h�ller dig ansluten \
    		till Internet under obest�md tid �ven om din anslutning �r inaktiv. F�r att anv�nda \
    		detta alternativ klickar du p� alternativknappen bredvid <i>Beh�ll aktiv</i>. Standardinst�llningen \
    		f�r �teruppringningsperiod �r 30 sekunder (dvs. routern kontrollerar \
    		Internetanslutningen var 30:e sekund).";
hsetup.phase22="Observera: Vissa \
    		kabelleverant�rer kr�ver en specifik MAC-adress f�r anslutning till \
    		Internet. Mer information finns under fliken <b>System</b>. Klicka d�refter \
    		p� knappen <b>Hj�lp</b> och l�s om funktionen f�r MAC-kloning.";
hsetup.phase23="LAN";
hsetup.phase24="IP-adress och n�tmask";
hsetup.phase25="Detta �r\
    		routerns IP-adress och n�tmask som visas p� det interna LAN. Standardv�rdet \
    		�r 192.168.1.1 f�r IP-adress och 255.255.255.0 f�r n�t\
    		mask.";
hsetup.phase26="DHCP";
hsetup.phase27="Beh�ll \
		standardinst�llningen <b>Aktivera</b> f�r att aktivera routeralternativet DHCP-server. Om du \
		redan har en DHCP-server i n�tverket eller inte vill ha en DHCP-server \
		v�ljer du <b>Inaktivera</b>.";
hsetup.phase28="Ange ett \
    		numeriskt v�rde till DHCP-servern f�r start vid utf�rdandet av IP-adresser. \
    		B�rja inte med 192.168.1.1 (IP-adressen till routern).";
hsetup.phase29="Maximalt antal DHCP-anv�ndare";
hsetup.phase30="Skriv in \
    		det maximala antalet datorer som du vill att DHCP-servern ska tilldela IP-adresser \
    		till. Absolut maximum �r 253--m�jligt om 192.168.1.2 �r f�rsta IP- \
    		adress.";
hsetup.phase31="Klientens \
    		l�netid �r den tid som en n�tverksanv�ndare till�ts ansluta till \
    		till routern men dess aktuella dynamiska IP-adress. Skriv in tiden \
    		i minuter som anv�ndaren kan \"leased\" denna dynamiska IP-adress.";
hsetup.phase32="Statisk DNS 1-3 ";
hsetup.phase33="Dom�nnamnsystemet \
    		(DNS) �r hur Internet �vers�tter namn p� dom�ner eller webbplatser \
    		till Internet-adresser eller URL. Internetleverant�ren tillhandah�ller minst en \
    		IP-adress f�r DNS-server. Om du vill anv�nda en annan anger du den IP-adressen \
    		i ett av dessa f�lt. Du kan ange upp till tre IP-adresser f�r DNS-server \
    		h�r. Routern anv�nder dessa f�r snabbare �tkomst till fungerande DNS-servrar.";
hsetup.phase34="WINS (Windows Internet Naming Service) hanterar varje dators interaktion med \
    		Internet. Om du anv�nder en WINS-server skriver du in den serverns IP-adress �r. \
    		I annat fall l�mnar du detta tomt.";
hsetup.phase35="Kontrollera alla \
		v�rden och klicka p� <b>Spara inst�llningar</b> f�r att spara dina inst�llningar. Klicka p� <b>Avbryt \
		�ndringar</b> f�r \
		att avbryta dina osparade �ndringar. Du kan testa inst�llningarna genom att ansluta till \
		Internet. ";    		    		    		

//DDNS
var helpddns = new Object();
helpddns.phase1="Routern tillhandah�ller en DDNS-funktion (Dynamic Domain Name System). DDNS l�ter dig tilldela ett fast \
		v�rd- och dom�nnamn till en dynamisk Internet IP-adress. Detta �r anv�ndbart n�r du \
		�r v�rd f�r din egen webbplats, FTP-server eller annan server bakom routern. Innan du \
		anv�nder denna funktion m�ste du anm�la dig f�r en DDNS-tj�nst hos <i>www.dyndns.org</i> \
		som �r en leverant�r av DDNS-tj�nster.";
helpddns.phase2="DDNS-tj�nst";
helpddns.phase3="Om du vill inaktivera DDNS-tj�nsten beh�ller du standardinst�llningen <b>Inaktivera</b>. F�r att aktivera DDNS-tj�nsten f�ljer du dessa instruktioner:";
helpddns.phase4="Anm�l dig f�r DDNS-tj�nst p� <i>www.dyndns.org</i> och skriv ned \
		informationen om ditt Anv�ndarnamn,<i> </i>L�senord, och<i> </i>V�rdnamn.";
helpddns.phase5="P� sk�rmbilden <i>DDNS</i> v�ljer du <b>Aktivera.</b>";
helpddns.phase6="Fyll i f�lten <i> Anv�ndarnamn</i>,<i> L�senord</i> och<i> V�rdnamn</i>.";
helpddns.phase7="Klicka p� knappen <b>Spara inst�llningar</b> f�r att spara dina �ndringar. Klicka p� knappen <b>Avbryt �ndringar</b> f�r att \
		avbryta osparade �ndringar.";
helpddns.phase8="Routerns aktuella Internet IP-adress visas h�r.";
helpddns.phase9="Status f�r DDNS-tj�nstanslutningen visas h�r.";
		
//MAC Address Clone
var helpmac =  new Object();
helpmac.phase1="MAC-kloning";
helpmac.phase2="Routerns MAC-adress �r en kod p� 12 siffror som tilldelas en unik \
    		maskinvara f�r identifiering. Vissa Internetleverant�rer kr�ver att du registrerar MAC-\
    		adressen p� ditt n�tverkskort/adapter som var anslutet till ditt kabel- eller \
    		DSL-modem under installationen. Om din Internetleverant�rer kr�ver MAC-\
    		adressregistrering hittar du adapterns MAC-adress genom att f�lja \
    		instruktionerna till din dators operativsystem.";
helpmac.phase3="F�r Windows 98 och Millennium:";
helpmac.phase4="1.  Klicka p� knappen <b>Start</b> och v�lj <b>K�r</b>.";
helpmac.phase5="2.  Skriv <b>winipcfg </b>i f�ltet och tryck p� <b>OK </b>.";
helpmac.phase6="3.  V�lj den Ethernet-adapter som du anv�nder.";
helpmac.phase7="4.  Klicka p� <b>Mer Info</b>.";
helpmac.phase8="5.  Skriv ned din adapters MAC-adress.";
helpmac.phase9="1.  Klicka p� knappen <b>Start</b> och v�lj <b>K�r</b>.";
helpmac.phase10="2.  Skriv <b>cmd </b>i f�ltet och tryck p� <b>OK </b>.";
helpmac.phase11="3.  Vid kommandoprompten k�r du <b>ipconfig /all</b> och letar efter din adapters fysiska adress.";
helpmac.phase12="4.  Skriv ned din adapters MAC-adress.";
helpmac.phase13="F�r att klona din n�tverksadapters MAC-adress till routern och undvika att ringa till \
    		Internetleverant�ren f�r att �ndra den registrerade MAC-adressen f�ljer du dessa instruktioner:";
helpmac.phase14="F�r Windows 2000 och XP:";
helpmac.phase15="1.  V�lj <b>Aktivera</b>.";
helpmac.phase16="2.  Skriv in din adapters MAC-adress i f�ltet <i>MAC-adress</i>.";
helpmac.phase17="3.  Klicka p� knappen <b>Spara inst�llningar</b>.";
helpmac.phase18="Om du vill inaktivera kloning av MAC-adress beh�ller du standardinst�llningen <b>Inaktivera</b>.";

//Advance Routing
var hrouting = new Object();
hrouting.phase1="Routing";
hrouting.phase2="P� sk�rmbilden <i>Routing</i> kan du st�lla in routingl�ge och g�ra inst�llningar f�r routern. \
		 Gateway-l�get rekommenderas f�r de flesta anv�ndare.";
hrouting.phase3="V�lj r�tt arbetsl�ge. Beh�ll standardinst�llningen <b> \
    		 Gateway</b>, om routern �r v�rd f�r din n�tverksanslutning till Internet (Gateway-l�get rekommenderas f�r de flesta anv�ndare). V�lj <b> \
    		 Router </b>om routern finns i ett n�tverk med andra routers.";
hrouting.phase4="Dynamisk routing (RIP)";
hrouting.phase5="Observera: Den h�r funktionen �r inte tillg�nglig i gateway-l�ge.";
hrouting.phase6="Dynamisk routing g�r att routern automatiskt kan justeras f�r fysiska f�r�ndringar i \
    		 n�tverksutformningen och routingtabeller f�r utv�xling med andra routrar. Routern \
    		 avg�r n�tverkspaketens v�g baserat p� minsta antalet \
    		 hopp mellan k�llan och destinationen. ";
hrouting.phase7="F�r att aktivera funktionen dynamisk routing f�r WAN-sidan v�ljer du <b>WAN</b>. \
    		 F�r att aktivera denna funktion f�r sidan f�r LAN och tr�dl�st v�ljer du <b>LAN &amp; Tr�dl�s</b>. \
    		 F�r att aktivera funktionen f�r b�de WAN och LAN v�ljer du <b> \
    		 B�da</b>. F�r att inaktivera funktionen dynamisk routing f�r alla �verf�ringar beh�ller du \
    		 standardinst�llningen <b>Inaktivera</b>. ";
hrouting.phase8="Statisk routing,&nbsp; destinationens IP-adress, n�tmask, gateway och gr�nssnitt";
hrouting.phase9="F�r att uppr�tta en statisk v�g mellan routern och ett annat n�tverk \
    		 v�ljer du ett nummer fr�n den nedrullningsbara menyn <i>Statisk routing</i>. (En statisk \
    		 v�g �r en f�rutbest�md s�kv�g som n�tverksinformationen m�ste f�rdas f�r att \
    		 n� en specifik v�rd eller n�tverk.)";
hrouting.phase10="Skriv in f�ljande information:";
hrouting.phase11="Destinationens IP-adress </b>- \
		  Destinationens IP-adress �r den n�tverksadress eller v�rd till vilken du vill tilldela en statisk v�g.";
hrouting.phase12="N�tmask </b>- \
		  N�tmasken styr vilken del av IP-adressen som �r n�tverksdelen och vilken \
    		  del som �r en v�rddelen. ";
hrouting.phase13="Gateway </b>- \
		  Detta �r IP-adressen f�r den gateway-enhet som m�jligg�r kontakt mellan routern och n�tverket eller v�rden.";
hrouting.phase14="Beroende p� var destinationens IP-adress finns placerad v�ljer du \
    		  <b>LAN &amp; tr�dl�s </b>eller <b>WAN </b>fr�n den nedrullningsbara menyn <i>Gr�nssnitt</i>.";
hrouting.phase15="F�r att spara dina �ndringar klickar du p� knappen <b>Verkst�ll</b>. Om du vill avbryta dina osparade �ndringar klickar du <b> \
    		  p� knappen Avbryt</b>.";
hrouting.phase16="F�r ytterligare statiska v�gar upprepar du stegen 1-4.";
hrouting.phase17="Ta bort denna post";
hrouting.phase18="Borttagning av en post f�r statisk v�g:";
hrouting.phase19="I den nedrullningsbara menyn <i>Statisk routing</i> v�ljer du postnumret f�r den statiska v�gen.";
hrouting.phase20="Klicka p� knappen <b>Ta bort denna post</b>.";
hrouting.phase21="F�r att spara en borttagning klickar du p� knappen <b>Verkst�ll</b>. Om du vill avbryta en borttagning klickar du <b> \
    		  p� knappen Avbryt</b>. ";
hrouting.phase22="Visa routingtabell";
hrouting.phase23="Klicka p� knappen \
    		  <b>Visa routingtabell </b>f�r att se alla giltiga v�gposter som anv�nds. Destinationens IP-adress, n�tmask, \
    		  gateway och gr�nssnitt visas f�r varje post. Klicka p� knappen <b>Uppdatera </b>f�r att uppdatera informationen som visas. Klicka p� knappen <b> \
    		  St�ng</b>f�r att �terg� till sk�rmbilden <i>Routing</i>.";
hrouting.phase24="Destinationens IP-adress </b>- \
		  Destinationens IP-adress �r den n�tverksadress eller v�rd till vilken den statisk v�gen �r tilldelad. ";
hrouting.phase25="N�tmask </b>- \
		  N�tmasken styr vilken del av IP-adressen som �r n�tverksdelen och vilken del som �r v�rddelen.";
hrouting.phase26="Gateway</b> - Detta �r IP-adressen f�r den gateway-enhet som m�jligg�r kontakt mellan routern och n�tverket eller v�rden.";
hrouting.phase27="Gr�nssnitt</b> - Detta gr�nssnitt anger om destinationens IP-adress �r p� \
    		  <b> LAN &amp; tr�dl�s </b>(interna tr�dbundna och tr�dl�sa n�tverk), <b>WAN</b> (Internet) eller <b> \
    		  Loopback</b> (ett modelln�tverk d�r en dator fungerar som ett n�tverk vilket fordras av vissa programvaror). ";

//Firewall
var hfirewall = new Object();
hfirewall.phase1="Blockera WAN-beg�ran";
hfirewall.phase2="Genom att aktivera funktionen Blockera WAN-beg�ran kan du f�rhindra att ditt n�tverk \
    		 blir \"pingat\" eller uppt�ckt av andra Internetanv�ndare. Funktionen Blockera WAN-beg�ran \
    		 f�rst�rker �ven din n�tverkss�kerhet genom att d�lja dina n�tverksportar. \
    		 B�da funktionerna i blockera WAN-beg�ran g�r det sv�rare f�r \
    		 utomst�ende anv�ndare att arbeta sig in i ditt n�tverk. Denna funktion �r aktiverad \
    		 som standard. Om du vill inaktivera denna funktion v�ljer du <b>Inaktivera</b>.";
hfirewall.right="Aktivera eller inaktivera SPI-brandv�gg.";

//VPN
var helpvpn = new Object();
helpvpn.phase1="VPN-genomstr�mning";
helpvpn.phase2="VPN (Virtual Private Networking) anv�nds vanligtvis f�r arbetsrelaterad n�tverksuppkoppling. F�r \
    		VPN-tunnlar st�djer routern IPSec-genomstr�mning och PPTP-genomstr�mning.";
helpvpn.phase3="<b>IPSec</b> - IPSec (Internet Protocol Security) �r en<b> </b>upps�ttning protokoll som anv�nds f�r implementering av \
      		s�ker utv�xling av paket i IP-skiktet. F�r att till�ta IPSec-tunnlar att passera \
      		genom routern �r IPSec-genomstr�mning aktiverad som standard. F�r att inaktivera \
      		IPSec-genomstr�mning avmarkerar du rutan bredvid <i>IPSec</i>.";
helpvpn.phase4="<b>PPTP </b>- Point-to-Point Tunneling Protocol �r den metod som anv�nds f�r att m�jligg�ra VPN- \
      		sessioner till en Windows NT 4.0- eller 2000-server. F�r att till�ta PPTP-tunnlar att passera \
      		genom routern �r PPTP-genomstr�mning aktiverad som standard. F�r att inaktivera  \
      		PPTP-genomstr�mning avmarkerar du rutan bredvid <i>PPTP</i>.";

helpvpn.right="Du kan v�lja att aktivera PPTP-, L2TP- eller IPSec-genomstr�mning f�r att l�ta dina \
		n�tverksenheter kommunicera via VPN.";
//Internet Access
var hfilter = new Object();
hfilter.phase1="Filter";
hfilter.phase2="Sk�rmbilden <i>Filter</i> l�ter dig blockera eller till�ta specifika typer av Internet- \
		anv�ndning. Du kan uppr�tta Internet�tkomstpolicy f�r specifika datorer och uppr�tta \
		filter genom att anv�nda n�tverksportnummer.";
hfilter.phase3="Denna funktion ger dig m�jligheten att anpassa upp till tio olika Internet�tkomstpolicy \
    		f�r speciella datorer som identifieras av deras IP- eller MAC-adresser. F�r \
    		varje policyber�rd dator under de dagar och tidsperioder som anges.";
hfilter.phase4="F�lj dessa instruktioner f�r att skapa och redigera en policy:";
hfilter.phase5="V�lj ett policynummer \(1-10\) i den nedrullningsbara menyn.";
hfilter.phase6="Skriv in ett namn i f�ltet <i>Skriv in profilnamn</i>.";
hfilter.phase7="Klicka p� knappen <b>Redigera datorlista</b>.";
hfilter.phase8="Klicka p� knappen <b>Verkst�ll</b> f�r att spara �ndringarna. Klicka p� knappen <b>Avbryt</b> f�r \
    		att avbryta dina osparade �ndringar. Klicka p� knappen <b>St�ng</b> f�r att �terg� till \
    		sk�rmen <i>Filter</i>.";
hfilter.phase9="Om du vill blockera datorerna i listan mot Internet�tkomst under de angivna dagarna och \
    		tidpunkterna beh�ller du standardinst�llningen <b>Inaktivera Internet�tkomst f�r \
    		datorerna i listan</b>. Om du vill att datorerna i listan ska f� �tkomst till Internet under \
    		de angivna dagarna och tidpunkterna klickar du p� alternativknappen bredvid <i> Aktivera \
    		Internet�tkomst f�r datorerna i listan</i>.";
hfilter.phase10="I sk�rmbilden <i>Datorlista</i> anger du datorerna med IP-adress eller MAC-adress. Skriv in \
    		respektive IP-adresser i f�lten <i>IP</i>. Om du har ett intervall med \
    		IP-adresser som ska filtreras fyller du i respektive f�lt i <i>IP-intervall</i>. \
    		Skriv in respektive MAC-adresser i f�lten <i>MAC</i>.";
hfilter.phase11="Ange tidpunkt f�r filtrering av �tkomst. V�lj <b>24 timmar</b><b> </b>eller markera kryssrutan bredvid <i>Fr�n</i> \
    		och anv�nd de nedrullningsbara rutorna f�r att ange en specifik tidsperiod.";
hfilter.phase12="Ange dagar f�r filtrering av �tkomst. V�lj <b>Alla dagar</b> eller respektive dagar i veckan.";
hfilter.phase13="Klicka p� knappen <b>L�gg till policy</b> f�r att spara �ndringarna och aktivera.";
hfilter.phase14="Upprepa steg 1-9 f�r att skapa eller redigera ytterligare policy.";
hfilter.phase15="Om du vill ta bort en policy f�r Internet�tkomst v�ljer du policynumret och klickar p� knappen <b>Ta bort</b>.";
hfilter.phase16="Om du vill se en sammanfattning av alla policy klickar du p� knappen <b>Sammanfattning</b>. Sk�rmbilden <i> \
    		Sammanfattning av Internetpolicy</i> visar varje policynummer, policynamn \
    		dagar och tidpunkt p� dagen. Om du vill ta bort en policy klickar du i rutan \
    		och sedan p� knappen <b>Ta bort</b>. Klicka p� knappen <b>St�ng</b> f�r att �terg� till \
    		sk�rmen <i>Filter</i>.";
hfilter.phase17="Filtrera portintervall f�r Internet";
hfilter.phase18="Om du vill filtrera datorer efter n�tverksportnummer v�ljer du <b>B�da</b>, <b>TCP</b> eller <b>UDP</b>, \
    		beroende p� vilket protokoll du vill filtrera.  Skriv sedan in<b> </b>de \
    		portnummer som du vill filtrera i f�lten portnummer.  Datorer anslutna till \
    		routern kan inte l�ngre n� n�got portnummer som listas h�r. F�r att \
    		inaktivera ett filter v�ljer du <b>Inaktivera</b>.";

//share of help string
var hshare = new Object();
hshare.phase1="Kontrollera alla v�rden och klicka p� <b>Spara inst�llningar</b> f�r att spara dina inst�llningar. Klicka p� knappen <b>Avbryt \
		�ndringar</b> f�r att avbryta dina osparade �ndringar.";


//DMZ
var helpdmz = new Object();
helpdmz.phase1="Funktionen DMZ-v�rd till�ter att en lokal anv�ndare exponeras mot Internet vid anv�ndning av \
		en specialtj�nst som t.ex. Internetspel eller videokonferens. \
		DMZ-v�rden vidarebefordrar alla portar samtidigt till en dator. Funktionen \
    		Portvidarebefordran �r s�krare eftersom den endast �ppnar de portar som du vill \
    		�ppna medan DMZ-v�rden �ppnar alla portar p� en dator och exponerar \
    		datorn s� att Internet kan se den. ";
helpdmz.phase2="En dator vars port vidarebefordras m�ste ha funktionen DHCP-klient inaktiverad \
    		och m�ste ha en ny statisk IP-adress tilldelade eftersom IP-adressen \
    		kan �ndras vid anv�ndning av DHCP-funktionen.";
/***To expose one PC, select enable.***/
helpdmz.phase3="F�r att exponera en dator  ";
helpdmz.phase4="anger du datorns IP-adress i f�ltet <i>IP-adress f�r DMZ-v�rd</i>.";



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
 
