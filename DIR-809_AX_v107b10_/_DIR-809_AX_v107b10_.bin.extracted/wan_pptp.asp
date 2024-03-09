<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<link rel="stylesheet" rev="stylesheet" href="../style.css" type="text/css" />
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
var schedule_options = [
	<%virSevSchRuleList();%> 
];	
function do_add_new_schedule()
{
	top.location = "../Tools/Schedules.asp";
}	
function ppp_dial_schedule_select(value)
{
	mf["ppp_dial_schedule_name"].value = value;
}	
function update_wan_ip_mode_list()
{
	mf.wan_ip_mode_select.length = 0;
	mf.wan_ip_mode_select[0] = new Option(sw("txtStaticIP"), "0", false, false);
	mf.wan_ip_mode_select[1] = new Option(sw("txtDynamicIP"), "1", false, false);
	mf.wan_ip_mode_select[2] = new Option("PPPoE("+sw("txtUsernamePassword")+")", "2", false, false);
	mf.wan_ip_mode_select[3] = new Option("PPTP("+sw("txtUsernamePassword")+")", "3", false, false);
	mf.wan_ip_mode_select[4] = new Option("L2TP("+sw("txtUsernamePassword")+")", "4", false, false);
	

}
/* * Used by template.js.* You cannot put this function in a sourced file, because SSI will not process it.*/
function get_webserver_ssi_uri() {
		return ("" !== "") ? "/Basic/Setup.asp" : "/Basic/WAN.asp";
}
/** Perform initialization for items that belong to the DWT when page is loaded. */
var ItvID=0;
function template_load()
{
/** Prepend "0" to Firmware minor version if it is less than 10*/
var global_fw_minor_version = "<%getInfo("fwVersion")%>";
var fw_extend_ver = "";			
var fw_minor;
assign_firmware_version(global_fw_minor_version,fw_extend_ver,fw_minor);
var hw_version="<%getInfo("hwVersion")%>";
document.getElementById("hw_version_head").innerHTML = hw_version;
document.getElementById("product_model_head").innerHTML = modelname;
/** Enable or disable subnavigation links depending on feature options.*/
SubnavigationLinks(WLAN_ENABLED, OP_MODE);

topnav_init(document.getElementById("topnav_container"));
page_load();
/** Render any warnings to the user*/
RenderWarnings();
}
//]]>
</script>
<script language="JavaScript" type="text/javascript">
//<![CDATA[
/*
 * For debuging the page on a local client.
 *	This variable will be TRUE if this page is loaded locally in a browser,
 *	and FALSE if this page is loaded from a live gateway,
 */
var local_debug = false;
/** Will be set to "true" if a reboot is needed after saving settings.*/
		var verify_failed = "<%getInfo("err_msg")%>";
/* * Handle for document.form["mainform"]. */
		var mf;
		var pcmac;
		var remote_login;
		var default_idle_time = parseInt("5",10);

		/*
		 * wan_ip_mode_selector()
		 *	Hide or show WAN settings according to selected WAN mode.
		 */
function wan_ip_mode_selector(mode)
{
	var html_file="";
/** Get a numerical mode*/
	mode = mode * 1;
	switch(mode)
	{	
		case STATIC:
			html_file = "wan_static.asp";
			break;
		case DHCP:
			html_file = "wan_dhcp.asp";
			break;
		case PPPOE:
			html_file = "wan_pppoe.asp";
			break;
		case PPTP:
			html_file = "wan_pptp.asp";
			break;
		case L2TP:
			html_file = "wan_l2tp.asp";
			break;
		case DHCPPLUS:
			html_file = "wan_dhcpplus.asp";			
			break;				
	}
/* * Restore the form to its on-load values */
	reset_form("mainform");
/** Update to the correct default MTU provided the mode actually changed */
	if(mode != mf.wan_ip_mode.value) 
	{
		window.location.href=html_file+"?t="+new Date().getTime();
		mf.wan_mtu.value = mtu_default_values[mode];
	}
	//document.getElementById("box_wan_static").style.display = mode == STATIC ? "block" : "none";
}
/* * pppoe_use_dynamic_address_selector() */
		function pppoe_use_dynamic_address_selector(mode){
			mf.pppoe_use_dynamic_address.value = mode;
			if(mode == "true") {
				mf.pppoe_use_dynamic_address_radio_1.checked = true;
				mf.pppoe_ip_address.disabled = true;
			} else {
				mf.pppoe_use_dynamic_address_radio_0.checked = true;
				mf.pppoe_ip_address.disabled = false;
			}
		}
