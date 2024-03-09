var firewall2 = new Object();
firewall2.natredir="Filtrer la redirection NAT Internet";
firewall2.ident="IDENT filtre (port 113)";
firewall2.multi="Filtrer multidiffusion";

var hupgrade = new Object();
//hupgrade.right1="Click on the browse button to select the firmware file to be uploaded to the router.";
hupgrade.right1="Cliquez sur le bouton Parcourir pour s�lectionner le fichier du micrologiciel � charger sur le routeur.";
//hupgrade.right2="Click the Upgrade button to begin the upgrade process.  Upgrade must not be interrupted.";
hupgrade.right2="Cliquez sur le bouton Mettre � niveau pour lancer la proc�dure de mise � niveau. La mise � niveau ne doit pas �tre interrompue.";
hupgrade.wrimage="Fichier image incorrect";

var hfacdef = new Object();
//hfacdef.right1="This will reset all settings back to factory defaults.  All of your settings will be erased.";
hfacdef.right1="<b>Restaurer les param�tres d'usine&nbsp;:  </b>Permet de restaurer tous les param�tres d'usine. Tous vos param�tres seront effac�s.";
hfacdef.warning="Avertissement�! Si vous cliquez sur OK, les param�tres d\'usine du p�riph�rique seront r�initialis�s et tous les param�tres pr�c�dents seront supprim�s.";

var hdiag = new Object();
//hdiag.right1="Enter the IP address or domain name you would like to ping and click the Ping button.";
hdiag.right1="Entrez l'adresse IP ou le nom de domaine pour lequel vous voulez ex�cuter le ping et cliquez sur le bouton Ping.";
//hdiag.right2="Enter the IP address or domain name you would like to trace, then click the Traceroute button";
hdiag.right2="Entrez l'adresse IP ou le nom de domaine dont vous voulez effectuer le suivi et cliquez sur le bouton D�terminer l'itin�raire.";

var hlog = new Object();
//hlog.right1="You may enable or disable the use of <b>Incoming</b> and <b>Outgoing</b> logs by selecting the appropriate radio button.";
hlog.right1="Vous pouvez activer ou d�sactiver l'utilisation de fichiers journaux  <b>entrants</b> et  <b>sortants</b> en s�lectionnant le bouton d'option appropri�.";

var manage2 = new Object();
manage2.webacc="Acc�s au Web";
manage2.accser="Acc�s au serveur";
manage2.wlacc="Acc�s au Web &nbsp;sans fil";
manage2.vapass="Les mots de passe ne correspondent pas. Entrez-les de nouveau.";
manage2.passnot="Le mot de passe de confirmation ne correspond pas.";
manage2.selweb="Vous devez au moins s�lectionner un serveur Web.";
manage2.changpass="Le mot de passe par d�faut est d�j� d�fini pour le routeur. Par mesure de s�curit�, vous devez modifier le mot de passe pour que la fonction Gestion distante puisse �tre activ�e. Cliquez sur le bouton OK pour changer votre mot de passe. Cliquez sur le bouton Annuler pour maintenir la fonction Gestion distante d�sactiv�e.";

var hmanage2 = new Object();
//hmanage2.right1="<b>Local Router Access: </b>You can change the Router's password from here. Enter a new Router password and then type it again in the Re-enter to confirm field to confirm.<br>";
hmanage2.right1="<b>Acc�s local au routeur&nbsp;:  </b>Vous pouvez modifier le mot de passe du routeur dans ce champ. Entrez un nouveau mot de passe de routeur et retapez-le dans le champ de confirmation.";
//hmanage2.right2="<b>Web Access: </b>Allows you to configure access options to the router's web utility.";
hmanage2.right2="";
//hmanage2.right3="<b>Acc�s distant au routeur&nbsp;:  </b>Permet d'acc�der au routeur � distance. Choisissez le port � utiliser. Vous devez modifier le mot de passe d'acc�s au routeur s'il utilise toujours son mot de passe par d�faut.";
hmanage2.right3="<b>Acc�s distant au routeur&nbsp;:  </b>Permet d'acc�der au routeur � distance. Choisissez le port � utiliser. Vous devez modifier le mot de passe d'acc�s au routeur s'il utilise toujours son mot de passe par d�faut.";
//hmanage2.right4="<b>UPnP: </b>Used by certain programs to automatically open ports for communication.";
hmanage2.right4="<b>UPnP&nbsp;:  </b>Utilis� par certains programmes pour l'ouverture automatique de ports pour la communication.";

