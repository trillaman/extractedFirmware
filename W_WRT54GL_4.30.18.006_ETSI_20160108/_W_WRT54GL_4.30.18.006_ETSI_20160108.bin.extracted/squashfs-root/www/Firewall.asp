<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Firewall</TITLE>
<% no_cache(); %>
<% charset(); %>

<% web_include_file("filelink.asp"); %>

<SCRIPT language=JavaScript>
document.title = share.firewall;

function wan_enable_disable(F)
{
	if(F._block_wan.checked == true) 
		choose_enable(F._ident_pass);	
	else {
		choose_disable(F._ident_pass);	
	}
}

function to_submit(F)
{
	F.submit_button.value = "Firewall";
	if(F._block_wan.checked == true) 
		F.block_wan.value = 1;
	else {
		F.block_wan.value = 0;
	}
	if(F._block_loopback){
		if(F._block_loopback.checked == true) F.block_loopback.value = 1;
		else 				 F.block_loopback.value = 0;
	}
	if(F._block_cookie){
		if(F._block_cookie.checked == true) F.block_cookie.value = 1;
		else 				 F.block_cookie.value = 0;
	}
	if(F._block_java){
		if(F._block_java.checked == true) F.block_java.value = 1;
		else 				 F.block_java.value = 0;
	}
	if(F._block_proxy){
		if(F._block_proxy.checked == true) F.block_proxy.value = 1;
		else 				 F.block_proxy.value = 0;
	}
	if(F._block_activex){
		if(F._block_activex.checked == true) F.block_activex.value = 1;
		else 				 F.block_activex.value = 0;
	}
	if(F._ident_pass){
		if(F._ident_pass.checked == true) F.ident_pass.value = 0;
		else 				 F.ident_pass.value = 1;
	}

	if(F._block_multicast){
		if(F._block_multicast.checked == true) F.multicast_pass.value = 0;
		else				F.multicast_pass.value = 1;
	}

	F.gui_action.value = "Apply";
        F.submit();
}
function init()
{
	init_form_session_key(document.forms[0], "apply.cgi");
	if(document.firewall._block_wan.checked == true) 
                choose_enable(document.firewall._ident_pass);   
        else {
                choose_disable(document.firewall._ident_pass);  
        }
}

</SCRIPT>

</HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM name=firewall method=<% get_http_method(); %> action=apply.cgi>
<input type=hidden name=submit_button>
<input type=hidden name=change_action>
<input type=hidden name=gui_action>
<input type=hidden name=block_wan>
<input type=hidden name=block_loopback>
<input type=hidden name=multicast_pass value=0>
<input type=hidden name=ident_pass>
<input type=hidden name=block_cookie value=0>
<input type=hidden name=block_java value=0>
<input type=hidden name=block_proxy value=0>
<input type=hidden name=block_activex value=0>

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>
  <TBODY>
  <TR bgColor=black>
    <TD 
    style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" 
    borderColor=#e7e7e7 width=163 bgColor=#e7e7e7 height=1><IMG height=15 src="image/UI_03.gif" width=164 border=0></TD>
    <TD 
    style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" width=646 height=1><IMG height=15 src="image/UI_02.gif" width=645 
      border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0 width="633">
        <TBODY>
        <TR>
          <TD width=156 bgColor=#5b5b5b height=25>
            <p align="right"><b><font face="Arial" color="#FFFFFF" style="font-size: 9pt">
                <script>Capture(share.firewall)</script></font></b></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=11 height=25>&nbsp;</TD>
          <TD width=17 height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=15 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        
        <TR>
          <TD width=156 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD colSpan=2 height=1 width="28">&nbsp;</TD>
          <TD width=411 colSpan=3 height=1>&nbsp;&nbsp;&nbsp;&nbsp;<script>Capture(firewall.firewallpro)</script>:&nbsp;&nbsp;<INPUT type=radio value=on name=filter <% nvram_match("filter","on","checked"); %>><B><script>Capture(share.enable)</script></B>&nbsp;<INPUT type=radio value=off name=filter <% nvram_match("filter","off","checked"); %>><B><script>Capture(share.disable)</script></B></TD>
          <TD width=15>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR>
         <TR>
          <TD width=156 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD colSpan=2 height=1 width="28">&nbsp;</TD>
          <TD width=411 colSpan=3 height=1>
            <HR color=#b5b5e6 SIZE=1>
          </TD>
          <TD width=15>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR>

        <!--TR>
          <TD width=156 bgColor=#e7e7e7 height=25>
          <p align="right">
                <font face="Arial" style="font-size: 8pt; font-weight: 700"> Additional Filters</font></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=397 height=25 colspan="2"><table border="0" cellpadding="0" cellspacing="0" id="AutoNumber12" width="300">
                  <tr>
                    <td height="25" width="27"><INPUT type=checkbox value=1 name="_block_proxy" <% nvram_match("block_proxy","1","checked"); %>><b>
				
		    </td>
                    <td height="25" width="110"> Filter Proxy&nbsp;
		    </td>
                    <td height="25" width="27">
    <INPUT type=checkbox value=1 name="_block_cookie" <% nvram_match("block_cookie","1","checked"); %>><b>
		    </td>
                    <td height="25" width="90"> Filter Cookies&nbsp;
		    </td>
                  </tr>
                </table>
