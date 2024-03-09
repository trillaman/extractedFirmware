<% web_include_file("copyright.asp"); %>
<% show_status("init"); %>
<HTML><HEAD><TITLE>Router Status</TITLE>
<% no_cache(); %>
<% charset(); %>

<% web_include_file("filelink.asp"); %>
<SCRIPT language=JavaScript>
document.title = share.router;
/*Add for session key*/
var session_key = "<% nvram_get("session_key"); %>";
var close_session = "<% get_session_status(); %>";
/*End for session key*/
function DHCPAction(F,I)
{
	F.submit_type.value = I;
	F.submit_button.value = "Status_Router";
	F.change_action.value = "gozila_cgi";
	F.submit();
}
function Connect(F,I)
{
	F.submit_type.value = I;
	F.submit_button.value = "Status_Router";
	F.change_action.value = "gozila_cgi";
	F.submit();
}
function init()
{
	init_form_session_key(document.forms[0], "apply.cgi");
	<% show_status("onload");%>
}
function ShowAlert(M)
{
	var str = "";
	var mode = "";
	var wan_ip = "<% nvram_status_get("wan_ipaddr"); %>";
	var wan_proto = "<% nvram_get("wan_proto"); %>";
	var ac_name = "<% nvram_get("ppp_get_ac"); %>";
	var srv_name = "<% nvram_get("ppp_get_srv"); %>";

	if(document.status.wan_proto.value == "pppoe")
		mode = "PPPoE";
	else if(document.status.wan_proto.value == "l2tp")
		mode = "L2TP";
	else if(document.status.wan_proto.value == "heartbeat")
		mode = "HBS";
	else
		mode = "PPTP";

	if(M == "AUTH_FAIL" || M == "PAP_AUTH_FAIL" || M == "CHAP_AUTH_FAIL")
                str = mode + hstatrouter2.authfail;
//              str = mode + " authentication fail";
	else if(M == "IP_FAIL" || (M == "TIMEOUT" && wan_ip == "0.0.0.0")) {
		if(mode == "PPPoE") {
			if(hstatrouter2.pppoenoip)	// For DE
				str = hstatrouter2.pppoenoip;
			else
				str = hstatrouter2.noip + mode + hstatrouter2.server;
		}
		else
                	str = hstatrouter2.noip + mode + hstatrouter2.server;
	}
//              str = "Can not get an IP address from " + mode + " server";
        else if(M == "NEG_FAIL")
                str = mode + hstatrouter2.negfail;
//              str = mode + " negotication fail";
        else if(M == "LCP_FAIL")
                str = mode + hstatrouter2.lcpfail;
//              str = mode + " LCP negotication fail";
        else if(M == "TCP_FAIL" || (M == "TIMEOUT" && wan_ip != "0.0.0.0" && wan_proto == "heartbeat"))
                str = hstatrouter2.tcpfail + mode + hstatrouter2.server;
//              str = "Can not build a TCP connection to " + mode + " server";
	else 
                str = hstatrouter2.noconn + mode + hstatrouter2.server;
//              str = "Can not connect to " + mode + " server";

	alert(str);

	Refresh();
}
var value=0;
function Refresh()
{
	var refresh_time = "<% show_status("refresh_time"); %>";
	if(refresh_time == "")	refresh_time = 60000;
	if (value>=1)
	{
		do_replace("Status_Router.asp");
	}
	value++;
	timerID=setTimeout("Refresh()",refresh_time);
}
function ViewDHCP()
{
	dhcp_win = do_open('DHCPTable.asp','inLogTable','alwaysRaised,resizable,scrollbars,width=720,height=600');
	dhcp_win.focus();
}
function localtime()
{
        tmp = "<% localtime(); %>";
        if( tmp == "Not Available")
                document.write(satusroute.localtime);
        else
                document.write(tmp);
}
</SCRIPT>

