var firewall2 = new Object();
firewall2.natredir="Filter f�r Internet NAT omdirigering";
firewall2.ident="Filter f�r IDENT(Port 113)";
firewall2.multi="Filter f�r Multicast";

var hupgrade = new Object();
hupgrade.right1="Klicka p� knappen bl�ddra och v�lj den fil f�r inbyggd programvara som ska skickas till routern.";
hupgrade.right2="Klicka p� knappen Uppgradera f�r att p�b�rja uppgraderingsprocessen. Uppgraderingen f�r inte avbrytas.";
hupgrade.wrimage="Fel bildfil!";

var hfacdef = new Object();
hfacdef.right1="Detta kommer att �terst�lla alla inst�llningar till fabriksinst�llningarna. Alla dina inst�llningar kommer att raderas.";
hfacdef.warning="Varning! Om du klickar p� OK �terst�lls enheten till fabriksinst�llningarna och alla tidigare inst�llningar f�rsvinner.";

var hdiag = new Object();
hdiag.right1="Skriv in den IP-adress eller det dom�nnamn som du vill pinga och klicka p� knappen Ping.";
hdiag.right2="Skriv in den IP-adress eller det dom�nnamn som du vill sp�ra och klicka d�refter p� knappen Traceroute.";

var hlog = new Object();
hlog.right1="Du kan aktivera eller inaktivera anv�ndningen av <b>Inkommande</b> eller <b>Utg�ende</b> loggar genom att v�lja l�mplig alternativknappar.";

var manage2 = new Object();
manage2.webacc="Webb�tkomst";
manage2.accser="�tkomstserver";
manage2.wlacc="Tr�dl�s �tkomst &nbsp;Webb";
manage2.vapass="Det bekr�ftade l�senordet �verensst�mmer inte med l�senordet som angetts. Skriv in l�senordet igen";
manage2.passnot="L�senorden �verensst�mmer inte.";
manage2.selweb="Du m�ste �tminstone v�lja en webbserver!";
manage2.changpass="Routern anv�nder f�r n�rvarande standardl�senordet. Av s�kerhetssk�l m�ste du �ndra l�senordet innan funktionen Fj�rrhantering kan aktiveras. Klicka p� OK om du vill �ndra l�senordet. Klicka p� Avbryt om du vill l�mna funktionen Fj�rrhantering inaktiverad.";

var hmanage2 = new Object();
hmanage2.right1="<b>Lokal router�tkomst: </b>H�r kan du �ndra routerns l�senord. Ange ett nytt routerl�senord och skriv in det igen i f�ltet Skriv in igen f�r att bekr�fta.<br>";
hmanage2.right2="<b>Webb�tkomst: </b>H�r kan du konfigurera �tkomstalternativen till routerns webbverktyg.";
hmanage2.right3="<b>Fj�rr�tkomst till routern: </b>Detta m�jligg�r fj�rr�tkomst till routern. V�lj den port som du vill anv�nda. Du m�ste �ndra l�senordet till routern om den fortfarande anv�nder standardl�senordet.";
hmanage2.right4="<b>UPnP: </b>Anv�nds av vissa program f�r att automatisk �ppna portar f�r kommunikation.";

var hstatwl2 = new Object();
hstatwl2.right1="<b>MAC-adress</b>. Detta �r routerns MAC-adress som den visas p� ditt lokala tr�dl�sa n�tverk.";
hstatwl2.right2="<b>L�ge</b>. V�ljs under fliken Tr�dl�s och visar det tr�dl�sa l�get (Blandat, G-enbart, eller Inaktiverad) som anv�nds av n�tverket.";

var hstatlan2 = new Object();
hstatlan2.right1="<b>MAC-adress</b>. Detta �r routerns MAC-adress som den visas p� ditt lokala Ethernet-n�tverk.";
hstatlan2.right2="<b>IP-adress</b>. Detta visar routerns IP-adress som den visas p� ditt lokala Ethernet-n�tverk.";
hstatlan2.right3="<b>N�tmask</b>. N�r routern anv�nder en n�tmask visas den h�r.";
hstatlan2.right4="<b>DHCP-server</b>. Om du anv�nder routern som en DHCP-server s� visas det h�r.";

