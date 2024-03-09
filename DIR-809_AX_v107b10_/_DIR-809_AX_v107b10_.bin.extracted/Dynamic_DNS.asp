<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<!--<meta http-equiv="Refresh" content="120" >-->
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
width: 168px;
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

/*
 * Used by template.js.
 * You cannot put this function in a sourced file, because SSI will not process it.
*/
function get_webserver_ssi_uri() {
	return ("" !== "") ? "/Basic/Setup.asp" : "/Tools/Dynamic_DNS.asp";
}
/** Perform initialization for items that belong to the DWT when page is loaded.*/
function web_timeout()
{
setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);
}
function template_load()
{/*
	<% getFeatureMark("MultiLangSupport_Head_script");%>
	lang_form = document.forms.lang_form;
	if ("" === "") {
		assign_i18n();
		lang_form.i18n_language.value = "<%getLangInfo("langSelect")%>";
	}
	<% getFeatureMark("MultiLangSupport_Tail_script");%> 
document.forms.lang_form.style.display = "none"; */
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
<!-- InstanceBeginEditable name="Scripts" -->
<script type="text/javascript">
//<![CDATA[
/** Handle for document.forms.mainform.*/
var mf;
/** Will be set to "true" if a reboot is needed after saving settings. */
var verify_failed = "<%getInfo("err_msg")%>";		
/** Do we support the DynDNS server entered by the user?*/
var is_user_server_supported = true;
/** List of supported Dynamic DNS service providers.*/
		var dyndns_servers_list = [
			"",
	"dlinkddns.com.cn",
			"" // index 21 for Oray 2007.10.08
		];
//dyndns_servers_list[2]=sw("txtDDNSServerAddressOray"); 
function dyndns_enabled_selector(checked)
{
	//mf.dyndns_enabled.value = checked;
	mf.dyndns_enabled_select.checked = checked;
	var disabled = !checked;
	mf.dyndns_server_select.disabled = disabled;
	if(checked)
	{
		mf.dyndns_enabled.value = "1";
		if(mf.dyndns_server.value == 5)
		{
			mf.dyndns_host.disabled = true;
		}
		else
		{
			mf.dyndns_host.disabled = false;
		}
	}
	else
	{
		mf.dyndns_enabled.value = "0";
		mf.dyndns_host.disabled = disabled;
	}
	mf.dyndns_user.disabled = disabled;
	mf.dyndns_pass.disabled = disabled;
	mf.confirm_dyndns_pass.disabled = disabled;
	mf.dyndns_timeout.disabled = disabled;
    mf.dns_button.disabled = disabled;
    mf.dyndns_server_user.disabled = disabled;
    mf.dyndns_server_user2.disabled = disabled;

	//document.getElementById("check_on_line").disabled = disabled;
	
}

function dyndns_server_user_selector(user_server)
{
	user_server = user_server.toLowerCase().replace(/\s/g, "");
	for (var i = 0, len = dyndns_servers_list.length; i < len; i++) {
		if (user_server == dyndns_servers_list[i].toLowerCase().replace(/\s/g, "")) {
			mf.dyndns_server.value = i;
			//mf.dyndns_server_user.value = dyndns_servers_list[i];
			mf.dyndns_server_select.value = -1;
			is_user_server_supported = true;
			return;
		}
	}
	is_user_server_supported = false;
	alert(sw("txtSpecifiedDDNSNotSupported"));
}
function dyndns_server_selector(value)
{
	if (value < 0) {
		return;
	}
	mf.dyndns_host.disabled = false;
	//document.getElementById("check_on_line").disabled = true;//temporarily remove by aaron
	get_by_id("type_domain").style.display = "none";
	document.getElementById("dyndns_status").innerHTML = "";
	
	if(value == 5)
	{
		get_by_id("type_domain").style.display = "";
		mf.dyndns_host.disabled = true;
        document.getElementById("dyndns_status").innerHTML = sw("txtpeanutDisConnected");
		//document.getElementById("check_on_line").disabled = true;
		//document.getElementById("dsc_oray").style.display = "";
		//document.getElementById("dsc_gen").style.display = "none";
	    //document.getElementById("dsc_ddns_cn").style.display = "none";
		//document.getElementById("dsc_dyndns_com").style.display = "none";
	}
    /*else if(value == 1)
	{
		document.getElementById("dsc_oray").style.display = "none";
		document.getElementById("dsc_gen").style.display = "none";
		document.getElementById("dsc_ddns_cn").style.display = "";
		document.getElementById("dsc_dyndns_com").style.display = "none";
	}else if(value == 7 || value == 8)
	{
		document.getElementById("dsc_oray").style.display = "none";
		document.getElementById("dsc_gen").style.display = "none";
		document.getElementById("dsc_ddns_cn").style.display = "none";
		document.getElementById("dsc_dyndns_com").style.display = "";
	}else
	{
		document.getElementById("dsc_gen").style.display = "";
		document.getElementById("dsc_oray").style.display = "none";
		document.getElementById("dsc_ddns_cn").style.display = "none";
		document.getElementById("dsc_dyndns_com").style.display = "none";
	}*/
/** Only update the list's selected option if it exists.*/
    var select = mf.dyndns_server_select;
    select.value = -1;
    for (var i = 0, len = select.options.length; i < len; i++)
    {
        if (select.options[i].value === value)
        {
            select.value = value;
            mf.dyndns_server_user2.value = select.options[i].text;
            break;
        }
    }
	mf.dyndns_server.value = value;
	//mf.dyndns_server_select.value = value;
    return true;
}

function verify_password(f1, f2)
{
	if (f1.value !== f2.value) {
		alert(sw("txtPasswordsNotMatchReEnter"));
		f1.value = "";
		f2.value = "";
		f1.selected = true;
		f1.select();
		f1.focus();				
		return false;
	}
		return true;
}
function get_len(name)
{
  var byteLength = name.length;   
    for (i=0; i<name.length; i++)
    {
        if (name.charCodeAt(i) > 255)
        {
            byteLength++;
        }
    }
    
    return byteLength;
}	
function is_consecutive(str)
{
        if (str.length==0) return false;
        for (var i=0;i < str.length;i++)
        {
                if (str.charAt(i) == '-' && str.charAt(i+1) == '-') return true;
        }
        return false;
}
function isValid_UserName(name, type)
{ 
 var name_len = name.length;
 var type_num = "-1"; 
 if(typeof(type) != 'undefined')
 {
 	type_num = type;
 }

 for(i=0;i<name_len;i++)
	{
	 var char_code = name.charAt(i);	
	 if(type_num == "5")
     {	 if (char_code  == '-' ||  char_code == '_')  continue;}
	 else
     {	 if (char_code  == '-' ||  char_code == '_' || char_code == '.')  continue;}
     if (char_code >= '0' && char_code <= '9')  continue;	/* 0~9 */
	 else if (char_code >= 'A' && char_code <= 'Z')  continue;	/* A~Z */
	 else if (char_code >= 'a' && char_code <= 'z') continue;	/* a~z */
	 else  return false;
	}		
	return true;
}	
/** Validate and submit the form.*/
function formIsChange(){

		if(mf.dyndns_enabled.value == "0")
		{
			if(mf.dyndns_enabled.value != "<%getIndex("ddnsEnabled");%>")
				return true;
		}
		else{
			if(mf.dyndns_enabled.value != "<%getIndex("ddnsEnabled");%>")
				return true;
			if(mf.dyndns_server.value != "<%getIndex("ddnsType");%>")
				return true;
			if(mf.dyndns_server.value != 5)
			{
				if(mf.dyndns_host.value != "<%getInfo("ddnsDomainName");%>")
					return true;
			}
			if(mf.dyndns_user.value != "<%getInfo("ddnsName");%>")
				return true;
			if(mf.dyndns_pass.value != aes_decrypt("<%getInfo("ddnsPw");%>"))
				return true;
		}
    return false;
}

function validate_server_addresses(srvVal)
{
    if(srvVal == "")
    {
        return false;
    }
    else 
    {
        if(LangCode=="SC")
        {
            if(srvVal == sw("txtDDNSServerAddressOray"))
            {
                return true;
            }
        }
        var strRegex = "^((https|http)?:\/\/)"
            + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?"
            + "(([0-9]{1,3}\\.){3}[0-9]{1,3}|"
            + "([0-9a-z_!~*'()-]+\\.)*"
            + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\\."
            + "[a-z]{2,6})"
            + "(:[0-9]{1,4})?"
            + "((\/?)|(\/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+\/?)$";
        var re=new RegExp(strRegex);

        if(!re.test(srvVal))
        {
            return false;
        }
        else if((srvVal == "0.0.0.0") || (srvVal == "255.255.255.255"))
        {
            return false;
        }
    }
    return true;
}
function page_submit()
{
	mf.curTime.value = new Date().getTime();
        /*post data security control*/
        var PrivateKey = sessionStorage.getItem('PrivateKey');
        var current_time = Math.floor(mf.curTime.value / 1000) % 2000000000;
        var auth = hex_hmac_md5(PrivateKey, current_time.toString()+"/Tools/Dynamic_DNS.asp");
        auth = auth.toUpperCase();
        mf.HNAP_AUTH.value = auth + " " + current_time; 

	if (!is_form_modified("mainform") && !confirm(sw("txtSaveAnyway"))) {
			return false;
	}
	else
	{
		mf.settingsChanged.value = 1;
	}
	if (!is_user_server_supported) {
		alert(sw("txtSpecifiedDDNSNotSupported"));
		return false;
	}
    var ddns_server = mf.dyndns_server_user2.value;
	if(mf.dyndns_enabled.value == "1")
	{
        if (mf.dyndns_user.value.length == 0)
        {
            alert(sw("txtdyndnsusernull"));
            return false;
        }
        if (!validate_server_addresses(mf.dyndns_server_user2.value))
        {
            alert(sw("txtInvalidDDNSServer"));
            //mf.dyndns_server_user2.value = "";
            return false;
        }

        if(ddns_server == "dlinkddns.com.cn")
        {
            mf.dyndns_server.value = 1;
        }
        else if(ddns_server == "dlinkddns.com")
        {
            mf.dyndns_server.value = 6;
        }
        else if(ddns_server == "DynDns.org(Custom)")
        {
            mf.dyndns_server.value = 7;
        }
        else if((ddns_server == "DynDns.org(Free)") || (ddns_server == "dyndns.com"))
        {
            mf.dyndns_server.value = 8;
        }
        else if(ddns_server == sw("txtDDNSServerAddressOray"))
        {
            mf.dyndns_server.value = 5;
        }
        else if((ddns_server == "noip.org") || (ddns_server == "noip.com") 
                || (ddns_server == "no-ip.org") || (ddns_server == "no-ip.com"))
        {
            mf.dyndns_server.value = 9;
        }
        else
        {
            mf.dyndns_server.value = 99;
        }

		if(mf.dyndns_server.value != 5)
		{
			if ((mf.dyndns_host.value.length > 64)||(mf.dyndns_host.value.length < 1))
			{
				alert(sw("txtInvalidHostName2"));
		
				return false;				
			}
		}
  
	if (!isValid_UserName(mf.dyndns_host.value) )

	{
		alert(sw("txtInvalidHostName"));

		return false;

	}	
	  
	if (!isValid_UserName(mf.dyndns_user.value, mf.dyndns_server.value))

	{
		alert(sw("txtdyndnsuser"));

		return false;

	}
	if (strchk_unicode(mf.dyndns_pass.value))

	{
		alert(sw("txtdyndnspassnull"));

		return false;

	}
	if(mf.dyndns_server.value != 5)
	{
	 if ((mf.dyndns_user.value.length > 64)||(mf.dyndns_user.value.length < 2))
	 {

		alert(sw("txtdyndnsuserlength"));

		return false;
	 }
	}
	else
	{
	 if ((mf.dyndns_user.value.length > 16)||(mf.dyndns_user.value.length < 5))
	 {

		alert(sw("txtorayuser"));

		return false;
	 }	
	 if( is_digit(mf.dyndns_user.value))
	 {

		alert(sw("txtdyndnsuser"));

		return false;
	 }		
	 if (is_include_special_chars(mf.dyndns_user.value,"_"))
	 {
	 		return false;
	 }
	 if(is_consecutive(mf.dyndns_user.value))
	 {
	 		alert(sw("txtdyndnsuser"));
	 		return false;
	 }
	}

	if(mf.dyndns_server.value != 5)
	{
	 	if((mf.dyndns_server.value == 1)||(mf.dyndns_server.value == 6))
	 	{		 
		 if ((get_len(mf.dyndns_pass.value) > 64)||(get_len(mf.dyndns_pass.value) < 5))		 
		 {
			alert(sw("txtdyndnspasslength"));
			return false;
		  }
		 }
		 else{
			 if ((get_len(mf.dyndns_pass.value) > 64)||(get_len(mf.dyndns_pass.value) < 6))	 
			 {
				alert(sw("txtdyndnspasslength2"));
				return false;
			  }		 	
		 }	
	}
	else
	{
	 if ((get_len(mf.dyndns_pass.value) > 16)||(get_len(mf.dyndns_pass.value) < 6))	 
	 {
		alert(sw("txtdyndnspasslength3"));
		return false;
	  }			
	}
	}

	//timeout setting
	var timeout = mf.dyndns_timeout.value;
		if (!is_number(timeout)) {
			alert(sw("txtEnterNumericBetween1and8760"));
			mf.dyndns_timeout.select();
			mf.dyndns_timeout.focus();
			return;
		}
		timeout = parseInt(timeout);
		if (timeout < 1) {
			alert(sw("txtTimeoutValueLessEqualZero"));
			mf.dyndns_timeout.select();
			mf.dyndns_timeout.focus();
			return;
		}
	if (timeout > 8760) {
			alert(sw("txtTimeoutValueGreater8760"));
			mf.dyndns_timeout.select();
			mf.dyndns_timeout.focus();
			return;
		}

	mf.form_submitted.value = "1";
/*	
	{
		// default value to userinput/99
		mf.dyndns_server.value = 99;
		var user_server;
		var select = mf.dyndns_server_select;
		user_server = mf.dyndns_server_user2.value;
		user_server = user_server.toLowerCase().replace(/\s/g, "");
		for (var i = 0, len = dyndns_servers_list.length; i < len; i++) {
				if (user_server == dyndns_servers_list[i].toLowerCase().replace(/\s/g, "")) {
					mf.dyndns_server.value =select.options[i].value;
					break;
				}
			}
	}
*/	
mf.submit_psw.value = aes_encrypt(mf.dyndns_pass.value);
if (formIsChange()){  //something changed
        mf.dyndns_pass.value = "WDB8WvbXdH";
			mf.settingsChanged.value = 1;
		}
			mf.submit();
}
/*
function refresh() {
		top.location = "Dynamic_DNS.asp?t="+new Date().getTime();
}
*/

var mystatus = 0;
function xml_done(xml)
{
	var ddns = xml.getElementData("ddns");	
	var sConnected = sw("txtConnected");
	var sDisConnect = sw("txtDisconnected");
	var sDisConnect1 = sw("txtDisconnect1");
	var sDisConnect2 = sw("txtDisconnect2");
	var sConnecting = sw("txtConnecting");
	if (ddns) {
				//document.getElementById("offline").style.display = "none";
				//document.getElementById("online").style.display = "block";
				// 2007.04.25 skip wan online issue
                                // wanonline = 1;
	}
	//var s;
	//var t;
	if(mf.dyndns_server.value == 5)
	{
		document.getElementById("type_domain").style.display = "";
	    //s = '<% getInfo("ddnsStatus"); %>';
		var s = xml.getElementData("dynStatus");

		if(s == 0)
		{
			document.getElementById("dyndns_status").innerHTML = sw("txtpeanutDisConnected");
			document.getElementById("dyndns_dynDomain").innerHTML = "";
		}
		else if(s == 1)
		{
			document.getElementById("dyndns_status").innerHTML = sw("txtpeanutConnected");
			var dynLists=new Array();
			dynLists = xml.getElementData("dynDomain");
			var str=new String("");
			var tt = dynLists.split(",");
			var yy = tt.length;
			
			for(var i=0;i<yy-1;i++){
				
				str+="<font color=red>ON&nbsp;</font>" + tt[i] + "<br>";
			}

			document.getElementById("dyndns_dynDomain").innerHTML = str;
		}
		else if(s == 3)
		{
			document.getElementById("dyndns_status").innerHTML = sw("txtpeanutConnecting");
			document.getElementById("dyndns_dynDomain").innerHTML = "";
		}
        else
        {
            document.getElementById("dyndns_status").innerHTML = sw("txtConnecting");
        }
		//document.getElementById("check_on_line").disabled = true;//temporarily remove by aaron
		//t = '<% getInfo("ddnsType"); %>';
		var t = xml.getElementData("dynType");
	
		if(t == 5)
		{
			document.getElementById("dyndns_type").innerHTML = sw("txtpeanutCommon");
		}
		else
		{
			document.getElementById("dyndns_type").innerHTML = sw("txtpeanutSpecial");
		}

		return ;
		
	}else
    {
        document.getElementById("type_domain").style.display = "none";
    }

	if( ddns == 250) {
				s = "Fail, WAN no IP Adress";
				s = sDisConnect1;			
	}else if( ddns == 5) {
			//s = "Fail, Please check ddns configuration setting";			
			s = sDisConnect2;			
	}else if( ddns == 0) {
			//s = "Connected";
			s = sConnected;
	}else if( ddns == 129) {
			//s = "DDNS Disabled";
			s = sDisConnect;			
	}else if( ddns == 100) {
			//s = "Connected Update";
			s = sConnected;
	}else if( ddns == 128) {
			//s = "Connected Update";
			s = sConnecting; // 2007.10.19 oray
	}else {
			s = sDisConnect;			
	}
	
	mystatus++;
	// this should try next
	if(mystatus < 5 && s==sDisConnect){
		xml_tryagain();
	}else if(mystatus<2 && s !=sDisConnect){
		xml_tryagain();
	}else
	{
		document.getElementById("dyndns_status").innerHTML = s;
		//document.getElementById("check_on_line").disabled = true;//temporarily remove by aaron
	}
}
function xml_timeout()
{
	// this should try next
	//alert("050");	
	xml_tryagain();
	// maybe server down...
}
function xml_tryagain() 
{
	setTimeout(xml_load, 6000);
}
function xml_load()
{
	if(mf.dyndns_server.value == 5)
	{
		var ddns_getUrl="get_peanut_status.asp"+"?mystatus="+mystatus;
	}
	else
	{
		var ddns_getUrl="get_ddns_status.asp"+"?mystatus="+mystatus;
	}
	var myxml = new xmlDataObject(xml_done, xml_timeout, 3000,ddns_getUrl);
		myxml.retrieveData();
}
function Check_OnLine()
{
if (formIsChange()){  //something changed
		alert(sw("txtsavefirst"));
		return;
	}

	mystatus=0;
	//document.getElementById("check_on_line").disabled = true;
	document.getElementById("dyndns_status").innerHTML =sw("txtDDNSTesting");
	xml_load();
document.getElementById("dyndns_status").style.display = "block";
return;
}

function get_value()
{
	xml_load();
    document.getElementById("dyndns_status").innerHTML = sw("txtConnecting");
	setTimeout(get_value,6000);
}

function page_load()
{
	mf = document.forms.mainform;
	/* When locally viewing the page. */
	if ("" !== "") {
		hide_all_ssi_tr();
		dyndns_enabled_selector(false);
		return;
	}
	
	displayOnloadPage("<%getInfo("ok_msg")%>");
	// 2007.05.07
	// 99 is user input, only support dyndns (because no dyndns/static/custom information)
	mf.dyndns_server.value = "<%<getIndex("ddnsType");%>";
    mf.dyndns_server_user2.value = "<%getInfo("ddnsserver");%>";
	if(mf.dyndns_enabled.value == "1")
	{
		if( mf.dyndns_server.value != "99" )
		{
			dyndns_server_selector(mf.dyndns_server.value);
			//mf.dyndns_server_user.value = dyndns_servers_list[mf.dyndns_server.value];
		}
	}
	/*else
	{
		if(LangCode=="SC")
		{
			dyndns_server_selector(1);
		}
		else
		{
			dyndns_server_selector(6);
		}
	}*/
	dyndns_enabled_selector(mf.dyndns_enabled.value == "1");
	/* Check for validation errors. */
	if (verify_failed != "") {
		set_form_always_modified("mainform");
		alert(verify_failed);
		return;
	}
	set_form_default_values("mainform");
	
	//xml_load();

    mf.dyndns_pass.value = aes_decrypt("<%getInfo("ddnsPw");%>");

	if(mf.dyndns_enabled.value == "1")
	{
	
		get_value();
	}
	
}
function init()
{
	var DOC_Title= sw("txtTitle")+" : "+sw("txtTools")+'/'+sw("txtDDNS");
	document.title = DOC_Title;	
	get_by_id("RestartNow").value = sw("txtRebootNow");
	get_by_id("RestartLater").value = sw("txtRebootLater");
	get_by_id("DontSaveSettings").value = sw("txtDontSaveSettings");
	get_by_id("SaveSettings").value = sw("txtSaveSettings");
	//get_by_id("check_on_line").value = sw("txtDDNSAccountTesting");
    if(get_by_id("dyndns_server_select").value == 5)
    {
        get_by_id("type_domain").style.display = "";
    }else
    {
        get_by_id("type_domain").style.display = "none";
    }

}					
//]]>
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="init();template_load();web_timeout();">
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
</SCRIPT></div>
<!--
<% getFeatureMark("MultiLangSupport_Head");%>
<SCRIPT >
DrawLanguageList();
</SCRIPT>
<% getFeatureMark("MultiLangSupport_Tail"); %>								
-->
</td>
<td id="maincontent_container">
<SCRIPT >
DrawRebootContent("wan");
</SCRIPT>
<div id="warnings_section" style="display:none">
<div class="section" >
<div class="section_head">
<h2><SCRIPT >ddw("txtConfigurationWarnings");</SCRIPT></h2>
<div style="display:block" id="warnings_section_content">
<!-- This division will be populated with configuration warning information --></div><!-- box warnings_section_content -->
</div></div></div> <!-- warnings_section -->
<div id="maincontent" style="display: block">
<!-- InstanceBeginEditable name="Main Content" -->
<form id="mainform" name="mainform" action="/formDdns.htm" method="post">
	<input type="hidden" id="settingsChanged" name="settingsChanged" value="0"/>
	<input type="hidden" id="curTime" name="curTime" value=""/>
        <input type="hidden" id="HNAP_AUTH" name="HNAP_AUTH" value=""/>
        <input type="hidden" name="submit-url" value="/Tools/Dynamic_DNS.asp"/>
<div class="section"><div class="section_head">
<h2><SCRIPT >ddw("txtDDNS");</SCRIPT></h2>
<p><SCRIPT >ddw("txtDDNSStr1");</SCRIPT>
<div id="dsc" style="display:none"><SCRIPT >ddw("txtDDNSS_CN");</SCRIPT></div>
<!--<br><br>
<div id="dsc_gen" style="display:none"><SCRIPT >ddw("txtDDNSStr2");</SCRIPT></div>
<div id="dsc_ddns_cn" style="display:none"><SCRIPT >ddw("txtDDNSS_CN");</SCRIPT></div>
<div id="dsc_dyndns_com" style="display:none"><SCRIPT >ddw("txtDYNDNS_COM");</SCRIPT></div>
<div id="dsc_oray" style="display:none"><SCRIPT >ddw("txtpeanut");</SCRIPT><br><a href="https://console.oray.com/passport/register.html#per"><SCRIPT >ddw("txtpeanutserver");</SCRIPT></a><br><a href="http://www.oray.cn"> <SCRIPT >ddw("txtpeanutupdate");</SCRIPT></a><br><a href="http://ask.oray.cn/"><SCRIPT >ddw("txtpeanuthelp");</SCRIPT></a></div>
<br><br>-->
</p><input class="button_submit" type="button" id="SaveSettings" name="SaveSettings" value="" onclick="page_submit()"/>
<input class="button_submit" type="button" id="DontSaveSettings" name="DontSaveSettings" value="" onclick="page_cancel()"/>
</div><div class="box">
<h3><SCRIPT >ddw("txtDDNSSettings");</SCRIPT></h3>
<fieldset><p>
<input type="hidden" name="form_submitted" value="0"/>
<input type="hidden" name="submit_psw" value=""/>
<label class="duple">
<SCRIPT >ddw("txtEnableDDNS");</SCRIPT>
:</label>
<input type="hidden" id="dyndns_enabled" name="config.dyndns_enabled" value="<%getIndex("ddnsEnabled");%>" />
<input type="checkbox" id="dyndns_enabled_select" onclick="dyndns_enabled_selector(this.checked);"/>
</p>
<p>
<input type="hidden" id="dyndns_server" name="config.dyndns_server" value="99" />
<label class="duple">
<SCRIPT >ddw("txtServerAddress");</SCRIPT>
:</label>
<!-- Support DDNS 2007.05.07 -->

<input size=15 type="text" id="dyndns_server_user2" name="config.dyndns_cameo_name" size="20" maxlength="63" value="" />
<input type="hidden" id="dyndns_server_user" size="25" maxlength="63" onchange="dyndns_server_user_selector(this.value);" />
<input type="button" id="dns_button" name="dns_button" value="&lt;&lt;" size="3" onClick="dyndns_server_selector(document.getElementById('dyndns_server_select').value);">
<select id="dyndns_server_select">
<option value="-1">
<SCRIPT >ddw("txtSelectDDNSServer");</SCRIPT>
</option>
<SCRIPT>
if(LangCode=="SC")
{
	//document.write('<option value="1">dlinkddns.com.cn </option>');
	//document.write('<option value="6">dlinkddns.com </option>');
	//document.write('<option value="7">DynDns.org(Custom) </option>');
	document.write('<option value="8">dyndns.com  </option>');
	document.write('<option value="5">');ddw("txtDDNSServerAddressOray");document.write('</option>');
}
else
{
	document.write('<option value="6">dlinkddns.com </option>');
	//document.write('<option value="1">dlinkddns.com.cn </option>');
	//document.write('<option value="7">DynDns.org(Custom) </option>');
	document.write('<option value="8">dyndns.com </option>');
	//document.write('<option value="5">');ddw("txtDDNSServerAddressOray");document.write('</option>');

}
</SCRIPT>
</select></p>
<p>
<label class="duple">
<SCRIPT >ddw("txtHostName");</SCRIPT>
:</label>
<input type="text" size="30" maxlength="64" id="dyndns_host" name="config.dyndns_host"  value="<%getInfo("ddnsDomainName");%>" />
</p><p>
<label class="duple">
<SCRIPT >ddw("txtUsernameOrKey");</SCRIPT>
:</label>
<input type="text" size="30" maxlength="64" id="dyndns_user" name="config.dyndns_user" value="<%getInfo("ddnsName");%>" />
</p><p>
<label class="duple">
<SCRIPT >ddw("txtPasswordOrKey");</SCRIPT>
:</label>
<input type="password" size="30" maxlength="64" id="dyndns_pass" name="config.dyndns_pass" onfocus="select();" />
</p>
<p>
<!--label class="duple">
<SCRIPT >ddw("txtVerifyPassword");</SCRIPT>
:</label-->
<input type="hidden" size="30" maxlength="64" id="confirm_dyndns_pass" name="config.confirm_dyndns_pass" onfocus="select();" />
</p> 
<p>
<label class="duple">
<SCRIPT >ddw("txtTimeout");</SCRIPT>
:</label>
<input type="text" size="10" maxlength="10" id="dyndns_timeout" name="config.dyndns_timeout" value="<%getIndexInfo("ddns_timeout");%>" />
<SCRIPT >ddw("txtHours");</SCRIPT>
</p>
<!--
			<div id="gen_ddns_test" style="display:block">
			<table>
			<tr>
					<td width=170></td>	
					<td height=20><input type=button id="check_on_line" value="" style="display:none" onClick="Check_OnLine()"></td>
			</tr>
			<tr>
			<td width=170></td>	
            <td class=c_tb colspan=2 height=20><div id="dyndns_status" style="display:block" /></div></td>
            </tr> 
			</table>
			</div>
			-->
<!-- Status issue -->
<p>
<label class="duple">
<SCRIPT >ddw("txtStatus");</SCRIPT>
:</label>
<span id="dyndns_status"  /></span>
</p>
<div id="type_domain" >
<p>
<label class="duple">
<SCRIPT >ddw("txtType");</SCRIPT>
:</label>
<span id="dyndns_type"  /></span>
</p>
<p>
<table>
<tr>
<td>
<label class="duple">
<SCRIPT >ddw("txtDomain");</SCRIPT>
:</label>
</td>
<td>
<!--<table><tr><td><% getInfo("ddnsDomain"); %></td></tr></table>-->
<table><tr><td><span id="dyndns_dynDomain"  /></span></td></tr></table>
</td>
</tr>
</table>
</p> 
</div>
</fieldset></div></div></form>
<!-- InstanceEndEditable -->
</div></td>
<td id="sidehelp_container"><div id="help_text">
<!-- InstanceBeginEditable name="Help_Text" -->
<strong>
<SCRIPT >ddw("txtHelpfulHints");</SCRIPT>...</strong>
<p><SCRIPT >ddw("txtDDNSStr3");</SCRIPT></p>
<p class="more"><!-- Link to more help -->
<a href="../Help/Tools.asp#Dynamic_DNS" onclick="return jump_if();"><SCRIPT >ddw("txtMore");</SCRIPT>...</a>
</p><!-- InstanceEndEditable --></div></td></tr></table>
<SCRIPT >Write_footerContainer();</SCRIPT>
<SCRIPT language=javascript>print_copyright();</SCRIPT>
</div><!-- outside --></body>
<!-- InstanceEnd -->
</html>
