<link rel="stylesheet" type="text/css" href="style.css">
<style fprolloverstyle>
A:hover {color: #00FFFF}
.small A:hover {color: #00FFFF}
</style>
<script src="common.js"></script>
<script type="text/javascript" src="session.js"></script>
<script defer type="text/javascript" src="pngfix.js"></script>
<SCRIPT language="Javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capsec.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/share.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/help.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capapp.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capasg.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capsetup.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capwrt54g.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/timezone.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/layout.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capadmin.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capstatus.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/ses.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/ddns.js"></SCRIPT>
<SCRIPT language=JavaScript>
var SelectItemIdx = 0;
var SelectSubItem = 0;
var DNAME = 0; 
var DLINK = 1; 
var DMAIN = 2;
var DWIDTH = 3;
/*Add for session key*/
var session_key = "<% nvram_get("session_key"); %>";
var close_session = "<% get_session_status(); %>";
/*End for session key*/

var Menu = new Array(
		new Array(
			new Array(topmenu.basicsetup,  "index.asp", bmenu.setup, "83"),
			new Array(share.ddns,	       "DDNS.asp"),
			new Array(topmenu.macaddrclone,"WanMAC.asp"),
			new Array(topmenu.advrouting,  "Routing.asp")
<% support_invmatch("HSIAB_SUPPORT", "1", "/*"); %>
			,
			new Array("Hot Spot",	       "HotSpot_Admin.asp")
<% support_invmatch("HSIAB_SUPPORT", "1", "*/"); %>
		),
		new Array(
			new Array(wlantopmenu.basicset,   "Wireless_Basic.asp",bmenu.wireless, "83"),
			new Array(wlantopmenu.security,   "WL_WPATable.asp"),
			new Array(wlantopmenu.macfilter,  "Wireless_MAC.asp"),
			new Array(wlantopmenu.advwireless,"Wireless_Advanced.asp")
		),
		new Array
		(
	                new Array(share.firewall ,"Firewall.asp",bmenu.security,"83"), 
			new Array(share.vpn,"VPN.asp")
		),
<% support_invmatch("STORAGE_SUPPORT", "1", "/*"); %>
 		new Array(
			new Array(FUNST.Disk,   "Disk_Management.asp"),
			new Array(FUNST.MS,   "Media_Server.asp"),
			new Array(bmenu.admin,"NAS_Administration.asp")
		),
<% support_invmatch("STORAGE_SUPPORT", "1", "*/"); %>
		new Array
		(
                        new Array(share.policy,"Filters.asp",bmenu.accrestriction, "103")
		),
		new Array
		(
			new Array(share.singelforward,"SingleForward.asp",bmenu.applications+"  & "+bmenu.gaming, "100"),
			new Array(apptopmenu.portrange, "Forward.asp"),
<% support_invmatch("PORT_TRIGGER_SUPPORT", "1","/*"); %>
			new Array(trigger2.ptrigger,	"Triggering.asp"),
<% support_invmatch("PORT_TRIGGER_SUPPORT", "1", "*/"); %>
<% support_invmatch("UPNP_FORWARD_SUPPORT", "1","/*"); %>
		        new Array("UPnP Forward",       "Forward_UPnP.asp"),
<% support_invmatch("UPNP_FORWARD_SUPPORT", "1", "*/"); %>
			new Array(share.dmz,		"DMZ.asp")
<% support_elsematch("HW_QOS_SUPPORT", "1",",", "/*"); %>
			new Array(trigger2.qos,		"QoS.asp")
<% support_invmatch("HW_QOS_SUPPORT", "1", "*/"); %>
		),
		new Array(
			new Array(adtopmenu.manage,	"Management.asp", bmenu.admin, "115"),
			new Array(adtopmenu.log,	"Log.asp"),
			new Array(adtopmenu.diag,	"Diagnostics.asp"),
			new Array(adtopmenu.facdef,	"Factory_Defaults.asp"),
			new Array(adtopmenu.upgarde,	"Upgrade.asp"),
			new Array(bakres2.conman,	"Backup_Restore.asp")
		),
		new Array(
			new Array(share.router,        "Status_Router.asp",bmenu.statu, "79"),
			new Array(statopmenu.localnet, "Status_Lan.asp"),
			new Array(bmenu.wireless,   "Status_Wireless.asp")
<% support_invmatch("PERFORMANCE_SUPPORT", "1", "/*"); %>
			,
			new Array("System Performance","Status_Performance.asp")
<% support_invmatch("PERFORMANCE_SUPPORT", "1", "*/"); %>
		)
	);
function getpos(surl)
{
   var i,j;
	<% support_invmatch("STORAGE_SUPPORT", "1", "/*"); %>
	if(surl == "Claim_Disk.asp")
	{
		surl = "Disk_Management.asp";
	}
	<% support_invmatch("STORAGE_SUPPORT", "1", "*/"); %>
   for(i=0; i<Menu.length; i++)
   {
        for (j=0; j<Menu[i].length; j++)
        {
            if ( surl == Menu[i][j][DLINK] )
            {
                      SelectItemIdx = i ;
                      SelectSubItem = j ;
                      break;
            }
        }	
   }
   if ( SelectItemIdx == -1 &&  surl == "/" )
   {
        SelectItemIdx = 0 ;
        SelectSubItem = 0 ;
   }
}
</script>
