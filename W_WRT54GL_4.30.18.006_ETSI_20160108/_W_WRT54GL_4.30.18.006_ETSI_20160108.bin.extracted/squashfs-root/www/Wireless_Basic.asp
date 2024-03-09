<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Basic Wireless Settings</TITLE>
<% no_cache(); %>
<% charset(); %>
<% web_include_file("filelink.asp"); %>

<SCRIPT language=JavaScript>
re1 = /<br>/gi;
str = wlantopmenu.basicset.replace(re1," ");
document.title = str;
var EN_DIS = '<% nvram_else_match("wl_net_mode","disabled","0","1"); %>';
var init_gmode;
function SelWL(num,F)
{
	if (num == 0)
		I = '0';
	else
		I = '1';
	wl_enable_disable(F,I);
}

function wl_enable_disable(F,I)
{
        EN_DIS = I;
        if( I == "0"){
                choose_disable(F.wl_ssid);
                choose_disable(F.wl_channel);
                choose_disable(F.wl_closed[0]);
                choose_disable(F.wl_closed[1]);
<% support_invmatch("SES_SUPPORT", "1", "/*"); %>
		ses_enable_disable(F,"0");
                //choose_disable(F.B1);
                //choose_disable(F.B2);
<% support_invmatch("SES_SUPPORT", "1", "*/"); %>
        }
        else{
                choose_enable(F.wl_ssid);
                choose_enable(F.wl_channel);
                choose_enable(F.wl_closed[0]);
                choose_enable(F.wl_closed[1]);
<% support_invmatch("SES_SUPPORT", "1", "/*"); %>
		ses_enable_disable(F, '<% nvram_get("ses_enable"); %>');
                //choose_disable(F.B1);
                //choose_disable(F.B2);
<% support_invmatch("SES_SUPPORT", "1", "*/"); %>
        }
}
function ses_enable_disable(F,I)
{
        EN_DIS = I;
        if( I == "0"){
                choose_disable(F.B1);
		document.getElementById("ses_on").style.display = "none";
		document.getElementById("ses_off").style.display = "";
                //choose_disable(F.B2);
        }
        else{
                choose_enable(F.B1);
		document.getElementById("ses_on").style.display = "";
		document.getElementById("ses_off").style.display = "none";
                //choose_enable(F.B2);
        }
}

function to_submit(F)
{
	var gmode = <% nvram_get("wl_gmode"); %>;
	var security_mode = "<% nvram_get("security_mode"); %>";

	if(F.wl_ssid.value == ""){
//                alert("You must input a SSID!");
                alert(errmsg2.err2);
                F.wl_ssid.focus();
                return;
        }

	//if(F.wl_gmode.value == 6){
	//	if(security_mode != "wep" && security_mode != "disabled"){
	//		if(confirm("The SpeedBooster mode can only allow WEP. Click the OK button to change your security mode.")){
	//			window.location.replace('WL_WPATable.asp?session_id=<% nvram_get("session_key"); %>');
	//			return;
	//		}
	//		else{
	//			F.wl_gmode[init_gmode].selected = true;
	//			return;
	//		}
	//	}
	//}

	F.submit_button.value = "Wireless_Basic";
	F.gui_action.value = "Apply";
	F.submit();
}

var ses = '<% get_ses_status(); %>';
                                                                                                   
function ses_status()
{
        return ses;
}
                                                                                                   
function Reset_SES(F)
{
        F.submit_button.value = "Wireless_Basic";
        F.submit_type.value = "Reset_SES";
        F.change_action.value = "gozila_cgi";
        F.submit();
}
                                                                                                   
function Set_SES_Short_Push(F)
{
        var wl_net_mode = '<% nvram_get("wl_net_mode"); %>';
	var ses_enable = '<% nvram_get("ses_enable"); %>';

	if(wl_net_mode == "disabled" || ses_enable == "0")
		return ;
                                                                                                   
        if (confirm(SW_SES_BTN.MSG2)) {
                F.submit_button.value = "Wireless_Basic";
                F.submit_type.value = "Set_SES_Short_Push";
                F.change_action.value = "gozila_cgi";
                F.next_page.value = "SES_Status.asp";
                F.submit();
        }
}