var hstatwl2 = new Object();
//hstatwl2.right1="<b>MAC Address</b>. This is the Router's MAC Address, as seen on your local, wireless network.";
hstatwl2.right1="<b>Adresse MAC</b>. Il s'agit de l'adresse&nbsp;MAC du routeur telle qu'elle appara�t sur votre r�seau sans fil.";
//hstatwl2.right2="<b>Mode</b>. As selected from the Wireless tab, this will display the wireless mode (Mixed, G-Only, or Disabled) used by the network.";
hstatwl2.right2="<b>Mode</b>. Cette option s�lectionn�e dans l'onglet Sans fil affiche le mode sans fil (Mixte, G&nbsp;uniquement ou D�sactiver) utilis� sur le r�seau.";

var hstatlan2 = new Object();
//hstatlan2.right1="<b>MAC Address</b>. This is the Router's MAC Address, as seen on your local, Ethernet network.";
hstatlan2.right1="<b>Adresse MAC</b>. Il s'agit de l'adresse&nbsp;MAC du routeur telle qu'elle appara�t sur votre r�seau local Ethernet.";
//hstatlan2.right2="<b>IP Address</b>. This shows the Router's IP Address, as it appears on your local, Ethernet network.";
hstatlan2.right2="<b>Adresse IP</b>. Il s'agit de l'adresse&nbsp;IP du routeur telle qu'elle appara�t sur votre r�seau local Ethernet.";
//hstatlan2.right3="<b>Subnet Mask</b>. When the Router is using a Subnet Mask, it is shown here.";
hstatlan2.right3="<b>Masque de sous-r�seau</b>. Lorsque le routeur utilise un masque de sous-r�seau, cette information s'affiche sur cette ligne.";
//hstatlan2.right4="<b>DHCP Server</b>. If you are using the Router as a DHCP server, that will be displayed here.";
hstatlan2.right4="<b>Serveur DHCP</b>. Si vous utilisez le routeur en qualit� de serveur&nbsp;DHCP, cette information s'affiche sur cette ligne.";

var hstatrouter2 = new Object();
hstatrouter2.wan_static="statique";
hstatrouter2.l2tp="L2TP";
hstatrouter2.hb="Telstra Cable";
hstatrouter2.connecting="Connexion en cours";
hstatrouter2.disconnected="D�connect�";
hstatrouter2.disconnect="D�connecter";
//hstatrouter2.right1="<b>Firmware Version. </b>This is the Router's current firmware.";
hstatrouter2.right1="<b>Version du micrologiciel.  </b>Il s'agit du micrologiciel du routeur.";
//hstatrouter2.right2="<b>Current Time. </b>This shows the time, as you set on the Setup Tab.";
hstatrouter2.right2="<b>Heure actuelle.  </b>Affiche l'heure, d�finie dans l'onglet Configuration.";
//hstatrouter2.right3="<b>MAC Address. </b>This is the Router's MAC Address, as seen by your ISP.";
hstatrouter2.right3="<b>Adresse&nbsp;MAC.  </b>Adresse MAC du routeur, accessible par votre FAI.";
//hstatrouter2.right4="<b>Router Name. </b>This is the specific name for the Router, which you set on the Setup Tab.";
hstatrouter2.right4="<b>Nom du routeur.  </b>Il s'agit ici du nom sp�cifique du routeur que vous avez d�fini dans l'onglet Configuration.";
//hstatrouter2.right5="<b>Configuration Type. </b>This shows the information required by your ISP for connection to the Internet. This information was entered on the Setup Tab. You can <b>Connect</b> or <b>Disconnect</b> your connection here by clicking on that button.";
hstatrouter2.right5="<b>Type de configuration.  </b>Ce champ affiche les informations requises par votre FAI pour la connexion � Internet. Ces informations ont �t� saisies dans l'onglet Configuration. Vous pouvez <b>Connecter</b> ou <b>D�connecter</b> votre connexion en cliquant sur ce bouton.";
hstatrouter2.authfail=" �chec de l'authentification";
hstatrouter2.noip="Impossible d'obtenir une adresse IP ";
hstatrouter2.negfail=" �chec de la n�gociation";
hstatrouter2.lcpfail=" �chec de la n�gociation LCP";
hstatrouter2.tcpfail="Cr�ation d'une connexion TCP impossible ";
hstatrouter2.noconn="Connexion impossible ";
hstatrouter2.server=" Serveur";

var hdmz2 = new Object();
//hdmz2.right1="<b>DMZ: </b>Enabling this option will expose your router to the Internet.  All ports will be accessible from the Internet";
hdmz2.right1="<b>DMZ&nbsp;:  </b>Lorsque cette option est activ�e, le routeur est expos� � Internet. Tous les ports sont accessibles depuis Internet.";