/** wan_pptp_use_dynamic_carrier_selector()*/
		function wan_pptp_use_dynamic_carrier_selector(mode){
			mf.wan_pptp_use_dynamic_carrier.value = mode;
			if(mode == "true") {
				mf.wan_pptp_use_dynamic_carrier_radio_1.checked = true;
				mf.wan_pptp_ip_address.disabled = true;	
				mf.wan_pptp_subnet_mask.disabled = true;
				mf.wan_pptp_gateway.disabled = true;
				mf.wan_primary_dns.disabled = true;
			} else {
				mf.wan_pptp_use_dynamic_carrier_radio_0.checked = true;
				mf.wan_pptp_ip_address.disabled = false;
				mf.wan_pptp_subnet_mask.disabled = false;
				mf.wan_pptp_gateway.disabled = false;
				mf.wan_primary_dns.disabled = false;
			}
		}

/*
 * pptp_reconnect_selector()
 *	Enable or disable PPTP settings according to selected PPTP Reconnect mode.
 */
function pptp_reconnect_selector(mode)
{
	mode = mode * 1;
	// 0 = Always on, 1 = On demand, 2 = Manual
	mf.wan_pptp_reconnect_mode.value = mode;
	mf.wan_pptp_max_idle_time.disabled = mode == 1 ?  false : true;
    /*
	if(mode != 0){
		mf.wan_sch_select.disabled=true;
	}else{
		mf.wan_sch_select.disabled=false;
	}
    */
	switch(mode)
	{
		case 0:
			mf.pptp_reconnect_mode_radio_0.checked = true;
			break;
		case 1:
			mf.pptp_reconnect_mode_radio_2.checked = true;
		break;
		case 2:
			mf.pptp_reconnect_mode_radio_1.checked = true;
		break;
	}
}
function page_load() 
{
	var oldmac;
	displayOnloadPage("<%getInfo("ok_msg")%>");
/** Get a handle to the main form */
	mf = document.forms["mainform"];
 /** Initialise this to local login before checking for local debugging */
	remote_login = false;
	update_wan_ip_mode_list();
    pcmac = "<% getInfo("host-hwaddr"); %>";
	remote_login = (pcmac == "00:00:00:00:00:00") ? true : false;
	oldmac=mf.mac_cloning_address.value; 
	mf.mac1.value=oldmac.substring(0,2);
	mf.mac2.value=oldmac.substring(3,5);
	mf.mac3.value=oldmac.substring(6,8);
	mf.mac4.value=oldmac.substring(9,11);
	mf.mac5.value=oldmac.substring(12,14);
	mf.mac6.value=oldmac.substring(15,17);
	/* * Track the WAN mode*/
			mf.wan_ip_mode.value = PPTP;
			mf.wan_ip_mode_select.value = PPTP;
	/* * Show the MTU default for this mode*/
	wan_pptp_use_dynamic_carrier_selector(mf.wan_pptp_use_dynamic_carrier.value);
	pptp_reconnect_selector(mf.wan_pptp_reconnect_mode.value);
	mf["dsl_mode"].value = 3;
	//schedule_populate_select(mf["wan_sch_select"]);
	//mf.wan_sch_select.value = mf.ppp_schedule_control_0.value;
        mf.wan_pptp_password.value = aes_decrypt("<% getInfo("pptpPassword"); %>");
        mf.confirm_wan_pptp_password.value = aes_decrypt("<% getInfo("pptpPassword"); %>");
  /** Assert form defaults so we know if the user changed something*/
			set_form_default_values("mainform");
		/* Check for validation errors. */
			if (verify_failed != "") {
				set_form_always_modified("mainform");
				alert(verify_failed);
			}
			
		
}

function clone_mac() {
	var copy_mac;
			mf.mac_cloning_address.value = pcmac;
			mf.mac_cloning_enabled.value = "true";
			copy_mac=mf.mac_cloning_address.value; 
	mf.mac1.value=copy_mac.substring(0,2);
	mf.mac2.value=copy_mac.substring(3,5);
	mf.mac3.value=copy_mac.substring(6,8);
	mf.mac4.value=copy_mac.substring(9,11);
	mf.mac5.value=copy_mac.substring(12,14);
	mf.mac6.value=copy_mac.substring(15,17);
}

