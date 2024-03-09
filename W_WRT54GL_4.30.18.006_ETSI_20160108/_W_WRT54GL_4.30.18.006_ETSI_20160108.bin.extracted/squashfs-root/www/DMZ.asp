<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>DMZ</TITLE>
<% no_cache(); %>
<% charset(); %>
<% web_include_file("filelink.asp"); %>
<SCRIPT language=JavaScript>
document.title = share.dmz;
var EN_DIS = '<% nvram_get("dmz_enable"); %>'
function to_submit(F)
{
	if(F.dmz_enable[0].checked == true){
		if(F.dmz_ipaddr.value == "0"){
//                      alert("Illegal DMZ IP Address!");
                        alert(errmsg.err9);
			F.dmz_ipaddr.focus();
			return;
		}	
	}
	
	F.submit_button.value = "DMZ";
	F.gui_action.value = "Apply";
        F.submit();
}
function dmz_enable_disable(F,I)
{
	EN_DIS1 = I;
	if ( I == "0" ){
		choose_disable(F.dmz_ipaddr);
	}
	else{
		choose_enable(F.dmz_ipaddr);
	}
}
function SelDMZ(F,num)
{
	dmz_enable_disable(F,num);
}
function init() 
{               
	init_form_session_key(document.forms[0], "apply.cgi");
	dmz_enable_disable(document.dmz,'<% nvram_get("dmz_enable"); %>');
}
</SCRIPT>
</HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM name=dmz method=<% get_http_method(); %> action=apply.cgi>
<input type=hidden name=submit_button value="DMZ">
<input type=hidden name=change_action>
<input type=hidden name=gui_action value="Apply">

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=809 bgColor=black border=0>
  <TBODY>
  <TR bgColor=black>
    <TD>
    <IMG height=15 src="image/UI_03.gif" width=164 border=0></TD>
    <TD>
    <IMG height=15 src="image/UI_02.gif" width=645 border=0></TD></TR></TBODY></TABLE>

<TABLE height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD width=156 bgcolor=#5b5b5b colSpan=3 height=25 align=right><B><FONT style="FONT-SIZE: 9pt" color=#ffffff><script>Capture(share.dmz)</script></FONT></B></TD>
          <TD width=8 bgcolor=#5b5b5b height=25></TD>
          <TD width=42 height=25>&nbsp;</TD>
          <TD width=161 height=25>&nbsp;</TD>
          <TD width=238 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&#12288;</TD></TR>
     
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&#12288;</TD>
          <td width=8 height=25 align=right background=image/UI_04.gif>&nbsp;</td>
          <TD height=25 width=42>&#12288;</TD>
          <TD width=399 height=25 colSpan=2><INPUT type=radio value=1 name=dmz_enable <% nvram_match("dmz_enable","1","checked"); %> onClick=SelDMZ(this.form,1)><B><script>Capture(share.enable)</script></B>&nbsp;<INPUT type=radio value=0 name=dmz_enable <% nvram_match("dmz_enable","0","checked"); %> onClick=SelDMZ(this.form,0)><B><script>Capture(share.disable)</script></B></TD>
          <TD width=13 height=25>&#12288;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&#12288;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&#12288;</TD>
          <td width=8 height=25 align=right background=image/UI_04.gif>&nbsp;</td>
          <TD height=25 width=42>&#12288;</TD>
          <TD width=161 height=25>&nbsp;&nbsp;<script>Capture(dmz.dmzhostip)</script>&nbsp;:&nbsp;</TD>
          <TD width=238 height=25><B>&nbsp;<% prefix_ip_get("lan_ipaddr",1); %><INPUT class=num maxLength=3 onBlur=valid_range(this,1,254,"IP") size=3 value='<% nvram_get("dmz_ipaddr"); %>' name="dmz_ipaddr"></b></TD>
          <TD width=13 height=25>&#12288;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&#12288;</TD></TR>
 <!--          <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&#12288;</TD>
          <td width="8" height="25" align=right><img border="0" src="image/UI_04.gif" width="8" height="28"></td>
          <TD colSpan=6 width="454">
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>
                  <HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD width=15>&#12288;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=1>&#12288;</TD></TR>
-->          
       <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3></TD>
          <TD width=8 background=image/UI_04.gif></TD>
          <TD width=42></TD>
          <TD width=161></TD>
          <TD width=238></TD>
          <TD width=13></TD>
          <TD width=15 background=image/UI_05.gif></TD></TR>

      </TBODY>
      </TABLE></TD>
    <TD vAlign=top width=176 bgcolor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=10 bgcolor=#2971b9 height=25>&#12288;</TD>
          <TD width=156 bgcolor=#2971b9 height=25><br><span style="font-family: Arial"><font color="#FFFFFF">
<script>Capture(hdmz2.right1)</script><br>
<script language=javascript>
help_link("help/HDMZ.asp");
Capture(share.more);
document.write("</a></b>");
</script>
</span></font>
          </TD>
          <TD width=9 bgcolor=#2971b9 height=25>&#12288;</TD>
        </TR>
        </TBODY>
      </TABLE>
    </TD>
  </TR>

 <tr>
                <td width="809" colspan=2>
                 <table border="0" cellpadding="0" cellspacing="0">
		  <tr> 
		      <td width="156" height="25" bgcolor="#E7E7E7">&nbsp;</td>
                      <td width="8" height="25"><img border="0" src="image/UI_04.gif" width="8" height="30"></td>
                      <td width="454" height="25" bgcolor="#FFFFFF">&nbsp;</td>
	  <TD width="15" rowspan="2" background="image/UI_05.gif">&nbsp;</TD>
          <TD width="176" rowspan="2" align="right" bgcolor="#2971b9" border="0" height="64">&nbsp;</TD>
                   </tr>
		  <tr>
		      <td width="156" height="33" bgcolor="#5b5b5b">&nbsp;</td>
                      <td width="8" height="33" bgcolor="#5b5b5b">&nbsp;</td>
                      <td width="454" height="33" bgcolor=#2971b9>
				<p align="right">
<TABLE>
<TR>
<TD width=101 bgcolor=#175592 align=center height=20><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:to_submit(document.forms[0])"><script>Capture(sbutton.save)</script></A></font></TD>
		<TD width=8></TD>
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('DMZ.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></td>
                   </tr>
		</table>
	       </td>
              </tr>
    </TBODY>
    </TABLE>
    </FORM>
    </DIV>
    </BODY>
    </HTML>
