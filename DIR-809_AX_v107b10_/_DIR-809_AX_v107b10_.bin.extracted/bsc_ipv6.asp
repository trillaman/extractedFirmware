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
fieldset label.duple {
width: 203px;
}
</style>
<!-- InstanceEndEditable -->
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
function do_reboot()
{
	document.forms["rebootdummy"].next_page.value="index.asp";
	document.forms["rebootdummy"].act.value="do_reboot";
	document.forms["rebootdummy"].submit();
}


function get_webserver_ssi_uri() {
			return ("" !== "") ? "/Basic/Setup.asp" : "/Basic/bsc_ipv6.asp";
}
function web_timeout()
{
setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);
}
function template_load()
{
		<% getFeatureMark("MultiLangSupport_Head_script");%>
//		lang_form = document.forms.lang_form;
		if ("" === "") {
			assign_i18n();
//			lang_form.i18n_language.value = "<%getLangInfo("langSelect")%>";
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
<script type="text/javascript">
//<![CDATA[

var ingress_filter_options = [
	<%dumpInboundFilterList();%>  
];

function submit_ok()
{
	return true;
}
var mf;
var admin_pwd = "<%getInfo("adminpasswd1");%>";
var user_pwd = "<%getInfo("userpasswd");%>";
function page_load()
{
			
	displayOnloadPage("<%getInfo("ok_msg")%>"); 
	var local_debug = false;
	mf = document.forms.mainform;
//dir803e do not support follow config	,may be we will open it later	
/*
	mf.w_st_pl.disabled = true;
	mf.w_st_gw.disabled = true;
	mf.w_st_pdns.disabled = true;
	mf.w_st_sdns.disabled = true;
	mf.dhcppd_hint_prefix.disabled = true;
	mf.dhcppd_hint_pfxlen.disabled = true;
	mf.dhcppd_hint_plft.disabled = true;
	mf.dhcppd_hint_vlft.disabled = true;
*/	
//dir803e end			

			
/*				if (local_debug) {
				hide_all_ssi_tr();
				web_server_allow_wan_http_selector(false);
				return;
			}

			
				mf.password.value = admin_pwd;
				mf.password_verify.value = admin_pwd;
			
			is_router_mode = OP_MODE == "0";
			if (is_router_mode) {
				web_server_allow_wan_http_selector(mf.web_server_allow_wan_http.value == "true");
				ingress_filter_populate_select(mf.wan_web_ingress_filter_name_select);
				
			} else {
				
			do_block_enable(mf.remote_administration_fieldset, false)
				document.getElementById("remote_administration_box").style.display = "none"
			}

			wan_port_http_select_selector(mf.web_server_wan_port_http.value);
			set_form_default_values("mainform");


			var verify_failed = "<%getInfo("err_msg")%>";
			if (verify_failed != "") {
				set_form_always_modified("mainform");
				alert(verify_failed);
				verify_failed = "";
				return;
			}*/
}
function password_verify_ok()
{
	var password = mf.password.value;
	if(password == "")
	{
		alert(sw("txtNewPassword")+sw("txtIsBlank"));
		mf.password.selected = true;
		return false;
	}
	if(password.length < "6")
	{
		alert(sw("txtPasswordCheckLength"));
		mf.password.selected = true;
		return false;
	}
 	if(mf.password.value != mf.password_verify.value) {
			alert(sw("txtAdminPasswordandVerifyPasswordNotMatch"));
			mf.password.value = "";
			mf.password_verify.value = "";
			mf.password.selected = true;
			return false;
	}else{
		if(mf.password.value != admin_pwd){
			mf.password.value=encode_base64(mf.password.value);
			mf.password_verify.value = encode_base64(mf.password_verify.value);
		}else{
			mf.password.value=admin_pwd;
		}
		
		
	}

			return true;
}

function web_server_wan_http_verify_ok()
{
	var LAN_IP = "<% getInfo("ip-rom"); %>";
	var LAN_MASK = "<% getInfo("mask-rom"); %>";
	val = mf.web_server_wan_ipaddr_http.value;
	var ip_http = ipv4_to_unsigned_integer(val);//kity
	var b255 = ipv4_to_unsigned_integer("255.255.255.255");//kity
	var mask_ip = ipv4_to_unsigned_integer("255.255.255.0");//kity
	b255 ^= mask_ip;//kity
	
	if(!is_ipv4_valid(val) && val!="")
	{
		alert(sw("txtInvalidIPAddress"));
		mf.web_server_wan_ipaddr_http.select();
		mf.web_server_wan_ipaddr_http.focus();				
		return false;
	}
	if (val != "0.0.0.0")
	{
		<!--kity add IP address opinion-->
		if((b255 & ip_http) == b255)
		{
			alert(sw("txtInvalidIPAddress"));
			mf.web_server_wan_ipaddr_http.select();
			mf.web_server_wan_ipaddr_http.focus();	
			return false;
		}
		if((ip_http & b255) == 0)
		{
			alert(sw("txtInvalidIPAddress"));
			mf.web_server_wan_ipaddr_http.select();
			mf.web_server_wan_ipaddr_http.focus();	
			return false;
		}
		<!--kity end-->
		if ((is_valid_ip(val, 0)==false) || LAN_IP == val || !is_valid_gateway(LAN_IP,LAN_MASK,val))
		{
			alert(sw("txtInvalidIPAddress"));
			mf.web_server_wan_ipaddr_http.select();
			mf.web_server_wan_ipaddr_http.focus();	
			return false;
		}
	}
	
/*	
	val = mf.web_server_wan_port_http.value;
 	if (!is_number(val)) {
		alert(sw("txtRemoteAdminPortNumberValid"));
		mf.web_server_wan_port_http.select();
		mf.web_server_wan_port_http.focus();				
		return false;
	}
	if (val < 1 || val > 65535) {
		alert(sw("txtRemoteAdminPortRange1to65535"));
		mf.web_server_wan_port_http.select();
		mf.web_server_wan_port_http.focus();				
		return false;
	}
*/	
		return true;
}

function page_submit()
{
/*
	mf.curTime.value = new Date().getTime();
	if(is_blank(mf.login_name.value))
	{
		alert(sw("txtUserNameBlank"));
		mf.login_name.selected = true;
		return false;
	}

	else if(strchk_hostname(mf.login_name.value)==false)
	{
		alert(sw("txtUserInvalid2"));
		mf.login_name.selected = true;
		return false;
	}


	if(strchk_unicode(mf.password.value)==true)
	{
		alert(sw("txtUserInvalid3"));
		mf.password.selected = true;
		return false;
	}
	if (!password_verify_ok()) {
			return false;
	}			
	if ( mf.web_server_allow_wan_http_checkbox.checked ) {
		if (is_router_mode && !web_server_wan_http_verify_ok()) {
				return false;
		}
	}
	if (!is_form_modified("mainform") && !confirm(sw("txtSaveAnyway"))) {
			return false;
	}
	// wan enable
	if ( mf.web_server_allow_wan_http_checkbox.checked ) {
		var value = mf.web_server_wan_port_http.value;
		if(Check_VS_Port(value)) {
				return false;
		}
	}
	if (is_form_modified("mainform")){  //something changed
		mf.settingsChanged.value = 1;
	}*/
	if(!confirm(sw("txtIndexStr5")))
		return false;
	mf.submit();
}
function web_server_allow_wan_http_selector(value)
{
	mf.web_server_allow_wan_http.value = value;
	mf.web_server_allow_wan_http_checkbox.checked = value;
	mf.web_server_wan_ipaddr_http.disabled = !value;
	mf.rt_port.disabled = !value;
	mf.wan_web_ingress_filter_name_select.disabled = !value;
}

// 2007.04.17 Check Port issue (Remote Managemnet)
// Virtual Server
	var VS_Port = [
	<%dumpVirtualServList();%>
	];
function Check_VS_Port(value)
	{  // return true if find value == port 
	   // check protocol = 6 or 257
	   	var i;
	   	for(i=0;i<24;i++) {
	   		if( VS_Port[i].id == "-1") {
	   			break;
	   		}
	   		if( VS_Port[i].enabled == "true") {
	   			if( VS_Port[i].protocol == "6" || VS_Port[i].protocol == "257" ) {
	   				if( CheckCheck_PortRange( VS_Port[i].public_port,value)) {
					        var msg;
					        var s;					        
							s = sw("txtVirtualServer1");
					        msg = s + "'" + VS_Port[i].name + "'";
							s = sw("txtPleasecheck");
					        msg = msg + s;
					        alert(msg);
	   					return true;
	   				}
	   			} 
	   		}
	   	} 
		return false;	
	}

// PORT FORWARD
	var PF_Port = [
	
		<%dumpPortFwList();%>
		
	];


// APPLICATION RULE
	var AR_Port = [
	<%dumpPortFwList();%>
																
	];
function web_server_allow_graphics_auth_selector(value)
{
	mf.web_server_allow_graphics_auth.value = value;
	mf.web_server_allow_graphics_auth_checkbox.checked = value;
}


function wan_port_http_select_selector(slectValue)
{
	mf.web_server_wan_port_http.value=slectValue;
	mf.rt_port.value=slectValue;

}
function Check_AR_Port(value)
{  // return true if find value == port 
	   // check  protocol 0 or 6
		return false;	
}
function init()
{
//	var DOC_Title= sw("txtTitle")+" : "+sw("txtTools")+'/'+sw("txtDeviceAdmin1");
//	document.title = DOC_Title;	
	document.getElementById("DontSaveSettings").value=	sw("txtDontSaveSettings");		
	document.getElementById("SaveSettings").value=	sw("txtSaveSettings");
	get_by_id("RestartNow").value = sw("txtRebootNow");
	get_by_id("RestartLater").value = sw("txtRebootLater");
	get_by_id("DontSaveSettings_Btm").value = sw("txtDontSaveSettings");
	get_by_id("SaveSettings_Btm").value = sw("txtSaveSettings");	
//	web_server_allow_graphics_auth_selector(mf.web_server_allow_graphics_auth.value == "true");
}

	//]]>
	</script>
	<!-- InstanceEndEditable -->
</head>
<body onload="template_load(); init();web_timeout();">
<div id="loader_container" onclick="return false;">&nbsp;</div>
<div id="outside" style="display:none">
<table id="table_shell" cellspacing="0" summary=""><col span="1"/>
<tr><td>
<SCRIPT >
DrawHeaderContainer();
DrawMastheadContainer();
DrawTopnavContainer();
</SCRIPT>
<table id="content_container" border="0" cellspacing="0" summary=""><col span="3"/>
<tr><td id="sidenav_container">
<div id="sidenav"><SCRIPT >
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
<td id="maincontent_container">
<SCRIPT >
DrawRebootContent();
</SCRIPT>
<div id="warnings_section" style="display:none">
<div class="section" >
<div class="section_head">
<h2><SCRIPT >ddw("txtConfigurationWarnings");</SCRIPT></h2>
<div style="display:block" id="warnings_section_content">
</div><!-- box warnings_section_content -->
</div></div></div> <!-- warnings_section -->
<div id="maincontent" style="display: block">
<!-- InstanceBeginEditable name="Main Content" -->
<form id="mainform" name="mainform" action="/formIPv6Addr.htm" method="post">
	<input type="hidden" id="settingsChanged" name="settingsChanged" value="0"/>
	<input type="hidden" id="curTime" name="curTime" value=""/>
	<input type="hidden" value="/Basic/bsc_ipv6.asp" name="submit-url">
<div class="section">
<div class="section_head">
<h2><SCRIPT >ddw("txtIpV6Setting");</SCRIPT></h2>
<br>
<p>	<SCRIPT >ddw("txtIpV6Setting2");</SCRIPT></p>
<br>
<input class="button_submit" type="button" id="SaveSettings" name="SaveSettings" value="Save" onclick="page_submit()"/>
<input class="button_submit" type="button" id="DontSaveSettings"  name="DontSaveSettings" value="" onclick="page_cancel()"/>
</div></div>
<div class="box" style="display:none">
<h5><SCRIPT >ddw("txtIPv6Type");</SCRIPT></h5>
<p>
<label class="duple">
<SCRIPT >ddw("txtmyIPv6Type");</SCRIPT>
&nbsp;:</label>
<select id="wan_ip_mode_select" onchange="wan_ip_mode_selector(this.value);">
</select></p>
</div>


<div class="box" id="box_wan_static_body">
<h3><SCRIPT >ddw("txtWanIpV6Set");</SCRIPT></h3>
<p class="box_msg"><SCRIPT >ddw("txtWanIpV6SetStr");</SCRIPT></p>
<fieldset>
<!--p>
<label class="duple">
<SCRIPT >ddw("Use Link-Local Address");</SCRIPT>
&nbsp;:</label>
<input type="checkbox" id="usell" size="20" value="" name="config.user_password" onClick="PAGE.OnClickUsell();"/>
</p-->
<p>
<label class="duple">
<SCRIPT >ddw("txtWanIpV6Address");</SCRIPT>
&nbsp;:</label>
			<input type=text name=addr_1_1 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_1_1"); %>>:
			<input type=text name=addr_1_2 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_1_2"); %>>:
			<input type=text name=addr_1_3 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_1_3"); %>>:
			<input type=text name=addr_1_4 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_1_4"); %>>:
			<input type=text name=addr_1_5 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_1_5"); %>>:
			<input type=text name=addr_1_6 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_1_6"); %>>:
			<input type=text name=addr_1_7 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_1_7"); %>>:
			<input type=text name=addr_1_8 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_1_8"); %>>/<input type=text name=prefix_len_1 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("prefix_len_1"); %>>
</p>
<!--
<p>
<label class="duple">
<SCRIPT >ddw("txtWanIpV6Subnet");</SCRIPT>
&nbsp;:</label>
<input id="w_st_pl" type="text" size="4" maxlength="3" />
</p>
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("txtWanIpV6Gateway");</SCRIPT>
&nbsp;:</label>
<input id="w_st_gw" type="text" size="42" maxlength="45" />
</p>
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("txtWanIpV6PriDNS");</SCRIPT>
&nbsp;:</label>
<input id="w_st_pdns" type="text" size="42" maxlength="45" />
</p>
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("txtWanIpV6SecDNS");</SCRIPT>
&nbsp;:</label>
<input id="w_st_sdns" type="text" size="42" maxlength="45" />
</p>
-->
</fieldset></div>


<div class="box" id="box_wan_pppoe_body" style="display:none">
<h3><SCRIPT >ddw("PPPoE Internet Connection Type :");</SCRIPT></h3>
<p class="box_msg"><SCRIPT >ddw("Enter the information provided by your Internet Service Provider (ISP).");</SCRIPT></p>
<fieldset>
<p>
<label class="duple" for="gw_name">
<SCRIPT >ddw("PPPoE Session");</SCRIPT>
&nbsp;:</label>
<input type="radio" id="pppoe_sess_share" name="pppoe_sess_type" onclick="PAGE.OnClickPppoeSessType();"/><SCRIPT >ddw("Share with IPv4");</SCRIPT>
<input type="radio" id="pppoe_sess_new"  name="pppoe_sess_type" onclick="PAGE.OnClickPppoeSessType();"/><SCRIPT >ddw("Create a new session");</SCRIPT>
</p>
<p>
<label class="duple" for="gw_name">
<SCRIPT >ddw("Address Mode");</SCRIPT>
&nbsp;:</label>
<input type="radio" id="pppoe_dynamic" name="pppoe_addr_type" onclick="PAGE.OnClickPppoeAddrType();"/><SCRIPT >ddw("Dynamic IP");</SCRIPT>
<input type="radio" id="pppoe_static"  name="pppoe_addr_type" onclick="PAGE.OnClickPppoeAddrType();"/><SCRIPT >ddw("Static IP");</SCRIPT>
<p>
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("IP Address");</SCRIPT>
&nbsp;:</label>
<input type="password" id="user_password" maxlength="15" size="20" value="" name="config.user_password"/>
</p>
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("Username");</SCRIPT>
&nbsp;:</label>
<input type="password" id="user_password" maxlength="15" size="20" value="" name="config.user_password"/>
</p>
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("Password");</SCRIPT>
&nbsp;:</label>
<input type="password" id="user_password" maxlength="15" size="20" value="" name="config.user_password"/>
</p>
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("Verify Password");</SCRIPT>
&nbsp;:</label>
<input type="password" id="user_password" maxlength="15" size="20" value="" name="config.user_password"/>
</p>
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("Service Name");</SCRIPT>
&nbsp;:</label>
<input type="password" id="user_password" maxlength="15" size="20" value="" name="config.user_password"/>
</p>
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("Reconnect Mode");</SCRIPT>
&nbsp;:</label>
<input type="radio" id="pppoe_alwayson"	name="pppoe_reconnect_radio" onclick="PAGE.OnClickPppoeReconnect();"/><SCRIPT >ddw("Always on");</SCRIPT>
<input type="radio" id="pppoe_ondemand"	name="pppoe_reconnect_radio" onclick="PAGE.OnClickPppoeReconnect();"/><SCRIPT >ddw("On demand");</SCRIPT>
<input type="radio" id="pppoe_manual"	name="pppoe_reconnect_radio" onclick="PAGE.OnClickPppoeReconnect();"/><SCRIPT >ddw("Manual");</SCRIPT>
</p>
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("MTU");</SCRIPT>
&nbsp;:</label>
<input id="ppp6_mtu" type="text" size="10" maxlength="4" /><SCRIPT >ddw("(bytes) MTU default = 1492");</SCRIPT>
</p>
</fieldset>
</div>

<div class="box" id="box_wan_static_body">
<h3><SCRIPT >ddw("txtLanIpV6Set");</SCRIPT></h3>
<p class="box_msg"><SCRIPT >ddw("txtLanIpV6SetStr");</SCRIPT></p>
<fieldset>
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("txtLanIpV6Address");</SCRIPT>
&nbsp;:</label>
			<input type=text name=addr_2_1 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_2_1"); %>>:
			<input type=text name=addr_2_2 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_2_2"); %>>:
			<input type=text name=addr_2_3 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_2_3"); %>>:
			<input type=text name=addr_2_4 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_2_4"); %>>:
			<input type=text name=addr_2_5 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_2_5"); %>>:
			<input type=text name=addr_2_6 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_2_6"); %>>:
			<input type=text name=addr_2_7 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_2_7"); %>>:
			<input type=text name=addr_2_8 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("addrIPv6_2_8"); %>>/<input type=text name=prefix_len_2 size=4 maxlength=4 enable value=<% getIPv6BasicInfo("prefix_len_2"); %>>
</p>
<!--
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("txtLanIpV6Prefix");</SCRIPT>
&nbsp;:</label>
<input id="dhcppd_hint_prefix" type="text" size="42" maxlength="45" />/<input id="dhcppd_hint_pfxlen" type="text" size="4" maxlength="3" />
</p>
<p>
<label class="duple" for="user_password_verify">
<SCRIPT >ddw("txtLanIpV6Time");</SCRIPT>
&nbsp;:</label>
<input id="dhcppd_hint_plft" type="text" size="5" maxlength="3" />(<SCRIPT >ddw("minutes");</SCRIPT>)
</p>
<p>
<label class="duple" for="user_password">
<SCRIPT >ddw("txtLanIpV6ValidTime");</SCRIPT>
&nbsp;:</label>
<input id="dhcppd_hint_vlft" type="text" size="5" maxlength="3" />(<SCRIPT >ddw("minutes");</SCRIPT>)(<SCRIPT >ddw("optional");</SCRIPT>)
</p>
-->
</fieldset></div>

<!--@OPTIONAL:not the_lpj_output.APP_TYPE_ACCESS_POINT@-->
<div class="box" id="remote_administration_box" style="display:none">
<h3><SCRIPT >ddw("txtAdministration");</SCRIPT></h3>
<fieldset id="remote_administration_fieldset">
<p>
<label class="duple" >
<SCRIPT >ddw("txtEnableGraphAuthcode");</SCRIPT>
&nbsp;:</label>
<input type="hidden" id="web_server_allow_graphics_auth" name="config.web_server_allow_graphics_auth"  value="<%getInfo("enableGraphicsAuth");%>" />
<input type="checkbox" id="web_server_allow_graphics_auth_checkbox" onclick="web_server_allow_graphics_auth_selector(this.checked)" />
</p>
<p>
<label class="duple" >
<SCRIPT >ddw("txtEnableRemoteManagement");</SCRIPT>
&nbsp;:</label>
<input type="hidden" id="web_server_allow_wan_http" name="config.web_server_allow_wan_http"  value="<%getIndexInfo("wanaccessEnabled");%>" />
<input type="checkbox" id="web_server_allow_wan_http_checkbox" onclick="web_server_allow_wan_http_selector(this.checked)" />
</p>
<p>
<label class="duple" for="web_server_wan_port_http">
<SCRIPT >ddw("txtRemoteAdminIP");</SCRIPT>
&nbsp;:</label>
<input type="text" name="config.web_server_wan_ipaddr_http" id="web_server_wan_ipaddr_http" size="20" maxlength="16" value="<%getIndexInfo("webWanAccessIP");%>" _DISABLED="!config.wan_web_port"/>
</p>
<p>
<label class="duple" for="web_server_wan_port_http">
<SCRIPT >ddw("txtPort");</SCRIPT>&nbsp;:</label>
<input type="hidden" name="config.web_server_wan_port_http" id="web_server_wan_port_http" value="<%getIndexInfo("webWanAccessport");%>" _DISABLED="!config.wan_web_port"/>
<select id="rt_port" onchange="wan_port_http_select_selector(this.value);">
	<option value="80">80</option>
	<option value="88">88</option>
	<option value="1080">1080</option>
	<option value="8080">8080</option>
</select>

</p>
<div class="box" id="inboundFilter_box" style="display:none">
<p>
<label class="duple">
<SCRIPT >ddw("txtRemoteAdmin");</SCRIPT>
<a href="../Advanced/Inbound_Filter.asp" onclick="return jump_if();">
<SCRIPT >ddw("txtInboundFilter");</SCRIPT>
</a>&nbsp;:</label>
<input type="hidden" id="wan_web_ingress_filter_name" name="config.wan_web_ingress_filter_name" value="<%getIndexInfo("RemoteInbound");%>" />
<select id="wan_web_ingress_filter_name_select"  onchange="">
<option value="Allow All">
<SCRIPT >ddw("txtAllowAll");</SCRIPT>
</option>
<option value="Deny All">
<SCRIPT >ddw("txtDenyAll");</SCRIPT>
</option></select></p>
<p>
<label class="duple" for="wan_ingress_filter_details">
<SCRIPT >ddw("txtDetails");</SCRIPT>
&nbsp;:</label>
<input id="wan_ingress_filter_details" name="wan_ingress_filter_details" type="text" class="rule_details" size="48" maxlength="48" readonly="readonly" value="" />
</p>
</div>
</fieldset></div>
<!--@ENDOPTIONAL@-->
</form><!-- InstanceEndEditable -->	<SCRIPT language=javascript>DrawSaveButton_Btm();</SCRIPT></div></td>
<td id="sidehelp_container">
<div id="help_text">
<!-- InstanceBeginEditable name="Help_Text" -->
<strong><SCRIPT >ddw("txtHelpfulHints");</SCRIPT>...</strong>
<p><SCRIPT >ddw("txtToolsAdminStr3");</SCRIPT></p>
<p><SCRIPT >ddw("txtToolsAdminStr4");</SCRIPT></p>
<!--
<p><SCRIPT >ddw("txtToolsAdminStr6");</SCRIPT></p>
-->
<p class="more">
<!-- Link to more help -->
<a href="../Help/Tools.asp#Admin" onclick="return jump_if();">
<SCRIPT >ddw("txtMore");</SCRIPT>...</a>										</p>
<!-- InstanceEndEditable -->
</div></td></tr></table>
<SCRIPT >Write_footerContainer();</SCRIPT>
<SCRIPT >print_copyright();</SCRIPT>
</div><!-- outside -->
</body>
<!-- InstanceEnd -->
</html>

