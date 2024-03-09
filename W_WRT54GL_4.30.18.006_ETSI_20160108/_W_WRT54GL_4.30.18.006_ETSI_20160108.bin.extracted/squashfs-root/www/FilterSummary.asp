<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Filter Summary Table</TITLE>
<% no_cache(); %>
<% charset(); %>
<script src="common.js"></script>
<SCRIPT language="Javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capsec.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/share.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/help.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capapp.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capasg.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capwrt54g.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/layout.js"></SCRIPT>

<SCRIPT language=JavaScript>
document.title = summary.policy;
/*Add for session key*/
var session_key = "<% nvram_get("session_key"); %>";
var close_session = "<% get_session_status(); %>";
/*End for session key*/
function filter_del(F)
{
       F.submit_button.value="FilterSummary";
       F.change_action.value="gozila_cgi";
       F.submit_type.value="delete";
       F.submit();
}
function Refresh()
{
	top.opener.window.location.href='Filters.asp?session_id=<% nvram_get("session_key"); %>';
}
function init()
{
	if ( close_session == "1" )
	{
		document.forms[0].action = "apply.cgi";
	}
	else
	{
		document.forms[0].action = "apply.cgi?session_id=<% nvram_get("session_key"); %>";
	}
	window.focus();
	<% onload("FilterSummary", "Refresh();"); %>
}
</SCRIPT>
</HEAD>
<BODY bgColor=white onload=init()>
<form method=<% get_http_method(); %> action=apply.cgi?session_id=<% nvram_get("session_key"); %>>
<input type=hidden name=submit_button>
<input type=hidden name=submit_type>
<input type=hidden name=change_action>
<center><table border=0 cellspacing=1>
  <tr align=middle bgcolor=b3b3b3>
    <th width="550" colspan="4" bgcolor="#FFFFFF" height="30">
    <p align="left"><font face="Arial" color="#0000FF"><SPAN STYLE="FONT-SIZE:14pt"><script>Capture(summary.policy)</script></SPAN></font></th>
    <th width="70" bgcolor="#FFFFFF" height="30">&nbsp;</th></tr><tr align=middle bgcolor=b3b3b3>
    <th width="50"><font face=Arial><SPAN STYLE="FONT-SIZE: 10pt"><script>Capture(summary.num)</script></SPAN></th><th width="200"><font face=Arial>
    <SPAN STYLE="FONT-SIZE: 10pt"><script>Capture(summary.policyname)</script></FONT></th><th width="150"><font face="Arial"><SPAN STYLE="FONT-SIZE: 10pt"><script>Capture(summary.days)</script></FONT></font></th>
    <th width="150"><font face="Arial"><SPAN STYLE="FONT-SIZE: 10pt"><script>Capture(summary.tmofday)</script></FONT></font></th>
    <th width="70"><font face=Arial size=2>

<script>document.write("<input type=button name=delete_button onClick=filter_del(this.form) value=\"" + sbutton.del + "\">");</script>

    </th></tr>
<% filter_summary_show(); %>
      <tr bgcolor=cccccc align=middle>
        <td width="50" bgcolor="#FFFFFF">&nbsp;</td>
        <td bgcolor="#FFFFFF" width="200">&nbsp;</td>
	<td bgcolor="#FFFFFF" width="150">&nbsp;</td>
        <td bgcolor="#FFFFFF" width="150">&nbsp;</td>
	<td bgcolor="#FFFFFF" width="70">

<script>document.write("<INPUT onclick=self.close() type=button name=close_button value=\"" + sbutton.close + "\">");</script>

        </td>
</table></center></form></BODY></HTML>
