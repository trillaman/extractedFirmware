<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Management</TITLE>
<% no_cache(); %>
<% charset(); %>
<% web_include_file("filelink.asp"); %>
<SCRIPT language=JavaScript>
document.title = adtopmenu.manage;
var EN_DIS1 = '<% nvram_get("remote_management"); %>'	
var wan_proto = '<% nvram_get("wan_proto"); %>'
var snmp_confirm = 0

<% web_include_file("md5_2.js"); %>

function PasswdLen(F)
{
	var sLen = F.snmpv3_passwd.value;
	if( sLen.length < 8 )
	{
		F.snmpv3_passwd.value = F.snmpv3_passwd.defaultValue;
		alert("SNMPv3 Password must be at least 8 characters long");
	}
	if( F.snmpv3_passwd.value != F.SnmpPasswdConfirm.value )
	{
		snmp_confirm = 1;
	}
	else 
	{
		snmp_confirm = 0;
	}
}
function ConfirmPasswd(F)
{
	if( F.snmpv3_passwd.value != F.SnmpPasswdConfirm.value )
	{
		snmp_confirm = 1;
	}
}

function SelPort(num,F)
{	
	if(num == 1 && F.PasswdModify.value == 1){
		 if(ChangePasswd(F) == true)
			port_enable_disable(F,num);	
	}
	else
		port_enable_disable(F,num);
}
function control_remote_mgt(F)
{
	if(F.remote_management[0].checked == true)
	{
		if(F._http_enable.checked == true)
		{
			if(F._https_enable.checked == true)
			{
				choose_enable(F._remote_mgt_https);
				if(F._remote_mgt_https.checked == true)
				{
					choose_disable(F.http_wanport);
				}
				else 
				{
					choose_enable(F.http_wanport);
				}
			}
			else 
			{
				choose_enable(F.http_wanport);
				choose_disable(F._remote_mgt_https);
				F._remote_mgt_https.checked = false;
			}
		}
		else 
		{
			choose_disable(F.http_wanport);
			choose_disable(F._remote_mgt_https);
			if(F._https_enable.checked == true)
			{
				F._remote_mgt_https.checked = true;
			}
			else 
			{
				F._remote_mgt_https.checked = false;
			}
		}
	}
	else 
	{
		choose_disable(F.http_wanport);
		choose_disable(F._remote_mgt_https);
		if(F._https_enable.checked == false && F._http_enable.checked == true)
		{
			F._remote_mgt_https.checked = false;
		}
		else if(F._https_enable.checked == true && F._http_enable.checked == false)
		{
			F._remote_mgt_https.checked = true;
		}
	}
}
function port_enable_disable(F,I)
{
	EN_DIS2 = I;
	control_remote_mgt(F);
/*
	if ( I == "0" ){
		choose_disable(F.http_wanport);
		choose_disable(F._remote_mgt_https);
	}
	else{
		choose_enable(F.http_wanport);
		choose_enable(F._remote_mgt_https);
	}

	if(F._http_enable.checked == false && F._https_enable.checked == true) {
		choose_disable(F._remote_mgt_https);
		F._remote_mgt_https.checked = true;
	}

	if(F._http_enable.checked == true && F._https_enable.checked == false)
		choose_disable(F._remote_mgt_https);
*/
}
function ChangePasswd(F)
{
	if((F.PasswdModify.value==1 && F.http_passwd.value == "d6nw5v1x2pc7st9m") || F.http_passwd.value == "admin")
	{
//              if(confirm('The Router is currently set to its default password. As a security measure, you must change the password before the Remote Management feature can be enabled. Click the OK button to change your password.  Click the Cancel button to leave the Remote Management feature disabled.'))
                if(confirm(manage2.changpass))
		{
			//window.location.replace('Management.asp?session_id=<% nvram_get("session_key"); %>');
			F.remote_management[1].checked = true;
			return false;
		}
		else
		{
			F.remote_management[1].checked = true;
			return false;
		}
	}
	else 
		return true;
}

function en_value(data)
{
	return hex_md5(data);
}


