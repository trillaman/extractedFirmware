<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<link rel="stylesheet" rev="stylesheet" href="style.css" type="text/css" />		
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

var enable_graphics_auth=<% getInfo("enableGraphicsAuth");%>;
function get_obj(name)
{
        if (document.getElementById)    return document.getElementById(name);//.style;
        if (document.all)                               return document.all[name].style;
        if (document.layers)                    return document.layers[name];
}
var no_reboot_alt_location = "";

function noenter() {
  return !(window.event && window.event.keyCode == 13);
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
watcher_warnings_check("<?xml version='1.0'?><xml><\/xml>");
document.getElementById("loader_container").style.display = "none";			
}
function entsub(e) {
    var charCode=(navigator.appName=="Netscape")?e.which:e.keyCode;
    if (charCode == 13)
    {
        check();
        //removed for new auth by saxon 150516

   	/*
        //var pwd=get_by_id("login_pass").value;
        //get_by_id("login_pass").value=encode_base64(pwd);
        //get_by_id("curTime").value = new Date().getTime();
        //document.forms.myform.submit();
   	*/    	
    }
    else
        return true;
}	
		
function keypress_ver_code(e)
{
	
	
	if(e.keyCode==13)
	{
		check();
	}
}		
var AjaxReq = null;

function createRequest()
{
	var request = null;
	try { request = new XMLHttpRequest(); }
	catch (trymicrosoft)
	{
			try { request = new ActiveXObject("Msxml2.XMLHTTP"); }
			catch (othermicrosoft)
			{
					try { request = new ActiveXObject("Microsoft.XMLHTTP"); }
					catch (failed) { request = null; }
			}
	} 
	if (request == null) alert("Error creating request object !");
	return request;
}

function send_request(url, update_func)
{
    if (AjaxReq == null) AjaxReq = createRequest();
    AjaxReq.open("GET", url, true);
    AjaxReq.onreadystatechange = update_func;
    AjaxReq.send(null);
}

function set_wanTypeRadioButton()
{

}

	function changText(str)
	{
		// alert(str);
		var ar = str.split('');
		for(var i = 0; i < ar.length; i ++)
		{
			if(ar[i].charCodeAt(0) >= 65 && ar[i].charCodeAt(0) <= 90)
			{
			     ar[i] = ar[i].toLowerCase();
			}
			else
			{
			    ar[i] = ar[i].toUpperCase();
			}
		}
		str = "";
		for(var i = 0; i < ar.length; i ++)
		{
		     str += ar[i];
		}
		// alert(str);
		return str;
	}
	
function send_request_login(xdoc)
{
	var PublicKey;
	var Challenge;
	var Cookie;
	var PrivateKey;
	if(sessionStorage.getItem("PrivateKey")!="")
		sessionStorage.removeItem("PrivateKey");
    PublicKey = xdoc.Get("/LoginResponse/PublicKey");
    Challenge = xdoc.Get("/LoginResponse/Challenge");
    Cookie = xdoc.Get("/LoginResponse/Cookie");
	if (navigator.cookieEnabled) document.cookie = "uid="+Cookie+"; path=/";
	var Login_Password=get_by_id("login_pass").value;

	PublicKey=trim_string(PublicKey);
	Challenge=trim_string(Challenge);
	
//	PublicKey="s7jKiV9CG6oYxYk9Lsgd";
//	Challenge="ZLLRj70c5D5z24LgjoF1";

	PrivateKey = hex_hmac_md5(PublicKey + Login_Password, Challenge);
	PrivateKey = PrivateKey.toUpperCase();
// Storage data in DOM
	sessionStorage.setItem("Cookie", Cookie);
	sessionStorage.setItem("PrivateKey", PrivateKey);

	var Login_Passwd = hex_hmac_md5(PrivateKey, Challenge);
	Login_Passwd = Login_Passwd.toUpperCase();
		
	var pwd=get_by_id("login_pass").value;
	mf =document.forms.myform;
	
	if(mf.login_n.value=="")
	{
		alert(sw("txtUserNameBlank"));
	
		mf.login_n.select();
		mf.login_n.focus();
		return false;
	}
	get_by_id("login_pass").value=encode_base64(pwd);
	get_by_id("curTime").value = new Date().getTime();
	get_by_id("curUid").value = Cookie;
	mf.loginpwd.value = Login_Passwd;
	get_by_id("user_name").value=get_by_id("login_n").value;
	if(enable_graphics_auth == true)
	{
		if(mf.VER_CODE.value=="")
		{
			alert(sw("txtAuthcodeNull"));
			mf.VER_CODE.focus();
			return false;
		}
		else{
				mf.VERIFICATION_CODE.value = mf.VER_CODE.value.toUpperCase();
				mf.VER_CODE.disabled = true;
		}
	}

    get_by_id("login_pass").value = pwd;
	document.forms.myform.submit();
	return true;
}

function check()
{
		var ajaxObj = GetAjaxObj("request_key");
		ajaxObj.createRequest();
		ajaxObj.onCallback = function(text)
		{
			ajaxObj.release();
			send_request_login(text);
		}
		//ajaxObj.returnXml=false;
		ajaxObj.setHeader("Content-Type", "application/x-www-form-urlencoded");
		ajaxObj.sendRequest("formRequestKey.htm" , "act=getaplist");
		
}

var delaytime=2*1000;

