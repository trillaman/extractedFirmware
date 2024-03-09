<% web_include_file("copyright.asp"); %>
<html>
<head>
<% no_cache(); %>
<% charset(); %>

<SCRIPT language=JavaScript>
<% tmp_langpack(); %>
var bNotUpgrade = '<% is_it_restore(); %>';
var session_key = "<% nvram_get("session_key"); %>";
var close_session = "<% get_session_status(); %>";

function Capture(obj)
{
	document.write(obj);	
}	
function to_submit()
{
		history.go(-1);
}
</SCRIPT>
</head>
<body bgcolor="black">
<form>
<center><table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=557 >
<tr BGCOLOR="white">
<th HEIGHT=400><font face="Verdana" size=4 color="red">
<script>
if(bNotUpgrade == '1')
	Capture(errmsg.err85)
else
	Capture(errmsg.err13)
</script></font>
<p><p>

<script>document.write("<input type=button name=gui_action OnClick=to_submit() value=\"" + sbutton.continue1 + "\">");</script>

</th>
</tr>
</table></center>
</form>
</body>
</html>