var hforward2 = new Object();
//hforward2.right1="<b>Port Range Forwarding: </b>Certain applications may require to open specific ports in order for it to function correctly.  Examples of these applications include servers and certain online games.  When a request for a certain port comes in from the Internet, the router will route the data to the computer you specify.  Due to security concerns, you may want to limit port forwarding to only those ports you are using, and uncheck the <b>Enable</b> checkbox after you are finished.";
hforward2.right1="<b>Transfert de connexion&nbsp;:  </b>Certaines applications peuvent requ�rir l'ouverture de certains ports pour que le transfert de connexion puisse fonctionner correctement. Ces applications incluent les serveurs et certains jeux en ligne. Lorsque la demande d'un certain port provient d'Internet, le routeur achemine les donn�es vers l'ordinateur indiqu�. En raison de probl�mes de s�curit�, vous pouvez limiter le transfert de connexion aux ports que vous utilisez et d�sactiver l'option <b>Activer</b> lorsque vous avez termin�.";

var hfilter2 = new Object();
//hfilter2.delpolicy="Delete the Policy?";
hfilter2.delpolicy="Supprimer la strat�gie ?";
//hfilter2.right1="<b>Richtlinien f�r Internetzugriff: </b> Sie k�nnen bis zu 10 Zugriffsrichtlinien definieren. Zum L�schen einer Richtlinie klicken Sie auf <b>L�schen</b>, oder klicken Sie auf <b>Zusammenfassung</b>, um eine Zusammenfassung der Richtlinie anzuzeigen.";
hfilter2.right1="<b>Strat�gie d'acc�s � Internet&nbsp;:  </b>Vous pouvez d�finir jusqu'� 10&nbsp;strat�gies d'acc�s. Cliquez sur  <b>Supprimer</b> pour supprimer une strat�gie ou  <b>R�capitulatif</b> pour afficher un r�capitulatif de la strat�gie.";
//hfilter2.right2="<b>Status: </b>Enable or disable a policy.";
hfilter2.right2="<b>Etat&nbsp;:  </b>Activer ou d�sactiver une strat�gie.";
//hfilter2.right3="<b>Policy Name: </b>You may assign a name to your policy.";
hfilter2.right3="<b>Nom de la strat�gie&nbsp;:  </b>Vous pouvez attribuer un nom � votre stat�gie.";
//hfilter2.right4="<b>Policy Type: </b>Choose from Internet Access or Inbound Traffic.";
hfilter2.right4="<b>Type de strat�gie&nbsp;:  </b>Choisissez Acc�s � Internet ou Trafic entrant.";
//hfilter2.right5="<b>Days: </b>Choose the day of the week you would like your policy to be applied.";
hfilter2.right5="<b>Jours&nbsp;:  </b>Choisissez le jour d'application de votre strat�gie.";
//hfilter2.right6="Times: </b>Enter the time of the day you would like your policy to apply.";
hfilter2.right6="<b>Heures&nbsp;:  </b>Entrez l'heure d'application de votre strat�gie.";
//hfilter2.right7="<b>Blocked Services: </b>You may choose to block access to certain services.  Click <b>Add/Edit</b> Services to modify these settings.";
hfilter2.right7="<b>Services bloqu�s&nbsp;:  </b>Vous pouvez choisir de bloquer l'acc�s � certains services. Cliquez sur  <b>Ajouter/Modifier un service</b> pour modifier ces param�tres.";
//hfilter2.right8="<b>Website Blocking by URL: </b>You can block access to certain websites by entering their URL.";
hfilter2.right8="<b>Blocage du site Web par URL&nbsp;:  </b>Vous pouvez bloquer l'acc�s � certains sites Web en entrant leur URL.";
//hfilter2.right9="<b>Website Blocking by Keyword: </b>You can block access to certain website by the keywords contained in their webpage.";
hfilter2.right9="<b>Blocage du site Web par mot-cl�&nbsp;:  </b>Vous pouvez bloquer l'acc�s � certains sites Web en utilisant les mots-cl�s contenus dans leur page Web.";


var hportser2 = new Object();
hportser2.submit="Appliquer";

