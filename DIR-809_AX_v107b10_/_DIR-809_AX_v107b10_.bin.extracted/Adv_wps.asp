<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<link rel="stylesheet" rev="stylesheet" href="../style.css" type="text/css" />
<style type="text/css">
 fieldset label.duple {
	width: 200px;
 }
</style>
<script language="JavaScript" type="text/javascript">
<!--
var lang = "<% getLangInfo("lang");%>";
//-->
</script>

<script type="text/javascript" src="../ubicom.js"></script>
<script type="text/javascript" src="../xml_data.js"></script>
<script type="text/javascript" src="../navigation.js"></script>
<% getLangInfo("LangPath");%>
<script type="text/javascript" src="../utility.js"></script>

<script type="text/javascript">
//<![CDATA[
var WLAN_ENABLED; 
if(<%getIndex("wlanDisabled");%>)WLAN_ENABLED = <%getIndex("wlanDisabled");%>; 
	else WLAN_ENABLED =1;

var wireless2_disabled="<%getIndex("wlanDisabled","1");%>";
var wireless5_disabled="<%getIndex("wlanDisabled","0");%>";
	
var OP_MODE = <%getIndex("opMode");%>;
var settingsChanged_flag=0;
var WPA_MODE = "<%getIndex("encrypt_5G")%>"; 
var WEP_AUTH = "<%getIndex("wep_auth_5G")%>";
var WPACIPHER= "<%getIndex("wpaCipher_5G")%>";
var wscDisable= "<%getIndex("wscDisable_5G")%>";

var WPA_MODE_24G = "<%getIndex("encrypt_24G")%>"; 
var WEP_AUTH_24G = "<%getIndex("wep_auth_24G")%>";
var WPACIPHER_24G= "<%getIndex("wpaCipher_24G")%>";
var wscDisable_24G= "<%getIndex("wscDisable_24G")%>";

var macFltMode= "<% getInfo("macFltMode");%>";

var hiddenssid_24G = "<% getIndex("hiddenSSID","1");%>";
var hiddenssid_5G = "<% getIndex("hiddenSSID","0");%>";
var mf;
var timeleft = 1;

function waittime()
{

	if(timeleft == 0){
		get_by_id("final_form").submit();
		return;
	}
	timeleft--;
	setTimeout(waittime, 1000);
}

var __AjaxAsk = null;

function __createRequest()
{
	var request = null;
	try { request = new XMLHttpRequest(); }
	catch (trymicrosoft)
	{
		try { request = new ActiveXObject("Msxml2.XMLHTTP"); }
		catch (othermicrosoft)
 		{
 			try { request = new ActiveXObject("Microsoft.XMLHTTP"); }
			catch (failed)
			{
				request = null;
			}
		}
	}
	
	if (request == null)
		alert("Error creating request object !");
	return request;
}


function do_alpha_submit_to_sdk()
{
var f_wps =get_by_id("formWPS");

	if(mf.wifisc_reset_unconfig_btn.value != 1)
		mf.wifisc_reset_unconfig_btn.value =0;
    else
	    mf.wifisc_reset_unconfig_btn.value = sw("txtResettoUnconfigured");
	var str;
	
    mf.curTime.value = new Date().getTime();
    
    var PrivateKey = sessionStorage.getItem('PrivateKey');
    var current_time = Math.floor(mf.curTime.value / 1000) % 2000000000;
    var auth = hex_hmac_md5(PrivateKey, current_time.toString()+"/Advanced/Adv_wps.asp");
    auth = auth.toUpperCase();
    mf.HNAP_AUTH.value = auth + " " + current_time;
    
	if(mf.wifisc_enable_select.checked == true)
	{
		mf.settingsChanged.value = 1;
		wifisc_enable_selector(true);
		str =  "disableWPS=OFF";
		str = "&submit-url=%2FAdvanced%2FAdv_wps.asp" ; 
		str += "&save=Apply+Changes";
        str += "&HNAP_AUTH=";
        str += mf.HNAP_AUTH.value.toString();
	}
	else//disable wps 
	{
		str =  "disableWPS=ON";
		str += "&submit-url=%2FAdvanced%2FAdv_wps.asp" ; 
		str += "&save=Apply+Changes";	
        str += "&HNAP_AUTH=";
        str += mf.HNAP_AUTH.value.toString();
	}
	str += "&wps_act=" + f_wps["wps_act"].value;
    if (mf.wifisc_reset_unconfig_btn.value == sw("txtResettoUnconfigured"))
    {
	    str += "&resetUnCfg=" + 1;
	}
	else
	{
	    str += "&resetUnCfg=" + mf.wifisc_reset_unconfig_btn.value;
	}
	str += "&targetAPMac=";
	str += "&targetAPSsid=";
	
	
	str += "&peerPin=";
	str += "&configVxd=off";
	str += "&resetRptUncfg=0";
	str += "&peerRptPin=";
	str += "&wps_all=all";
	if (__AjaxAsk == null) __AjaxAsk = __createRequest();
        __AjaxAsk.open("POST", "formWsc.htm", true);
	__AjaxAsk.setRequestHeader('Content-type','application/x-www-form-urlencoded');
	__AjaxAsk.onreadystatechange = doWirlessSecurityCallBack;
	__AjaxAsk.send(str);

}

