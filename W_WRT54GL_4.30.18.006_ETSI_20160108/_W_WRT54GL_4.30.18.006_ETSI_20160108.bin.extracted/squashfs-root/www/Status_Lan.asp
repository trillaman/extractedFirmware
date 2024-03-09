<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Local Network Status</TITLE>
<% no_cache(); %>
<% charset(); %>

<% web_include_file("filelink.asp"); %>
<SCRIPT language=JavaScript>
document.title = statopmenu.localnet;
var dhcp_win = null;
function ViewDHCP()
{
	dhcp_win = do_open('DHCPTable.asp','inLogTable','alwaysRaised,resizable,scrollbars,width=720,height=600');
	dhcp_win.focus();
}
function exit()
{
        closeWin(dhcp_win);
}
</SCRIPT>

</HEAD>
<BODY onunload=exit()>
<DIV align=center>

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
    width=646 height=1><IMG height=15 src="image/UI_02.gif" 
      width=645 border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 
height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD width=156 bgColor=#5b5b5b height=25>
            <P align=right><B><FONT style="FONT-SIZE: 9pt" face=Arial 
            color=#ffffff><script>Capture(statopmenu.localnet)</script></FONT></B></P></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=17 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
          height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>
          <p align="right"></TD>
          <TD width=8 background=image/UI_04.gif 
height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD><FONT style="FONT-SIZE: 8pt"><span ><script>Capture(share.macaddr)</script>:&nbsp;</span></FONT></TD>
          <TD>&nbsp;<FONT 
            style="FONT-SIZE: 8pt"><B><% nvram_get("lan_hwaddr"); %></B></FONT></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
          height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif 
height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD><FONT style="FONT-SIZE: 8pt"><script>Capture(share.ipaddr)</script>:&nbsp;</FONT></TD>
          <TD>&nbsp;<FONT style="FONT-SIZE: 8pt"><B><% nvram_get("lan_ipaddr"); %></B></FONT></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
          height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif 
height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD height=25><FONT style="FONT-SIZE: 8pt"><script>Capture(share.submask)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25>&nbsp;<FONT 
            style="FONT-SIZE: 8pt"><B><% nvram_get("lan_netmask"); %></B></FONT></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
          height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif 
height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD height=25><FONT style="FONT-SIZE: 8pt"><script>Capture(share.dhcpsrv)</script>:&nbsp;</FONT></TD>
          <TD height=25>&nbsp;<FONT 
            style="FONT-SIZE: 8pt"><B><% nvram_match("lan_proto", "dhcp", "<script>Capture(share.enabled)</script>"); %><% nvram_match("lan_proto", "static", "<script>Capture(share.disabled)</script>"); %></B></FONT></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
          height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif 
height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD height=25><FONT style="FONT-SIZE: 8pt"><span ><script>Capture(stalan.startip)</script>:&nbsp;</span></FONT></TD>
          <TD height=25><b>&nbsp;<% prefix_ip_get("lan_ipaddr",1); %><% nvram_get("dhcp_start"); %>&nbsp;</b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
          height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif 
height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD height=25><span ><script>Capture(stalan.endip)</script>:&nbsp;</span></TD>
          <TD height=25>&nbsp;<b><script language=javascript>
	var prefix = "<% prefix_ip_get("lan_ipaddr",1); %>";
	var start = <% nvram_get("dhcp_start"); %>;
	var num = <% nvram_get("dhcp_num"); %>;
	var lanip3 = <% get_single_ip("lan_ipaddr","3"); %>;
	document.write(prefix);
	if(lanip3 > start && lanip3 < (start+num-1))
	{
		document.write(start+num);
	}
	else
	{
		document.write(start+num-1);
	}
          </script>
&nbsp;</b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

	<TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD colSpan=4 height=25><HR color=#b5b5e6 SIZE=1></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif 
height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD height=25 colspan="2">

<script>document.write("<INPUT id=button1 onclick=ViewDHCP() type=button name=dhcp_table value=\"" + stabutton.dhcpclitbl + "\">");</script>

          </TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
	<TR>
          <TD width=156 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD colSpan=3>&nbsp;</TD>
          <TD colspan=2></TD>
          <TD width=13>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR>


        
        </TBODY></TABLE></FORM></TD>
    <TD vAlign=top width=176 bgColor=#2971b9><font color="#FFFFFF"><span style="font-family: Arial"><br>

<script>Capture(hstatlan2.right1)</script><br><br>
<script>Capture(hstatlan2.right2)</script><br><br>
<script>Capture(hstatlan2.right3)</script><br><br>
<script>Capture(hstatlan2.right4)</script><br>
<script language=javascript>
help_link("help/HStatus.asp#lan");
Capture(share.more);
document.write("</a></b>");
</script>
</span></font></TD></TR>
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
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Status_Lan.asp')"><script>Capture(sbutton.refresh)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
