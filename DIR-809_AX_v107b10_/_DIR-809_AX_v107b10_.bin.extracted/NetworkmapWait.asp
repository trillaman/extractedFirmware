<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<meta http-equiv="pragma" content="no-cache" />
<link rel="stylesheet" rev="stylesheet" href="../style.css" type="text/css" />
<link rel="stylesheet" rev="stylesheet" href="../networkmap.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
<!--
var lang = "<% getLangInfo("lang");%>";
//-->
</script>
<style type="text/css">
#add_sta_progress_bar
{
	overflow: hidden;
	width:400px;
	height:14px;
	margin: 0 auto;
	border: 2px solid black;
}
</style>	
<script type="text/javascript" src="../ubicom.js"></script>
<script type="text/javascript" src="../xml_data.js"></script>
<script type="text/javascript" src="../navigation.js"></script>
<% getLangInfo("LangPath");%>
<script type="text/javascript" src="../utility.js"></script>
<script type="text/javascript">
//<![CDATA[

var wan_type = "<%getInfo("wanType");%>";
var get_update_page_returned = 0;
var times = 0;
var status = '3';

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
var fw_extend_ver = "";			
var fw_minor;
assign_firmware_version(global_fw_minor_version,fw_extend_ver,fw_minor);
var hw_version="<%getInfo("hwVersion")%>";
document.getElementById("hw_version_head").innerHTML = hw_version;
document.getElementById("product_model_head").innerHTML = modelname;
page_load();
RenderWarnings();
}
var timeleft = "50";
var marqueetime = "0";
var str1 = self.location.href.split('?');
var str2 = str1[1].substring(5,6);
str2 = str2 *1 ; 
var xkjs = "0";

if(timeleft > "50")
{
	xkjs = "1";
}

function countdown()
{
	displayoffline();
	if (status =='1') 
	{
		if(str2 == '1')
		{
			self.location.href = '../logout.asp?t='+new Date().getTime();
			return;
		}
		self.location.href="NetworkmapInternet.asp?t="+new Date().getTime();
		return;
	}	
	if (timeleft == 0) {
		if (wan_type=='2')
		{
		alert(sw("txtInvalidUsername"));
			if(str2 == '1')
			{
				self.location.href = '../logout.asp?t='+new Date().getTime();
				return;
			}
			self.location.href="NetworkmapPPPoeError.asp?t="+new Date().getTime();
			return;
		}else{
				self.location.href = '../logout.asp?t='+new Date().getTime();
				return;
		}
	}
	timeleft--;
	if(xkjs == "1")
	{
		if(timeleft < 40 && times < 2)
		{
			ping_test();
			times++;
		}
		if(timeleft < 30 && times < 4)
		{
			ping_test();
			times++;
		}
		if(timeleft < 20 && times < 6)
		{
			ping_test();
			times++;
		}
	}
	else
	{
		if(timeleft < 20 && times < 3)
		{
			ping_test();
			times++;
		}
	}
	if(timeleft < 10 && get_update_page_returned == 0)
	{
		decetive_wan_link();
	}
	setTimeout(countdown, 1000);
}

function displayoffline()
{
	refresh_progress_bar(marqueetime);
	marqueetime++;
}
function ping_test()
{
        send_wan_link_request("/Basic/ajax_ping_test.asp?r="+generate_random_str());
}
function decetive_wan_link()
{
        send_wan_link_request("/Basic/ajax_wan_link.asp?r="+generate_random_str());		
}