function wan_schedule_name_selector(value)
{
	mf["ppp_schedule_control_0"].value=value;
}

function page_submit(mode)
{
	/* Check if any changes have been made */
	var lan_ip_str = "<% getInfo("ip-rom"); %>";
	var lan_mask_str = "<% getInfo("mask-rom"); %>";	
	mf.curTime.value = new Date().getTime();	
	if (!is_form_modified("mainform"))
	{
		if(!confirm(sw("txtSaveAnyway"))) 
			return false;
	}else
			{
/* * Make sure mode is an integer and not a string */
				mode = mode * 1;
/* * Handle mode specific fields */
				/* case PPTP */	
	
	if(is_blank(mf.wan_pptp_username.value))
	{
		alert(sw("txtUserNameBlank"));
		mf.wan_pptp_username.focus();
		return false;
	}
	if(strchk_unicode(mf.wan_pptp_username.value) == true) 
	{
                alert(sw("txtUserName")+sw("txtisInvalid"));
                return false;
        }
        if(__is_str_in_deny_chars(mf.wan_pptp_username.value, 1, "<>\""))
        {
                alert(sw("txtForSecurity")+"\n< > \"");
                mf.wan_pptp_username.focus();
                return false;
        }
	if(strchk_unicode(mf.wan_pptp_password.value) == true)
	{
		alert(sw("txtInvalidPwd"));
		mf.wan_pptp_password.focus();
		return false;
	}	
	if (mf.wan_pptp_password.value != mf.confirm_wan_pptp_password.value) {
			alert(sw("txtThePasswordsDontMatch"));
			try	{
				mf.wan_pptp_password.select();
				mf.confirm_wan_pptp_password.select();
				mf.wan_pptp_password.focus();
			} catch (e) {
			}
			return;
		}

        var server_is_ipv4=0;

        if (is_ipv4_valid(mf.wan_pptp_server.value))
        {
            server_is_ipv4 = 1;
        }

		if(mf.wan_pptp_use_dynamic_carrier.value == "false" ) 
		{
			var LAN_IP = ipv4_to_unsigned_integer("<% getInfo("ip-rom"); %>");
			var LAN_MASK = ipv4_to_unsigned_integer("<% getInfo("mask-rom"); %>");	
			var wan_ip = ipv4_to_unsigned_integer(mf.wan_pptp_ip_address.value);
			var mask_ip = ipv4_to_unsigned_integer(mf.wan_pptp_subnet_mask.value);
			var gw_ip = ipv4_to_unsigned_integer(mf.wan_pptp_gateway.value);
			var srv_ip = ipv4_to_unsigned_integer(mf.wan_pptp_server.value);
			var b255 = ipv4_to_unsigned_integer("255.255.255.255");
			b255 ^= mask_ip;

			if (!is_ipv4_valid(mf.wan_pptp_ip_address.value) || 
				mf.wan_pptp_ip_address.value=="0.0.0.0" || 
				is_FF_IP(mf.wan_pptp_ip_address.value) ||
				wan_ip == gw_ip || (server_is_ipv4 && wan_ip == srv_ip) ||
				0 == (wan_ip & b255) ||
				b255 == (b255 & wan_ip))
			{
				alert(sw("txtInvalidPPTPIPaddress") + mf.wan_pptp_ip_address.value);
					try	{
						mf.wan_pptp_ip_address.select();
						mf.wan_pptp_ip_address.focus();
					} catch (e) {
					}
					return;
			}

			if (!is_ipv4_valid(mf.wan_pptp_subnet_mask.value) || !is_mask_valid(mf.wan_pptp_subnet_mask.value)) {
					alert(sw("txtInvalidPPTPsubnetMask") + mf.wan_pptp_subnet_mask.value);
					try	{
						mf.wan_pptp_subnet_mask.select();
						mf.wan_pptp_subnet_mask.focus();
					} catch (e) {
					}
					return;
				}
			//|| gw_ip == srv_ip	==> we accept the case when gw ip == server ip
			if (!is_ipv4_valid(mf.wan_pptp_gateway.value) || 
				mf.wan_pptp_gateway.value=="0.0.0.0" || 
				is_FF_IP(mf.wan_pptp_gateway.value) ||
				0 == (gw_ip & b255) ||
				b255 == ((gw_ip & b255)) )
			{
					alert(sw("txtInvalidPPTPgatewayIPaddress") + mf.wan_pptp_gateway.value);
					try	{
						mf.wan_pptp_gateway.select();
						mf.wan_pptp_gateway.focus();
					} catch (e) {
					}
					return;
				}
				
				if ((wan_ip & mask_ip) !== (gw_ip & mask_ip))
				{
					alert(sw("txtPPTPWANGwIp")+" "+integer_to_ipv4(gw_ip)+" "+sw("txtWithinWanSubnet"));
					return false;
				}
				if ((LAN_IP & LAN_MASK) == (wan_ip & LAN_MASK))
				{
					alert(sw("txtWanSubConflitLanSub"));
					return false;
				}
			}
		//	if (!is_ipv4_valid(mf.wan_pptp_server.value)  || mf.wan_pptp_server.value=="0.0.0.0" || is_FF_IP(mf.wan_pptp_server.value)) {

				if(!server_is_ipv4 || (mf.wan_pptp_server.value == "0.0.0.0") || (server_is_ipv4 && (mf.wan_pptp_server.value == lan_ip_str)) || mf.wan_pptp_server.value == "")
				{
                                         alert(sw("txtInvalidPPTPserverIPaddress") + mf.wan_pptp_server.value);
                                         try     {
                                                 mf.wan_pptp_server.select();
                                                 mf.wan_pptp_server.focus();
                                         } catch (e) {
                                         }
                                         return;

				}

				if(  mf.wan_pptp_use_dynamic_carrier_radio_0.checked == true
				     && server_is_ipv4 &&(!is_valid_ip(mf.wan_pptp_server.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,mf.wan_pptp_server.value) 
				     || !is_valid_gateway(mf.wan_pptp_ip_address.value,mf.wan_pptp_subnet_mask.value,mf.wan_pptp_server.value))){ 
					alert(sw("txtInvalidPPTPserverIPaddress") + mf.wan_pptp_server.value);
					try	{
						mf.wan_pptp_server.select();
						mf.wan_pptp_server.focus();
					} catch (e) {
					}
					return;
				}

		//	if (!is_ipv4_valid(mf.wan_pptp_server.value)  || mf.wan_pptp_server.value=="0.0.0.0" || is_FF_IP(mf.wan_pptp_server.value)) {
				if(  mf.wan_pptp_use_dynamic_carrier_radio_1.checked == true
				     && server_is_ipv4 &&(!is_valid_ip(mf.wan_pptp_server.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,mf.wan_pptp_server.value))){
					alert(sw("txtInvalidPPTPserverIPaddress") + mf.wan_pptp_server.value);
					try	{
						mf.wan_pptp_server.select();
						mf.wan_pptp_server.focus();
					} catch (e) {
					}
					return;
				}

				var LAN_IP_ADDRESS = ipv4_to_unsigned_integer("<% getInfo("ip-rom"); %>");
				var LAN_MASK_ADDRESS = ipv4_to_unsigned_integer("<% getInfo("mask-rom"); %>");
				var wan_ip_address = ipv4_to_unsigned_integer(mf.wan_pptp_server.value);
				if (server_is_ipv4 && ( (LAN_IP_ADDRESS & LAN_MASK_ADDRESS) == (wan_ip_address & LAN_MASK_ADDRESS))) {
					alert(sw("txtWanSubConflitLanSub"));
					try     {
                                                mf.wan_pptp_server.select();
                                                mf.wan_pptp_server.focus();
                                        } catch (e) {
                                        }
					return;
				}

				if (!is_number(mf.wan_pptp_max_idle_time.value)  || (mf.wan_pptp_max_idle_time.value>600 || mf.wan_pptp_max_idle_time.value<0)) {
					alert(sw("txtInvalidIdleTime")+"("+sw("txtPermittedRange")+sw("txtIdleRng0to600")+")");
					try	{
						mf.wan_pptp_max_idle_time.select();
						mf.wan_pptp_max_idle_time.focus();
					} catch (e) {
					}
					return;
				}
/** Check DNS IP's for well-formed-ness*/
				mf.wan_primary_dns.value = trim_string(mf.wan_primary_dns.value);
				
/* * Allow blank as wel as 0.0.0.0 for primary and secondary*/
				mf.wan_primary_dns.value = mf.wan_primary_dns.value == "" ? "0.0.0.0" : mf.wan_primary_dns.value;
				
	
				if(  mf.wan_primary_dns.value!="0.0.0.0" && mf.wan_pptp_use_dynamic_carrier_radio_0.checked == true
				     && (!is_valid_ip(mf.wan_primary_dns.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,mf.wan_primary_dns.value) 
				     || !is_valid_gateway(mf.wan_pptp_ip_address.value,mf.wan_pptp_subnet_mask.value,mf.wan_primary_dns.value))){ 
					alert(sw("txtInvalidPPPoEPrimaryDNS") +  mf.wan_primary_dns.value);
					try {
						mf.wan_primary_dns.select();
						mf.wan_primary_dns.focus();
					} catch (e) {
					}
					return;
				}
				
				if(  mf.wan_primary_dns.value!="0.0.0.0" && mf.wan_pptp_use_dynamic_carrier_radio_1.checked == true
				     && (!is_valid_ip(mf.wan_primary_dns.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,mf.wan_primary_dns.value))){
					alert(sw("txtInvalidPPPoEPrimaryDNS") +  mf.wan_primary_dns.value);
					try {
						mf.wan_primary_dns.select();
						mf.wan_primary_dns.focus();
					} catch (e) {
					}
					return;
				}
				
				if ((mf.wan_primary_dns.value != "0.0.0.0")) {
					mf.wan_force_static_dns_servers.value = "true";
				} else {
					mf.wan_force_static_dns_servers.value = "false";
				}
/* * MTU */			 
				if (!is_number(mf.wan_mtu.value)) {
					alert(sw("txtInvalidMTUSize"));
					try {
						mf.wan_mtu.select();
						mf.wan_mtu.focus();
					} catch (e) {
					}
					return;
				}
				if(mf.wan_mtu.value > 1460 || mf.wan_mtu.value < 576)
				{
					alert(sw("txtInvalidMTUSize")+"("+sw("txtPermittedRange")+sw("txtMtuRng576to1460")+")");
					return false;
				}
/* * Validate MAC and activate cloning if necessary*/			
				mf.mac_cloning_address.value=mf.mac1.value+':'+mf.mac2.value+':'+mf.mac3.value+':'+mf.mac4.value+':'+mf.mac5.value+':'+mf.mac6.value;
				mf.mac_cloning_address.value = trim_string(mf.mac_cloning_address.value);
				if(!verify_mac(mf.mac_cloning_address.value, mf.mac_cloning_address)) {
					alert (sw("txtInvalidMACAddress") + mf.mac_cloning_address.value + ".");
					return;
				}
				if(mf.mac_cloning_address.value == "00:00:00:00:00:00") {
					mf.mac_cloning_enabled.value = "false";
				}			
				else
				{
					var mac_addr = mf.mac_cloning_address.value.split(":");					
					mf.mac_cloning_enabled.value = "true";
					mf.mac_clone.value = "";

					for(var i=0;i<mac_addr.length;i++)
					{
						mf.mac_clone.value += mac_addr[i];
						
					}			
				}
				switch (mode) {
				case PPPOE:			
					mf.pppoe_max_idle_time.disabled = false;
					break;
				case PPTP:
					mf.wan_pptp_max_idle_time.disabled = false;
					break;			
				case L2TP:
					mf.wan_l2tp_max_idle_time.disabled = false;
					break;
	
				}
				
				mf["settingsChanged"].value = 1;
			}
			
			if(mf["dsl_mode"].value != "<%getInfo("wanType");%>")
				mf["settingsChanged"].value = 1;

	var PrivateKey = sessionStorage.getItem('PrivateKey');
var current_time = Math.floor(mf.curTime.value / 1000) % 2000000000;
var auth = hex_hmac_md5(PrivateKey, current_time.toString()+"/Basic/wan_pptp.asp");
auth = auth.toUpperCase();
mf.HNAP_AUTH.value = auth + " " + current_time;	
                        /*encrypt password*/
                        mf.wan_pptp_password.value = aes_encrypt(mf.wan_pptp_password.value);
			mf.submit();
		}
