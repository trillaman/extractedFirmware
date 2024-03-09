<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Factory Defaults</TITLE>
<% no_cache(); %>
<% charset(); %>

<% web_include_file("filelink.asp"); %>
<SCRIPT language=JavaScript>
re1 = /&nbsp;/gi
str = adtopmenu.facdef.replace(re1,"");
document.title = str;
function to_submit(F)
{
	if( F.FactoryDefaults[0].checked == 1 )
		{
//              if(!confirm('Warning! If you click OK, the device will reset to factory default and all previous settings will be erased.'))
                if(!confirm(hfacdef.warning))
			{return;}
		else
			F.gui_action.value='Restore';
			F.submit_button.value = "Factory_Defaults";
  		        F.submit();
       		        return;
		}
	else
		return;

	F.submit_button.value = "Factory_Defaults";
	F.submit();
	return;
}
function init()
{
	init_form_session_key(document.forms[0], "apply.cgi");
}
</SCRIPT>
</HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM name=default method=<% get_http_method(); %> action=apply.cgi>
<input type=hidden name=submit_button>
<input type=hidden name=change_action>
<input type=hidden name=gui_action>
<input type=hidden name=wait_time value=19>

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>
  <TBODY>
  <TR bgColor=black>
    <TD borderColor=#e7e7e7 width=163 bgColor=#e7e7e7 height=1><IMG height=15 src="image/UI_03.gif" width=164 border=0></TD>
    <TD width=646 height=1><IMG height=15 src="image/UI_02.gif" width=645 border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD align=right width=156 bgColor=#5b5b5b colSpan=3 height=25><B><FONT style="FONT-SIZE: 9pt" face=Arial color=#ffffff><script>Capture(adtopmenu.facdef)</script></FONT></B></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=17 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=151 height=25>&nbsp;</TD>
          <TD width=246 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=14 height=25></TD>
          <TD width=17 height=25></TD>
          <TD width=13 height=25></TD>
          <TD width=151 height=25><SPAN  style="FONT-SIZE: 8pt"><script>Capture(facdef.refacdefa)</script>:&nbsp;</SPAN></TD>
          <TD width=246 height=25><TABLE id=AutoNumber12 cellSpacing=0 cellPadding=0 width=242 border=0>
              <TBODY>
              <TR>
                <TD width=27 height=25><INPUT type=radio value=1 name=FactoryDefaults></TD>
                <TD width=54 height=25><B><FONT style="FONT-SIZE: 8pt" face=Arial><script>Capture(share.yes)</script><SPAN >&nbsp;</SPAN></FONT></B></TD>
                <TD width=24 height=25> 
    <INPUT type=radio CHECKED value=0 name=FactoryDefaults></TD>
                <TD width=137 height=25><B><FONT style="FONT-SIZE: 8pt" face=Arial size=2><script>Capture(share.no)</script></FONT></B></TD></TR></TBODY></TABLE></TD>
          <TD width=13 height=25></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <!--  TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>&nbsp;</TD>
                <TD width=15 height=1>&nbsp;</TD></TR></TBODY></TABLE -->
          </TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR>
        <TR>
          <TD width=44 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=65 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=47 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=14></TD>
          <TD width=17></TD>
          <TD width=13></TD>
          <TD width=151></TD>
          <TD width=246></TD>
          <TD width=13></TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD vAlign=top width=176 bgColor=#2971b9>
          <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
          <TBODY>
                <TR>
                <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
                <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF"><span style="font-family: Arial"><br>
<script>Capture(hfacdef.right1)</script><br>
<script language=javascript>
help_link("help/HDefault.asp");
Capture(share.more);
document.write("</a></b>");
</script>
          </span></font></TD>
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
          <TD width=454 bgColor=#2971b9 align="right">
<TABLE>
<TR>
<TD width=101 bgcolor=#175592 align=center height=20><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:to_submit(document.forms[0])"><script>Capture(sbutton.save)</script></A></font></TD>
		<TD width=8></TD>
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Factory_Defaults.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
           </TR>
           </TBODY>
           </TABLE>
         </TD>
        </TR>
      </FORM>
    </TBODY>
  </TABLE>
</DIV>
</BODY>
</HTML>