var hwlad2 = new Object();
hwlad2.authtyp="Type d\'authentification";
hwlad2.basrate="Taux de base";
hwlad2.mbps="Mbit/s";
hwlad2.def="Par d�faut";
hwlad2.all="Tout";
hwlad2.defdef="(Par d�faut&nbsp;: Par d�faut)";
hwlad2.fburst="Rafale de trames";
hwlad2.milli="millisecondes";
hwlad2.range="Plage";
hwlad2.frathrh="Seuil de fragmentation";
hwlad2.apiso="Isolation AP";
hwlad2.off="D�sactiv�e";
hwlad2.on="Activ�e";
//hwlad2.right1="<b>Authentication Type: </b>You may choose from Auto or Shared Key.  Shared key authentication is more secure, but all devices on your network must also support Shared Key authentication.";
hwlad2.right1="<b>Type d'authentification : </b>Vous avez le choix entre Auto et Cl� partag�e. L'authentification Cl�  partag�e est plus s�re mais tous les p�riph�riques du r�seau doivent �galement prendre en charge ce type d'authentification.";

var hwlbas2 = new Object();
//hwlbas2.right1="<b>Wireless Network Mode: </b><% support_match("SPEED_BOOSTER_SUPPORT", "1", "SpeedBooster is enabled automatically on <b>Mixed</b> Mode and <b>G-Only</b> mode."); %> If you wish to exclude Wireless-G clients, choose <b>B-Only</b> Mode.  If you would like to disable wireless access, choose <b>Disable</b>.";
hwlbas2.right1="<b>Mode r�seau sans fil� : </b><% support_match(\"SPEED_BOOSTER_SUPPORT\", \"1\", \"SpeedBooster est activ� automatiquement en mode <b>Mixte</b> et en mode<b> �G uniquement</b>. \"); %> Si vous voulez exclure les clients sans fil�G, s�lectionnez le mode<b> B� uniquement</b>. Si vous souhaitez d�sactiver l'acc�s sans fil, s�lectionnez<b> D�sactiver</b>.";

var hwlsec2 = new Object();
hwlsec2.wpapsk="Cl� pr�-partag�e WPA";
hwlsec2.wparadius="WPA RADIUS";
hwlsec2.wpapersonal="WPA Personal";
hwlsec2.wpaenterprise="WPA Enterprise";
//new wpa2
hwlsec2.wpa2psk="Cl� pr�-partag�e WPA2 seulement";
hwlsec2.wpa2radius="WPA2 RADIUS seulement";
hwlsec2.wpa2pskmix="Cl� pr�-partag�e WPA2 mixte";
hwlsec2.wpa2radiusmix="WPA2 RADIUS mixte";
hwlsec2.wpa2personal="WPA2 Personal";
hwlsec2.wpa2enterprise="WPA2 Enterprise";
//new wpa2
//hwlsec2.right1="<b>Security Mode: </b>You may choose from Disable, WEP, WPA Pre-Shared Key, WPA RADIUS, or RADIUS.  All devices on your network must use the same security mode in order to communicate.";
hwlsec2.right1="<b>Mode de s�curit�  : </b>Vous avez le choix entre D�sactiver, WEP, Cl� pr�-partag�e WPA, WPA RADIUS et RADIUS. Tous les p�riph�riques du r�seau doivent utiliser le m�me mode de s�curit� pour pouvoir communiquer.";

var hwmac2 = new Object();
//hwmac2.right1="<b>MAC Address Clone: </b>Some ISP will require you to register your MAC address.  If you do not wish to re-register your MAC address, you can have the router clone the MAC address that is registered with your ISP.";
hwmac2.right1="<b>Adresse MAC dupliqu�e : </b>Certains FAI vous demandent d'enregistrer votre adresse MAC. Si vous ne souhaitez pas enregistrer de nouveau votre adresse MAC, le routeur peut dupliquer l'adresse MAC enregistr�e par votre FAI.";

var hddns2 = new Object();
//hddns2.right1="<b>DDNS Service: </b>DDNS allows you to access your network using domain names instead of IP addresses.  The service manages changing IP address and updates your domain information dynamically.  You must sign up for service through TZO.com or DynDNS.org.";
hddns2.right1="<b>Service DDNS : </b>DDNS permet d'acc�der au r�seau � l'aide de noms de domaine au lieu d'adresses IP. Le service g�re la modification de l'adresse IP et met � jour de mani�re dynamique les informations relatives � votre domaine. Vous devez vous connecter au service via TZO.com ou DynDNS.org.";
hddns2.right2="Click <b><a target=_blank href=http://Linksys.tzo.com>here</a></b> to SIGNUP with a <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TZO FREE TRIAL ACCOUNT";
hddns2.right3="Click <b><a target=_blank href=https://controlpanel.tzo.com>here</a></b> to Manage your <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TZO Account";
hddns2.right4="Click <b><a target=_blank href=https://www.tzo.com/cgi-bin/Orders.cgi?ref=linksys>here</a></b> to Purchase a TZO <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;DDNS Subscription";
hddns2.right5="TZO DDNS <b><a target=_blank href=http://Linksys.tzo.com>Support/Tutorials</a></b>";