//var AjaxAsk_tmp;
function doWirlessSecurityCallBack()
{
//	if(__AjaxAsk.readyState ==4)
//	{
		displayOnloadPage("Setting saved.");
//	}else
//	{
//	}
}

function createRequest()
{
	var request = null;
	try { request = new XMLHttpRequest(); }
	catch (trymicrosoft)
	{
		try { request = new ActiveXObject("Msxml2.XMLHTTP"); }
		catch (othermicrosoft)
		{
			try { request = new ActiveXObject("Microsoft.XMLHTTP"); }
			catch (failed) { request = null; }
		}
	}
	if (request == null) alert("Error creating request object !");
	return request;
}


function init_show_wps_status()
{
	wifisc_pin_retriever = new xmlDataObject(wifisc_pin_ready, null, null, "/wifisc_pin.asp");
	//if(wscDisable && wscDisable_24G)
	//	get_by_id("wifisc_enable").value = "true";
	//else
	//	get_by_id("wifisc_enable").value = "false";
	if((wireless5_disabled == "1" || WPA_MODE == 1 || WPACIPHER == 1 || WPA_MODE == 2 || hiddenssid_5G =="1") &&
	(wireless2_disabled == "1" || WPA_MODE_24G == 1 || WPACIPHER_24G == 1 ||WPA_MODE_24G == 2 || hiddenssid_24G == "1") //&& 
	//checked == true
	)
	{
		get_by_id("wifisc_enable").value = "false";

	}
	wifisc_enable_selector(get_by_id("wifisc_enable").value == "true");
	
	wifisc_pinlock_selector(get_by_id("wifisc_pinlock").value == "true");
	
	var wps_status_str="";
	if( get_by_id("wifisc_enable").value == 'true')
		wps_status_str+=sw("txtEnable")+" /";
	else
		wps_status_str+=sw("txtDisabled")+" / ";

	if("<%getIndex("wscConfig");%>" == "0")
	{
		disable_form_field(get_by_id("wifisc_reset_unconfig_btn"), true);
		disable_form_field(get_by_id("wifisc_pinlock_select"), true);
		wps_status_str+=sw("txtNotConfigured");
	}
	else
	{
//		disable_form_field(get_by_id("wifisc_reset_unconfig_btn"), false);
		wps_status_str+=sw("txtConfigured");
	}
		
	get_by_id("wps_status").innerHTML = wps_status_str;
	
	get_by_id("wifisc_current_pin").innerHTML = wifisc_current_pin;

	if(get_by_id("wifisc_er_lock_state").value == "true")//kity pin
	{
		disable_form_field(get_by_id("wifisc_er_unlock_button"), false);
//		disable_form_field(get_by_id("wifisc_get_new_pin_button"), true);
//		disable_form_field(get_by_id("wifisc_reset_pin_button"), true);
	}	
	else
	{
		disable_form_field(get_by_id("wifisc_er_unlock_button"), true);
//		disable_form_field(get_by_id("wifisc_get_new_pin_button"), false);
//		disable_form_field(get_by_id("wifisc_reset_pin_button"), false);
	}

}

function Modify_WPS_Options()
{
	var f_wps =get_by_id("formWPS");
		f_wps.wifisc_enable_select.disabled=true;
		f_wps.wifisc_pinlock_select.disabled=true;
		f_wps.wifisc_get_new_pin_button.disabled=true;
		f_wps.wifisc_reset_pin_button.disabled=true;
		f_wps.wifisc_reset_unconfig_btn.disabled=true;
		f_wps.wifisc_add_sta_start_button.disabled=true;
}


function do_cancel()
{
	self.location.href="bsc_wlan.asp?random_str="+generate_random_str();
}

