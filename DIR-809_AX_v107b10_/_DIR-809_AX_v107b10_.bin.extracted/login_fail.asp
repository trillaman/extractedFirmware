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

function web_timeout()
{
setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);
}

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
page_load();
/** Render any warnings to the user*/
watcher_warnings_check("<?xml version='1.0'?><xml><\/xml>");
document.getElementById("loader_container").style.display = "none";				
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
var DOC_Title= sw("txtTitle")+" : "+sw("txtLoginFail");
document.title = DOC_Title;	
get_by_id("Login").value = sw("txtLoginAgain");		
auth_error_report();
}

function jumpToLoginPage()
{
	top.location = "./index.asp?t="+new Date().getTime();
}
function auth_error_report()
{
	var enable_graphics_auth=<% getInfo("enableGraphicsAuth");%>;
	
	if(enable_graphics_auth == true)
	{
		get_by_id("LoginFailReport").innerHTML = sw("txtLoginFailStr1");
	}else{
		get_by_id("LoginFailReport").innerHTML = sw("txtLoginFailStr");
	}
}
	//]]>
	</script>
	<!-- InstanceEndEditable -->
</head>
<body onload="init();template_load();web_timeout();">
<form name="mainform" action="" method="post" id="mainform">
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
					<h5><SCRIPT >ddw("txtLoginFail");</SCRIPT></h5>
					<br><br>
					<p align="center" id="LoginFailReport"><SCRIPT >ddw("txtLoginFailStr");</SCRIPT></p>
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