function valid_password(F)
{
	if (F.http_passwd.value != F.http_passwdConfirm.value)
	{	
//              alert("Confirmed password did not match Entered Password.  Please re-enter password");
                alert(manage2.vapass);
		F.http_passwdConfirm.focus();
		F.http_passwdConfirm.select();
		return false;
	}
	return true;
}
function to_submit(F)
{
	if( F.http_passwd.value != F.http_passwdConfirm.value )
		{
//              alert('Password confirmation is not matched.');
                alert(manage2.passnot);
		return;
		}
	else if( snmp_confirm == 1 )
	{	
		alert('SNMPv3 Password confirmation is not matched.');
//		alert(snmp_confirm);
		snmp_confirm = 0;
		return;
	}
	else
		F.gui_action.value='Apply';

	valid_password(F);

	if(F.remote_management[0].checked == true){
		if(!ChangePasswd(F))
			return;
	}

	if(F._remote_mgt_https){
		if(F.http_enable.checked == true && F.https_enable.checked == false)
			F._remote_mgt_https.checked == false;
		if(F.http_enable.checked == false && F.https_enable.checked == true)
			F._remote_mgt_https.checked == true;
		if(F._remote_mgt_https.checked == true) F.remote_mgt_https.value = 1;
		else 	 F.remote_mgt_https.value = 0;
	}
	if(F._http_enable){
		if(F._http_enable.checked == true) F.http_enable.value = 1;
		else 	 F.http_enable.value = 0;
	}
	if(F._https_enable){
		if(F._https_enable.checked == true) F.https_enable.value = 1;
		else 	 F.https_enable.value = 0;
	}

	if(F._http_enable.checked == false && F._https_enable.checked == false) {
//              alert("You must at least select a web server!");
                alert(manage2.selweb);
		return;
	}

	if(F.upnp_enable[0].checked == true && '<% nvram_get("upnp_enable"); %>' == '0') {
		F.need_reboot.value = "1";
		F.wait_time.value = "10";
	}
	//encode passwd
	//var en_pwd = en_value(F.http_passwd.value);
	//F.http_passwd.value = en_pwd;
	//F.http_passwdConfirm.value = en_pwd;

	F.submit_button.value = "Management";
	F.submit();
	return;
}
function handle_https(F)
{
	control_remote_mgt(F);
/*
	if(F._https_enable.checked == true && F.remote_management[0].checked == true) {
		choose_enable(F._remote_mgt_https);
	}
	else {
		choose_disable(F._remote_mgt_https);
	}
*/
}
function SelUPNP(num,F)
{
	if(num == 1) {
		choose_enable(F.upnp_config[0]);
		choose_enable(F.upnp_config[1]);
		choose_enable(F.upnp_internet_dis[0]);
		choose_enable(F.upnp_internet_dis[1]);
	}
	else {
		choose_disable(F.upnp_config[0]);
		choose_disable(F.upnp_config[1]);
		choose_disable(F.upnp_internet_dis[0]);
		choose_disable(F.upnp_internet_dis[1]);
	}
}
function init() 
{    
	init_form_session_key(document.forms[0], "apply.cgi");
	SelUPNP('<% nvram_get("upnp_enable"); %>',document.password); 
	port_enable_disable(document.password, '<% nvram_get("remote_management"); %>');
}        
	
</SCRIPT>

</HEAD>
<BODY vLink=#b5b5e6 aLink=#ffffff link=#b5b5e6 onload=init()>
<DIV align=center>
<FORM name=password method=<% get_http_method(); %> action=apply.cgi?session_id=<% nvram_get("session_key"); %>>
<input type=hidden name=submit_button>
<input type=hidden name=change_action>
<input type=hidden name=gui_action>
<INPUT type=hidden name=PasswdModify value='<% nvram_else_match("http_passwd", "admin", "1", "0"); %>'> 
<input type=hidden name=remote_mgt_https>
<input type=hidden name=http_enable>
<input type=hidden name=https_enable>
<input type=hidden name=wait_time value=4>
<input type=hidden name=need_reboot value=0>

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>
  <TBODY>
  <TR bgColor=black>
    <TD style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" borderColor=#e7e7e7 width=163 bgColor=#e7e7e7 height=1><IMG height=15 src="image/UI_03.gif" width=164 border=0></TD>
    <TD style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" width=646 height=1><IMG height=15 src="image/UI_02.gif" width=645 border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0 width="633">
        <TBODY>        
        <TR>
          <TD width=156 bgColor=#5b5b5b colSpan=3 height=25><P align=right><B><FONT style="FONT-SIZE: 9pt" face=Arial color=#ffffff><script>Capture(adleftmenu.routerpsw)</script></FONT></B></P></TD>
          <TD width=5 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=454 colSpan=6 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <!--TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25><P align=right><FONT style="FONT-WEIGHT: 700">Local Router Access</FONT></P></TD>
          <TD width=8 background=image/UI_04.gif height=25></TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt"><span >User Name</span>:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><FONT style="FONT-SIZE: 8pt" face=Arial><% nvram_get("http_username"); %></FONT></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR-->
        