function is_wlan_settings_modified(form_id)
{
	var df = document.forms[form_id];
	if (!df) 
	{
		return false;
	}
	if (df.getAttribute('modified') == "true") 
	{
		return true;
	}
	if (df.getAttribute('saved') != "true") 
	{
		return false;
	}

	for (var i = 0, k = df.elements.length; i < k; i++)
	{
		var obj = df.elements[i];
		if (obj.getAttribute('modified') == 'ignore') 
		{
			continue;
		}
		var name = obj.tagName.toLowerCase();
		if (name == 'input') 
		{
			var type = obj.type.toLowerCase();
			if (((type == 'text') || (type == 'textarea') || (type == 'password') || (type == 'hidden')) &&
					!are_values_equal(obj.getAttribute('default'), obj.value))
			{

				return true;
			} else if (((type == 'checkbox') || (type == 'radio')) && !are_values_equal(obj.getAttribute('default'), obj.checked))
			{
				return true;
			}
		} else if (name == 'select') 
		{
			var opt = obj.options;
			for (var j = 0; j < opt.length; j++)
			{
				if (!are_values_equal(opt[j].getAttribute('default'), opt[j].selected)) 
				{
					return true;
				}
			}
		}
	}
	return false;
}

function page_submit()
{    
	if (is_wlan_settings_modified("formWPS"))
	{
		if(( WPA_MODE ==  "1" || WEP_AUTH == "2" || WPACIPHER == "1")
		&& mf.wifisc_enable_select.checked == "true")		
		{
			alert(sw("txtWPSCantWorkAtWPAEAPMode"));
			get_by_id("wifisc_enable_select").focus();				
			return false;
		}		
		mf.settingsChanged.value = 1;
	}
	
	do_alpha_submit_to_sdk();
	return;
}


function get_webserver_ssi_uri() 
{
	return ("" !== "") ? "/Basic/Setup.asp" : "/Advanced/Adv_wps.asp";
}

function web_timeout()
{
	setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);
}