function Set_SES_Long_Push(F)
{
        if (confirm(SW_SES_BTN.MSG3)) {
                F.submit_button.value = "Wireless_Basic";
                F.submit_type.value = "Set_SES_Long_Push";
                F.change_action.value = "gozila_cgi";
                F.next_page.value = "Wireless_Basic.asp";
                F.submit();
        }
}

function init()
{
	init_form_session_key(document.forms[0], "apply.cgi");
	init_gmode = document.wireless.wl_net_mode.selectedIndex;

	wl_enable_disable(document.wireless,'<% nvram_else_match("wl_net_mode","disabled","0","1"); %>');
<% support_invmatch("SES_SUPPORT", "1", "<!--"); %>
	//ses_enable_disable(document.wireless,'<% nvram_get("ses_enable"); %>');
<% support_invmatch("SES_SUPPORT", "1", "-->"); %>
}
</SCRIPT>

</HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM name=wireless onSubmit="return false;" method=<% get_http_method(); %> action=apply.cgi>
<input type=hidden name=submit_button value="Wireless_Basic">
<input type=hidden name=gui_action value="Apply">
<input type=hidden name=submit_type >
<input type=hidden name=change_action >
<input type=hidden name=next_page >

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>
  <TBODY>
  <TR>
    <TD borderColor=#e7e7e7 width=164 bgColor=#e7e7e7 height=1><IMG height=15 
      src="image/UI_03.gif" width=164 border=0></TD>
    <TD width=645 height=1><IMG height=15 src="image/UI_02.gif" 
      width=645 border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 
height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0 width="633">
        <TBODY>

        <TR>
          <TD width=156 bgColor=#5b5b5b height=25>
               <P align=right><B><font face="Arial" color="#FFFFFF" style="font-size: 9pt">
                <script>Capture(wlanleftmenu.wirelessnet)</script></font></B></P>
          </TD>
          <TD width=8  bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD height=25 width=21>&nbsp;</TD>
          <TD width=156 height=25>&nbsp;</TD>
          <TD width=276 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
         
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25 width=21>&nbsp;</TD>
          <TD width=156 height=25>&nbsp;<font face="Arial" style="font-size: 8pt"><script>Capture(wlansetup.networkmode)</script>:&nbsp;</font></TD>
          <TD width=276 height=25>&nbsp;&nbsp;<font face=verdana size=2><b><select name="wl_net_mode" onChange=SelWL(this.form.wl_net_mode.selectedIndex,this.form)>
	  		<option value="disabled" <% nvram_match("wl_net_mode", "disabled", "selected"); %>><script>Capture(share.disabled)</script></option>
	  		<option value="mixed" <% nvram_match("wl_net_mode", "mixed", "selected"); %>><script>Capture(wlansetup.mixed)</script></option>
	  		<option value="b-only" <% nvram_match("wl_net_mode", "b-only", "selected"); %>><script>Capture(wlansetup.bonly)</script></option>
			<option value="g-only" <% nvram_match("wl_net_mode", "g-only", "selected"); %>><script>Capture(wlansetup.gonly)</script></option>
		</select></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25 width=21>&nbsp;</TD>
          <TD width=156 height=25>&nbsp;<font face="Arial" style="font-size: 8pt"><script>Capture(wlansetup.ssid)</script>:&nbsp;</font></TD>
          <TD width=276 height=25>&nbsp;&nbsp;<INPUT maxLength=32 value='<% nvram_get("wl_ssid"); %>' name="wl_ssid" size="20"  onBlur=valid_name(this,"SSID")></font></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25 width=21>&nbsp;</TD>
          <TD width=156 height=25>&nbsp;<font face="Arial" style="font-size: 8pt"><script>Capture(wlansetup.channel)</script>:&nbsp;</font></TD>
          <TD width=276 height=25>&nbsp;&nbsp;<select name="wl_channel" onFocus="check_action(this,0)">