var hstatrouter2 = new Object();
hstatrouter2.wan_static="Static";
hstatrouter2.l2tp="L2TP";
//hstatrouter2.hb="HeartBeat-signal";
hstatrouter2.hb="Telstra Cable";
hstatrouter2.connecting="Ansluter";
hstatrouter2.disconnected="Fr�nkopplad";
hstatrouter2.disconnect="Koppla fr�n";
hstatrouter2.right1="<b>Version p� inbyggd programvara. </b>Detta �r routerns nuvarande inbyggda programvara.";
hstatrouter2.right2="<b>Aktuell tid. </b>H�r visas tiden som du st�ller in i fliken Inst�llning.";
hstatrouter2.right3="<b>MAC-adress. </b>Detta �r routerns MAC-adress som den visas f�r din Internetleverant�r.";
hstatrouter2.right4="<b>Routernamn. </b>Detta �r det specifika namn f�r routern som du st�ller in i fliken Inst�llning.";
hstatrouter2.right5="<b>Konfigurationstyp. </b>H�r visas den information som kr�vs av din Internetleverant�r f�r anslutning till Internet. Denna information skrevs in i fliken Inst�llning. Du kan <b>Ansluta</b> eller <b>Koppla fr�n</b> din anslutning h�r genom att klicka p� knappen.";
hstatrouter2.authfail=" verifiering misslyckades";
hstatrouter2.noip="Kan inte h�mta en IP-adress fr�n ";
hstatrouter2.negfail=" f�rhandlingen misslyckades";
hstatrouter2.lcpfail=" LCP-f�rhandlingen misslyckades";
hstatrouter2.tcpfail="Kan inte skapa en TCP-anslutning till ";
hstatrouter2.noconn="Kan inte ansluta till ";
hstatrouter2.server=" server";

var hdmz2 = new Object();
hdmz2.right1="<b>DMZ: </b>Om detta alternativ aktiveras kommer du att exponera din router mot Internet. Alla portar kommer att kunna n�s fr�n Internet";

var hforward2 = new Object();
hforward2.right1="<b>Vidarebefordran av portintervall: </b>Vissa till�mpningar kan eventuellt kr�va att specifika portar �ppnas f�r att det ska kunna fungera ordentligt. Exempel p� s�dana till�mpningar omfattar servrar och vissa online-spel. N�r en beg�ran f�r en viss port kommer in fr�n Internet kommer routern att skicka data till den dator som du anger. Av s�kerhetssk�l b�r du begr�nsa portvidarebefordran till enbart de portar som du anv�nder och avmarkera kryssrutan <b>Aktivera</b> n�r du �r klar.";

var hfilter2 = new Object();
hfilter2.delpolicy="Ta bort policyn?";
hfilter2.right1="<b>Policy f�r Internet�tkomst: </b>Du kan definiera upp till 10 �tkomstpolicy. Klicka p� <b>Ta bort</b> f�r att ta bort en policy eller p� <b>Sammanfattning</b> f�r att se en sammanfattning av policyn.";
hfilter2.right2="<b>Status: </b>Aktivera eller inaktivera en policy.";
hfilter2.right3="<b>Policynamn: </b>Du kan tilldela ett namn till din policy.";
hfilter2.right4="<b>Policytyp: </b>V�lj mellan Internet�tkomst eller Inkommande trafik.";
hfilter2.right5="<b>Dagar: </b>V�lj den veckodag som du vill att din policy ska till�mpas.";
hfilter2.right6="<b>Tid: </b>V�lj den tidpunkt p� dagen som du vill att din policy ska till�mpas.";
hfilter2.right7="<b>Blockerade tj�nster: </b>Du kan v�lja att blockera �tkomst till vissa tj�nster. Klicka p� <b>L�gg till/Redigera</b> tj�nster f�r att �ndra dessa inst�llningar.";
hfilter2.right8="<b>Blockering av webbplats med URL: </b>Du kan blockera �tkomsten till vissa webbplatser genom att skriva in URL-adressen.";
hfilter2.right9="<b>Blockering av webbplats med nyckelord: </b>Du kan blockera �tkomsten till vissa webbplatser med nyckelord som finns p� webbsidan.";