var hrouting2 = new Object();
//hrouting2.right1="<b>Operating Mode: </b>If the router is hosting your Internet connection, select <b>Gateway</b> mode.  If another router exists on your network, select <b>Router</b> mode.";
hrouting2.right1="<b>Mode op�rationnel : </b>Si le routeur h�berge votre connexion Internet, s�lectionnez le mode <b>Passerelle</b>. Si votre r�seau contient un autre routeur, s�lectionnez le mode <b>Routeur</b>.";
//hrouting2.right2="<b>Select Set Number: </b>This is the unique route number, you may set up to 20 routes.";
hrouting2.right2="<b>S�lectionner un num�ro d'itin�raire : </b>Il s'agit d'un num�ro d'itin�raire unique. Vous pouvez d�finir 20 itin�raires au maximum.";
//hrouting2.right3="<b>Route Name: </b>Enter the name you would like to assign to this route.";
hrouting2.right3="<b>Nom de l'itin�raire : </b>Entrez le nom de cet itin�raire.";
//hrouting2.right4="<b>Destination LAN IP: </b>This is the remote host to which you would like to assign the static route.";
hrouting2.right4="<b>IP LAN de destination : </b>H�te distant auquel vous voulez assigner l'itin�raire statique.";
//hrouting2.right5="<b>Subnet Mask: </b>Determines the host and the network portion.";
hrouting2.right5="<b>Masque de sous-r�seau : </b>D�termine l'h�te et la portion du r�seau.";

var hindex2 = new Object();
hindex2.telstra="Telstra Cable";
hindex2.dns3="DNS statique 3";
hindex2.hbs="Serveur &nbsp;HeartBeat";
hindex2.l2tps="Serveur L2TP";
hindex2.hdhcp="<b>Configuration automatique - DHCP : </b>Ce param�tre est tr�s commun�ment utilis� par les op�rateurs du cable<br><br>";
hindex2.hpppoe1="<b>PPPoE�: </b>Ce param�tre est tr�s commun�ment utilis� par les fournisseurs de comptes DSL.<br>";
hindex2.hpppoe2="<b>Nom d'utilisateur : </b>Entrez le nom d'utilisateur fourni par votre FAI.<br>";
hindex2.hpppoe3="<b>Mot de passe : </b>Entrez le mot de passe fourni par votre FAI.<br>";

//hindex2.hpppoe4="<b><a target=_blank href=help/HSetup.asp>More...</a></b><br><br><br><br><br>";

hindex2.hstatic1="<b>IP statique�: </b>Ce param�tre est tr�s commun�ment utilis� par les fournisseurs de comptes professionnels.<br>";
hindex2.hstatic2="<b>Adresse IP Internet : </b>Entrez l'adresse IP fournie par votre FAI.<br>";
hindex2.hstatic3="<b>Masque de sous-r�seau : </b>Entrez le masque de sous r�seau.<br>";

//hindex2.hstatic4="<b><a target=_blank href=help/HSetup.asp>More...</a></b><br><br><br><br><br><br><br>";

hindex2.hpptp1="<b>PPTP�: </b>Ce param�tre est tr�s commun�ment utilis� par les fournisseur de comptes DSL.<br>";
hindex2.hpptp2="<b>Adresse IP Internet : </b>Entrez l'adresse IP fournie par votre FAI.<br>";
hindex2.hpptp3="<b>Masque de sous-r�seau : </b>Entrez le masque de sous r�seau.<br>";
hindex2.hpptp4="<b>Passerelle : </b>Entrez l'adresse de la passerelle de votre FAI.<br>";

//hindex2.hpptp5="<b><a target=_blank href=help/HSetup.asp>More...</a></b><br><br><br><br><br><br><br><br>";

hindex2.hl2tp1="<b>L2TP : </b>Ce param�tre est utilis� par certains FAI en Europe.<br>";
hindex2.hl2tp2="<b>Nom d'utilisateur : </b>Entrez le nom d'utilisateur fourni par votre FAI.<br>";
hindex2.hl2tp3="<b>Mot de passe : </b>Entrez le mot de passe fourni par votre FAI.<br>";

//hindex2.hl2tp4="<b><a target=_blank href=help/HSetup.asp>More...</a></b><br><br><br><br><br><br><br><br>";

