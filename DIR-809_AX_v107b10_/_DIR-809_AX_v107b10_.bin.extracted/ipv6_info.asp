<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<link rel="stylesheet" rev="stylesheet" href="../style.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
<!--
var lang = "<% getLangInfo("lang");%>";
//-->
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
	return ("" !== "") ? "/Basic/Setup.asp" : "/Status/ipv6_info.asp";
}
function web_timeout()
{
setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);
}
function template_load()
{
	<% getFeatureMark("MultiLangSupport_Head_script");%>
//	lang_form = document.forms.lang_form;
	if ("" === "") {
		assign_i18n();
//		lang_form.i18n_language.value = "<%getLangInfo("langSelect")%>";
	}
	<% getFeatureMark("MultiLangSupport_Tail_script");%>
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
		
		var local_debug =false;
		var mf;
var global_fw_minor_version = "<%getInfo("fwVersion")%>";

function page_load()
{
			mf = document.forms["mainform"];
			//document.getElementById("fw_minor_current").innerHTML = global_fw_minor_version;
			document.getElementById("firmware_version").innerHTML = global_fw_minor_version;
			document.getElementById("wan_LinkType").innerHTML="SLAAC";
			document.getElementById("wan_global_addr").innerHTML="<% getIPv6BasicInfo("addrIPv6_1_1"); %>" + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_1_2"); %>"  + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_1_3"); %>"  + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_1_4"); %>"  + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_1_5"); %>"  + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_1_6"); %>"  + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_1_7"); %>"  + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_1_8"); %>"  + "/" +
															   "<% getIPv6BasicInfo("prefix_len_1"); %>";
			
			document.getElementById("lan_global_addr").innerHTML="<% getIPv6BasicInfo("addrIPv6_2_1"); %>" + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_2_2"); %>"  + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_2_3"); %>"  + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_2_4"); %>"  + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_2_5"); %>"  + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_2_6"); %>"  + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_2_7"); %>"  + ":" +
															   "<% getIPv6BasicInfo("addrIPv6_2_8"); %>"  + "/" +
															   "<% getIPv6BasicInfo("prefix_len_2"); %>";
}

	//]]>
</script>
<!-- InstanceEndEditable -->

</head>
<body onload="template_load();web_timeout();">
<div id="loader_container" onclick="return false;">&nbsp;</div>
<div id="outside" style="display:none"><table id="table_shell" cellspacing="0" summary=""><col span="1"/>
<tr><td><SCRIPT >
DrawHeaderContainer();
DrawMastheadContainer();
DrawTopnavContainer();
</SCRIPT>
<table id="content_container" border="0" cellspacing="0" summary=""><col span="3"/>
<tr><td id="sidenav_container"><div id="sidenav">
<SCRIPT >
DrawBasic_subnav();
DrawAdvanced_subnav();
DrawTools_subnav();
DrawStatus_subnav();
DrawHelp_subnav();
DrawEarth_onlineCheck(<%getWanConnection("");%>);
DrawRebootButton();
</SCRIPT></div>
<% getFeatureMark("MultiLangSupport_Head");%>
 <!-- 								
<SCRIPT>DrawLanguageList();</SCRIPT>
 --> 
<% getFeatureMark("MultiLangSupport_Tail"); %>								
</td>					
<td id="maincontent_container"><SCRIPT >DrawRebootContent();</SCRIPT>
<div id="warnings_section" style="display:none">
<div class="section" >	<div class="section_head">
<h2><SCRIPT >ddw("txtConfigurationWarnings");</SCRIPT></h2>
<div style="display:block" id="warnings_section_content">
</div><!-- box warnings_section_content --></div></div>	</div> <!-- warnings_section -->
<div id="maincontent" style="display: block">
<!-- InstanceBeginEditable name="Main Content" -->
<!--@OPTIONAL:this_file ~= 'Tools_Firmware.html' and this_file ~= 'Tools_System.html'@-->
<form id="mainform" name="mainform" action="/goform/formSetWanStatus" method="post" enctype="application/x-www-form-urlencoded">
<!--@ENDOPTIONAL@-->
<!--@UNIQUE:maincontent@-->
<div class="section"><div class="section_head"> 
<h2><SCRIPT >ddw("txtipv6info");</SCRIPT></h2>
<p><SCRIPT >ddw("txtipv6infoAlldisplayedhere");</SCRIPT></p><br>
<fieldset><p><label class="duple_Dev_info"><strong><SCRIPT>ddw("txtFirmwareVersion");</SCRIPT>&nbsp;:</strong></label>
<strong id="firmware_version" class="output"><span id="fw_minor_current"></span>,&nbsp;&nbsp;<%getInfo("fwBuiltDate")%></strong>
</p></fieldset>
</div><div class="box"style="display:none">
<h3><SCRIPT >ddw("txtGeneral");</SCRIPT></h3>
<p class="box_msg">	</p><fieldset><p><label class="duple_Dev_info">
<SCRIPT >ddw("txtTime");</SCRIPT>&nbsp;:</label>
<span id="current_time" class="output">&nbsp;</span></p>
<p><label class="duple_Dev_info"><SCRIPT >ddw("txtFirmwareVersion");</SCRIPT>&nbsp;:</label>
<strong id="firmware_version" class="output"><span id="fw_minor_current"></span>,&nbsp;&nbsp;<%getInfo("fwBuiltDate")%></strong>
</p></fieldset></div>

<div class="box"><h3><SCRIPT >ddw("txtWanIPv6Info");</SCRIPT></h3><fieldset>
<p><label class="duple_Dev_info"><SCRIPT >ddw("txtLinkType");</SCRIPT>&nbsp;:</label>
<span id="wan_LinkType" class="output">&nbsp;</span></p>
<p><label class="duple_Dev_info"><SCRIPT >ddw("txtGobalAddr");</SCRIPT>&nbsp;:</label>
<span id="wan_global_addr" class="output">&nbsp;</span></p>
</div></fieldset></div>

<div class="box"><h3><SCRIPT >ddw("txtLanIPv6Info");</SCRIPT></h3><fieldset>
<p><label class="duple_Dev_info"><SCRIPT >ddw("txtGobalAddr");</SCRIPT>&nbsp;:</label>
<span id="lan_global_addr" class="output">&nbsp;</span></p>
</div></fieldset></div>

<!--@ENDOPTIONAL@-->

<div class="box" id="lan_computers_box" style="display:none">
<h3><SCRIPT >ddw("txtLANComputers");</SCRIPT></h3>
<p class="box_msg"></p>
<div id="lan_computers_container"></div></div>
<!--@OPTIONAL:not the_lpj_output.APP_TYPE_ACCESS_POINT@--><div class="box" id="multicast_memberships_div" style="display:none">
<h3><SCRIPT >ddw("txtIGMPMulticastmember");</SCRIPT></h3>
<p class="box_msg"/><div id="igmp_membership_container"></div></div></div><!--@ENDOPTIONAL@-->
</form><!--@ENDOPTIONAL@--><!-- InstanceEndEditable --></div></td><td id="sidehelp_container">
<div id="help_text"><!-- InstanceBeginEditable name="Help_Text" --> <strong><SCRIPT >ddw("txtHelpfulHints");</SCRIPT>...</strong>
<p><SCRIPT >ddw("txtAllWANLANdisplayed");</SCRIPT></p>
<p class="more"><!-- Link to more help --><a href="../Help/Status.asp#Device_Info" onclick="return jump_if();"><SCRIPT >ddw("txtMore");</SCRIPT>...</a></p>
<!-- InstanceEndEditable --></div></td></tr></table>
<SCRIPT >Write_footerContainer();</SCRIPT></td></tr></table>
<SCRIPT language=javascript>print_copyright();</SCRIPT>
</div><!-- outside --></body>
<!-- InstanceEnd -->
</html>