/*		
function page_cancel()
{
if (is_form_modified("mainform") && confirm (sw("txtAbandonAallChanges"))) {
if (verify_failed !== "") {
	top.location = "WAN.asp";
} else {
	reset_form("mainform");
	page_load();
}
}
}
*/
function init()
{
var DOC_Title= 'D-LINK SYSTEMS, INC. | WIRELESS ROUTER  :'+sw("txtSetup")+'/'+sw("txtWAN");
document.title = DOC_Title;
get_by_id("RestartNow").value = sw("txtRebootNow");
get_by_id("RestartLater").value = sw("txtRebootLater");
get_by_id("DontSaveSettings").value = sw("txtDontSaveSettings");
get_by_id("SaveSettings").value = sw("txtSaveSettings");			
get_by_id("clone_mac_addr").value = sw("txtCopyPCsMACAddress");
//get_by_id("add_new_schedule").value = sw("txtAddNew");
get_by_id("DontSaveSettings_Btm").value = sw("txtDontSaveSettings");
get_by_id("SaveSettings_Btm").value = sw("txtSaveSettings");		
}
//]]>
</script>
</head>
<body onmousemove="if(ItvID!=0) clearInterval(ItvID);ItvID=setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);" onload="template_load(); init();">
<div id="loader_container" onclick="return false;">&nbsp;</div>
<div id="outside" style="display:none"><table id="table_shell" cellspacing="0" summary=""><col span="1"/>
<tr><td>
<SCRIPT >
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
DrawRebootButton();
</SCRIPT></div>							
</td>
<td id="maincontent_container">
<SCRIPT >DrawRebootContent("wan");</SCRIPT>
<div id="warnings_section" style="display:none"><div class="section" >
<div class="section_head"><h2><SCRIPT >ddw("txtConfigurationWarnings");</SCRIPT></h2>
<div style="display:block" id="warnings_section_content"></div></div></div></div> <!-- warnings_section -->
<div id="maincontent" style="display: block">
<!-- InstanceBeginEditable name="Main Content" -->
<!--@OPTIONAL:this_file ~= 'Tools_Firmware.html' and this_file ~= 'Tools_System.html'@-->
<form name="mainform" action="/formWanTcpipSetup.htm" method="post" enctype="application/x-www-form-urlencoded" id="mainform">
<input type="hidden" id="settingsChanged" name="settingsChanged" value="0"/>
<input type="hidden" id="curTime" name="curTime" value=""/>
<input type="hidden" value="/Basic/wan_pptp.asp" name="submit-url">
<input type="hidden" id="HNAP_AUTH" name="HNAP_AUTH" value=""/>
<input type="hidden" id="wanType_id" name="wanType" value="pptp"/>
<input type="hidden" id="dsl_mode" name="dsl_mode" value="<%getInfo("wanType");%>"/>
<input type="hidden" name="config.wan_force_static_dns_servers" id="wan_force_static_dns_servers" value="false" />
<input type="hidden" name="config.wan_ip_mode" id="wan_ip_mode" value="<%getInfo("wanType");%>" />
<input type="hidden" name="config.wan_mtu_use_default" id="wan_mtu_use_default" value="true" />
<input type="hidden" id="mac_cloning_enabled" name="config.mac_cloning_enabled" value="true"/>
<input type="hidden" id="mac_clone" name="mac_clone" value=""/>
<input type="hidden" name="config.wan_pptp_reconnect_mode" id="wan_pptp_reconnect_mode" value="<% getIndex("pptpConnectType"); %>" />
<input type="hidden" name="config.wan_pptp_use_dynamic_carrier" id="wan_pptp_use_dynamic_carrier" value="<%getIndexInfo("pptp_wan_ip_mode");%>" />				
<input type="hidden" id="webpage" name="webpage" value="/Basic/wan_pptp.asp">
<input type="hidden" id="mac_cloning_address" size="20" maxlength="17" value="<% getInfo("wanMac"); %>" name="wan_macAddr" /> 
<!--@ENDOPTIONAL@-->
<!--@UNIQUE:maincontent@-->