<BODY onload=init()>
<DIV align=center>
<FORM name=status method=<% get_http_method(); %> action=apply.cgi>
<input type=hidden name=submit_button>
<input type=hidden name=submit_type>
<input type=hidden name=change_action>
<input type=hidden name=wan_proto value='<% nvram_get("wan_proto"); %>'>

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
            color=#ffffff><script>Capture(staleftmenu.routerinfo)</script></B></P></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=17 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><script>Capture(share.firmwarever)</script>:&nbsp;</TD>
          <TD><B><% get_linksys_firmware_version(); %>, <% compile_date(); %></B></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><script>Capture(stacontent.curtime)</script>:&nbsp;</TD>
          <!-- TD><b><% localtime(); %></b></TD -->
          <TD><b><script>localtime();</script></b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><script>Capture(share.macaddr)</script>:&nbsp;</TD>
          <TD><b><% nvram_get("wan_hwaddr"); %></b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><script>Capture(share.routename)</script>:&nbsp;</TD>
          <TD><b><% nvram_get("router_name"); %>&nbsp;</b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><script>Capture(share.hostname)</script>:&nbsp;</TD>
          <TD><b><% nvram_get("wan_hostname"); %>&nbsp;</b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><script>Capture(share.domainname)</script>:&nbsp;</TD>
          <TD><b>
<script language=javascript>
if("<% nvram_get("wan_domain"); %>" != "") {
	document.write("<% nvram_get_len("wan_domain", "44"); %>");
}
else {
	document.write("<% nvram_get_len("wan_get_domain", "44"); %>");
}
</script>
</b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#5b5b5b height=25>
            <P align=right><B><FONT style="FONT-SIZE: 9pt" 
            color=#ffffff><span ><script>Capture(share.internet)</script></span></FONT></B></P></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD colSpan=6>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
          height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>
          <p align="right"><FONT 
style='FONT-WEIGHT: 700'><span ><script>Capture(share.cfgtype)</script></span></FONT></TD>
          <TD width=8 background=image/UI_04.gif 
          height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><span><script>Capture(stacontent.logtype)</script></span>:&nbsp;</TD>
          <TD><b><% nvram_match("wan_proto","dhcp","<script>Capture(setupcontent.dhcp)</script>"); %><% nvram_match("wan_proto","static","<script>Capture(hstatrouter2.wan_static)</script>"); %><%
nvram_match("wan_proto","pppoe","<script>Capture(share.pppoe)</script>"); %><% nvram_match("wan_proto","pptp","<script>Capture(share.pptp)</script>"); %><% nvram_match("wan_proto","l2tp","<script>Capture(hstatrouter2.l2tp)</script>"); %><%
nvram_match("wan_proto","heartbeat","<script>Capture(hstatrouter2.hb)</script>"); %></b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<% show_status_setting(); %>

        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
	  <TD width=14 height=25></TD>
          <TD colSpan=4 height=25><HR color=#b5b5e6 SIZE=1></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>                

        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD colSpan=2 height=25>

<!-- % nvram_match("wan_proto", "dhcp", "<INPUT onclick=DHCPAction(this.form,'release') type=button value='DHCP Release'>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT onclick=DHCPAction(this.form,'renew') type=button value='DHCP Renew'>"); % -->

<% nvram_invmatch("wan_proto", "dhcp", "<!--"); %> 

<script>document.write("<INPUT onclick=DHCPAction(this.form,\'release\') type=button name=dhcp_release value=\"" + stabutton.dhcprelease + "\">");</script>

<script>document.write("<INPUT onclick=DHCPAction(this.form,\'renew\') type=button name=dhcp_renew value=\"" + stabutton.dhcprenew + "\">");</script>

<% nvram_invmatch("wan_proto", "dhcp", "-->"); %> 

    &nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>  
        <TR>
          <TD width=156 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD colSpan=6>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR></TBODY></TABLE></TD>

    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF"><span ><br>
<script>Capture(hstatrouter2.right1)</script><br><br>
<script>Capture(hstatrouter2.right2)</script><br><br>
<script>Capture(hstatrouter2.right3)</script><br><br>
<script>Capture(hstatrouter2.right4)</script><br>
<script language=javascript>
help_link("help/HStatus.asp");
Capture(share.more);
document.write("</a></b>");
</script>
</span><br><br>
<script>Capture(hstatrouter2.right5)</script><br>
<script language=javascript>
help_link("help/HStatus.asp");
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
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Status_Router.asp')"><script>Capture(sbutton.refresh)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