function template_load()
{
	<% getFeatureMark("MultiLangSupport_Head_script");%>
	if ("" === "") {
		assign_i18n();
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
	RenderWarnings();
	var WLAN_WARN="0";
	
	document.getElementById("warnings_section").style.display = (WLAN_WARN  == "1") ? "block"  : "none";

	var wps_enable = "<%getIndex("wsc_enabled")%>";
	if(wscDisable == "0" || wscDisable_24G =="0")
	{
		document.getElementById("wifisc_enable_select").checked = true;
		document.getElementById("wifisc_enable").value = "true";
	}
		
	
	get_by_id("wifisc_get_new_pin_button").value = sw("txtGenerateNewPIN");
	get_by_id("wifisc_reset_pin_button").value = sw("txtResetPINtoDefault");
	get_by_id("wifisc_reset_unconfig_btn").value = sw("txtResettoUnconfigured");
	get_by_id("wifisc_add_sta_start_button").value = sw("txtAddWirelessDeviceWithWPS");
	get_by_id("DontSaveSettings").value = sw("txtDontSaveSettings");
	get_by_id("SaveSettings").value = sw("txtSaveSettings");
	get_by_id("wifisc_er_unlock_button").value = sw("txtwpsunlock");
	get_by_id("RestartNow").value = sw("txtRebootNow");
	get_by_id("RestartLater").value = sw("txtRebootLater");
	displayOnloadPage("<%getInfo("ok_msg")%>");
	
}

function wifisc_pinlock_selector(checked)
{
	get_by_id("wifisc_pinlock").value = checked ? "true" : "false";
	get_by_id("wifisc_pinlock_select").checked = checked;
}

function wifisc_enable_selector(checked)
{		

	if((macFltMode == 1||macFltMode == 2)&&(mf.wifisc_enable_select.checked == true)){
		alert(sw("txtWpsWirelessMacFilter"));
		mf.wifisc_enable_select.checked = false;
		disable_all_wps_buttons(true);
		return false;
	}
	if((wireless5_disabled == "1" || WPA_MODE == 1 || WPACIPHER == 1 || WPA_MODE == 2 || hiddenssid_5G =="1") &&
	(wireless2_disabled == "1" || WPA_MODE_24G == 1 || WPACIPHER_24G == 1 ||WPA_MODE_24G == 2 || hiddenssid_24G == "1") //&& 
	//checked == true
	)
	{
		//if(wscDisable == "1"&&wscDisable_24G =="1")
		if(checked == true)
		alert(sw("txtWpsNotWorkmode"));
		
		mf.wifisc_enable_select.checked = false;
			
		disable_all_wps_buttons(true);
		return false;
	
	}
	/*
	if((wireless2_enabled =="0" || WPA_MODE == 1 || WPACIPHER == 1 || WPA_MODE == 2 || hiddenssid_5G =="1") &&
	(wireless2_enabled =="0" || WPA_MODE_24G == 1 || WPACIPHER_24G == 1 ||WPA_MODE_24G == 2 || hiddenssid_24G == "1")
	)
	{
		if(wscDisable == "1"&&wscDisable_24G =="1")
			alert(sw("txtWpsNotWorkmode"));
		mf.wifisc_enable_select.checked = false;
		disable_all_wps_buttons(true);
		return false;
	
	}
	*/
	
	/*
//	if(WPA_MODE>0 && WPA_MODE<6 && WPA_MODE_24G>0 && WPA_MODE_24G<6 &&checked == true||(WPA_MODE == 4 && WPACIPHER == 1 &&WPA_MODE_24G == 4 && WPACIPHER_24G == 1 && checked == true) ){
	if((WPA_MODE == 1 && WPA_MODE_24G == 1 && checked == true) ||
	(WPA_MODE == 2 && WPA_MODE_24G == 2 && checked == true)||
	(WPA_MODE == 4 && WPACIPHER == 1 && WPA_MODE_24G == 4 && WPACIPHER_24G == 1 && checked == true)||
	(WPA_MODE == 1 && WPA_MODE_24G == 2 && checked == true) ||
	(WPA_MODE == 1 && WPA_MODE_24G == 4 && WPACIPHER_24G == 1 && checked == true) || 
	(WPA_MODE == 2 && WPA_MODE_24G == 1) ||
	(WPA_MODE == 2 && WPA_MODE_24G == 4 && WPACIPHER_24G == 1 && checked == true)||
	(WPA_MODE == 4 && WPACIPHER == 1 && WPA_MODE_24G == 1 && checked == true)||
	(WPA_MODE == 4 && WPACIPHER == 1 && WPA_MODE_24G == 2 && checked == true))
	{
		if(wscDisable == "0"&&wscDisable_24G =="0")
			alert(sw("txtShareKeyCantWorkAtWPAEAPMode"));
		mf.wifisc_enable_select.checked = false;
		disable_all_wps_buttons(true);
		return false;
	}			
	
	*/
//	mf.wifisc_enable.value = checked ? "true" : "false";
//	mf.wifisc_enable_select.checked = checked;

	if(!mf.wifisc_enable_select.checked)
	{
//		alert("disable all wps buttons!");
		disable_all_wps_buttons(true);
	}else{
		disable_all_wps_buttons(false);
	}
}


var wifisc_current_pin = aes_decrypt("<%getInfo("wscLoocalPin");%>");

function disable_all_wps_buttons(disabled)
{
	disable_form_field(get_by_id("wifisc_get_new_pin_button"), disabled);
	disable_form_field(get_by_id("wifisc_reset_pin_button"), disabled);
	disable_form_field(get_by_id("wifisc_add_sta_start_button"), disabled);
	disable_form_field(get_by_id("wifisc_pinlock_select"), disabled);
	disable_form_field(get_by_id("wifisc_reset_unconfig_btn"), disabled);
//	if(get_by_id("wireless_radio_control").value == 0)
//	{
//		disable_form_field(get_by_id("wifisc_reset_unconfig_btn"), true);
//	}else if(get_by_id("wifisc_enable_select").checked == false)
//	{
//		disable_form_field(get_by_id("wifisc_reset_unconfig_btn"), true);
//	}else
//	{
//		disable_form_field(get_by_id("wifisc_reset_unconfig_btn"), ("<%getIndex("wscConfig");%>" == "0" || get_by_id("wireless_radio_control").value == 0));
//	}
}

function do_wps_request(act)
{
	if (act == 1) //reset to wireless unconfig
	{
		if (!confirm (sw("txtProtectedSetupStr1") 
			+ "\n" + 
			sw("txtProtectedSetupStr2"))) 
		{
			return;
		}
		mf.wifisc_reset_unconfig_btn.value = 1;
	}
	
	else if (act == 2)	//get new pin 
	{
		if (!confirm (sw("txtProtectedSetupStr8"))) 
		{
			return;
		}	
	}
	else if (act == 3) //reset to current pin
	{
		if (!confirm (sw("txtProtectedSetupStr9"))) 
		{
			return;
		}	
	}	
	
	else if (act == 4) //add sta start.
	{
		var time_now=new Date().getTime();
		if (is_wlan_settings_modified("formWPS")) 
		{
			alert(sw("txtWizardAddWlanDeviceStr17"));
			return;
		}
		top.location = "../Basic/Wizard_Add_Wireless_Device.asp?t="+time_now;
		return;
	}
	else if (act == 5) //unlock pin
	{
		
	}
	get_by_id("wps_act").value = act;
	get_by_id("formWPS").settingsChanged.value = 1;		
	do_alpha_submit_to_sdk();
}

function wifisc_pin_ready(dataInstance)
{
	var pin = dataInstance.getElementData("pin");
	wifisc_current_pin_selector(pin);
	disable_all_wps_buttons(get_by_id("wifisc_enable").value == "false");
}

function wifisc_current_pin_selector(pin)
{
	get_by_id("wifisc_current_pin").innerHTML =  pin;
	get_by_id("wifisc_pin").value = pin;
}


var page_start = 1;

function page_load()
{	
	displayOnloadPage("<%getInfo("ok_msg")%>");
	mf = document.forms.formWPS;
	
	init_show_wps_status();
	
	if( "<%getIndex("wlanMode");%>" == 2 || "<%getIndex("wlanMode");%>" == 6) //2:WDS 6:WDS+Router
	{

//		Modify_WPS_Options();
//		get_by_id("ssid").disabled=true;
	}
	if( "<%getIndex("wlanMode");%>" == 1)
	{
//	 	disable_form_field(get_by_id("wifisc_reset_unconfig_btn"),true);
	}
	
	if( "<%getIndex("wlanMode");%>" == 2|| "<%getIndex("wlanMode");%>" == 3 || "<%getIndex("wlanMode");%>" == 6 || "<%getIndex("wlanMode");%>" == 7)
	{ 
//	 	show_wds_ap_info();
	}
	
	set_form_default_values("formWPS");
	if(<% getInfo("DefcmpResult");%>==0)
		disable_form_field(get_by_id("wifisc_reset_pin_button"), true);
}
//]]>
</script>
</head>
<body onload="template_load();page_load();web_timeout();" topmargin="1" leftmargin="0" rightmargin="0" bgcolor="#757575">
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
<tr>	<td id="sidenav_container"><div id="sidenav">
<SCRIPT >
DrawBasic_subnav();
DrawAdvanced_subnav();
DrawTools_subnav();
DrawStatus_subnav();
DrawHelp_subnav();
DrawEarth_onlineCheck(<%getWanConnection("");%>);
DrawRebootButton();
</SCRIPT>
</div>
</td>

<td id="maincontent_container">
<SCRIPT>DrawRebootContent("all");</SCRIPT>
<div id="warnings_section" style="display:none">
<div class="section" >	<div class="section_head">
<h2><SCRIPT>ddw("txtConfigurationWarnings");</SCRIPT></h2>
<div style="display:block" id="warnings_section_content">
<p>
	<b><SCRIPT>ddw("txtCommWarnStr1");</SCRIPT></b>
</p>
<p>
	<SCRIPT>ddw("txtCommWarnStr2");</SCRIPT>
</p>
<UL><LI><p>
	<SCRIPT>ddw("txtWlanWarnStr1");</SCRIPT>
</p></LI></UL>
<p>
	<SCRIPT>ddw("txtCommWarnStr3");</SCRIPT>
</p></div></div></div></div>

<div id="maincontent" style="display: block"> 

<form name="formWPS" id="formWPS" method="post" action="/goform/formWsc">		
			<input type="hidden" id="settingsChanged" name="settingsChanged" value="0"/>
			<input type="hidden" id="webpage" name="webpage" value="/Advanced/Adv_wps.asp">
            <input type="hidden" value="/Advanced/Adv_wps.asp" name="submit-url">
            <input type="hidden" id="HNAP_AUTH" name="HNAP_AUTH" value=""/>
            <input type="hidden" id="curTime" name="curTime" value="<% getInfo("currTimeSec");%>"/>
			<input type="hidden" id="wps_act"  name="wps_act" value="0"/>			
			
			<input type="hidden" id="wireless_radio_control" name="config.wireless.radio_control" value="<%getIndex("wlanDisabled")%>"/>	

			<div class="section">
			<div class="section_head">
			<h2><SCRIPT>ddw("txtAdvanceWifiProtectSetup");</SCRIPT></h2>
			<p>	<SCRIPT>ddw("txtProtectedSetupStr3");</SCRIPT></p>
			<SCRIPT>DrawSaveButton();</SCRIPT>
			</div>
			</div>
			<div class="box" id="wifisc_hidden">
			<h2><SCRIPT>ddw("txtWiFiProtectedSetup");</SCRIPT></h2>

			<table cellpadding="1" cellspacing="1" border="0" width="525">			
			<tr>
				<td class='r_tb' width='200'><SCRIPT >ddw("txtEnable");</SCRIPT></td>
				<input type="hidden" id="wifisc_enable" name="config.wifisc.enabled"/>			
				<td class='l_tb'> :&nbsp;				
				<input id="wifisc_enable_select" onclick="wifisc_enable_selector(this.checked);" type="checkbox" />
				</td>
			</tr>
			<tr>
				<input type="hidden" id="wifisc_pin" name="config.wifisc.pin" value=aes_decrypt("<%getInfo("wscLoocalPin");%>")/>
				<td class='r_tb' width='200'><SCRIPT >ddw("txtCurrentPIN");</SCRIPT></td>
				<td class='l_tb'> :&nbsp;<b><span id="wifisc_current_pin" class="output">&nbsp;</span></b>
				</td>
			</tr>
			
			<tr>
				<td class='r_tb' width='200'></td>
				<td class='l_tb'>
				<input type=button id="wifisc_get_new_pin_button" value="" onclick="do_wps_request(2);">
				&nbsp;
				<input type=button id="wifisc_reset_pin_button" value="Reset PIN to Default" onclick="do_wps_request(3);">
				</td>
			</tr>
			
			<tr>
				<td class='r_tb' width='200'><SCRIPT >ddw("txtWiFiProtectedStatus")</SCRIPT></td>
				<td class='l_tb'> &nbsp;<span id="wps_status"></span>					
				</td>
			</tr>
			<tr>
				<td class='r_tb' width='200'></td>
				<td class='l_tb'>
				<input type="hidden" id="wifisc_ap_locked" name="config.wifisc.ap_locked" value="<%getIndex("wsc_locked");%>"/>
				<input type=button id="wifisc_reset_unconfig_btn" value="" onclick="do_wps_request(1)" style="display: none">
				</td>
			</tr>
			<tr style="display: none">
				<td class='r_tb' width='200'><SCRIPT >ddw("txtWiFiPinLock")</SCRIPT></td>
				<input type="hidden" id="wifisc_pinlock" name="config.wifisc_pinlock.enabled" value="<%getIndex("wps_WebPinLock");%>"/>
				<td class='l_tb'> :&nbsp;<input id="wifisc_pinlock_select" onclick="wifisc_pinlock_selector(this.checked);" type="checkbox" /></td>
			</tr>
			<tr>
				<td class='r_tb' width='200'></td>
				<td class='l_tb'>
				<input type=button id="wifisc_add_sta_start_button" value="" onclick="return do_wps_request(4)">
				</td>
			</tr>
			<tr>
				<td class='r_tb' width='200'></td>
				<td class='l_tb'>
				<input type="hidden" id="wifisc_er_lock_state" value="<%getIndex("lockdown_stat");%>"/>
				<input type="hidden" id="wifisc_er_unlock" name="config.wifisc.er_unlock" value="false"/>
				<input type=button id="wifisc_er_unlock_button" value="" onclick="return do_wps_request(5)">
				</td>
			</tr>
			</table>
			</div>
</form>

</div>
</td>


<td id="sidehelp_container">	
<div id="help_text">
<strong>	<SCRIPT>ddw("txtHelpfulHints");</SCRIPT>...</strong>
<p><span id="wifi_help"></span></p>
<p><SCRIPT>ddw("txtProtectedSetupStr4");</SCRIPT></p>
<p>	<SCRIPT>ddw("txtProtectedSetupStr5");</SCRIPT></p>
<p>	<SCRIPT>ddw("txtProtectedSetupStr6");</SCRIPT></p>
<p class="more">
<a href="../Help/Adv_wps.asp#Wireless" onclick="return jump_if();"><SCRIPT>ddw("txtMore");</SCRIPT>...</a>
</p><!-- InstanceEndEditable --></div></td></tr></table>
<SCRIPT>Write_footerContainer();</SCRIPT></td></tr></table>
<SCRIPT language=javascript>print_copyright();</SCRIPT>
</div></body></html>