var hportser2 = new Object();
hportser2.submit="Verkst�ll";

var hwlad2 = new Object();
hwlad2.authtyp="Verifieringstyp";
hwlad2.basrate="Grundl�ggande hastighet";
hwlad2.mbps="Mbps";
hwlad2.def="Standardinst";
hwlad2.all="Alla";
hwlad2.defdef="(Standardinst: Standardinst�llning)";
hwlad2.fburst="Frame Burst";
hwlad2.milli="Millisekunder";
hwlad2.range="Omr�de";
hwlad2.frathrh="Tr�skelv�rde f�r fragmentering";
hwlad2.apiso="AP-isolation";
hwlad2.off="Av";
hwlad2.on="P�";
hwlad2.right1="<b>Verifieringstyp: </b>Du kan v�lja mellan Auto eller Delad nyckel. Verifiering med delad nyckel �r s�krare men alla enheter p� ditt n�tverk m�ste ocks� st�dja verifiering med delad nyckel.";

var hwlbas2 = new Object();
hwlbas2.right1="<b>Tr�dl�st n�tverksl�ge: </b>SpeedBooster �r automatiskt aktiverat i <b>Blandat</b> l�ge och <b>G-enbart</b> l�ge. Om du vill utesluta klienter med tr�dl�s-G v�ljer du l�get <b>B-enbart</b>. Om du vill inaktivera tr�dl�s �tkomst v�ljer du <b>Inaktivera</b>.";

var hwlsec2 = new Object();
hwlsec2.wpapsk="WPA i f�rv�g utdelad nyckel";
hwlsec2.wparadius="WPA RADIUS";
hwlsec2.wpapersonal="WPA Personal";
hwlsec2.wpaenterprise="WPA Enterprise";
//new wpa2
hwlsec2.wpa2psk="Endast WPA2 i f�rv�g utdelad nyckel";
hwlsec2.wpa2radius="Endast WPA2 RADIUS";
hwlsec2.wpa2pskmix="Blandat WPA2 i f�rv�g utdelad nyckel";
hwlsec2.wpa2radiusmix="Blandat WPA2 RADIUS";
hwlsec2.wpa2personal="WPA2 Personal";
hwlsec2.wpa2enterprise="WPA2 Enterprise";
//new wpa2
hwlsec2.right1="<b>S�kerhetsl�ge: </b>Du kan v�lja mellan Inaktivera, WEP, WPA i f�rv�g utdelad nyckel, WPA RADIUS eller RADIUS. Alla enheter p� n�tverket m�ste anv�nda samma s�kerhetsl�ge f�r att kunna kommunicera.";

var hwmac2 = new Object();
hwmac2.right1="<b>Klona MAC-adress: </b>Vissa Internetleverant�rer kr�ver att du registrerar din MAC-adress. Om du inte vill registrera om din MAC-adress kan routern klona MAC-adressen som finns registrerad hos Internetleverant�ren.";

var hddns2 = new Object();
hddns2.right1="<b>DDNS-tj�nst: </b>DDNS erbjuder m�jligheten att n� ditt n�tverk med hj�lp av dom�nnamn ist�llet f�r IP-adresser. Tj�nsten hanterar f�r�ndrade IP-adresser och uppdaterar din dom�ninformation dynamiskt. Du m�ste anm�la dig f�r tj�nsten genom TZO.com eller DynDNS.org.";
hddns2.right2="Click <b><a target=_blank href=http://Linksys.tzo.com>here</a></b> to SIGNUP with a <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TZO FREE TRIAL ACCOUNT";
hddns2.right3="Click <b><a target=_blank href=https://controlpanel.tzo.com>here</a></b> to Manage your <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TZO Account";
hddns2.right4="Click <b><a target=_blank href=https://www.tzo.com/cgi-bin/Orders.cgi?ref=linksys>here</a></b> to Purchase a TZO <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DDNS Subscription";
hddns2.right5="TZO DDNS <b><a target=_blank href=http://Linksys.tzo.com>Support/Tutorials</a></b>";