//hindex2.hhb1="<b>Telstra Cable: </b>This setting is most commonly used by DSL providers.<br>";
hindex2.hhb1="<b>C�ble Telstra: </b>Ce param�tre est tr�s commun�ment utilis� par les fournisseurs de comptes DSL.<br>";
hindex2.hhb2="<b>Nom d'utilisateur : </b>Entrez le nom d'utilisateur fourni par votre FAI.<br>";
hindex2.hhb3="<b>Mot de passe : </b>Entrez le mot de passe fourni par votre FAI.<br>";

//hindex2.hhb4="<b><a target=_blank href=help/HSetup.asp>More...</a></b><br><br><br><br><br><br>";

hindex2.right1="<b>Nom de l'h�te : </b> Entrez le nom de l'h�te fourni par votre FAI. <br>";
hindex2.right2="<b>Nom du domaine : </b>Entrez le nom de domaine fourni par votre FAI. <br>";
hindex2.right3="<b>Adresse IP locale : </b>Adresse du routeur. <br>";
hindex2.right4="<b>Masque de sous-r�seau : </b>Masque de sous-r�seau du routeur. <br><br><br>";
hindex2.right5="<b>Serveur DHCP : </b>Permet au routeur de g�rer vos adresses IP. <br>";
hindex2.right6="<b>Adresse IP de d�part : </b>Adresse que vous allez utiliser en premier. <br>";
//hindex2.right7="<b>Time Setting: </b>You may set the time manually.  Or choose Automatically if you wish to use a NTP server to keep the most accurate time.  Choose the time zone you are in.  The router can also adjust automatically for daylight savings time.";
hindex2.right7="<b>R�glage de l'heure : </b>S�lectionnez le fuseau horaire de votre pays d'origine. Le routeur peut �galement r�gler automatiquement le passage � l'heure d'�t�.";
//hindex2.hdhcps1="<b>Maximum number of DHCP Users: </b>You may limit the number of addresses your router hands out.<br>";
hindex2.hdhcps1="<b>Nombre maximum d'utilisateurs DHCP �: </b>Vous pouvez limiter le nombre d'adresses g�r�es par le routeur.<br>";
hindex2.pptps="Serveur PPTP";

var errmsg2 = new Object();
//errmsg2.err0="The HeartBeat Server IP Address is invalid!";
errmsg2.err0="The HeartBeat Server IP Address is invalid!";
errmsg2.err1="Supprimer l'entr�e";
errmsg2.err2="Vous devez entrer un SSID.";
errmsg2.err3="Entrez une cl� partag�e.";
errmsg2.err4=" Utilise des chiffres hexad�cimaux non autoris�s ou comporte plus de 63�caract�res.";
errmsg2.err5="La valeur de la cl� est non valide. Elle doit comprendre entre 8 et 63 caract�res ou 64 chiffres hexad�cimaux.";
errmsg2.err6="Entrez une valeur pour la cl�. ";
errmsg2.err7="Longueur incorrecte de la cl� ";
errmsg2.err8="Entrez une phrase mot de passe.";
errmsg2.err9="Le nombre de v�rifications est sup�rieur �40.";
errmsg2.err10=" L\'adresse MAC ne doit pas contenir d\'espaces";
errmsg2.err11="Apr�s avoir effectu� toutes les op�rations, cliquez sur le bouton Appliquer pour enregistrer les param�tres.";
errmsg2.err12="Vous devez entrer un nom de service.";
errmsg2.err13="Le nom de service existe.";
errmsg2.err14="Adresse IP LAN ou masque de sous-r�seau non valide.";

var trigger2 = new Object();
trigger2.ptrigger="D�clenchement de connexion";
trigger2.qos="QoS";
trigger2.trirange="Connexion d�clench�e";
trigger2.forrange="Connexion transf�r�e";
trigger2.sport="Port de d�but";
trigger2.eport="Port de fin";
//trigger2.right1="Application Enter the application name of the trigger. <b>Triggered Range</b> For each application, list the triggered port number range.  Check with the Internet application documentation for the port number(s) needed.<b>Start Port</b> Enter the starting port number of the Triggered Range.<b>End Port</b> Enter the ending port number of the Triggered Range.  <b>Forwarded Range</b> For each application, list the forwarded port number range.  Check with the Internet application documentation for the port number(s) needed.  <b>Start Port</b> Enter the starting port number of the Forwarded Range.  <b>End Port</b> Enter the ending port number of the Forwarded Range.";
trigger2.right1="<b>Application :</b> Entrez le nom d'application du d�clencheur.<b>Connexion d�clench�e :</b> Pour chaque application, r�pertoriez la plage des num�ros de ports d�clench�s. V�rifiez le(s) num�ro(s) de port n�cesssaire(s) dans la documentation de l'application Internet. <b>Port de d�but :</b> Entrez le num�ro du port de d�but de la connexion d�clench�e. <b>Port de fin :</b> Entrez le num�ro du port de fin de la connexion d�clench�e.<b>Connexion transf�r�e :</b> Pour chaque application, r�pertoriez la plage des num�ros de port transf�r�s. V�rifiez le(s) num�ro(s) de port n�cesssaire(s) dans la documentation de l'application Internet. <b>Port de d�but :</b> Entrez le num�ro du port de d�but de la connexion transf�r�e. <b>Port de fin :</b> Entrez le num�ro du port de fin de la connexion transf�r�e.";