function generate_img_ready()
{
	if (AjaxReq != null && AjaxReq.readyState == 4)
    {
		if(AjaxReq.responseText!="")
		{
			var idx = AjaxReq.responseText;
			var f=document.getElementById("auth_img");

			setTimeout("set_wanTypeRadioButton();",delaytime);					

			f.innerHTML="<img src='auth_img/"+idx+"?random_str="+generate_random_str()+"'>";
			document.getElementById("FILECODE").value=idx;
		}
	}
}
		
function generate_img()
{
	var f=document.getElementById("auth_img");
	f.innerHTML="<font color=red>(" + sw("txtWaitAuthPic") + ")</font>";
	//f.innerHTML="<font color=red>sw("txtWaitAuthPic");</font>";
	send_request("__login.asp?random_str="+generate_random_str(),generate_img_ready);
}



</script>

<!-- InstanceBeginEditable name="Scripts" -->
<script type="text/javascript" src="/md5.js"></script>
<script type="text/javascript">
//<![CDATA[

function get_page_pass()
{
	var url=location.search;
//	var theRequest=new Obiect();
	if(url.indexOf("?")!=-1){
		var strs=url.substr(1);
		strs=strs.split("&");
		for(var i=0;i<strs.length;i++){
//			alert(unescape(strs[i].split("=")[1]));
			if(unescape(strs[i].split("=")[0])=="password"){
				get_by_id("login_pass").value=unescape(strs[i].split("=")[1]);
			}
		}	
	}
}
function page_load()
{
	var loginFlag= "<%getInfo("loginFailMsg")%>";
	var mf
	/* Detect browsers that cannot handle XML methods. */
	if (!document.getElementsByTagName || !((document.implementation && document.implementation.createDocument) || window.ActiveXObject)) {
		alert (sw("txtIndexStr1"));
		return;
	}

	get_by_id("login_pass").focus();

	if(loginFlag == 1)
	{
		self.location.href="/login_fail.asp";
		//alert(sw("txtInvalidPwd"));
		//window.location.reload();
		//return;
	}
	<% getInfo("mobile_jscomment_start");%>
	get_page_pass();
	<% getInfo("mobile_jscomment_end");%>
}

function init()
{
	var DOC_Title= sw("txtTitle")+" : "+sw("txtLogin");
	document.title = DOC_Title;	
	get_by_id("login_n").value = "<%getInfo("superName");%>";
	get_by_id("login_n").disabled = true;
	get_by_id("Login").value = sw("txtLogin");
	get_by_id("regen").value = sw("txtAuthButton");
	get_obj('div_vercode_submit').style.display='';
	if(enable_graphics_auth == true )
	{
		get_obj('div_vercode_dsc').style.display='';
		get_obj('div_vercode_body').style.display='';
		get_obj('div_vercode_submit').style.display='';
		
		generate_img();
	}
	
}
//]]>
</script>
<!-- InstanceEndEditable -->
</head>

<body onload="init();template_load();">
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
						<h5><SCRIPT >ddw("txtLogin");</SCRIPT></h5>
					<p>
						<SCRIPT >ddw("txtLogInToTheRouter");</SCRIPT>
					:</p>
						<form id="myform" name="myform" action="/formLogin.htm" method="post" onsubmit="check();">
							<input type="hidden" id="curTime" name="curTime" value=""/>
							<input type="hidden" id="curUid" name="curUid" value=""/>
							<input type=hidden name="FILECODE" id="FILECODE" value="">
							<input type=hidden name="VERIFICATION_CODE" id="VERIFICATION_CODE" value="">
							<input type="hidden" id="user_name" name="user_name" value=""/>
						<table width="643">
						<tr valign=middle align=center>	
					<td>	
							<br>
	<!-- ________________________________ Main Content Start ______________________________ -->
							<table width=100%>
							<tr>
								<td width="50%" align="right"><SCRIPT >ddw("txtUserName");</SCRIPT></td>
								<td align="left">&nbsp;:&nbsp;<input type=text id="login_n" name="login_n" size="20" maxlength=15 onkeypress="return entsub(event)" value=""></td>
							</tr>
							<tr>
								<td align="right" ><SCRIPT>ddw("txtPassword");</SCRIPT></td>
								<td align="left">&nbsp;:&nbsp;<input type=password id="login_pass" size="20" maxlength="15" autocomplete="off" onkeypress="return entsub(event)"/>
                                <input type="hidden" size="20"  name="loginpwd" autocomplete="off" onkeypress="return entsub(event)"/>
                                </td>
							</tr>
							<tr id="div_vercode_dsc" style="display:none">
								<td align="right"><SCRIPT>ddw("txtAuthInfo");</SCRIPT></td>
								<td align="left">&nbsp;:&nbsp;<input type=text name="VER_CODE" id="VER_CODE" size="20" maxlength="5" onkeypress="keypress_ver_code(event)"></td>
							</tr>
							<tr id="div_vercode_body" style="display:none">									
								<td align="right"><span id="auth_img"></span>
								<td align="left">&nbsp;&nbsp;<input type=button name="regen" id="regen" onclick="generate_img();" value="Regenerate" valign="middle"></td>
							</tr>
							<tr><td>&nbsp;</td></tr>		
							<tr id="div_vercode_submit" style="display:none">
								<td></td>
								<td align="left"> <input class="button_submit_padleft" type="button" id="Login" name="login" value="" onclick="return check()" /></td>
							</tr>
						</table>
	<!-- ________________________________  Main Content End _______________________________ -->
						<br>							
						</td>		
					</tr>				
					</table>
					</form>
				</div>
			</div> <!-- section -->
								<!-- InstanceEndEditable -->
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
<!-- InstanceEnd --></html>
