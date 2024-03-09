<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<link rel="stylesheet" rev="stylesheet" href="style.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
</script>		
<style type="text/css">
/** Styles used only on this page.*/
	fieldset label.duple {
		width: 300px;
	}
</style>
<!-- InstanceEndEditable -->
<script type="text/javascript" src="ubicom.js"></script>
<script type="text/javascript" src="xml_data.js"></script>
<script type="text/javascript" src="navigation.js"></script>
<% getLangInfo("LangPath");%>
<script type="text/javascript" src="utility.js"></script>
<script type="text/javascript">
//<![CDATA[

var no_reboot_alt_location = "";

var ItvID=0;
function template_load()
{
<% getFeatureMark("MultiLangSupport_Head_script");%>
lang_form = document.forms.lang_form;
if ("" === "") {
i18n_xslt_processor = new xsltProcessingObject(i18n_xslt_is_ready, null, null, "/i18n_language_codes.xsl");
i18n_xml_data_fetcher = new xmlDataObject(i18n_data_is_ready, null, null, "/languages.xml");
i18n_xslt_processor.retrieveData();
i18n_xml_data_fetcher.retrieveData();
}
<% getFeatureMark("MultiLangSupport_Tail_script");%>
//document.forms.lang_form.style.display = "none"; //we do not display multilangsupport selst on this page
var global_fw_minor_version = "<%getInfo("fwVersion")%>";
var fw_extend_ver = "";			
var fw_minor;
assign_firmware_version(global_fw_minor_version,fw_extend_ver,fw_minor);
var hw_version="<%getInfo("hwVersion")%>";
document.getElementById("hw_version_head").innerHTML = hw_version;
document.getElementById("product_model_head").innerHTML = modelname;
page_load();
RenderWarnings();				
<%getLogout()%>
}
		
		
				

	//]]>
	</script>

	<!-- InstanceBeginEditable name="Scripts" -->
	<script type="text/javascript" src="/md5.js"></script>
	<script type="text/javascript">
	//<![CDATA[
	function page_load()
	{
		var loginFlag= "<%getInfo("loginFailMsg")%>";
		
		/* Detect browsers that cannot handle XML methods. */
		if (!document.getElementsByTagName || !((document.implementation && document.implementation.createDocument) || window.ActiveXObject)) {
			alert (sw("txtIndexStr1"));
			return;
		}
		//mf = document.forms["mainform"];
		//mf.submit();

	}

function init()
{
var DOC_Title= sw("txtTitle")+" : "+sw("txtLogout");
document.title = DOC_Title;	
get_by_id("Login").value = sw("txtRtnLoginPage");		
}

function jumpToLoginPage()
{
	var mf = document.forms["mainform"];
	mf.submit();
	//top.location = "./index.asp?t="+new Date().getTime();
}
	//]]>
	</script>
	<!-- InstanceEndEditable -->
</head>
<body onmousemove="if(ItvID!=0) clearInterval(ItvID);ItvID=setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);" onload="init();template_load();">
<form name="mainform" action="/formLogout.htm" method="post" id="mainform">
	<input type="hidden" id="logout" name="logout" value="1"/>
</form>
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

									<!-- InstanceBeginEditable name="Main_Content" -->
			<div class="section">
				<div class="section_head"> 
					<h5><SCRIPT >ddw("txtLogout");</SCRIPT></h5>
					<br><br>
					<p align="center"><SCRIPT >ddw("txtHaveLogout");</SCRIPT></p>
					<br>
					<p align="center"> <input class="button_submit_padleft" type="button" id="Login" name="Login" value="" onclick="return jumpToLoginPage();"></p>
					<br>
				</div>
			</div> <!-- section -->
									<!-- InstanceEndEditable -->

								</div>
								
								<!-- language selection functions -->
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
<!-- InstanceEnd --></html>
