<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Diagnostics</TITLE>
<% no_cache(); %>
<% charset(); %>

<% web_include_file("filelink.asp"); %>

<SCRIPT language=JavaScript>
document.title = adtopmenu.diag;

function ViewPing()
{
	do_open('Ping.asp','PingTable','alwaysRaised,resizable,scrollbars,width=540,height=500').focus();
}
function ViewTraceroute()
{
	do_open('Traceroute.asp','TracerouteTable','alwaysRaised,resizable,scrollbars,width=600,height=450').focus();
}
function init()
{
	init_form_session_key(document.forms[0], "apply.cgi");
}

</SCRIPT>
</HEAD>
<BODY vLink=#b5b5e6 aLink=#ffffff link=#b5b5e6 onload=init()>
<DIV align=center>
<FORM name=diag method=<% get_http_method(); %> action=apply.cgi>

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>
  <TBODY>
  <TR bgColor=black>
    <TD style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" 
    borderColor=#e7e7e7 width=163 bgColor=#e7e7e7 height=1><IMG height=15 src="image/UI_03.gif" width=164 border=0></TD>
    <TD style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" width=646 height=1><IMG height=15 src="image/UI_02.gif" width=645 border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0 width="633">
        <TBODY>
        <TR>
          <TD width=156 bgColor=#5b5b5b colSpan=3 height=25>
            <P align=right><b>
                <font face="Arial" color="#FFFFFF" style="font-size: 9pt">
                <script>Capture(adleftmenu.ping)</script></font></b></P></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD colSpan=6 height=25 width="454">&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>
          <p align="right">
                <font style="font-weight: 700"><span >&nbsp;<script>Capture(adleftmenu.pingparam)</script></span></font></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=149 height=25>

<script>document.write("<INPUT onclick=ViewPing(); type=button name=ping_button value=\"" + adbutton.ping + "\">");</script>

          </TD>
          <TD width=180 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>
            <P align=right>&nbsp;</P></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=219 height=25>&nbsp;</TD>
          <TD width=180 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>                
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6 width="454">
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>
                  <HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD width=15>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR>

        <TR>
          <TD width=156 bgColor=#5b5b5b colSpan=3 height=25>
            <P align=right><B><FONT style="FONT-SIZE: 9pt" 
            color=#ffffff><span ><script>Capture(adleftmenu.tracertest)</script></span></FONT></B></P></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD colSpan=6 width="454">
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=25>&nbsp;</TD>
                <TD width=12 height=25>&nbsp;</TD>
                <TD width=411 height=25>&nbsp;</TD>
                <TD width=15 height=25>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD>
        </TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>
          <p align="right">
                <font style="font-weight: 700"><span >&nbsp;<script>Capture(adleftmenu.tracerparam)</script></span></font></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=219 height=25>

<script>document.write("<INPUT onclick=ViewTraceroute() type=button name=troute_button value=\"" + adbutton.traceroute + "\">");</script>

          </TD>
          <TD width=180 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>             
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6 width="454">
            <!-- TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>&nbsp;</TD>
                <TD width=15>&nbsp;</TD></TR></TBODY></TABLE --></TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR>
        <TR>
          <TD width=43 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=64 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=49 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=11></TD>
          <TD width=18></TD>
          <TD width=13></TD>
          <TD width=219></TD>
          <TD width=180></TD>
          <TD width=13></TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR></TBODY></TABLE></TD>

    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF">
          <span style="font-family: Arial"><br>

<b><script>Capture(adleftmenu.ping)</script>: </b><script>Capture(hdiag.right1)</script><br><br><br><br>
<b><script>Capture(adbutton.tracer)</script>: </b><script>Capture(hdiag.right2)</script><br>         

</span></font>
          </TD>
          <TD width=9 bgColor=#2971b9 height=25>&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
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
          <TD width=454 bgColor=#2971b9>&nbsp;</TD>
          </TR>
</TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
