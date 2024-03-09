<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<link rel="stylesheet" rev="stylesheet" href="../style.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
</script>
<style type="text/css">
</style>
<script type="text/javascript" src="../ubicom.js"></script>
<script type="text/javascript" src="../xml_data.js"></script>
<script type="text/javascript" src="../navigation.js"></script>
<% getLangInfo("LangPath");%>
<script type="text/javascript" src="../utility.js"></script>	
<script type="text/javascript">
//<![CDATA[
var WLAN_ENABLED; 
var OP_MODE;
if('<%getInfo("opmode");%>' =='Disabled')
	OP_MODE='1';
else
	OP_MODE='0';
if('<%getIndexInfo("wlanDisabled");%>'=='Disabled')
	WLAN_ENABLED='0';
else
	WLAN_ENABLED='1';
	
	
function get_webserver_ssi_uri() {
	return ("" !== "") ? "/Basic/Setup.asp" : "/Status/Statistics.asp";
}
function web_timeout()
{
setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);
}
function template_load()
{

var global_fw_minor_version = "<%getInfo("fwVersion")%>";
var fw_extend_ver = "";			
var fw_minor;
assign_firmware_version(global_fw_minor_version,fw_extend_ver,fw_minor);
var hw_version="<%getInfo("hwVersion")%>";
document.getElementById("hw_version_head").innerHTML = hw_version;
document.getElementById("product_model_head").innerHTML = modelname;
SubnavigationLinks(WLAN_ENABLED, OP_MODE);
topnav_init(document.getElementById("topnav_container"));

page_load();
RenderWarnings();
}
//]]>
</script>
<script language="JavaScript" type="text/javascript">
//<![CDATA[

var mf;
var local_debug = false;

function clear_stats()
{
        mf.curTime.value = new Date().getTime();
        var PrivateKey = sessionStorage.getItem('PrivateKey');
        var current_time = Math.floor(mf.curTime.value / 1000) % 2000000000;
        var auth = hex_hmac_md5(PrivateKey, current_time.toString()+"/Status/Statistics.asp");
        auth = auth.toUpperCase();
        mf.HNAP_AUTH.value = auth + " " + current_time;
	mf.submit();
}
function onTimeout()
{
	alert(sw("txtCommfailed"));
}
function page_load() 
{
mf = document.forms["mainform"];
if (local_debug) {
	hide_all_ssi_tr();
		return;
}
var is_admin = "<% getInfo("login_who"); %>" == "admin";
document.getElementById("clear_stats_button").disabled = !is_admin;
document.getElementById("user_only").style.display = is_admin ? "none" : "block";
}
function buttoninit()
{
var DOC_Title= sw("txtTitle")+" : "+sw("txtStatus")+'/'+sw("txtStatistics");
document.title = DOC_Title;
get_by_id("RestartNow").value = sw("txtRebootNow");
get_by_id("RestartLater").value = sw("txtRebootLater");
get_by_id("refresh_stats_button").value = sw("txtRefreshStatistics");
get_by_id("clear_stats_button").value = sw("txtClearStatistics");
}	
//]]>
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="template_load();buttoninit();web_timeout();">
<div id="loader_container" onclick="return false;">&nbsp;</div>
<div id="outside" style="display:none">
<table id="table_shell" cellspacing="0" summary=""><col span="1"/>
<tr><td><SCRIPT>
DrawHeaderContainer();
DrawMastheadContainer();
DrawTopnavContainer();
</SCRIPT>
<table id="content_container" border="0" cellspacing="0" summary=""><col span="3"/>
<tr><td id="sidenav_container"><div id="sidenav">
<SCRIPT>
DrawBasic_subnav();
DrawAdvanced_subnav();
DrawTools_subnav();
DrawStatus_subnav();
DrawHelp_subnav();
DrawEarth_onlineCheck(<%getWanConnection("");%>);
DrawRebootButton();
</SCRIPT>
</div>
</td><td id="maincontent_container">
<SCRIPT>DrawRebootContent();</SCRIPT>
<div id="warnings_section" style="display:none"><div class="section" >
<div class="section_head"><h2><SCRIPT>ddw("txtConfigurationWarnings");</SCRIPT></h2>
<div style="display:block" id="warnings_section_content">
</div><!-- box warnings_section_content --></div></div>	</div> <!-- warnings_section -->
<div id="maincontent" style="display: block">
<form name="mainform" action="/formResetStatistic.htm" method="post" enctype="application/x-www-form-urlencoded" id="mainform">
<input type="hidden" id="curTime" name="curTime" value="<% getInfo("currTimeSec");%>"/>
<input type="hidden" id="HNAP_AUTH" name="HNAP_AUTH" value=""/>
<input type="hidden" value="/Status/Statistics.asp" name="submit-url">
<div class="section" id="interfaces_head"><div class="section_head">
<h2><SCRIPT>ddw("txtTrafficStatistics");</SCRIPT></h2>
<p><SCRIPT>ddw("txtTrafficStatisticsdisplay");</SCRIPT></p>
<p id="user_only" style="display:none"><SCRIPT>ddw("txtAdminClearStatistics");</SCRIPT></p>

</div></div>

