<% web_include_file("copyright.asp"); %>
<html>
<head>
<% no_cache(); %>
<% charset(); %>
<SCRIPT language="javascript" type="text/javascript" src="lang_pack/layout.js"></SCRIPT>

<SCRIPT language=JavaScript>
<% langpack(); %>
var submit_button = '<% get_web_page_name(); %>';
var session_key = "<% nvram_get("session_key"); %>";
var close_session = "<% get_session_status(); %>";

function to_submit()
{
	if(submit_button == "")
		history.go(-1);
	else if(submit_button == 'WL_WEPTable.asp')
		self.close();
	else if(submit_button == 'Register_ok.asp'){
		if ( close_session == "1" )
			document.location.href =  submit_button;
		else
			document.location.href =  submit_button + "?session_id=" + session_key;
	}
	else {
		//document.location.href =  submit_button;
		if ( close_session == "1" )
		{
			document.location.href =  submit_button;
		}
		else
		{
			document.location.href =  submit_button + "?session_id=" + session_key;
		}
	}
}
</SCRIPT>
</head>
<body bgcolor="white">
<form>
<br><br><br><br>
<center>
<tr BGCOLOR="white">
<th><font face="Verdana" size=4  color="black"><script>Capture(other.setsuc)</script></font>
<p><p>

<script>document.write("<input type=button name=gui_action" + " value=" + sbutton.continue1 + " onClick=to_submit()>");</script>

</th>
</tr></center>
</form>
</body>