var hrouting2 = new Object();
hrouting2.right1="<b>Driftsl�ge: </b>Om routern �r v�rd f�r din Internetanslutning v�ljer du l�get <b>Gateway</b>. Om en annan router existerar i n�tverket v�ljer du l�get <b>Router</b>.";
hrouting2.right2="<b>V�lj inst�llt nummer</b> </b>Detta �r ett unikt v�gnummer. Du kan st�lla in upp till 20 v�gar.";
hrouting2.right3="<b>V�gnamn: Skriv in det namn som du vill tilldela denna v�g.";
hrouting2.right4="<b>Destinationen LAN-IP: </b>Detta �r den fj�rrv�rd till vilken du �nskar tilldela den statiska v�gen.";
hrouting2.right5="<b>N�tmask: </b>Styr v�rden och n�tverksdelen.";

var hindex2 = new Object();
hindex2.telstra="Telstra Cable";
hindex2.dns3="Statisk DNS 3";
hindex2.hbs="Heart Beat-server";
hindex2.l2tps="L2TP-server";
hindex2.hdhcp="<b>Automatisk konfiguration - DHCP: </b>Denna inst�llning �r den vanligaste bland kabeloperat�rer.<br><br>";
hindex2.hpppoe1="<b>PPPoE: </b>Denna inst�llning �r den vanligaste bland DSL-leverant�rer.<br>";
hindex2.hpppoe2="<b>Anv�ndarnamn: </b>Skriv in det anv�ndarnamn som tillhandah�lls av din Internetleverant�r.<br>";
hindex2.hpppoe3="<b>L�senord: </b>Skriv in det l�senord som tillhandah�lls av din Internetleverant�r.<br>";

//hindex2.hpppoe4="<b><a target=_blank href=help/HSetup.asp>Mera...</a></b><br><br><br><br><br>";

hindex2.hstatic1="<b>Statisk IP: </b>Denna inst�llning �r den vanligaste bland f�retagsinriktade Internetleverant�rer.<br>";
hindex2.hstatic2="<b>Internet IP-adress: </b>Skriv in den IP-adress som tillhandah�lls av din Internetleverant�r.<br>";
hindex2.hstatic3="<b>N�tmask: </b>Skriv in din n�tmask<br>";

//hindex2.hstatic4="<b><a target=_blank href=help/HSetup.asp>Mera...</a></b><br><br><br><br><br><br><br>";

hindex2.hpptp1="<b>PPTP: </b>Denna inst�llning �r den vanligaste bland DSL-leverant�rer.<br>";
hindex2.hpptp2="<b>Internet IP-adress: </b>Skriv in den IP-adress som tillhandah�lls av din Internetleverant�r.<br>";
hindex2.hpptp3="<b>N�tmask: </b>Skriv in din n�tmask<br>";
hindex2.hpptp4="<b>Gateway: </b>Skriv in gateway-adressen till din Internetleverant�r<br>";

//hindex2.hpptp5="<b><a target=_blank href=help/HSetup.asp>Mera...</a></b><br><br><br><br><br><br><br><br>";

hindex2.hl2tp1="<b>L2TP: </b>Denna inst�llning anv�nds av vissa Internetleverant�rer i Europa.<br>";
hindex2.hl2tp2="<b>Anv�ndarnamn: </b>Skriv in det anv�ndarnamn som tillhandah�lls av din Internetleverant�r.<br>";
hindex2.hl2tp3="<b>L�senord: </b>Skriv in det l�senord som tillhandah�lls av din Internetleverant�r.<br>";

