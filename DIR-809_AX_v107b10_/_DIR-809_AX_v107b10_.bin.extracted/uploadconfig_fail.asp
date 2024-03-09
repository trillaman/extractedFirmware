<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<link rel="stylesheet" rev="stylesheet" href="../style.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
<!--
var lang = "<% getLangInfo("lang");%>";
//-->
</script>
<!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="Local Styles" -->
<style type="text/css">
/*Styles used only on this page.*/
</style>
<!-- InstanceEndEditable -->

<script type="text/javascript" src="../ubicom.js"></script>
<script type="text/javascript" src="../xml_data.js"></script>
<script type="text/javascript" src="../navigation.js"></script>
<% getLangInfo("LangPath");%>
<script type="text/javascript" src="../utility.js"></script>
<script type="text/javascript">
//<![CDATA[
function web_timeout()
{
setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);
}
function template_load()
{
lang_form = document.forms.lang_form;
if ("" === "") {
assign_i18n();
}

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
var timeleft = 81;
function countdown()
{
if (--timeleft) {
document.getElementById("timeleft").innerHTML = timeleft;
setTimeout(countdown, 1000);
return;
}
top.location = "/";
}
function page_load() {
var DOC_Title= 'D-LINK SYSTEMS, INC. | WIRELESS ROUTER  : Failed';
document.title = DOC_Title;
get_by_id("Action").value = sw("txtContinue");

}
//]]>
</script>
<!-- InstanceEndEditable -->
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
<h1><SCRIPT >ddw("txtUploadConfigFailed");</SCRIPT></h1>
<p>
<SCRIPT >ddw("txtUploadConfigFailedStr1");</SCRIPT>
</p>
<p>
<SCRIPT >ddw("txtUploadConfigFailedStr2");</SCRIPT>
</p>
<p>
<SCRIPT >ddw("txtUploadConfigFailedStr3");</SCRIPT>
</p>
<input type="button" class="button_submit" id="Action" value="continue" onclick="location.href='http://<% getInfo("goformIpAddr"); %>/Tools/System.asp?t='+new Date().getTime()" />
</div>
</div>
</td>
<td id="sidehelp_container">&nbsp;</td>
</tr>
</table>
<table id="footer_container" border="0" cellspacing="0" summary="">
<tr>
<td>
<img src="../Images/img_wireless_bottom.gif" width="114" height="35" alt="" />
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