<script language=javascript>
	var max_channel = '<% get_wl_max_channel(); %>';
	var wl_channel = '<% nvram_get("wl_channel"); %>';
	var buf = "";
	var ch = "";
	//var freq = new Array("","2.412","2.417","2.422","2.427","2.432","2.437","2.442","2.447","2.452","2.457","2.462","2.467","2.472");
	for(i=1 ; i<=max_channel ; i++){
		if(i == wl_channel)	buf = "selected";
		else			buf = "";
		ch = eval("wlansetup.ch"+i);
		document.write("<option value="+i+" "+buf+">"+i+" - "+ch+"</option>");
	}
</script>
		  </select></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=30>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=30>&nbsp;</TD>
          <TD height=30 width=21>&nbsp;</TD>
          <TD width=156 height=30>&nbsp;<font face="Arial" style="font-size: 8pt"><script>Capture(wlansetup.ssidbroadcast)</script>:&nbsp;</font></TD>
          <TD width=276 height=40>
          	      <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; border-width: 0" bordercolor="#111111" id="AutoNumber17" width=270>
                  <tr>
                    <td style="border-style: none; border-width: medium" height=40 width=270>
          <span >&nbsp;</span><INPUT type=radio value=0 name=wl_closed <% nvram_match("wl_closed","0","checked"); %>><b><script>Capture(share.enable)</script></b>&nbsp;&nbsp;&nbsp;<INPUT type=radio value=1 name=wl_closed <% nvram_match("wl_closed","1","checked"); %>><b><script>Capture(share.disable)</script></td>
                  </tr>
                </table>
              </TD>
          <TD width=15 background=image/UI_05.gif height=45>&nbsp;</TD></TR>                                              
<% support_invmatch("WL_STA_SUPPORT", "1", "<!--"); %>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 colSpan=3 
            height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="21">&nbsp;</TD>
          <TD width=156 height=25>&nbsp;<font face="Arial" style="font-size: 8pt">SSID of associating AP:</font></TD>
          <TD width=262 height=25>&nbsp;&nbsp;<INPUT maxLength=32 value='<% nvram_get("wl_ap_ssid"); %>' name="wl_ap_ssid" size="20"  onBlur=valid_name(this,"SSID")></TD>
          <TD width=15 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>                                              
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 colSpan=3 
            height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="21">&nbsp;</TD>
          <TD width=156 height=25>&nbsp;<font face="Arial" style="font-size: 8pt">Default IP of associating AP:</font></TD>
          <TD width=262 height=25>&nbsp;<input type=hidden name="wl_ap_ip" value=4>
                <INPUT class=num maxLength=3 size=3 value='<% get_single_ip("wl_ap_ip","0"); %>' name="wl_ap_ip_0" onBlur=valid_range(this,0,255,"IP")> .
                <INPUT class=num maxLength=3 size=3 value='<% get_single_ip("wl_ap_ip","1"); %>' name="wl_ap_ip_1" onBlur=valid_range(this,0,255,"IP")> .
                <INPUT class=num maxLength=3 size=3 value='<% get_single_ip("wl_ap_ip","2"); %>' name="wl_ap_ip_2" onBlur=valid_range(this,0,255,"IP")> .
                <INPUT class=num maxLength=3 size=3 value='<% get_single_ip("wl_ap_ip","3"); %>' name="wl_ap_ip_3" onBlur=valid_range(this,0,254,"IP")></TD>
          <TD width=15 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>                                              