<% support_invmatch("DDM_SUPPORT", "1", "<!--"); %>
	<TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25><P align=right><FONT style="FONT-WEIGHT: 700">Local Router Access</FONT></P></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;Router Account:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=text maxLength=63 size=20 value='<% nvram_get("http_username"); %>' name=http_username onBlur=valid_name(this,"Account",SPACE_NO)></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<% support_invmatch("DDM_SUPPORT", "1", "-->"); %>

	<TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25><P align=right><FONT style="FONT-WEIGHT: 700">

<!-- % support_invmatch("DDM_SUPPORT", "1", "Local Router Access"); %  -->
<% support_match("DDM_SUPPORT", "1", "<!--"); %>
<script>Capture(adleftmenu.localaccess)</script>
<% support_match("DDM_SUPPORT", "1", "-->"); %>

          </FONT></P></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;<script>Capture(adleftmenu.routerpsw)</script>:&nbsp;</FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=password maxLength=63 size=20 value="d6nw5v1x2pc7st9m" name="http_passwd" onBlur=valid_name(this,"Password",SPACE_NO)></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;<script>Capture(mgt.reconfirm)</script>:&nbsp;</FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=password maxLength=63 size=20 value="d6nw5v1x2pc7st9m" name=http_passwdConfirm onBlur=valid_name(this,"Password",SPACE_NO)></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=30>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=30>&nbsp;</TD>
          <TD colSpan=6 width="454">
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=30>&nbsp;</TD>
                <TD width=13 height=30>&nbsp;</TD>
                <TD vAlign=top width=410 colSpan=3 height=30><HR color=#b5b5e6 SIZE=1></TD>
                <TD width=15 height=30>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=30>&nbsp;</TD></TR>        
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25><P align=right><FONT style="FONT-WEIGHT: 700"><script>Capture(manage2.webacc)</script></FONT></P></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25>&nbsp;<script>Capture(manage2.accser)</script>:&nbsp;</TD>
          <TD width=263 height=25><INPUT type=checkbox value=1 name=_http_enable <% nvram_match("http_enable","1","checked"); %> onClick="handle_https(this.form)"><b>HTTP</b>&nbsp;&nbsp;&nbsp;<INPUT type=checkbox value=1 name=_https_enable <% nvram_match("https_enable","1","checked"); %> onClick=handle_https(this.form)><b>HTTPS</b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25>&nbsp;<script>Capture(manage2.wlacc)</script>:&nbsp;</TD>
          <TD width=263 height=25><INPUT type=radio value=0 name=web_wl_filter <% nvram_match("web_wl_filter","0","checked"); %>><b><script>Capture(share.enable)</script></b>&nbsp;&nbsp;&nbsp;<INPUT type=radio value=1 name=web_wl_filter <% nvram_match("web_wl_filter","1","checked"); %>><b><script>Capture(share.disable)</script></b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=30>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=30>&nbsp;</TD>
          <TD colSpan=6 width="454">
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=30>&nbsp;</TD>
                <TD width=13 height=30>&nbsp;</TD>
                <TD vAlign=top width=410 colSpan=3 height=30><HR color=#b5b5e6 SIZE=1></TD>
                <TD width=15 height=30>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=30>&nbsp;</TD></TR>        
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25><p align="right"><FONT style="FONT-WEIGHT: 700"><span ><script>Capture(adleftmenu.remoteaccess)</script></span></FONT></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;<script>Capture(mgt.remotemgt)</script>:</SPAN></TD>
          <TD width=263 height=25><INPUT type=radio value=1 name=remote_management <% nvram_match("remote_management","1","checked"); %> OnClick=SelPort(1,this.form)><b><script>Capture(share.enable)</script></b>&nbsp;&nbsp;&nbsp;<INPUT type=radio value=0 name=remote_management <% nvram_match("remote_management","0","checked"); %> OnClick=SelPort(0,this.form)><b><script>Capture(share.disable)</script></b></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;<script>Capture(mgt.mgtport)</script>:&nbsp;</SPAN></TD>
          <TD width=263 height=25>&nbsp;&nbsp;<INPUT class=num maxLength=5 size=5 value='<% nvram_get("http_wanport"); %>' onBlur='valid_range(this,1,65535,"Port%20number")' name="http_wanport"></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<% support_invmatch("HTTPS_SUPPORT", "1", "<!--"); %>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25>&nbsp;<script>Capture(mgt.https)</script>:&nbsp;</TD>
          <TD width=263 height=25>&nbsp;<INPUT type=checkbox value=1 name=_remote_mgt_https <% nvram_match("remote_mgt_https","1","checked"); %> onClick="control_remote_mgt(this.form)"></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<% support_invmatch("HTTPS_SUPPORT", "1", "-->"); %>
