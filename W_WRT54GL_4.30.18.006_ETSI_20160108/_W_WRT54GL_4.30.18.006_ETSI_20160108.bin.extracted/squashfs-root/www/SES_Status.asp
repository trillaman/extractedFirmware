<% web_include_file("copyright.asp"); %>
<html>
<head>
<% no_cache(); %>
<% charset(); %>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/layout.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/ses.js"></SCRIPT>
<SCRIPT language=JavaScript>
<% langpack(); %>

var ses = '<% get_ses_status(); %>';

function auto_return() 
{
	document.location.href =  "Wireless_Basic.asp?session_id=<% nvram_get("session_key"); %>";
	setTimeout('auto_return()', 10000);
}

function init()
{
	setTimeout('auto_return()', 10000);		
}

</SCRIPT>
</head>
<body bgcolor="black" onload=init()>
<form name=success>
<center><table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH=557 >
<tr BGCOLOR="white">
<th HEIGHT=400><font face="Verdana" size=4 color="black"></font>
<script>
ses += "!\n";
document.write("<p><font face=Verdana size=4 color=black><B>" + SW_SES_BTN.<% get_ses_status(); %> +"!\n</B>");
document.write("<p><font face=Verdana size=4 color=black>" + SW_SES_BTN.MSG1);
</script>
</th>
</tr>
</table></center>
</form>
</body>