<% support_invmatch("WL_STA_SUPPORT", "1", "-->"); %>
<% support_invmatch("WL_WDS_SUPPORT", "1", "<!--"); %>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25 width=21>&nbsp;</TD>
          <TD width=156 height=25>&nbsp;<font face="Arial" style="font-size: 8pt">Mode:&nbsp;</font></TD>
          <TD width=276 height=25>&nbsp;&nbsp;<font face=verdana size=2><b><select name="wl_mode">
	  		<option value="ap" <% nvram_match("wl_mode", "ap", "selected"); %>>Access Point</option>
			<option value="wds" <% nvram_match("wl_mode", "wds", "selected"); %>>Wireless Bridge</option>
		</select></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25 width=21>&nbsp;</TD>
          <TD width=156 height=25>&nbsp;<font face="Arial" style="font-size: 8pt">Bridge Restrict:&nbsp;</font></TD>
          <TD width=276 height=25>&nbsp;&nbsp;<font face=verdana size=2><b><select name="wl_lazywds">
	  		<option value="0" <% nvram_match("wl_lazywds", "0", "selected"); %>>Enabled</option>
			<option value="1" <% nvram_match("wl_lazywds", "1", "selected"); %>>Disabled</option>
		</select></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25 width=21>&nbsp;</TD>
          <TD width=156 height=25>&nbsp;<font face="Arial" style="font-size: 8pt">Remote Bridges:&nbsp;</font></TD>
          <TD width=276 height=25>&nbsp;&nbsp;<input type="hidden" name="wl_wds" value="4"><INPUT maxLength=17 size=17 name=wl_wds0  value='<% nvram_list("wl_wds", 0); %>' onblur=valid_macs_17(this)><br>&nbsp;<INPUT maxLength=17 size=17 name=wl_wds1  value='<% nvram_list("wl_wds", 1); %>' onblur=valid_macs_17(this)><br>&nbsp;<INPUT maxLength=17 size=17 name=wl_wds2  value='<% nvram_list("wl_wds", 2); %>' onblur=valid_macs_17(this)><br>&nbsp;<INPUT maxLength=17 size=17 name=wl_wds3  value='<% nvram_list("wl_wds", 3); %>' onblur=valid_macs_17(this)></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

<% support_invmatch("WL_WDS_SUPPORT", "1", "-->"); %>

<% support_invmatch("SES_BUTTON_SUPPORT", "1", "<!--"); %>
                <TR id="ses_on">
          <TD align=right width=156 bgColor=#e7e7e7 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25></TD>
          <TD height=25 width="21"></TD>
            <td colSpan=2 width="432" height="79" bgcolor="#FFFFFF" colspan="2">
                <p align="center">
<!--
                <img border="0" src="image/SES-button-color.gif" width="50" height="50"><br>
-->
                <input type='image' name='B2' src="image/SES-button-color.gif" onclick='Set_SES_Short_Push(this.form)' width="50" height="50"><br>
                <font face="Arial" style="font-size: 8pt"><b><script>Capture(bmenu.statu)</script>: </b><script>document.write(SW_SES_BTN.<% get_ses_status(); %>)</script></font></td>
          <TD width=15 background=image/UI_05.gif height=25></TD></TR>
                <TR id="ses_off">
          <TD align=right width=156 bgColor=#e7e7e7 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25></TD>
          <TD height=25 width="21"></TD>
            <td colSpan=2 width="432" height="79" bgcolor="#FFFFFF" colspan="2">
                <p align="center">
<!--
                <img border="0" src="image/SES-button-color.gif" width="50" height="50"><br>
-->
                <input type='image' name='B2' src="image/SES-button-color.gif" width="50" height="50"><br>
                <font face="Arial" style="font-size: 8pt"><b><script>Capture(bmenu.statu)</script>: </b><script>document.write(SW_SES_BTN.<% get_ses_status(); %>)</script></font></td>
          <TD width=15 background=image/UI_05.gif height=25></TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25></TD>
          <TD  height=25 width="21"></TD>
          <TD colSpan=2 width="432" height="25" bgcolor="#FFFFFF" colspan="2"><p align="center">

	 
 <script>document.write("<input type=button name=B1 +  value=\"" + SW_SES_BTN.RESET + "\" onClick='Set_SES_Long_Push(this.form)'>");</script> 

	</TD>
          <TD width=15 background=image/UI_05.gif height=25></TD></TR>
<% support_invmatch("SES_BUTTON_SUPPORT", "1", "-->"); %>



        <TR>
          <TD bgColor=#e7e7e7>&nbsp;</TD>
          <TD background=image/UI_04.gif>&nbsp;</TD>
          <TD>&nbsp;</TD>
          <TD>&nbsp;</TD>
          <TD>&nbsp;</TD>
          <TD background=image/UI_05.gif>&nbsp;</TD></TR>                                              


        </TBODY></TABLE></TD>
    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF"><span style="font-family: Arial"><br>

<script>Capture(hwlbas2.right1)</script><br>
<script language=javascript>
help_link("help/HWireless.asp");
Capture(share.more);
document.write("</a></b>");
</script>
</span></font>
          </TD>
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
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Wireless_Basic.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
