<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>MAC Address Clone</TITLE>
<% no_cache(); %>
<% charset(); %>
<% web_include_file("filelink.asp"); %>
<meta http-equiv="content-type" content="text/html; charset=<script>document.write(lang_charset.set)</script>">

<SCRIPT language=JavaScript>
document.title = topmenu.macaddrclone;
function to_submit(F)
{	
	if(valid_macs_00(F))
        {
		F.submit_button.value = "WanMAC";
		F.gui_action.value = "Apply";
	       	F.submit();
	}
}
function CloneMAC(F)
{
       	F.submit_button.value = "WanMAC";
      	F.change_action.value = "gozila_cgi";
	F.submit_type.value = "clone_mac";
       	F.gui_action.value = "Apply";
       	F.submit();
}
function SelMac(num,F)
{
        mac_enable_disable(F,num);
}
function mac_enable_disable(F,I)
{
        EN_DIS3 = I;
        if ( I == "0" ){
                choose_disable(F.def_hwaddr);
                choose_disable(F.def_hwaddr_0);
                choose_disable(F.def_hwaddr_1);
                choose_disable(F.def_hwaddr_2);
                choose_disable(F.def_hwaddr_3);
                choose_disable(F.def_hwaddr_4);
                choose_disable(F.def_hwaddr_5);
                choose_disable(F.clone_b);
        }
        else{
                choose_enable(F.def_hwaddr);
                choose_enable(F.def_hwaddr_0);
                choose_enable(F.def_hwaddr_1);
                choose_enable(F.def_hwaddr_2);
                choose_enable(F.def_hwaddr_3);
                choose_enable(F.def_hwaddr_4);
                choose_enable(F.def_hwaddr_5);
                choose_enable(F.clone_b);
        }
}
function DISABLE_ALL(flg,F)
{
	var len,i,bt;
	len = F.elements.length;

	for(i=0; i<len; i++)
	{
		F.elements[i].disabled = flg ; 
	}
}

function init() 
{               
	init_form_session_key(document.forms[0], "apply.cgi");
        mac_enable_disable(document.mac,'<% nvram_get("mac_clone_enable"); %>');
	<% onload("MACClone", "document.mac.mac_clone_enable[0].checked = true; mac_enable_disable(document.mac,1);"); %>	
	if("<% nvram_get("http_from"); %>" == "wan") {
		DISABLE_ALL(true,document.mac);
		}
}

function valid_macs_00(F)
{
//        M1 = "The MAC Address is not correct!!";
        M1 = errmsg.err17;
        if(F.def_hwaddr_0.value == 00 && F.def_hwaddr_1.value == 00 && F.def_hwaddr_2.value == 00 &&  F.def_hwaddr_3.value == 00 && F.def_hwaddr_4.value == 00 && F.def_hwaddr_5.value == 00)
        {
                F.def_hwaddr_0.value = F.def_hwaddr_0.defaultValue;
                F.def_hwaddr_1.value = F.def_hwaddr_1.defaultValue;
                F.def_hwaddr_2.value = F.def_hwaddr_2.defaultValue;
                F.def_hwaddr_3.value = F.def_hwaddr_3.defaultValue;
                F.def_hwaddr_4.value = F.def_hwaddr_4.defaultValue;
                F.def_hwaddr_5.value = F.def_hwaddr_5.defaultValue;
                alert(M1);
                return false;
        }
        else
        {
                return true;
        }
}
</SCRIPT>

</HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM name=mac method=<% get_http_method(); %> action=apply.cgi>
<input type=hidden name=submit_button>
<input type=hidden name=change_action>
<input type=hidden name=submit_type>
<input type=hidden name=gui_action>

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
          <TD width=156 bgColor=#5b5b5b height=25>
            <P align=right><B><FONT style="FONT-SIZE: 9pt" face=Arial 
            color=#ffffff><script>Capture(share.macclone)</script></FONT></B></P></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=440 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>        
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=24>&nbsp;</TD>
          <TD width=14 height=24>&nbsp;</TD>
          <TD width=440 height=24><INPUT type=radio value=1 name=mac_clone_enable <% nvram_match("mac_clone_enable", "1", "checked"); %> OnClick=SelMac(1,this.form)><B><script>Capture(share.enable)</script></B>&nbsp;&nbsp;
                <INPUT type=radio value=0 name=mac_clone_enable <% nvram_match("mac_clone_enable", "0", "checked"); %> OnClick=SelMac(0,this.form)><B><script>Capture(share.disable)</script></B></TD>
          <TD width=15 background=image/UI_05.gif height=24>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=24>&nbsp;</TD>
          <TD width=14 height=24>&nbsp;</TD>
          <TD width=440 height=24>

&nbsp;&nbsp;<script>Capture(macclone.usrdef)</script>:&nbsp;
                                  <input type=hidden name="def_hwaddr"  value="6">
                                  <input name="def_hwaddr_0" value='<% get_clone_mac("0"); %>' size=2 maxlength=2 onBlur=valid_mac(this,0) class=num> :
                                  <input name="def_hwaddr_1" value='<% get_clone_mac("1"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num> :
                                  <input name="def_hwaddr_2" value='<% get_clone_mac("2"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num> :
                                  <input name="def_hwaddr_3" value='<% get_clone_mac("3"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num> :
                                  <input name="def_hwaddr_4" value='<% get_clone_mac("4"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num> :
                                  <input name="def_hwaddr_5" value='<% get_clone_mac("5"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num>&nbsp;&nbsp;&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=24>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=14 height=24>&nbsp;</TD>
          <TD width=440 height=25>
           <TABLE>
              <TBODY>
              <TR>
                <TD width=1></TD>
                <TD width=439 align=left>
			<script>document.write("<INPUT onclick=CloneMAC(this.form) type=button name=clone_b value=\"" + macclone.clonepcmac + "\">");</script>
                </TD>
              </TR>
              </TBODY>
            </TABLE>
           </TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=14 height=24>&nbsp;</TD>
          <TD width=440 height=25>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=430>
			<HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD width=10>&nbsp;</TD>
              </TR>
              </TBODY>
            </TABLE>
          </TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

	 <TR>
          <TD width=156 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=14>&nbsp;</TD>
          <TD width=440>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR>



    </TBODY></TABLE></TD>
    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF"><span style="font-family: Arial"><br>

<script>Capture(hwmac2.right1)</script><br>
<script language=javascript>
help_link("help/HMAC.asp");
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
          <TD width=454 bgColor=#2971b9 align=right>
<TABLE>
<TR>
<TD width=101 bgcolor=#175592 align=center height=20><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:to_submit(document.forms[0])"><script>Capture(sbutton.save)</script></A></font></TD>
		<TD width=8></TD>
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('WanMAC.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR>
          </TBODY>
          </TABLE>
          </TD>
          </TR>
          </TBODY>
          </TABLE>
          </FORM>
          </DIV>
          </BODY>
          </HTML>
