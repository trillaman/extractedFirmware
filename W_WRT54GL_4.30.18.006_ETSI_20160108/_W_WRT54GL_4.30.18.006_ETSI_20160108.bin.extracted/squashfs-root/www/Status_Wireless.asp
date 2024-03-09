<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Wireless Status</TITLE>
<% no_cache(); %>
<% charset(); %>

<% web_include_file("filelink.asp"); %>
<SCRIPT language=JavaScript>function ViewDHCP(){do_open('DHCPTable.asp', 'DHCP', 'alwaysRaised,resizable,scrollbars,width=560,height=400');}</SCRIPT>
<script>
document.title = bmenu.wireless;
</script>

</HEAD>
<BODY>
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
            <P align=right><B><FONT style="FONT-SIZE: 9pt" face=Arial color=#ffffff><span><script>Capture(bmenu.wireless)</script></span></FONT></B></P></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=44 height=25>&nbsp;</TD>
          <TD width=120 height=25>&nbsp;</TD>
          <TD width=277 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25><p align="right"></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=44 height=25>&nbsp;</TD>
          <TD width=120><FONT style="FONT-SIZE: 8pt"><span><script>Capture(share.macaddr)</script>:&nbsp;</span></FONT></TD>
          <TD width=277>&nbsp;<FONT style="FONT-SIZE: 8pt"><B><% nvram_get("wl0_hwaddr"); %></B></FONT></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=44 height=25>&nbsp;</TD>
          <TD width=120><FONT style="FONT-SIZE: 8pt"><span><script>Capture(stawlan.mode)</script>:&nbsp;</span></FONT></TD>
          <TD width=277><b>&nbsp;<% nvram_match("wl_net_mode", "mixed", "<script>Capture(wlansetup.mixed)</script>"); %><% nvram_match("wl_net_mode", "g-only", "<script>Capture(wlansetup.gonly)</script>"); %><% nvram_match("wl_net_mode", "disabled", "<script>Capture(share.disabled)</script>"); %><% nvram_match("wl_net_mode", "b-only", "<script>Capture(wlansetup.bonly)</script>"); %>&nbsp;</b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=44 height=25>&nbsp;</TD>
          <TD width=120 height=25><FONT style="FONT-SIZE: 8pt"><span>SSID:&nbsp;</span></FONT></TD>
          <TD width=277 height=25><b>&nbsp;<% nvram_get("wl_ssid"); %>&nbsp;</b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=44 height=25>&nbsp;</TD>
          <TD width=120 height=25><FONT style="FONT-SIZE: 8pt"><script>Capture(share.dhcpsrv)</script>:&nbsp;</FONT></TD>
          <TD width=277 height=25>&nbsp;<FONT style="FONT-SIZE: 8pt"><B><% nvram_match("lan_proto", "dhcp", "<script>Capture(share.enabled)</script>"); %><% nvram_match("lan_proto", "static", "<script>Capture(share.disabled)</script>"); %></B></FONT></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=44 height=25>&nbsp;</TD>
          <TD width=120 height=25><font style="font-size: 8pt"><script>Capture(stawlan.channel)</script>:&nbsp;</font></TD>
          <TD width=277 height=25><b>&nbsp;<% nvram_get("wl_channel"); %>&nbsp;</b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=44 height=25>&nbsp;</TD>
          <TD width=120 height=25><font style="font-size: 8pt"><script>Capture(stawlan.encryfun)</script>:&nbsp;</font></TD>
          <TD width=277 height=25><b>&nbsp;<% nvram_match("security_mode", "disabled", "<script>Capture(share.disabled)</script>"); %><% nvram_invmatch("security_mode", "disabled", "<script>Capture(share.enabled)</script>"); %>&nbsp;</b>
          </TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

	<TR>
          <TD width=156 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=44>&nbsp;</TD>
          <TD width=120></TD>
          <TD width=277><p>&nbsp;</p></TD>
          <TD width=13>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD>
        </TR>

        
        </TBODY></TABLE></FORM></TD>
    <TD vAlign=top width=176 bgColor=#2971b9><font color="#FFFFFF"><span style="font-family: Arial"><br>
<script>Capture(hstatwl2.right1)</script><br><br>
<script>Capture(hstatwl2.right2)</script><br>
<script language=javascript>
help_link("help/HStatus.asp#wireless");
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
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Status_Wireless.asp')"><script>Capture(sbutton.refresh)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