//hindex2.hl2tp4="<b><a target=_blank href=help/HSetup.asp>Mera...</a></b><br><br><br><br><br><br><br><br>";

hindex2.hhb1="<b>Telstra Cable: </b>Denna inst�llning �r den vanligaste bland DSL-leverant�rer.<br>";
hindex2.hhb2="<b>Anv�ndarnamn: </b>Skriv in det anv�ndarnamn som tillhandah�lls av din Internetleverant�r.<br>";
hindex2.hhb3="<b>L�senord: </b>Skriv in det l�senord som tillhandah�lls av din Internetleverant�r.<br>";

//hindex2.hhb4="<b><a target=_blank href=help/HSetup.asp>Mera...</a></b><br><br><br><br><br><br>";

hindex2.right1="<b>V�rdnamn: </b>Skriv in det v�rdnamn som tillhandah�lls av din Internetleverant�r.<br>";
hindex2.right2="<b>Dom�nnamn: </b>Skriv in det dom�nnamn som tillhandah�lls av din Internetleverant�r.<br>";
hindex2.right3="<b>Lokal IP-adress: </b>Detta �r adressen till routern.<br>";
hindex2.right4="<b>N�tmask: </b>Detta �r n�tmasken till routern.<br><br><br>";
hindex2.right5="<b>DHCP-server: </b>G�r att routern kan hantera dina IP-adresser.<br>";
hindex2.right6="<b>F�rsta IP-adress: </b>Den adress som du vill b�rja med.<br>";
hindex2.right7="<b>Tidsinst�llning: </b>V�lj den tidszon som du befinner dig i. Routern kan �ven justera automatiskt f�r sommartid.";
hindex2.hdhcps1="<b>Maximalt antal DHCP-anv�ndare: </b>Du kan begr�nsa antalet adresser som din router delar ut.<br>";
hindex2.pptps="PPTP-server";

var errmsg2 = new Object();
errmsg2.err0="IP-adressen f�r HeartBeat-servern �r ogiltig!";
errmsg2.err1="Ta bort posten?";
errmsg2.err2="Du m�ste ange ett SSID!";
errmsg2.err3="Ange en utdelad nyckel!";
errmsg2.err4=" har otill�tna hexadecimaltecken eller mer �n 63 tecken!";
errmsg2.err5="Ogiltig nyckel, m�ste vara mellan 8 och 63 ASCII-tecken eller 64 hexadecimaltecken";
errmsg2.err6="Du m�ste ange en nyckel f�r Nyckel ";
errmsg2.err7="Ogiltig l�ngd i nyckel ";
errmsg2.err8="Skriv in en l�senfras!";
errmsg2.err9="Det totala antalet kontroller �verstiger 40!";
errmsg2.err10=" till�ter inte mellanslag!";
errmsg2.err11="N�r du �r klar med alla �tg�rder klickar du p� Verkst�ll f�r att spara inst�llningarna.";
errmsg2.err12="Du m�ste ange ett tj�nstnamn!";
errmsg2.err13="Tj�nstnamnet finns redan!";
errmsg2.err14="Ogiltig IP-adress eller n�tmask f�r LAN";

var trigger2 = new Object();
trigger2.ptrigger="Portutl�sning";
trigger2.qos="QoS";
trigger2.trirange="Utl�st intervall";
trigger2.forrange="Vidarebefordrat intervall";
trigger2.sport="Startport";
trigger2.eport="Slutport";
trigger2.right1="Till�mpning Skriv in till�mpningsnamnet f�r utl�sningen. <b>Utl�st intervall</b> F�r varje till�mpning, lista nummerintervallet f�r portutl�sning. Kontrollera i Internettill�mpningens dokumentation f�r de portnummer som beh�vs.<b>Startport</b> Skriv in startportnummer f�r utl�st intervall.<b>Slutport</b> Skriv in slutportnummer f�r utl�st intervall. <b>Vidarebefordrat intervall</b> F�r varje till�mpning, lista intervallet f�r vidarebefordrade portnummer. Kontrollera i Internettill�mpningens dokumentation f�r de portnummer som beh�vs. <b>Startport</b> Skriv in startportnumret f�r vidarebefordrat intervall. <b>Slutport</b> Skriv in slutportnumret f�r vidarebefordrat intervall.";

