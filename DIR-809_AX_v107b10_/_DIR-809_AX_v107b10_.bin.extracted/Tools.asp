<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<META http-equiv=Pragma content=no-cache >
<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
<link rel="stylesheet" rev="stylesheet" href="../style.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
<!--
	var lang = "<% getLangInfo("lang");%>";
//-->
</script>	
<style type="text/css">
#sidehelp_container {
	display: none;
}
</style>
<script type="text/javascript" src="../ubicom.js"></script>
<script type="text/javascript" src="../xml_data.js"></script>
<script type="text/javascript" src="../navigation.js"></script>
<% getLangInfo("LangPath");%>
<% getLangInfo("LangPathHelp");%>
<script type="text/javascript" src="../utility.js"></script>
<script type="text/javascript">
//<![CDATA[
function web_timeout()
{
setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);
}
function template_load()
{
page_load();
RenderWarnings();
}

function page_load() {
var DOC_Title= sw("txtTitle")+" : "+sw("txtSetup")+'/'+sw("txtInternet");
document.title = DOC_Title;
}
//]]>
</script>
</head>
<body onload="template_load();web_timeout();">
<div id="loader_container" onclick="return false;">&nbsp;</div>
<div id="outside" style="display:none">
<table id="table_shell" cellspacing="0" summary=""><col span="1"/>
<tr>
<td>

<table id="content_container" border="0" cellspacing="0" summary=""><col span="3"/>
<tr>	

<td id="maincontent_container">

<div id="maincontent" style="display: block">
<SCRIPT language=javascript>ddw("txtToolsHp01");</SCRIPT>
</div>

</td>

<td id="sidehelp_container">
<div id="help_text">
</div></td></tr></table>
<table id="footer_container" border="0" cellspacing="0" summary="">
<tr>	<td>
<img src="../Images/img_wireless_bottom.gif" width="114" height="35" alt="" />
</td><td>&nbsp;</td></tr></table></td></tr></table>
<SCRIPT language=javascript>print_copyright();</SCRIPT>
</div><!-- outside -->
</body>
</html>
