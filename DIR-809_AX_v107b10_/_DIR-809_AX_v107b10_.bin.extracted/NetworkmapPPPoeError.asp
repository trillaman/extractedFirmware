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

function page_prev() 
{
	self.location.href="Networkmap.asp?t="+new Date().getTime();
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
        document.write("                        <img src=\"/Images/img_masthead_red1.gif\" usemap=\"#masthead_image_map\" width=\"842px\" bordder=\"0\" height=\"92px\" />");
        document.write("                </td>");
        document.write("        </tr>");
        document.write("</table>");
}
function web_timeout()
{
setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);
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
get_by_id("prev").value = sw("txtPrevious");	
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
		<h2><SCRIPT>ddw("txtEasyPPPoeFailure");</SCRIPT></h2>
		<div class="gap"></div>
		<div class="gap"></div>
		<!--kity<div class="gap"></div>
		<div class="gap"></div>-->
		<div style="font-size:14px;font-weight: bold;text-align:left;width:680px;">
		<SCRIPT >ddw("txtEasyPPPoeErr");</SCRIPT>
		<div class="gap"></div><!--kity-->
		<!--kity<li><font color=#000000 size="3px"><B><SCRIPT >ddw("txtEasyPPPoeLock");</SCRIPT></B></font></li>-->
		<!--kity<li><font color=#000000 size="3px"><B><SCRIPT >ddw("txtEasyPPPoeForget");</SCRIPT></B></font></li>-->
		<p><font color=#000000 style="font-size:14px; font-weight: bold;"><B><SCRIPT >ddw("txtEasyPPPoeLock");</SCRIPT></B></font></p><!--kity-->
		<p><font color=#000000 style="font-size:14px; font-weight: bold;"><B><SCRIPT >ddw("txtEasyPPPoeForget");</SCRIPT></B></font></p><!--kity-->
		</div>
		<div class="gap"></div>
		<div class="gap"></div>
	</div><!-- networkmap -->
	<div class="gap"></div>
	<div class="gap"></div>
	<div class="centerline">
		<input type="button" id="prev" value="" onClick="page_prev()"; class="button_submit" style="background:url(../Images/button_n.jpg); border-style:none; width:187px; height:48px;"/>
	</div>	
</div><!-- simple2body -->
</div><!-- simple2container -->
</div><!-- maincontainer -->
<!-- <div class="copyright">Copyright &copy; 2009-2013 D-Link Systems, Inc.</div> -->
<font style="font-size:12px"><SCRIPT language=javascript>print_copyright();</SCRIPT></font>
</body>
</html>
