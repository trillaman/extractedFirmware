<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Log</TITLE>
<% no_cache(); %>
<% charset(); %>
<% web_include_file("filelink.asp"); %>
<SCRIPT language=JavaScript>
document.title = adtopmenu.log;
var EN_DIS = '<% nvram_get("log_enable"); %>'
function to_submit(F)
{
	
	if(F.log_enable[0].checked)
		F.log_level.value = "2";
	else
		F.log_level.value = "0";

	F.submit_button.value = "Log";
	F.gui_action.value='Apply';
	F.submit();
	return;
	
}
function SelLog(num,F)
{
	log_enable_disable(F,num);
}
function log_enable_disable(F,I)
{
        EN_DIS = I;
        if ( I == "0" ){
                choose_disable(F.log_incoming);
                choose_disable(F.log_outgoing);
        }
        else{
                choose_enable(F.log_incoming);
                choose_enable(F.log_outgoing);
        }
}
function ViewLogIn()
{
	do_open('Log_incoming.asp','inLogTable','alwaysRaised,resizable,scrollbars,width=580,height=600').focus();
}
function ViewLogOut()
{
	do_open('Log_outgoing.asp','outLogTable','alwaysRaised,resizable,scrollbars,width=760,height=600').focus();
}
function ViewLog()
{
	do_open('Log_all.asp','inLogTable','alwaysRaised,resizable,scrollbars,width=580,height=600').focus();
}
function init() 
{               
	init_form_session_key(document.forms[0], "apply.cgi");
        log_enable_disable(document.log,'<% nvram_get("log_enable"); %>');
}

</SCRIPT>
</HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM name=log method=<% get_http_method(); %> action=apply.cgi>
<input type=hidden name=submit_button>
<input type=hidden name=change_action>
<input type=hidden name=gui_action>
<INPUT type=hidden name=log_level> 

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>
  <TBODY>
  <TR bgColor=black>
    <TD 
    style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" 
    borderColor=#e7e7e7 width=163 bgColor=#e7e7e7 height=1><IMG height=15 
      src="image/UI_03.gif" width=164 border=0></TD>
    <TD 
    style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" 
    width=646 height=1><IMG height=15 src="image/UI_02.gif" width=645 
      border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 
height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD width=156 bgColor=#5b5b5b colSpan=3 height=25>
            <P align=right><B><FONT style="FONT-SIZE: 9pt" face=Arial 
            color=#ffffff><script>Capture(adtopmenu.log)</script></FONT></B></P></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=454 colSpan=6 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=44 colSpan=3 height=25></TD>
          <TD width=103 height=25><SPAN  
            style="FONT-SIZE: 8pt"><script>Capture(adtopmenu.log)</script>:&nbsp;</SPAN></TD>
          <TD width=294 height=25>
            <TABLE id=AutoNumber12 cellSpacing=0 cellPadding=0 width=242 
            border=0>
              <TBODY>
              <TR>
                <TD width=242 height=25><B>
                <INPUT type=radio value=1 name=log_enable <% nvram_match("log_enable", "1", "checked"); %> OnClick=SelLog(1,this.form)><script>Capture(share.enable)</script>
                <INPUT type=radio value=0 name=log_enable <% nvram_match("log_enable", "0", "checked"); %> OnClick=SelLog(0,this.form)><script>Capture(share.disable)</script></B></TD>
                </TR></TBODY></TABLE></TD>
          <TD width=13 height=25></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<% support_invmatch("SYSLOG_SUPPORT", "1", "<!--"); %>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=44 height=25 colSpan=3></TD>
          <TD width=103 height=25><script>Capture(share.ipaddr)</script>:&nbsp;</TD>
          <TD width=294 height=25>
            <TABLE id=AutoNumber12 cellSpacing=0 cellPadding=0 width=242 border=0>
              <TBODY>
              <TR>
                <TD width=242 height=25>&nbsp;&nbsp;<B><% prefix_ip_get("lan_ipaddr",1); %><INPUT class=num maxLength=3 name=log_ipaddr onBlur=valid_range(this,0,254,"IP") size=3 value="<% nvram_get("log_ipaddr"); %>"></TD>
                </TR></TBODY></TABLE></TD>
          <TD width=13 height=25></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<% support_invmatch("SYSLOG_SUPPORT", "1", "-->"); %>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=18 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>
                </TD>
                <TD height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=14 height=25></TD>
          <TD width=17 height=25></TD>
          <TD width=13 height=25></TD>
          <TD width=397 colSpan=2 height=25>

<script>document.write("<input type=button name=log_incoming" + " value=" + "\"" + adbutton.inlog + "\"" + "onclick=ViewLogIn()>");</script>

<script>document.write("<input type=button name=log_outgoing" + " value=" + "\"" + adbutton.outlog + "\"" + "onclick=ViewLogOut()>");</script>&nbsp;
<% support_match("SYSLOG_SUPPORT", "1", "<INPUT onclick=ViewLog() type=button value='System Log'>"); %>

	  </TD>
          <TD width=13 height=25></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=454 colSpan=6></TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR></TBODY></TABLE></TD>

    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF"><span style="font-family: Arial"><br>
<script>Capture(hlog.right1)</script><br>
<script language=javascript>
help_link("help/HLog.asp");
Capture(share.more);
document.write("</a></b>");
</script>
</span></font></TD>
          <TD width=9 bgColor=#2971b9 
  height=25>&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD width=809 colSpan=2>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=30>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=454>&nbsp;</TD>
	  <TD width="15" rowspan="2" background="image/UI_05.gif">&nbsp;</TD>
          <TD width="176" rowspan="2" align="right" bgcolor="#2971b9" border="0" height="64">&nbsp;</TD>
          </TR>
        <TR>
          <TD width=156 height="33" bgColor=#5b5b5b>&nbsp;</TD>
          <TD width=8 bgColor=#5b5b5b>&nbsp;</TD>
          <TD width=454 bgColor=#2971b9 align="right">
<TABLE>
<TR>
<TD width=101 bgcolor=#175592 align=center height=20><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:to_submit(document.forms[0])"><script>Capture(sbutton.save)</script></A></font></TD>
		<TD width=8></TD>
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Log.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