</div></div>


 <script>
 function wlan_pkg(num)
{
	var wlan_num = <% getIndex("wlan_num"); %>;
	var wlanMode = <% getIndex("wlanMode"); %>;
	var ssid_drv=new Array();
  	var tx_pkt_num =new Array();
  	var rx_pkt_num =new Array();
  	var rp_enabled=new Array();
	var rp_tx_pkt_num =new Array();
  	var rp_rx_pkt_num =new Array();  	
	var wlanDisabled=new Array();
	var opMode="<% getInfo("opMode"); %>"*1;
	var vlanOnOff = "<% getInfo("vlanOnOff"); %>"*1;
	var isPocketRouter="<% getInfo("isPocketRouter"); %>"*1;
	
	if (wlan_num > 0)
	{
		<%getInfo("wlan0-status");%>
		ssid_drv[0] = '<%getInfo("ssid_drv");%>';
		tx_pkt_num[0] = <%getInfo("wlanTxPacketNum");%>;
		rx_pkt_num[0] = <%getInfo("wlanRxPacketNum");%>;
		rp_enabled[0] = <%getIndex("isRepeaterEnabled");%>;
		rp_tx_pkt_num[0] = <%getInfo("wlanRepeaterTxPacketNum");%>;
		rp_rx_pkt_num[0] = <%getInfo("wlanRepeaterRxPacketNum");%>;
		wlanDisabled[0] = <%getIndex("wlanDisabled");%>;
		
	} /*if (wlan_num > 0)*/
	
	if (wlan_num > 1)
	{
		<%getInfo("wlan1-status");%>
		ssid_drv[1] = '<%getInfo("ssid_drv");%>';
		tx_pkt_num[1] = <%getInfo("wlanTxPacketNum");%>;
		rx_pkt_num[1] = <%getInfo("wlanRxPacketNum");%>;
		rp_enabled[1] = <%getIndex("isRepeaterEnabled");%>;
		rp_tx_pkt_num[1] = <%getInfo("wlanRepeaterTxPacketNum");%>;
		rp_rx_pkt_num[1] = <%getInfo("wlanRepeaterRxPacketNum");%>;
		wlanDisabled[1] = <%getIndex("wlanDisabled");%>;
		
	} /*if (wlan_num > 1)*/
	if(num == 0)
	{
	document.write('			<td height=20 class=l_tb>' + rx_pkt_num[0]+'</td>');
	document.write('			<td height=20 class=l_tb>' + tx_pkt_num[0]+'</td>');
	}
	if(num == 1)
		
	{
	document.write('			<td height=20 class=l_tb>' + rx_pkt_num[1]+'</td>');
	document.write('			<td height=20 class=l_tb>' + tx_pkt_num[1]+'</td>');
	}
}
 </script>

		<div class="box">
			<h2>&nbsp</h2>
			<br><center>
<input id="refresh_stats_button"class="button_submit" type="button" value="" onclick="location.reload(true)"/>
<input id="clear_stats_button" class="button_submit" type="button" value="" onclick="clear_stats()"/>
			</center>
			<table borderColor=#ffffff cellSpacing=1 cellPadding=2 width=525 bgColor=#dfdfdf border=1>
			<tr id="box_header">
				<td class=bl_tb>&nbsp;</td>
				<td class=bl_tb><SCRIPT >ddw("txtReceived");</SCRIPT></td>
				<td class=bl_tb><SCRIPT >ddw("txtTransmit");</SCRIPT></td>
			</tr>

			<tr>
				<td width=111 height=20 class=bl_tb><SCRIPT>ddw("txtInternet2");</SCRIPT></td>
				<td height=20 class=l_tb><%getInfo("wanRxPacketNum");%></td>
				<td height=20 class=l_tb><%getInfo("wanTxPacketNum");%></td>
			</tr>

			<tr>
				<td width=111 height=20 class=bl_tb><SCRIPT>ddw("txtLan2");</SCRIPT></td>
				<td height=20 class=l_tb><%getInfo("lanRxPacketNum");%></td>
				<td height=20 class=l_tb><%getInfo("lanTxPacketNum");%></td>
			</tr>
			<tr>
				<td width=111 height=20 class=bl_tb><SCRIPT>ddw("txtWlan_5G");</SCRIPT></td>
				<SCRIPT>wlan_pkg(0);</SCRIPT>
			</tr>
			<tr>
				<td width=111 height=20 class=bl_tb><SCRIPT>ddw("txtWlan_2G");</SCRIPT></td>
				<SCRIPT>wlan_pkg(1);</SCRIPT>
			</tr>
			
			</table>
		</div>







</form>
</div></td>
<td id="sidehelp_container">
<div id="help_text">
<strong><SCRIPT>ddw("txtHelpfulHints");</SCRIPT>...</strong>
<p><SCRIPT>ddw("txtSummaryPackets");</SCRIPT></p>
<p class="more"><!-- Link to more help -->
<a href="../Help/Status.asp#Statistics" onclick="return jump_if();"><SCRIPT>ddw("txtMore");</SCRIPT>...</a></p>
<!-- InstanceEndEditable --></div></td></tr></table>
<SCRIPT>Write_footerContainer();</SCRIPT>
</td></tr></table>
<SCRIPT language=javascript>print_copyright();</SCRIPT>
</div><!-- outside -->
</body>
<!-- InstanceEnd -->
</html>
