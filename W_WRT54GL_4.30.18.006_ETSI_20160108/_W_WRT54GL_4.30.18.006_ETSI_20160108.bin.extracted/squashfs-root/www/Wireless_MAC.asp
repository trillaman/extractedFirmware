<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Wireless MAC Filter</TITLE>
<% no_cache(); %>
<% charset(); %>
<% web_include_file("filelink.asp"); %>
<SCRIPT language=JavaScript>
document.title = wlantopmenu.macfilter;
var win_options = 'alwaysRaised,resizable,scrollbars,width=660,height=460' ;

var wl_filter_win = null;
var EN_DIS =  '<% nvram_get("wl_macmode"); %>'
var close_session = "<% get_session_status(); %>";
function closeWin(win_var)
{
        if ( ((win_var != null) && (win_var.close)) || ((win_var != null) && (win_var.closed==false)) )
                win_var.close();
}

function ViewFilter()
{
	wl_filter_win = do_open('WL_FilterTable.asp','FilterTable','alwaysRaised,resizable,scrollbars,width=520,height=530');
	wl_filter_win.focus();
}
function to_submit(F)
{
        F.submit_button.value = "Wireless_MAC";
        F.gui_action.value = "Apply";
        F.submit();
}

function SelMac(num,F)
{
        F.submit_button.value = "Wireless_MAC";
        F.change_action.value = "gozila_cgi";
        F.wl_macmode1.value = F.wl_macmode1.value;
        F.submit();
}
function exit()
{
        closeWin(wl_filter_win);
}
function init()
{
	init_form_session_key(document.forms[0], "apply.cgi");
}
</SCRIPT>

</HEAD>
<BODY onunload=exit() onload=init()>
<DIV align=center>
<FORM method=<% get_http_method(); %> name=wireless action=apply.cgi?session_id=<% nvram_get("session_key"); %>>
<input type=hidden name=submit_button>
<input type=hidden name=change_action>
<input type=hidden name=gui_action>

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>
  <TBODY>
  <TR>
    <TD borderColor=#e7e7e7 width=163 bgColor=#e7e7e7 height=1><IMG height=15 
      src="image/UI_03.gif" width=164 border=0></TD>
    <TD width=646 height=1><IMG height=15 src="image/UI_02.gif" width=645 border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 
height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE cellSpacing=0 cellPadding=0 border=0 width="633">
        <TBODY>
        <TR>
          <TD width=156 bgColor=#5b5b5b height=25>
            <P align=right><B>
                <font face="Arial" color="#FFFFFF" style="font-size: 9pt">
                <script>Capture(wlantopmenu.macfilter)</script></font></B></P></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=21>&nbsp;</TD>
          <TD width=116>&nbsp;</TD>
          <TD width=317>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR>
         <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25 width="21">&nbsp;</TD>
          <TD width=116 height=25>&nbsp;<font face="Arial" style="font-size: 8pt"><script>Capture(wlantopmenu.macfilter)</script>:&nbsp;</font></TD>
          <TD width=317 height=25>
                <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" width="200">
                  <tr>
                    <td style="border-style: none; border-width: medium" height="25" width="200">
         &nbsp;&nbsp;<INPUT onClick=SelMac('other',this.form) type=radio value=other name=wl_macmode1 <% nvram_selmatch("wl_macmode1","other","checked"); %>><B><script>Capture(share.enable)</script></B>&nbsp; 
	<INPUT onClick=SelMac('disabled',this.form) type=radio value=disabled name=wl_macmode1 <% nvram_selmatch("wl_macmode1","disabled","checked"); %>><B><script>Capture(share.disable)</script></B> </td>
                  </tr>
                </table>
          </TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<% nvram_selmatch("wl_macmode1","disabled","<!--"); %>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25 width="21">&nbsp;</TD>
          <TD width=116 height=25 valign=top>&nbsp;<script>Capture(wlanfilter.prevent)</script>:</TD>
          <TD width=317 height=25>
	  <TABLE height=30 cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <tr>
                <td heigh=30 valign=baseline>
                        &nbsp;&nbsp;<INPUT type=radio value="deny" name="wl_macmode" <% nvram_invmatch("wl_macmode","allow","checked"); %>>
                </td>
                <td heigh=30 valign=baseline>
                        <b><script>Capture(wlanfilter.prevent)</script></b> <script>Capture(wlanfilter.pclist)</script>
                </td>
              </tr>
              </TBODY>
          </TABLE>
          </TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25 width="21">&nbsp;</TD>
          <TD width=116 height=25 valign=top>&nbsp;<script>Capture(wlanfilter.permitonly)</script>:</TD>
          <TD width=317 height=25>
	  <TABLE height=30 cellSpacing=0 cellPadding=0 border=0>
              <TBODY>
              <tr>
                <td heigh=30 valign=baseline>
                        &nbsp;&nbsp;<INPUT type=radio value="allow" name="wl_macmode" <% nvram_match("wl_macmode","allow","checked"); %>>
                </td>
                <td heigh=30 valign=baseline>
                        <b><script>Capture(wlanfilter.permitonly)</script></b> <script>Capture(wlanfilter.pclisttoacc)</script>
                </td>
              </tr>
              </TBODY>
          </TABLE>
          </TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25 width="21">&nbsp;</TD>
          <TD width=116 height=25>&nbsp;</TD>
          <TD width=317 height=25>&nbsp;<B><INPUT type=hidden value=0 name=login_status></B></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=40>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25 width="21">&nbsp;</TD>
          <TD width=432 height=25 colspan=2>&nbsp;<B><INPUT type=hidden value=0 name=login_status>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<script>document.write("<INPUT type=button onclick=ViewFilter() name=mac_filter_button value=\"" + wlanbutton.editlist + "\">");</script>

            </B></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<% nvram_selmatch("wl_macmode1","disabled","-->"); %>                                                      


	<TR>
          <TD bgColor=#e7e7e7></TD>
          <TD background=image/UI_04.gif></TD>
          <TD></TD>
          <TD></TD>
          <TD></TD>
          <TD background=image/UI_05.gif></TD>
        </TR>



        </TBODY></TABLE></TD>
    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF"><span style="font-family: Arial">
<script language=javascript>
help_link("help/HWireless.asp#wl_mac_filters");
<% nvram_else_match("language","DE","Hilfe...","Capture(share.more);"); %>
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
          <TD width=454 bgColor=#2971b9 align=right>
<TABLE>
<TR>
<TD width=101 bgcolor=#175592 align=center height=20><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:to_submit(document.forms[0])"><script>Capture(sbutton.save)</script></A></font></TD>
		<TD width=8></TD>
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Wireless_MAC.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