var bakres2 = new Object();
bakres2.conman="Gestion de configuration";
bakres2.bakconf="Configuration de sauvegarde";
bakres2.resconf="Restaurer la configuration";
bakres2.file2res="Veuillez s�lectionner un fichier � restaurer";
bakres2.bakbutton="Sauvegarder";
bakres2.resbutton="Restaurer";
//bakres2.right1="You may backup your current configuration in case you need to reset the router back to its factory default settings.";
bakres2.right1="Vous pouvez sauvegarder votre configuration actuelle pour pouvoir r�initialiser votre routeur, en cas de besoin, aux param�tres d'usine par d�faut.";
//bakres2.right2="You may click the Back up button to backup your current configuration.";
bakres2.right2="Pour sauvegarder votre configuration actuelle, cliquez sur le bouton Sauvegarder.";
//bakres2.right3="Click the Browse button to browse for a configuration file that is currently saved on your PC.";
bakres2.right3="Cliquez sur le bouton Parcourir pour rechercher un fichier de configuration enregistr� sur votre ordinateur.";
//bakres2.right4="Click Restore to overwrite all current configurations with the ones in the configuration file.";
bakres2.right4="Cliquez sur le bouton Restaurer pour remplacer toutes les configurations actuelles par celles du fichier de configuration.";

var qos = new Object();
qos.uband="Upstream Bandwidth";
qos.bandwidth="Bandwidth";
qos.dpriority="Priorit� du p�riph�rique";
qos.priority="Priorit�";
qos.dname="Nom du p�riph�rique";
qos.low="Basse";
qos.medium="Moyen";
qos.high="Elev�e";
qos.highest="Maximum";
//qos.eppriority="Ethernet Port Priority";
qos.eppriority="Ethernet Port Priority";
qos.flowctrl="Contr�le de flux";
qos.appriority="Priorit� de l\'application";
qos.specport="Num�ro de port sp�cifique (N)";
//qos.appname="Application Name";
qos.appname="Nom de l'application";
qos.alert1="La valeur du port est hors-limite [0 - 65535]";
qos.alert2="La valeur du port de d�but est plus �lev�e que la valeur du port de fin";
//qos.confirm1="Setting multiple devices, ethernet port or application to high priority may negate the effect of QoS.\nAre you sure you want to proceed?";
qos.confirm1="Setting multiple devices, ethernet port or application to high priority may negate the effect of QoS.\nAre you sure you want to proceed?";
/*
//qos.right1="The WRT54G offers two types of Quality of Service features, Application-based and Port-based.  Choose the appropriate offering for your needs.";
qos.right1="Le routeur WRT54G offre deux types de qualit� de service : les fonctions bas�es sur l'application et les fonctions bas�es sur le port. Choisissez les fonctions qui correspondent le plus � vos besoins.";
//qos.right2="<b>Application-based Qos: </b>You may control your bandwidth with respect to the application that is consuming bandwidth.  There are several pre-configured applications.  You may also customize up to three applications by entering the port number they use.";
qos.right2="<b>QoS bas� sur l'application : </b>Vous pouvez contr�ler votre bande passante en fonction de l'application qui l'utilise. Il existe plusieurs applications configur�es. Vous pouvez �galement personnaliser jusqu'� trois applications en entrant le num�ro de port qu'elles utilisent.";
//qos.right3="<b>Port-based QoS: </b>You may control your bandwidth according to which physical LAN port your device is plugged into.  You may assign High or Low priority to devices connected on LAN ports 1 through 4.";
qos.right3="<b>QoS bas� sur le port : </b>Vous pouvez contr�ler votre bande passante en fonction du port du r�seau local physique auquel est connect� votre p�riph�rique. Vous pouvez attribuer une priorit� �lev�e ou basse aux p�riph�riques connect�s aux ports 1 � 4 du r�seau local.";
*/
//wireless qos
qos.optgame="Optimiser les applications de jeux";
qos.wqos="QS c�bl�";
qos.wlqos="QS sans fil";
qos.edca_ap="Param�tres EDCA AP";
qos.edca_sta="Param�tres EDCA STA";
qos.wme="Support de WMM";
qos.noack="Aucun accus� de r�ception";
qos.defdis="(D�faut : D�sactiver)";
qos.cwmin="CWmin";
qos.cwmax="CWmax";
qos.aifsn="AIFSN";
qos.txopb="TXOP(b)";
qos.txopag="TXOP(a/g)";
qos.admin="Admin";
qos.forced="Forc�";
qos.ac_bk="AC_BK";
qos.ac_be="AC_BE";
qos.ac_vi="AC_VI";
qos.ac_vo="AC_VO";