<div class="section"><div class="section_head"><h2><SCRIPT >ddw("txtWAN");</SCRIPT></h2><p>
<SCRIPT >ddw("txtWANStr2");</SCRIPT></p><p>
<b><SCRIPT >ddw("txtNote");</SCRIPT>&nbsp;:</b> 
<SCRIPT >ddw("txtWANStr3");</SCRIPT></p> 
<input class="button_submit" type="button" id="SaveSettings" name="SaveSettings" value="" onclick="page_submit();"/>
<input class="button_submit" type="button" id="DontSaveSettings" name="DontSaveSettings" value="" onclick="page_cancel();"/>
</div></div>
<div class="box"> 
<h3><SCRIPT >ddw("txtInternetConnectionType");</SCRIPT></h3>
<p class="box_msg"><SCRIPT >ddw("txtWANStr5");</SCRIPT></p>
<fieldset><p><label class="duple"><SCRIPT >ddw("txtWANStr4");</SCRIPT>&nbsp;:</label>
<select id="wan_ip_mode_select" onchange="wan_ip_mode_selector(this.value);">
</select></p></fieldset></div>
<div class="box"><div id="box_wan_pptp" style="display:block"> 
<h3>PPTP&nbsp;<SCRIPT >ddw("txtInternetConnectionType");</SCRIPT>&nbsp;:</h3>
<p class="box_msg"> 
<SCRIPT >ddw("txtWANStr1");</SCRIPT> 
</p></div><fieldset>
<div id="box_wan_pptp_body" style="display:block"> 
<p><label class="duple">&nbsp;</label>
<input id="wan_pptp_use_dynamic_carrier_radio_1" type="radio" name="wan_pptp_use_dynamic_carrier_radio" value="true" onclick="wan_pptp_use_dynamic_carrier_selector(this.value);"/>
<label><SCRIPT >ddw("txtDynamicIP");</SCRIPT></label> 
<input id="wan_pptp_use_dynamic_carrier_radio_0" type="radio" name="wan_pptp_use_dynamic_carrier_radio" value="false" onclick="wan_pptp_use_dynamic_carrier_selector(this.value);"/>
<label><SCRIPT >ddw("txtStaticIP");</SCRIPT></label> 
</p><p><label class="duple" for="wan_pptp_ip_address">PPTP <SCRIPT >ddw("txtIPAddress");</SCRIPT>&nbsp;:</label>
<input type="text" id="wan_pptp_ip_address" size="20" maxlength="15" value="<% getInfo("pptpIp"); %>" name="pptpIpAddr"/>
</p><p> <label class="duple" for="wan_pptp_subnet_mask"><SCRIPT >ddw("txtPPTPSubnetMask");</SCRIPT>&nbsp;:</label>
<input type="text" id="wan_pptp_subnet_mask" size="20" maxlength="15" value="<% getInfo("pptpSubnet"); %>" name="pptpSubnetMask"/>
</p><p><label class="duple" for="wan_pptp_gateway">PPTP&nbsp;<SCRIPT >ddw("txtGatewayIPAddress");</SCRIPT>&nbsp;:</label>
<input type="text" id="wan_pptp_gateway" size="20" maxlength="15" value="<% getInfo("pptpDefGw");%>" name="pptpDefGw"/>
</p>
<p><label class="duple" for="wan_primary_dns"><SCRIPT >ddw("txtPrimaryDNSServer");</SCRIPT>&nbsp;:</label>
<input type="text" id="wan_primary_dns" size="20" maxlength="15" value="<% getInfo("wan-dns1");%>" name="config.wan_primary_dns"/><script>ddw("txtOptional");</script>
</p>

