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

function get_webserver_ssi_uri() {
	return ("" !== "") ? "/Basic/Setup.asp" : "/Status/Wireless.asp";
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

var local_debug =  false;
var dataIsReady = false;
var xsltIsReady = false;
var xmlData; // This will be an XMLDocument
function xsltReady(xmlDoc)
{
	xsltIsReady = true;
	refreshTable();
}
function dataReady(xmlDoc)
{
	xmlData = xmlDoc.getDocument();
	dataIsReady = true;
	refreshTable();
}
function refreshTable()
{
	if (!(dataIsReady && xsltIsReady)) {
		return;
	}
	var parent = document.getElementById("associated_wls_span");
/** Clear existing status section for associated clients*/
	parent.innerHTML="";
while (parent.firstChild != null) {
		parent.removeChild(parent.firstChild);
	}
var parent = document.getElementById("associated_wls_span");
xsltProcessor.transform(xmlData, window.document, parent);
window.setTimeout("xmlDataFetcher.retrieveData();", 10000);
}
function page_load() 
{
	var opmode = <% getIndex("opMode"); %> ;
	var wlanMode = "<%getIndex("wlanMode")%>";
	var rp_enable0 = "<% getIndex("repeaterEnabled","0"); %>";
	var rp_enable1 = "<% getIndex("repeaterEnabled","1"); %>";
	if (local_debug) {
		hide_all_ssi_tr();
	}

/*	if (lang == 1)
		xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients_pack.xml");	
	else
		xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients.xml");*/
    if(((opmode == "1")&&(wlanMode == "0")&&(rp_enable0 == "1" || rp_enable1 == "1")) || (opmode == 2) || (opmode == "1"))
	{
	    if(LangCode == "EN"){
		    xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients_repeater.xml");
	    }else if(LangCode == "SC"){
		    xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients_sc_repeater.xml");
	    }else if(LangCode == "TW"){
		    xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients_tw_repeater.xml");
		}else if(LangCode == "PT"){
		    xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients_pt_repeater.xml");
		}else if(LangCode == "ES"){
		    xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients_es_repeater.xml");
	    }else{
		    xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients_repeater.xml");
	    }
	}
	else 
    {
		if(LangCode == "EN"){
			xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients.xml");
		}else if(LangCode == "SC"){
			xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients_sc.xml");
		}else if(LangCode == "TW"){
			xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients_tw.xml");
		}else if(LangCode == "PT"){
			xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients_pt.xml");
		}else if(LangCode == "ES"){
			xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients_es.xml");
		}else{/*default setting is english*/
			xsltProcessor = new xsltProcessingObject(xsltReady, null, null, "/Status/wireless_clients.xml");
		}
	}
	xmlDataFetcher = new xmlDataObject(dataReady, null, null, "/Status/wifi_assoc.asp");
	xsltProcessor.retrieveData();
	xmlDataFetcher.retrieveData();
}	
//]]>
function buttoninit()
{
var DOC_Title= sw("txtTitle")+" : "+sw("txtStatus")+'/'+sw("txtWireless");
document.title = DOC_Title;
get_by_id("RestartNow").value = sw("txtRebootNow");
get_by_id("RestartLater").value = sw("txtRebootLater");
}	
</script>
</head>
<body onload="template_load();buttoninit();web_timeout();">
<div id="loader_container" onclick="return false;">&nbsp;</div>
<div id="outside" style="display:none"><table id="table_shell" cellspacing="0" summary=""><col span="1"/>
<tr>	<td><SCRIPT >
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
<SCRIPT >DrawRebootContent();</SCRIPT>
<div id="warnings_section" style="display:none">
<div class="section" ><div class="section_head">
<h2><SCRIPT >ddw("txtConfigurationWarnings");</SCRIPT></h2>
<div style="display:block" id="warnings_section_content">
</div></div></div></div> 
<div id="maincontent" style="display: block">
<div class="section" id="associated_wls">
<div class="section_head">
<h2><SCRIPT >ddw("txtWireless");</SCRIPT></title></h2>
<p><SCRIPT >ddw("txtViewWLANClients");</SCRIPT></p>
</div><div id="associated_wls_span"></div></div><!-- InstanceEndEditable --></div></td>
<td id="sidehelp_container">	<div id="help_text">
<strong><SCRIPT >ddw("txtHelpfulHints");</SCRIPT>...</strong>
<p><SCRIPT >ddw("txtListWLANClients");</SCRIPT></p>
<p class="more"><!-- Link to more help -->
<a href="../Help/Status.asp#Wireless" onclick="return jump_if();"><SCRIPT >ddw("txtMore");</SCRIPT>...</a>										</p>
</div></td></tr></table>
<SCRIPT >Write_footerContainer();</SCRIPT>
</td></tr></table>
<SCRIPT language=javascript>print_copyright();</SCRIPT>
</div><!-- outside -->
</body>
<!-- InstanceEnd -->
</html>