function send_wan_link_request(url)
{
	if(get_update_page_returned > 0) return 0; 
	if (__AjaxReq == null) __AjaxReq = __createRequest();
	__AjaxReq.open("GET", url, true);
	__AjaxReq.onreadystatechange = get_update_page_ok;
	__AjaxReq.send(null);
	get_update_page_returned++;
	return 1;
}
function get_update_page_ok()
{
		var conn_msg="";  	
				
		if (__AjaxReq != null && __AjaxReq.readyState == 4)
		{	  
		
				//alert(__AjaxReq.status);
		
			if (__AjaxReq.status == 200)
			{
				get_update_page_returned--;
				//alert(__AjaxReq.responseText.length);
				if (__AjaxReq.responseText.length <= 1) /* No data */
				{					
						return;		
				}
			
				
				status=__AjaxReq.responseText.substring(0,1);
			    //alert(__AjaxReq.responseText);		    

			}else
			{
				return;
			}
					
	   } 	
}



function refresh_progress_bar(index)
{
	var bar_color = "#FF6F00";
	var clear = "&nbsp;&nbsp;"

	for (i = 0; i <= index; i++)
	{
		var block = document.getElementById("block" + i);
		block.innerHTML = clear;
		block.style.backgroundColor = bar_color;
	}
}

function page_load() 
{
	countdown();
}
//]]>
</script>
</head>
<body class="mainbg" onload="template_load();web_timeout();">
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
	<div class="networkmap">
		<h2><SCRIPT>ddw("txtEasyConnecting");</SCRIPT></h2>
		<div class="gap"></div>
		<div class="gap"></div>
		<div class="gap"></div>
		<div class="gap"></div>
		<p style="font-size:14px;font-weight: bold;text-align:center;width:710px;"><SCRIPT >ddw("txtEasyWaiting");</SCRIPT></p>
		<div id="add_sta_progress_bar" style="display:block">
		<span id="block0">&nbsp;</span><span id="block1">&nbsp;</span><span id="block2">&nbsp;</span><span id="block3">&nbsp;</span><span id="block4">&nbsp;</span><span id="block5">&nbsp;</span><span id="block6">&nbsp;</span><span id="block7">&nbsp;</span><span id="block8">&nbsp;</span><span id="block9">&nbsp;</span><span id="block10">&nbsp;</span><span id="block11">&nbsp;</span><span id="block12">&nbsp;</span><span id="block13">&nbsp;</span><span id="block14">&nbsp;</span><span id="block15">&nbsp;</span><span id="block16">&nbsp;</span><span id="block17">&nbsp;</span><span id="block18">&nbsp;</span><span id="block19">&nbsp;</span><span id="block20">&nbsp;</span><span id="block21">&nbsp;</span><span id="block22">&nbsp;</span><span id="block23">&nbsp;</span><span id="block24">&nbsp;</span><span id="block25">&nbsp;</span><span id="block26">&nbsp;</span><span id="block27">&nbsp;</span><span id="block28">&nbsp;</span><span id="block29">&nbsp;</span><span id="block30">&nbsp;</span><span id="block31">&nbsp;</span><span id="block32">&nbsp;</span><span id="block33">&nbsp;</span><span id="block34">&nbsp;</span><span id="block35">&nbsp;</span><span id="block36">&nbsp;</span><span id="block37">&nbsp;</span><span id="block38">&nbsp;</span><span id="block39">&nbsp;</span><span id="block40">&nbsp;</span><span id="block41">&nbsp;</span><span id="block42">&nbsp;</span><span id="block43">&nbsp;</span><span id="block44">&nbsp;</span><span id="block45">&nbsp;</span><span id="block46">&nbsp;</span><span id="block47">&nbsp;</span><span id="block48">&nbsp;</span><span id="block49">&nbsp;</span><span id="block50">&nbsp;</span>
		</div>
		<div class="gap"></div>
		<div class="gap"></div>
		<div class="gap"></div>
		<div class="gap"></div>
		<div class="gap"></div>
	</div><!-- networkmap -->
</div><!-- simple2body -->
</div><!-- simple2container -->
</div><!-- maincontainer -->
<!-- <div class="copyright">Copyright &copy; 2009-2013 D-Link Systems, Inc.</div> -->
<font style="font-size:12px"><SCRIPT language=javascript>print_copyright();</SCRIPT></font>
</body>
</html>