var bakres2 = new Object();
bakres2.conman="Konfighantering";
bakres2.bakconf="S�kerhetskopiera konfiguration";
bakres2.resconf="�terst�ll konfiguration";
bakres2.file2res="V�lj en fil att �terst�lla";
bakres2.bakbutton="S�kerhetskopiera";
bakres2.resbutton="�terst�ll";
bakres2.right1="Du kan s�kerhetskopiera den aktuella konfigurationen om du skulle beh�va �terst�lla routern till fabriksinst�llningarna.";
bakres2.right2="Du kan klicka p� knappen S�kerhetskopiera f�r att skapa en s�kerhetskopia av din aktuella konfiguration.";
bakres2.right3="Klicka p� knappen Bl�ddra f�r att leta upp en konfigurationsfil som f�r n�rvarande finns sparad p� din dator.";
bakres2.right4="Klicka p� �terst�ll f�r att skriva �ver alla aktuella konfigurationer men det som finns i konfigurationsfilen.";

var qos = new Object();
qos.uband="Bandbredd uppstr�ms";
qos.bandwidth="Bandbredd";
qos.dpriority="Enhetsprioritet";
qos.priority="Prioritet";
qos.dname="Enhetsnamn";
qos.low="L�g";
qos.medium="Medium";
qos.high="H�g";
qos.highest="H�gsta";
qos.eppriority="Prioritet f�r Ethernet-port";
qos.flowctrl="Fl�desreglering";
qos.appriority="Till�mpningsprioritet";
qos.specport="Specifik port";
//qos.appname="Till�mpningsnamn";
qos.appname="Till�mpningsnamn";
qos.alert1="Portv�rdet ligger utanf�r intervallet [0 - 65535]";
qos.alert2="Startportv�rdet �r h�gre �n slutportv�rdet";
qos.confirm1="Genom att st�lla in flera enheter, ethernet-port eller till�mpning p� h�g prioritet motverkar du effekterna av QoS.\n�r du s�ker p� att du vill forts�tta?";
/*
qos.right1="WRT54G erbjuder tv� typer av servicekvalitetsfunktioner, till�mpningsbaserad och portbaserad. V�lj l�mpligt alternativ som passar dina behov.";
qos.right2="<b>Till�mpningsbaserad Qos: </b>Du kan styra din bandbredd med utg�ngspunkt fr�n den till�mpning som konsumerar bandbredd. Det finns flera f�rkonfigurerade till�mpningar. Du kan �ven specialanpassa upp till tre till�mpningar genom att skriva in det portnummer som de anv�nder.";
qos.right3="<b>Portbaserad QoS: </b>Du kan styra din bandbredd i enlighet med vilken fysisk LAN-port din enhet �r inpluggad i. Du kan tilldela H�g eller L�g prioritet till enheter anslutna till LAN-port 1 till 4.";
*/
//wireless qos
qos.optgame="Optimera speltill�mpningar";
qos.wqos="Tr�dbunden QoS";
qos.wlqos="Tr�dl�s QoS";
qos.edca_ap="Parametrar f�r EDCA AP";
qos.edca_sta="Parametrar f�r EDCA STA";
qos.wme="WMM-st�d";
qos.noack="Ingen bekr�ftelse";
qos.defdis="(Standardinst�llning: Inaktivera)";
qos.cwmin="CWmin";
qos.cwmax="CWmax";
qos.aifsn="AIFSN";
qos.txopb="TXOP(b)";
qos.txopag="TXOP(a/g)";
qos.admin="Admin";
qos.forced="Tvingad";
qos.ac_bk="AC_BK";
qos.ac_be="AC_BE";
qos.ac_vi="AC_VI";
qos.ac_vo="AC_VO";