<% support_invmatch("SNMP_SUPPORT", "1", "<!--"); %>
        
        <TR>
          <TD width=156 bgColor=#5b5b5b colSpan=3 height=25><P align=right><B><FONT style="FONT-SIZE: 9pt" color=#ffffff>SNMP</FONT></B></P></TD>
          <TD width=5 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD colSpan=6 width="454">
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=25>&nbsp;</TD>
                <TD width=12 height=25>&nbsp;</TD>
                <TD style="BORDER-TOP: 1px solid; BORDER-LEFT-WIDTH: 1px; BORDER-BOTTOM-WIDTH: 1px; BORDER-RIGHT-WIDTH: 1px" borderColor=#b5b5e6 width=411 height=25>&nbsp;</TD>
                <TD width=15 height=25>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
         <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25><P align=right><FONT style="FONT-WEIGHT: 700">Identification</FONT></P></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;Contact:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=text maxLength=63 size=20 value='<% nvram_get("snmp_contact"); %>' name="snmp_contact" onBlur=valid_name(this,"Password",SPACE_NO)></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;Device Name:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=text maxLength=63 size=20 value='<% nvram_get("router_name"); %>' name=router_name onBlur=valid_name(this,"router_name")></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR> 
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;Location:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=text maxLength=63 size=20 value='<% nvram_get("snmp_location"); %>' name=snmp_location onBlur=valid_name(this,"Password",SPACE_NO)></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=30>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=30>&nbsp;</TD>
          <TD colSpan=6 width="454">
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=30>&nbsp;</TD>
                <TD width=13 height=30>&nbsp;</TD>
                <TD vAlign=top width=410 colSpan=3 height=30><HR color=#b5b5e6 SIZE=1></TD>
                <TD width=15 height=30>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=30>&nbsp;</TD></TR>       
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;Get Community:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=text maxLength=63 size=20 value='<% nvram_get("snmp_getcom"); %>' name="snmp_getcom" onBlur=valid_name(this,"Password",SPACE_NO)></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;Set Community:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=text maxLength=63 size=20 value='<% nvram_get("snmp_setcom"); %>' name=snmp_setcom onBlur=valid_name(this,"Password",SPACE_NO)></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>   
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;SNMP Trusted Host:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=text maxLength=63 size=20 value='<% nvram_get("snmp_trust"); %>' name=snmp_trust onBlur=valid_name(this,"Password",SPACE_NO)></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;SNMP Trap - Community:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=text maxLength=63 size=20 value='<% nvram_get("trap_com"); %>' name=trap_com onBlur=valid_name(this,"Password",SPACE_NO)></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR> 
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;SNMP Trap - Destination:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;<b><% prefix_ip_get("lan_ipaddr",1); %></b></SPAN><INPUT type=num maxLength=3 size=3 value='<% nvram_get("trap_dst"); %>' name=trap_dst onBlur=valid_range(this,1,254,"IP")></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>


        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;SNMPv3 UserName:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=text maxLength=63 size=20 value='<% nvram_get("snmpv3_username"); %>' name=snmpv3_username ></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR> 


        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;SNMPv3 Password:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=password maxLength=63 size=20 value="d6nw5v1x2pc7st9m" name=snmpv3_passwd onBlur=PasswdLen(this.form)></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR> 


        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><FONT style="FONT-SIZE: 8pt">&nbsp;Re-enter to confirm:&nbsp;&nbsp; </FONT></TD>
          <TD width=263 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;</SPAN><INPUT type=password maxLength=63 size=20 value="d6nw5v1x2pc7st9m" name=SnmpPasswdConfirm onBlur=PasswdLen(this.form)></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR> 