qos.right1="Deux types QS (qualit� de service) sont disponibles : QS c�bl�, pour controler les p�riph�riques branch�s au routeur avec un c�ble Ethernet, et QoS sans fil, pour controler les p�riph�riques sans fil connect�s au routeur."
qos.right2="<b>Priorit� du p�riph�rique :</b> Vous pouvez sp�cifier la priorit� pour le trafic d�un p�riph�rique sur votre r�seau en assignant un nom au p�riph�rique et en sp�cifiant sa priorit� et son adresse MAC."
qos.right3="<b>Priorit� du port Ethernet :</b> Vous pouvez contr�ler le taux de transfert selon le port LAN physique dans lequel votre p�riph�rique est branch�. Vous pouvez assigner une priorit� Haute ou Basse au trafic de donn�es des p�riph�riques connect�s au ports LAN 1 � 4."
qos.right4="<b>Priorit� d'application :</b> Vous pouvez contr�ler le taux de transfert de l'application utilisant la bande passante. Cochez <b>Optimiser les applications de jeux</b> pour assigner automatiquement une plus haute priorit� aux ports des applications de jeux standards.  Vous pouvez personnaliser jusqu'� huit applications en entrant le num�ro du port qu'elles utilisent."
qos.right5="Wi-Fi Alliance<sup>TM</sup> d�finit le QS sans fil comme <b>Wi-Fi MultiMedia<sup>TM</sup> (WMM)</b>.  S�lectionnez Activer pour utiliser WMM si vous avez d�autres p�riph�riques sans fil qui sont aussi certifi�s WMM."
qos.right6="<b>Aucun accus� de r�ception :</b> Activez cette option si vous voulez d�sactiver les accus�s de r�ception.  Si cette option est activ�e, le routeur ne renvoie pas les donn�es en cas d�erreur."


var vpn2 = new Object();
vpn2.right1="Vous pouvez choisir d'activer l'intercommunication PPTP, L2TP ou IPSec afin d'autoriser les p�riph�riques de votre r�seau � communiquer via VPN.";

// for parental control

var pactrl = new Object();
pactrl.pactrl ="Contr�le parental";
pactrl.accsign ="Se connecter � un compte";
pactrl.center1 ="La solution Contr�le parental de Linksys vous permet de prot�ger les membres de votre famille lorsqu\'ils surfent sur internet.";
pactrl.center2 ="<li>Facile � installer</li><br><li>Prot�gez les ordinateurs de votre domicile gr�ce au routeur Linksys.</li><br><li>Des rapports permettent de contr�ler l\'utilisation du Web, de la messagerie et d\'IM.</li>";
pactrl.center3 ="** La connexion � ce service d�sactive les strat�gies d\'acc�s � Internet int�gr�es au routeur.";
pactrl.manageacc ="G�rer le compte";
pactrl.center4 ="Gestion de votre compte Contr�le parental";
pactrl.signparental ="Inscription au service de contr�le";
pactrl.moreinfo ="Plus d\'infos";
pactrl.isprovision ="Le p�riph�rique est approvisionn�";
pactrl.notprovision ="Le p�riph�rique n'est pas approvisionn�";
pactrl.right1 ="L'�cran Contr�le parental vous permet de vous connecter � votre compte Contr�le parental de Linksys et de le g�rer. Le service de contr�le parental de Linksys fournit des outils puissants pour contr�ler la disponibilit� des services, de l'acc�s et des fonctions d'Internet, pouvant �tre personnalis�s pour chaque membre de votre famille.";

var satusroute = new Object();
satusroute.localtime ="Non disponible";

var succ = new Object();
succ.autoreturn ="La page pr�c�dente sera r�affich�e apr�s quelques secondes.";