<p>	<label class="duple" for="mac_cloning_address"><SCRIPT >ddw("txtMACAddress");</SCRIPT>&nbsp;:</label>
<input type=text id=mac1 name=mac1 size=2 maxlength=2 value=""> -
<input type=text id=mac2 name=mac2 size=2 maxlength=2 value=""> -
<input type=text id=mac3 name=mac3 size=2 maxlength=2 value=""> -
<input type=text id=mac4 name=mac4 size=2 maxlength=2 value=""> -
<input type=text id=mac5 name=mac5 size=2 maxlength=2 value=""> -
<input type=text id=mac6 name=mac6 size=2 maxlength=2 value=""> <script>ddw("txtOptional");</script>&nbsp;&nbsp;
</p>
<p><label class="duple">&nbsp;</label>
<input class="button_submit" type="button" id="clone_mac_addr" value="" onclick="clone_mac();" />
</p>
<!--pptp server-->
<div id="box_wan_pptp_server" style="display:block"><p> 
<label class="duple" for="wan_pptp_server">PPTP&nbsp;<SCRIPT >ddw("txtServerIP");</SCRIPT>&nbsp;:</label>
<input type="text" id="wan_pptp_server" size="20" maxlength="128" value="<% getInfo("pptpServerIp"); %>" name="pptpServerIpAddr"/>
</p></div>
<p><label class="duple" for="wan_pptp_username"><SCRIPT >ddw("txtUserName");</SCRIPT>&nbsp;:</label>
<input type="text" id="wan_pptp_username" size="20" maxlength="63" value="<% getInfo("pptpUserName"); %>" name="pptpUserName"/>
</p><p> <label class="duple" for="wan_pptp_password"><SCRIPT >ddw("txtPassword");</SCRIPT>&nbsp;:</label>
<input type="password" id="wan_pptp_password" size="20" maxlength="63" onfocus="select();" value="" name="pptpPassword"/>
</p><p><label class="duple" for="confirm_wan_pptp_password"><SCRIPT >ddw("txtVerifyPassword");</SCRIPT>&nbsp;:</label>
<input type="password" id="confirm_wan_pptp_password" size="20" maxlength="63" onfocus="select();" value=""/>
</p><p><label class="duple" for="wan_pptp_max_idle_time"><SCRIPT >ddw("txtMaximumIdleTime");</SCRIPT>&nbsp;:</label>
<input type="text" id="wan_pptp_max_idle_time" maxlength="5" size="10" value="<% getIndex("wan-pptp-idle"); %>" name="pptpIdleTime"/>
<SCRIPT >ddw("txtMinutesInfinite");</SCRIPT> </p></div>