</TD>
          <TD width=15 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=397 height=25 colspan="2"><table border="0" cellpadding="0" cellspacing="0" id="AutoNumber12" width="300" >
                  <tr>
                    <td height="25" width="27">
    <INPUT type=checkbox value=1 name="_block_java" <% nvram_match("block_java","1","checked"); %>><b>
				
		    </td>
                    <td height="25" width="110"> Filter Java Applets&nbsp;
		    </td>
                    <td height="25" width="27">
    <INPUT type=checkbox value=1 name="_block_activex" <% nvram_match("block_activex","1","checked"); %>><b>
				
		    </td>
                    <td height="25" width="90"> Filter ActiveX&nbsp;
		    </td>
                  </tr>
                </table>
</TD>
          <TD width=15 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
       
        <TR>
          <TD width=156 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD colSpan=2 height=1 width="28">&nbsp;</TD>
          <TD width=411 colSpan=3 height=1>
            <HR color=#b5b5e6 SIZE=1>
          </TD>
          <TD width=15>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR-->

        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>
          <p align="right"><font face="Arial" style="font-size: 8pt; font-weight: 700">
                <script>Capture(secleftmenu.blockwan)</script></font></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=397 height=25 colspan="2"><table border="0" cellpadding="0" cellspacing="0" id="AutoNumber12" width="300">
                  <tr>
                    <td height="25" width="27"><input type=checkbox value=1 name=_block_wan <% nvram_match("block_wan","1","checked"); %> onclick=wan_enable_disable(this.form)></td>
                    <td height="25" width="240"> <script>Capture(firewall.blockinterreq)</script>&nbsp; </td>
                  </tr>
                </table>
</TD>
          <TD width=15 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>               
<% support_invmatch("MULTICAST_SUPPORT", "1", "<!--"); %>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>
          <p align="right">
                <font face="Arial" style="font-size: 8pt; font-weight: 700"></font></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=397 height=25 colspan="2"><table border="0" cellpadding="0" cellspacing="0" id="AutoNumber12" width="300">
                  <tr>
                    <td height="25" width="27"><input type=checkbox value=0 name=_block_multicast <% nvram_match("multicast_pass","0","checked"); %>></td>
                    <td height="25" width="240"> <script>Capture(firewall2.multi)</script>&nbsp; </td>
                  </tr>
                </table>
</TD>
          <TD width=15 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>               
<% support_invmatch("MULTICAST_SUPPORT", "1", "-->"); %>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>
          <p align="right">
                <font face="Arial" style="font-size: 8pt; font-weight: 700"></font></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=397 height=25 colspan="2"><table border="0" cellpadding="0" cellspacing="0" id="AutoNumber12" width="300">
                  <tr>
                    <td height="25" width="27"><input type=checkbox value=0 name=_block_loopback <% nvram_match("block_loopback","1","checked"); %>></td>
                    <td height="25" width="240"> <script>Capture(firewall2.natredir)</script>&nbsp; </td>
                  </tr>
                </table>
</TD>
          <TD width=15 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>               
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>
          <p align="right">
                <font face="Arial" style="font-size: 8pt; font-weight: 700">
                </font></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=397 height=25 colspan="2"><table border="0" cellpadding="0" cellspacing="0" id="AutoNumber12" width="300">
                  <tr>
                    <td height="25" width="27"><input type=checkbox value=1 name=_ident_pass <% nvram_match("ident_pass","0","checked"); %>></td>
                    <td height="25" width="240"> <script>Capture(firewall2.ident)</script>&nbsp; </td>
                  </tr>
                </table>
</TD>
          <TD width=15 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>               


	<TR>
          <TD bgColor=#e7e7e7></TD>
          <TD background=image/UI_04.gif></TD>
          <TD colSpan=3></TD>
          <TD colspan=2></TD>
          <TD></TD>
          <TD background=image/UI_05.gif></TD>
        </TR>



        </TBODY></TABLE></TD>
    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF"><br>

<b><script>Capture(firewall.firewallpro)</script>: </b><script>Capture(hfirewall.right)</script><br>
 <span >
<script language=javascript>
help_link("help/HFirewall.asp");
Capture(share.more);
document.write("</a></b>");
</script>
</span></font></TD>
          <TD width=9 bgColor=#2971b9 height=25>&nbsp;
	  </TD></TR></TBODY></TABLE></TD></TR>
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
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Firewall.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
