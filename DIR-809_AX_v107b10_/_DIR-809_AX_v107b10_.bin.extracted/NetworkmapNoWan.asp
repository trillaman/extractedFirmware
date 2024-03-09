<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<link rel="stylesheet" rev="stylesheet" href="../style.css" type="text/css" />
<link rel="stylesheet" rev="stylesheet" href="../networkmap.css" type="text/css" />
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

function page_again() 
{
	self.location.href="Networkmap.asp?t="+new Date().getTime();
}
function template_load()
{
var global_fw_minor_version = "<%getInfo("fwVersion")%>";
var hw_version="<%getInfo("hwVersion")%>";
var productModel="<%getInfo("productModel")%>";
document.getElementById("product_model_head").innerHTML = productModel;
document.getElementById("fw_minor_head").innerHTML = global_fw_minor_version;
document.getElementById("hw_version_head").innerHTML = hw_version;
RenderWarnings();	
get_by_id("again").value = sw("txtEasyNoAgain");	
}
function DrawMastheadContainer1()
{
        document.write("<table id=\"masthead_container1\" cellspacing=\"0\" cellpadding=\"0\" summary=\"\" style=\"width:820px; height:92px;  \">");
        document.write("<map id=\"masthead_image_map\" name=\"masthead_image_map\">");
        document.write("<area shape=\"rect\" coords=\"10,10,180,70\" target=\"_blank\" href=\"http://www.dlink.com.tw\">");
        document.write("</area>");
        document.write("</map>");
        document.write("        <tr padding=\"0\">");
        document.write("                <td padding=\"0\">");
        document.write("                        <img src=\"/Images/img_masthead_red1.gif\" usemap=\"#masthead_image_map\" width=\"842px\" height=\"92px\"  bordder=\"0\"/>");
        document.write("                </td>");
        document.write("        </tr>");
        document.write("</table>");
}
//]]>
</script>
</head>
<body class="mainbg" onload="template_load();">
<div id="loader_container" onclick="return false;" style="display: none">&nbsp;</div>
<!--<div class="maincontainer">
	<div class="bannercontainer2">
		<img src="../Images/logo.jpg" width="159" height="92">
		<span class="product" style="left:800px"><SCRIPT language=javascript type=text/javascript>ddw("txtProductPage");</SCRIPT> :<span id="product_model_head"></span></span>
		<span class="version" style="left:800px"><SCRIPT language=javascript type=text/javascript>ddw("txtFirmwareVersion");</SCRIPT> : <span id="fw_minor_head"></span><br><SCRIPT language=javascript type=text/javascript>ddw("txtHardwareVersion");</SCRIPT> : <span id="hw_version_head"></span></span>	</div>-->
		<div class="maincontainer">
		
<SCRIPT >
DrawHeaderContainer();
DrawMastheadContainer1();
</SCRIPT>
		
<div class="simple2container">
<div class="simple2body">
	<!--kity<img src="../Images/title.jpg"/>-->
	<div class="networkmap" align="center">
	<h2><SCRIPT>ddw("txtWizardEasyStepWanIsCutDown");</SCRIPT></h2>
		<div class="gap"></div>
		<div class="gap"></div>

		<!--kity<p style="font-size:12px;font-weight: bold;text-align:left;width:700px;"><SCRIPT >ddw("txtEasyNoWan");</SCRIPT></p>-->
		
		<p style="font-size:14px;font-weight: bold;text-align:left;width:680px;"><SCRIPT >ddw("txtEasyNoWan1");</SCRIPT></p><!--kity-->
		<p style="font-size:14px;font-weight: bold;text-align:left;width:680px;"><SCRIPT >ddw("txtEasyNoWan2");</SCRIPT></p><!--kity-->
		
		<div class="gap"></div>
		<div class="gap"></div>
	</div><!-- networkmap -->
	<div class="gap"></div>
	<div class="gap"></div>
	<div class="centerline">
		<input type="button" id="again" value="" onClick="page_again()"; class="button_submit" style="background:url(../Images/button_n.jpg); border-style:none; width:187px; height:48px;"/>
	</div>	
</div><!-- simple2body -->
</div><!-- simple2container -->
</div><!-- maincontainer -->
<!-- <div class="copyright">Copyright &copy; 2009-2013 D-Link Systems, Inc.</div> -->
<font style="font-size:12px"><SCRIPT language=javascript>print_copyright();</SCRIPT></font>
</body>
</html>