<div id="box_wan_general_body" style="display:block"><p><label class="duple" for="wan_mtu">MTU&nbsp;:</label>
<input type="text" id="wan_mtu" size="10" maxlength="5" value="<% getIndex("pptpMtuSize"); %>" name="pptpMtuSize" />
<SCRIPT >ddw("txtBytes");</SCRIPT>
<!--<span id="wan_mtu_default"></span>--></p></div>
<div id="box_wan_reconnect" style="display:block">
<p><label class="duple" for="wan_pptp_reconnect_mode"><SCRIPT >ddw("txtReconnectMode");</SCRIPT>&nbsp;:</label>
<input type=radio name=pptp_reconnect_mode_radio id=pptp_reconnect_mode_radio_0 value=0 onclick="pptp_reconnect_selector(this.value);">
<SCRIPT >ddw("txtAlwaysOn");</SCRIPT>
<!--
<input id="ppp_schedule_control_0" name="ppp_schedule_control_0" value="<%getIndexInfo("wanPPTPSchSelectName");%>" type="hidden">
<select id='wan_sch_select' name='wan_sch_select' onChange="wan_schedule_name_selector(this.value);">
</select> &nbsp;<input class="button_submit" type="button" id="add_new_schedule" value="" onclick="do_add_new_schedule(true)">
-->
</p>
<p>
<label class="duple">&nbsp;</label>
<input type=radio name=pptp_reconnect_mode_radio id=pptp_reconnect_mode_radio_1 value=2 onclick="pptp_reconnect_selector(this.value);"><SCRIPT >ddw("txtManual");</SCRIPT>
<input type=radio name=pptp_reconnect_mode_radio id=pptp_reconnect_mode_radio_2 value=1 onclick="pptp_reconnect_selector(this.value);"><SCRIPT >ddw("txtOnDemand");</SCRIPT>
</p>
</div></fieldset></div></form>
<SCRIPT language=javascript>DrawSaveButton_Btm();</SCRIPT>
<!-- InstanceEndEditable -->
</div>	</td><td id="sidehelp_container"><div id="help_text">
<!-- InstanceBeginEditable name="Help_Text" --> 
<strong>	<SCRIPT >ddw("txtHelpfulHints");</SCRIPT>...</strong>
<p><SCRIPT >ddw("txtWANStr10");</SCRIPT></p>
<p><SCRIPT >ddw("txtWANStr11");</SCRIPT></p>
<p class="more"><!-- Link to more help -->
<a href="../Help/Basic.asp#WAN" onclick="return jump_if();"><SCRIPT >ddw("txtMore");</SCRIPT>...</a>
</p><!-- InstanceEndEditable --></div></td>
</tr></table>
<SCRIPT >Write_footerContainer();</SCRIPT>
</td></tr></table>
<SCRIPT language=javascript>print_copyright();</SCRIPT>
</div><!-- outside -->
</body>
<!-- InstanceEnd -->
</html>