<% support_invmatch("SNMP_SUPPORT", "1", "-->"); %>


        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=30>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=30>&nbsp;</TD>
          <TD colSpan=6 width="454">
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=30>&nbsp;</TD>
                <TD width=13 height=30>&nbsp;</TD>
                <TD vAlign=top width=410 colSpan=3 height=30><HR color=#b5b5e6 SIZE=1></TD>
                <TD width=15 height=30>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=30>&nbsp;</TD></TR>        


        <TR>
          <TD width=156 bgColor=#5b5b5b colSpan=3 height=25><P align=right><B><FONT style="FONT-SIZE: 9pt" color=#ffffff>UPnP</FONT></B></P></TD>
          <TD width=5 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD colSpan=6 width="454">
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=25>&nbsp;</TD>
                <TD width=12 height=25>&nbsp;</TD>
                <TD width=411 height=25>&nbsp;</TD>
                <TD width=15 height=25>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;UPnP:&nbsp;</SPAN></TD>
          <TD width=263 height=25>
            <TABLE id=AutoNumber12 cellSpacing=0 cellPadding=0 width=242 border=0>
              <TBODY>
              <TR>
                <TD width=242 height=25><INPUT type=radio value=1 name=upnp_enable onClick="SelUPNP(this.value, this.form)" <% nvram_match("upnp_enable","1","checked"); %>><b><script>Capture(share.enable)</script></b>&nbsp;&nbsp;&nbsp;<INPUT type=radio value=0 name=upnp_enable onClick="SelUPNP(this.value, this.form)" <% nvram_match("upnp_enable","0","checked"); %>><b><script>Capture(share.disable)</script></b></TD>
                </TR></TBODY></TABLE></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>               
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;<script>Capture(mgt.upnpconfig)</script>:&nbsp;</SPAN></TD>
          <TD width=263 height=25>
            <TABLE id=AutoNumber12 cellSpacing=0 cellPadding=0 width=242 border=0>
              <TBODY>
              <TR>
                <TD width=242 height=25><INPUT type=radio value=1 name=upnp_config <% nvram_invmatch("upnp_config","0","checked"); %>><b><script>Capture(share.enable)</script></b>&nbsp;&nbsp;&nbsp;<INPUT type=radio value=0 name=upnp_config <% nvram_match("upnp_config","0","checked"); %>><b><script>Capture(share.disable)</script></b></TD>
                </TR></TBODY></TABLE></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>               
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25 width="42">&nbsp;</TD>
          <TD width=136 height=25><SPAN  style="FONT-SIZE: 8pt">&nbsp;<script>Capture(mgt.upnpinternetdis)</script>:&nbsp;</SPAN></TD>
          <TD width=263 height=25>
            <TABLE id=AutoNumber12 cellSpacing=0 cellPadding=0 width=242 border=0>
              <TBODY>
              <TR>
                <TD width=242 height=25><INPUT type=radio value=1 name=upnp_internet_dis <% nvram_match("upnp_internet_dis","1","checked"); %>><b><script>Capture(share.enable)</script></b>&nbsp;&nbsp;&nbsp;<INPUT type=radio value=0 name=upnp_internet_dis <% nvram_invmatch("upnp_internet_dis","1","checked"); %>><b><script>Capture(share.disable)</script></b></TD>
                </TR></TBODY></TABLE></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>               
        <TR>
          <TD width=42 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=62 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=52 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=12></TD>
          <TD width=17></TD>
          <TD width=13></TD>
          <TD width=136></TD>
          <TD width=263></TD>
          <TD width=13></TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25></TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF"><span style="font-family: Arial"><br>
<script>Capture(hmanage2.right1)</script><br><br>
<script>Capture(hmanage2.right2)</script><br>
<script language=javascript>
help_link("help/HManagement.asp");
Capture(share.more);
document.write("</a></b>");
</script>
<br><br>
<script>Capture(hmanage2.right3)</script><br><br>
<script>Capture(hmanage2.right4)</script><br>
<script language=javascript>
help_link("help/HManagement.asp");
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
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Management.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
