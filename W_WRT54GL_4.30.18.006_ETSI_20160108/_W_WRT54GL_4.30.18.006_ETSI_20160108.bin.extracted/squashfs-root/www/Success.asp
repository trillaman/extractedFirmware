<% web_include_file("copyright.asp"); %>
<html>
<head>
<% no_cache(); %>
<% charset(); %>
<SCRIPT language="javascript" type="text/javascript" src="lang_pack/layout.js"></SCRIPT>

<SCRIPT language=JavaScript>
<% langpack(); %>
var submit_button = '<% get_web_page_name(); %>';
var wait_time = '<% webs_get("wait_time"); %>';
var session_key = "<% nvram_get("session_key"); %>";
var close_session = "<% get_session_status(); %>";
function to_submit()
{
	var t2 = new Date().getTime();

	if(submit_button == "")
		history.go(-1);
	else if(submit_button == "WL_WEPTable.asp")
		self.close();
	else {
		if(wait_time != "0" && wait_time != "") {
			//delay(wait_time*1000 - (t2-t1));
			DelayTime = wait_time * 1000 - (t2-t1);
			choose_disable(document.success.action);
			if(DelayTime < 0)
				DelayTime = 0;
			setTimeout('returnpage()',DelayTime);
		}
		else{
			//document.location.href =  "<% get_http_prefix(""); %>"+submit_button;
			var found=false;
			var ii;
			var host=top.window.location.host;
			var re = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/;
			var return_url = submit_button;

			if (re.test(host))	// check if IPv4 address
			{
				if ( close_session == "1" )
				{
					document.location.href = "<% get_http_prefix(""); %>"+return_url;
				}
				else
				{
					document.location.href = "<% get_http_prefix(""); %>"+return_url + "?session_id=" + session_key;
				}

			}
			else
			{
				for(ii=0; ii<submit_button.length; ii++){
					if(submit_button.substr(ii,1)=="/"){
						return_url = submit_button.substr(ii+1);
						break;
					}
				}

				if ( close_session == "1" )
				{
					document.location.href = return_url;
				}
				else
				{
					document.location.href = return_url + "?session_id=" + session_key;
				}
			}
		}
	}
}

function auto_return()
{
	var t2 = new Date().getTime();
	//delay(wait_time*1000 - (t2-t1));
	DelayTime = wait_time * 1000 - (t2-t1);
	//choose_disable(document.success.action);
	if(DelayTime < 0)
		DelayTime = 0;
	setTimeout('returnpage()',DelayTime);
}

function returnpage()
{
	//document.location.href =  "<% get_http_prefix(""); %>"+submit_button;
	var found=false;
	var ii;
	var host=top.window.location.host;
	var re = /^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/;
	var return_url = submit_button;
	
	if (re.test(host))	// check if IPv4 address
	{
		if ( close_session == "1" )
		{
			document.location.href = "<% get_http_prefix(""); %>"+return_url;
		}
		else
		{
			document.location.href = "<% get_http_prefix(""); %>"+return_url + "?session_id=" + session_key;
		}

	}
	else
	{
		for(ii=0; ii<submit_button.length; ii++){
			if(submit_button.substr(ii,1)=="/"){
				return_url = submit_button.substr(ii+1);
				break;
			}
		}

		if ( close_session == "1" )
		{
			document.location.href = return_url;
		}
		else
		{
			document.location.href = return_url + "?session_id=" + session_key;
		}

	}

}
function init()
{
	if(wait_time != "0" && wait_time != "") {
		DelayTime = wait_time * 1000 ;
		setTimeout('returnpage()', DelayTime);		
	}
}
</SCRIPT>
</head>
<body bgcolor="black" onload=init()>
<form name=success>
<center><table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=557 >
<tr BGCOLOR="white">
<th HEIGHT=400><font face="Verdana" size=4 color="black"><script>Capture(other.setsuc)</script></font>
<script>
var wait_time = '<% webs_get("wait_time"); %>';
	if(wait_time != "0" && wait_time != "") {
		document.write("<p><font face=Verdana size=2 color=black>" + succ.autoreturn);
	}
	else {
//		document.write("<p><p><input type=button name=gui_action value=Continue OnClick=to_submit()>");
document.write("<p><p><input type=button name=gui_action" + " value=" + sbutton.continue1 + " onClick=to_submit()>");
	}
</script>
</th>
</tr>
</table></center>
</form>
</body>

