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
if('<%getIndex("wlanDisabled");%>'=='Disabled')
	WLAN_ENABLED='0';
else
	WLAN_ENABLED='1';
		
function get_webserver_ssi_uri() {
	return ("" !== "") ? "/Basic/Setup.asp" : "/Status/Logs.asp";
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

function doClear()
{
mf.curTime.value = new Date().getTime();
var PrivateKey = sessionStorage.getItem('PrivateKey');
var current_time = Math.floor(mf.curTime.value / 1000) % 2000000000;
var auth = hex_hmac_md5(PrivateKey, current_time.toString()+"/Status/Logs.asp");
auth = auth.toUpperCase();
mf.HNAP_AUTH.value = auth + " " + current_time;
if (!confirm(sw("txtClearAllLog"))) {
	return;
}
mf["settingsChanged"].value = 1;
mf["action"].value="clear";
mf.submit();
}

//["Jan  1 01:40:55  ","PPPoE: Sending PADI for session1."],

dataLists=[
<%sysLogList()%>

["",""]
];

var d_len=dataLists.length-1;
var row_num=parseInt("20", [20]);
var max=(d_len%row_num==0? d_len/row_num : parseInt(d_len/row_num, [10])+1);

function showSysLog()
{
	var str=new String("");
	var f=document.getElementById("mainform");
	var p=parseInt(f.curpage.value, [10]);

	if (max==0 || max==1)
	{
		f.Pp1.disabled=true;
		f.Np1.disabled=true;
	}
	else
	{
		if (p==1)
		{
			f.Pp1.disabled=true;
			f.Np1.disabled=false;
		}
		if (p==max)
		{
			f.Pp1.disabled=false;
			f.Np1.disabled=true;
		}
		if (p > 1 && p < max)
		{
			f.Pp1.disabled=false;
			f.Np1.disabled=false;
		}
	}

	if (document.layers) return true;
	{
		if(max == 0)
			p = 0;
		str+="<p>"+sw("txtPage")+" "+p+" "+sw("txtOf")+" "+max+"</p>";
		str+="<table borderColor=#ffffff cellSpacing=1 cellPadding=2 width=525 bgColor=#dfdfdf border=1>";
		str+="<tr>";
		str+="<td align=middle>"+sw("txtTime2")+"</td>";
		str+="<td align=middle>"+sw("txtMessage")+"</td>";
		str+="</tr>";

		if(max > 0)
		{
			for (var i=((p-1)*row_num);i < p*row_num;i++)
			{
				if (i>=dataLists.length) break;
				str+="<tr border=1 borderColor='#ffffff' bgcolor='#dfdfdf'>";
				str+="<td>"+dataLists[i][0]+"</td>";
				str+="<td>"+dataLists[i][1]+"</td>";
				str+="</tr>";
			}
		}
		str+="</table>";
	}

	if (document.all)           document.all("sLog").innerHTML=str;
	else if (document.getElementById)   document.getElementById("sLog").innerHTML=str;
}

function ToPage(p)
{
	if (document.layers)
	{
		alert("");
	}
	if (dataLists.length==0) return;
	var f=document.getElementById("mainform");

	switch (p)
	{
		case "0":
			f.curpage.value=max;
		break;
		case "1":
			f.curpage.value=1;
		break;
		case "-1":
			f.curpage.value=(parseInt(f.curpage.value, [10])-1 <=0? 1:parseInt(f.curpage.value, [10])-1);
		break;
		case "+1":
			f.curpage.value=(parseInt(f.curpage.value, [10])+1 >=max? max:parseInt(f.curpage.value, [10])+1);
		break;
	}
	showSysLog();
}
/** Clear the log.*/
function clear_log()
{
mf.curTime.value = new Date().getTime();
var PrivateKey = sessionStorage.getItem('PrivateKey');
var current_time = Math.floor(mf.curTime.value / 1000) % 2000000000;
var auth = hex_hmac_md5(PrivateKey, current_time.toString()+"/Status/Logs.asp");
auth = auth.toUpperCase();
mf.HNAP_AUTH.value = auth + " " + current_time;
if (!confirm(sw("txtClearAllLog"))) {
	return;
}
mf["settingsChanged"].value = 1;
mf["action"].value="clear";
mf.submit();
}
function init()
{
	showSysLog();	
}

var schedule_options = [
	<%virSevSchRuleList();%>
];

var verify_failed = "<%getInfo("err_msg")%>";
function page_submit()
{
        mf.curTime.value = new Date().getTime();	
        var PrivateKey = sessionStorage.getItem('PrivateKey');
        var current_time = Math.floor(mf.curTime.value / 1000) % 2000000000;
        var auth = hex_hmac_md5(PrivateKey, current_time.toString()+"/Status/Logs.asp");
        auth = auth.toUpperCase();
        mf.HNAP_AUTH.value = auth + " " + current_time;

	mf.submit();
}

function alpha_syslog_type_init(){

	var logEnabled = <%getIndex("logEnabled");%>;

    	if(logEnabled & 1) 
        	log_opt_SystemAll_selector(1);
        else
        	log_opt_SystemAll_selector(1);

    	if((logEnabled>>1) & 1)
        	log_opt_System_selector(1);
        else
        	log_opt_System_selector(0);
        
        if((logEnabled>>2) & 1)
        	log_opt_RouterStatus_selector(1);
        else
        	log_opt_RouterStatus_selector(0);
		
      <% getIndex("dos_jscomment_start");%>  	
        if((logEnabled>>3) & 1)
        	log_opt_Firewall_selector(1);
        else
        	log_opt_Firewall_selector(0);
		<% getIndex("dos_jscomment_end");%>
		
}

function log_opt_RouterStatus_selector(mode)
{
	//log_opt_SysActivity_selector(mode);
	//log_opt_notics_selector(mode);
	if(mode){
		mf.log_ntc.value = "ON";
	}else{
		mf.log_ntc.value = "OFF";
	}
	mf.log_ntc.checked = mode;
	//alpha_check_syslog_on();
}
function log_opt_Firewall_selector(mode)
{
	//log_opt_attack_selector(mode);
	//log_opt_dropPackets_selector(mode);
	
	if(mode){
		mf.log_attdrp.value = "ON";
	}else{
		mf.log_attdrp.value = "OFF";
	}
	mf.log_attdrp.checked = mode;
	//alpha_check_syslog_on();
}
function log_opt_System_selector(mode)
{
	//mf.log_opt_system.value = mode;
	if(mode){
		mf.log_ntc.checked = 0;
		mf.log_ntc.value = "OFF";
		mf.log_ntc.disabled = true;
			
		mf.log_attdrp.checked = 0;
		mf.log_attdrp.value = "OFF";
		mf.log_attdrp.disabled = true;


		mf.log_sys.value = "ON";
	}else{
		mf.log_sys.value = "OFF";
		mf.log_ntc.disabled = false;
		mf.log_attdrp.disabled = false;
	}
	mf.log_sys.checked = mode;
	//alpha_check_syslog_on();
}
function log_opt_SystemAll_selector(mode)
{

	if(mode){	

		mf.log_ntc.disabled = false;
		mf.log_attdrp.disabled = false;		
		mf.log_sys.disabled = false;		
		log_opt_System_selector(mf.log_sys.checked);
			
		mf.logEnabled.value = "ON";
	}else{
		mf.log_ntc.checked = 0;
		mf.log_ntc.value = "OFF";
		mf.log_ntc.disabled = true;
			
		mf.log_attdrp.checked = 0;
		mf.log_attdrp.value = "OFF";
		mf.log_attdrp.disabled = true;		

		mf.log_sys.checked = 0;
		mf.log_sys.value = "OFF";
		mf.log_sys.disabled = true;		
		
		mf.logEnabled.value = "OFF";
	}
	mf.logEnabled.checked = mode;
}

function page_load() {

	var is_router_mode = OP_MODE == "0";

	displayOnloadPage("<%getInfo("ok_msg")%>");

	mf = document.forms["mainform"];

	alpha_syslog_type_init();

	set_form_default_values("mainform");
	/* Check for validation errors. */
	if (verify_failed != "") {
		set_form_always_modified("mainform");
		alert(verify_failed);
	}
}

function buttoninit()
{
var DOC_Title= sw("txtTitle")+" : "+sw("txtStatus")+'/'+sw("txtViewLogs");
document.title = DOC_Title;
get_by_id("RestartNow").value = sw("txtRebootNow");
get_by_id("RestartLater").value = sw("txtRebootLater");
get_by_id("Clear").value = sw("txtClear");
//get_by_id("linkLog").value = sw("txtLinkLog");
get_by_id("Pp1").value = sw("txtPrevious");
get_by_id("Lp1").value = sw("txtLastPage");
get_by_id("Fp1").value = sw("txtFirstPage");
get_by_id("Np1").value = sw("txtNextPage");
get_by_id("DontSaveSettings").value = sw("txtDontSaveSettings");
get_by_id("SaveSettings").value = sw("txtSaveSettings");

}
function link_log_setting()
{
	self.location.href='../Tools/EMail.asp?t='+new Date().getTime();
}
//]]>
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="template_load();buttoninit();init();web_timeout();">
<div id="loader_container" onclick="return false;">&nbsp;</div>
<div id="outside" style="display:none"><table id="table_shell" cellspacing="0" summary=""><col span="1"/>
<tr><td>
<SCRIPT >
DrawHeaderContainer();
DrawMastheadContainer();
DrawTopnavContainer();
</SCRIPT>
<table id="content_container" border="0" cellspacing="0" summary=""><col span="3"/>
<tr>	<td id="sidenav_container">
<div id="sidenav">
<SCRIPT >
DrawBasic_subnav();
DrawAdvanced_subnav();
DrawTools_subnav();
DrawStatus_subnav();
DrawHelp_subnav();
DrawEarth_onlineCheck(<%getWanConnection("");%>);
DrawRebootButton();
</SCRIPT></div>
</td><td id="maincontent_container"><SCRIPT >DrawRebootContent();</SCRIPT>
<div id="warnings_section" style="display:none"><div class="section" >
<div class="section_head"><h2><SCRIPT >ddw("txtConfigurationWarnings");</SCRIPT></h2>
<div style="display:block" id="warnings_section_content">
</div>
</div></div></div> 
<div id="maincontent" style="display: block">
<form id="saveform" name="saveform" method='get' action=''>
</form>
<form id="mainform" name="mainform" action="/formSysLog.htm" method="post">
<input type="hidden" id="settingsChanged" name="settingsChanged" value="0"/>
<input type="hidden" id="action" name="action" value="0"/>
<input type="hidden" id="curTime" name="curTime" value="<% getInfo("currTimeSec");%>"/>	
<input type="hidden" id="curpage" name="curpage" value="1">
<input type="hidden" id="Apply" name="Apply" value="Apply\+Changes"/>
<input type="hidden" id="HNAP_AUTH" name="HNAP_AUTH" value=""/>
<input type="hidden" id="submit-url" name="submit-url" value="/Status/Logs.asp"/>
<div class="section"><div class="section_head">
<h2><SCRIPT >ddw("txtViewLogs");</SCRIPT></h2>
<p><SCRIPT >ddw("txtOptionViewLog");</SCRIPT></p>
</div></div>

<div class="box">
<h2><SCRIPT >ddw("txtLogSettings");</SCRIPT></h2>
<input class="button_submit" type="button" id="SaveSettings" name="SaveSettings" value="" onclick="page_submit()"/>
<input class="button_submit" type="button" id="DontSaveSettings"  name="DontSaveSettings" value="" onclick="page_cancel()"/>
</div> <!-- section_head -->

<div class="box" >
	<h2><SCRIPT >ddw("txtLogOptions");</SCRIPT></h2>
	<table cellSpacing=1 cellPadding=2 width=525>
	<tr>
		<input type=hidden id=logEnabled name="logEnabled" value="ON" </td>
	</tr>
	<tr>
		<td colspan=2></td>
	</tr>
	<tr>
		<td class=l_tb><input type=checkbox id=log_sys name="syslogEnabled" value="ON" onclick="log_opt_System_selector(this.checked);"><SCRIPT >ddw("txtSyslogSysEnable");</SCRIPT></td>
		<td class=l_tb><input type=checkbox id=log_attdrp name="doslogEnabled" value="ON" onclick="log_opt_Firewall_selector(this.checked);"><SCRIPT >ddw("txtFirewallSecurity");</SCRIPT></td>
		<td class=l_tb><input type=checkbox id=log_ntc name="wlanlogEnabled" value="ON" onclick="log_opt_RouterStatus_selector(this.checked);"><SCRIPT >ddw("txtSyslogWirelessEnable");</SCRIPT></td>
	</tr>
	</table>
</div>


<div class="box">
<h2><SCRIPT >ddw("txtLogFile");</SCRIPT></h2>
<table cellpadding="1" cellspacing="1" border="0" width="525">
<tr>
<td align="right">
<div align="left">
<input type=button value="" id="Fp1" name="Fp1" onclick=ToPage("1")>
<input type=button value="" id="Lp1" name="Lp1" onclick=ToPage("0")>
<input type=button value="" id="Pp1" name="Pp1" onclick=ToPage("-1")>
<input type=button value="" id="Np1" name="Np1" onclick=ToPage("+1")>
<input type=button value="" id=Clear name=Clear onclick=doClear()>
<!--<input type=button value="" id="linkLog" name="linkLog" onclick="link_log_setting();">-->
</div></td></tr><tr><td class=l_tb><div id=sLog></div></td></tr>
</table>
</div>
<!--	</div>--></form><!-- InstanceEndEditable --></div></td>
<td id="sidehelp_container">
<div id="help_text">
<strong><SCRIPT >ddw("txtHelpfulHints");</SCRIPT>...</strong>
<p><SCRIPT >ddw("txtCheckLog");</SCRIPT></p>
<p><SCRIPT >ddw("txtLogMailed");</SCRIPT></p>
<p class="more"><a href="../Help/Status.asp#Logs" onclick="return jump_if();"><SCRIPT >ddw("txtMore");</SCRIPT>...</a></p>
<!-- InstanceEndEditable --></div></td></tr></table>
<SCRIPT >Write_footerContainer();</SCRIPT>
</td></tr></table>
<SCRIPT language=javascript>print_copyright();</SCRIPT>
</div><!-- outside -->
</body>
<!-- InstanceEnd -->
</html>
