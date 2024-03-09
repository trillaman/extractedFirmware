<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<link rel="stylesheet" rev="stylesheet" href="style.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
</script>
<script type="text/javascript" src="ubicom.js"></script>
<script type="text/javascript" src="xml_data.js"></script>
<script type="text/javascript" src="navigation.js"></script>
<% getLangInfo("LangPath");%>
<script type="text/javascript" src="utility.js"></script>
<script type="text/javascript">
//<![CDATA[

var no_reboot_alt_location = "";

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
page_load();
RenderWarnings();
}
var timeleft = 35;
function countdown()
{

document.getElementById("timeleft").innerHTML = timeleft;
if (timeleft === 0) {
//top.location = '<%getInfo("last_url");%>?t='+new Date().getTime();
    top.location = '/index.asp?t='+new Date().getTime();
return;
}
timeleft--;
setTimeout(countdown, 1000);
}
function show_lan_ip()
{
	var repeater_enabled1='<%getIndex("repeaterEnabled","0");%>';
	var repeater_enabled2='<%getIndex("repeaterEnabled","1");%>';
		document.getElementById("lan_ip").innerHTML = '<% getInfo("ip-rom"); %>';
	 
	return;
}
function page_load() 
{
var DOC_Title= sw("txtTitle")+" : "+sw("txtRebooting");
document.title = DOC_Title;	
do_alpha_submit_to_sdk();
countdown();
show_lan_ip();
}
function do_alpha_submit_to_sdk()
{
	var str;
	var alpha_submit_Ajaxask;
	get_by_id("curTime").value = new Date().getTime();	

var PrivateKey = sessionStorage.getItem('PrivateKey');
var current_time = Math.floor(get_by_id("curTime").value / 1000) % 2000000000;
var auth = hex_hmac_md5(PrivateKey, current_time.toString()+"/apply_reboot.asp");
auth = auth.toUpperCase();
get_by_id("HNAP_AUTH").value = auth + " " + current_time;

	str = "&submit-url=%2Fapply_reboot.asp" ; 
	str += "&HNAP_AUTH="+get_by_id("HNAP_AUTH").value; 
	
	if (alpha_submit_Ajaxask == null) alpha_submit_Ajaxask = __createRequest();
        alpha_submit_Ajaxask.open("POST", "/formRebootCheck.htm", true);
	 alpha_submit_Ajaxask.setRequestHeader('Content-type','application/x-www-form-urlencoded');
	// alpha_submit_Ajaxask.onreadystatechange = do_alpha_submit_AjaxaskCallBack;
       alpha_submit_Ajaxask.send(str);	
}
//]]>
</script>
</head>
<body onload="template_load();web_timeout();">
<div id="loader_container" onclick="return false;">&nbsp;</div>
<div id="outside_1col">
<table id="table_shell" cellspacing="0" summary=""><col span="1"/>
<tbody>
<tr>
<td>
<SCRIPT >
DrawHeaderContainer();
DrawMastheadContainer();
</SCRIPT>
<table id="content_container" border="0" cellspacing="0" summary="">
<tr>
<td id="sidenav_container">&nbsp;</td>
<td id="maincontent_container">
<div id="maincontent_1col" style="display: block">
<div id="box_header">

<input type="hidden" id="curTime" name="curTime" value=""/>
<input type="hidden" id="HNAP_AUTH" name="HNAP_AUTH" value=""/>
<input type="hidden" value="/apply_reboot.asp" name="submit-url">

<h1><SCRIPT >ddw("txtRebooting");</SCRIPT>...</h1>
<p class="centered">
<SCRIPT >ddw("txtPleaseWait");</SCRIPT>
<span id="timeleft"></span>&nbsp; 
<SCRIPT >ddw("txtSeconds");</SCRIPT>
</p>
<p class="centered"><SCRIPT >ddw("txtRebootWarning");</SCRIPT></p>
<p class="centered"><SCRIPT >ddw("txtLanIP");</SCRIPT>
<p id="lan_ip" class="centered"></p>
</p>
</div>
</div>
</td>
<td id="sidehelp_container">&nbsp;</td>
</tr>
</table>
<table id="footer_container" border="0" cellspacing="0" summary="">
<tr>
<td>
<img src="Images/img_wireless_bottom.gif" width="114" height="35" alt="" />
</td>
<td>&nbsp;</td>
</tr>
</table>
</td>
</tr>
</tbody>
</table>
<SCRIPT language=javascript>print_copyright();</SCRIPT>
</div>
</body>
</html>