qos.right1="Det finns tv� typer av QoS-funktioner (Quality of Service) tillg�ngliga: Tr�dbunden QoS som styr enheter inpluggade i routern med en Ethernet-kabel samt Tr�dl�s QoS som styr enheter som �r tr�dl�st anslutna till routern."
qos.right2="<b>Enhetsprioritet:</b> Du kan ange prioritet f�r all trafik fr�n en enhet i ditt n�tverk genom att ge enheten ett enhetsnamn, ange prioritet och skriva in MAC-adressen."
qos.right3="<b>Prioritet f�r Ethernet-port:</b> Du kan styra din datahastighet i enlighet med vilken fysisk LAN-port din enhet �r inpluggad i. Du kan tilldela H�g eller L�g prioritet till datatrafik fr�n enheter anslutna till LAN-port 1 till 4."
qos.right4="<b>Till�mpningsprioritet :</b> Du kan styra din datahastighet med utg�ngspunkt fr�n den till�mpning som konsumerar bandbredd. Markera <b>Optimera speltill�mpningar</b> f�r att automatiskt till�ta att portar f�r vanligt f�rekommande speltill�mpningar f�r en h�gre prioritet. Du kan specialanpassa upp till �tta till�mpningar genom att skriva in det portnummer som de anv�nder."
qos.right5="Tr�dl�s QoS kallas �ven <b>Wi-Fi MultiMedia<sup>TM</sup> (WMM)</b> av Wi-Fi Alliance<sup>TM</sup>. V�lj Aktivera f�r att utnyttja WMM om du anv�nder andra tr�dl�sa enheter som �ven �r WMM-certifierade."
qos.right6="<b>Ingen bekr�ftelse:</b> Aktivera detta alternativ om du vill inaktivera bekr�ftelse. Om detta alternativ �r aktiverat kommer routern inte att s�nda om data om ett fel uppst�r."


var vpn2 = new Object();
vpn2.right1="Du kan v�lja att aktivera PPTP-, L2TP- eller IPSec-genomstr�mning f�r att l�ta dina n�tverksenheter kommunicera via VPN.";

// for parental control

var pactrl = new Object();
pactrl.pactrl ="F�r�ldrastyrning";
pactrl.accsign ="Kontoanm�lan";
pactrl.center1 ="Linksys f�r�ldrastyrningsl�sning hj�lper till att h�lla din familj s�ker<br> n�r de surfar p� Internet";
pactrl.center2 ="<li>Enkelt att anpassa</li><br><li>Skydda varje dator i ditt hush�ll fr�n din Linksys Router</li><br><li>Rapporterna hj�lper dig att �vervaka anv�ndningen av webben, e-post och IM</li>";
pactrl.center3 ="** Om du anm�ler dig f�r denna tj�nst kommer du att inaktivera routerns inbyggda Internet�tkomstpolicy";
pactrl.manageacc ="Administrera konton";
pactrl.center4 ="Administrera ditt f�r�ldrastyrningskonto";
pactrl.signparental ="Anm�l dig f�r f�r�ldrastyrningstj�nsten";
pactrl.moreinfo ="Mer info";
pactrl.isprovision ="enheten �r reserverad";
pactrl.notprovision ="enheten �r inte reserverad";
pactrl.right1 ="Sk�rmbilden f�r f�r�ldrastyrning ger dig m�jligheten att anm�la dig och administrera ditt Linksys-konto f�r f�r�ldrastyrning. Linksys tj�nst f�r f�r�ldrastyrning tillhandah�ller kraftfulla verktyg f�r styrning av tillg�ngligheten av Internettj�nster, �tkomst och funktioner och kan anpassas f�r varje enskild familjemedlem.";

var satusroute = new Object();
satusroute.localtime ="Ej tillg�nglig";

var succ = new Object();
succ.autoreturn ="Du kommer tillbaka till f�reg�ende sida efter ett antal sekunder.";
