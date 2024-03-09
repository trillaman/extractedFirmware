<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>DDNS</TITLE>
<% no_cache(); %>
<% charset(); %>
<% web_include_file("filelink.asp"); %>
<SCRIPT language=JavaScript>
document.title = share.ddns;
function check_email(email_url)
{
	var email_parttern = /^\w+(\.\w+)?@([A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;
	if(email_url.value != "" && !email_parttern.test(email_url.value))
	{
		alert(errmsg.erremail);
		email_url.value = email_url.defaultValue;
		return false;
	}
	return true;
}
function ddns_check(F,T)
{
	if(F.ddns_enable.value == 0)
		return true;
	else if(F.ddns_enable.value == 1){
		username = eval("F.ddns_username");
		passwd = eval("F.ddns_passwd");
		hostname = eval("F.ddns_hostname");
	}
	else {
		username = eval("F.ddns_username_"+F.ddns_enable.value);
		passwd = eval("F.ddns_passwd_"+F.ddns_enable.value);
		hostname = eval("F.ddns_hostname_"+F.ddns_enable.value);
	}

	if(username.value == ""){
//              alert("You must input a username!");
		if(F.ddns_enable.value != 2)
		{
                alert(errmsg.err0);
		}
		else
		{
			alert(errmsg.err60);
		}
		username.focus();
		return false;
	}
	else 
	{
		if(F.ddns_enable.value == 2)
		{
			var email_parttern = /^\w+(\.\w+)?@([A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/;
			if(!email_parttern.test(username.value))
			{
				alert(errmsg.erremail);
		username.focus();
		return false;
	}
		}
	}
	if(passwd.value == ""){
//              alert("You must input a passwd!");
		if(F.ddns_enable.value != 2)
		{
			alert(errmsg.err6);
		}
		else
		{
			alert(errmsg.errkey);
		}
		passwd.focus();
		return false;
	}
	else
	{
		if(F.ddns_enable.value == 2 && passwd.value.length < 16)
		{
			alert(errmsg.errkeylen);
			passwd.focus();
			return false;
		}
	}
	if(F.ddns_enable.value != 4){
		if(hostname.value == ""){
//              	alert("You must input a hostname!");
			if(F.ddns_enable.value == 1)
			{
				alert(errmsg.err7);
			}
			else
			{
				alert(errmsg.errdomain);
			}
			hostname.focus();
			return false;
		}
		else
		{
			if(F.ddns_enable.value == 2)
            		{
				var parttern = /^[\w-]+\.[\w]+(\.[\w]+(\.[\w]+)?)?$/;
				if(!parttern.test(hostname.value))
				{
					alert(errmsg.errdomainformat);
					hostname.focus();
					return false;
				}
			}
		}	
	}
	return true;
}
function to_save(F)
{
	if(ddns_check(F,"update") == true){
		F.change_action.value = "gozila_cgi";
		F.submit_button.value = "DDNS";
		F.submit_type.value = "save";
       		F.gui_action.value = "Apply";
       		F.submit();
	}
}
function ddns_modify(F)
{
	var tmp = <% nvram_get("ddns_enable"); %>;
	var backmx = "NO" ;
	var wildcard = "OFF";
	F.ddns_changed.value = 0 ; 
	if ( F.ddns_enable.options[F.ddns_enable.selectedIndex].value != tmp ) 
	{
		F.ddns_changed.value = 1 ; 
		return ; 
	}
	if ( tmp == 1 ) 
	{
		if ( F.ddns_backmx[0].checked ) backmx = "YES";
		if ( F.ddns_wildcard[0].checked ) wildcard = "ON";
		if ( ( F.ddns_username.value != "<% nvram_get("ddns_username"); %>" ) || 
		     ( F.ddns_passwd.value != "<% nvram_invmatch("ddns_passwd","","d6nw5v1x2pc7st9m"); %>" ) || 
		     ( F.ddns_hostname.value != "<% nvram_get("ddns_hostname"); %>" ) || 
		     ( F.ddns_service.options[F.ddns_service.selectedIndex].value != "<% nvram_get("ddns_service"); %>" ) || 
		     ( F.ddns_mx.value != "<% nvram_get("ddns_mx"); %>" ) || 
		     ( backmx != "<% nvram_get("ddns_backmx"); %>" ) || 
		     ( wildcard != "<% nvram_get("ddns_wildcard"); %>" ))
		{
			F.ddns_changed.value = 1 ; 
			return;
		}
		
	}
	else if ( tmp == 2 ) 
	{
		if ( ( F.ddns_username_2.value != "<% nvram_get("ddns_username_2"); %>"	) ||
		     ( F.ddns_passwd_2.value != "<% nvram_invmatch("ddns_passwd_2","","d6nw5v1x2pc7st9m"); %>" ) ||
		     ( F.ddns_hostname_2.value != "<% nvram_get("ddns_hostname_2"); %>" ))
		{
			F.ddns_changed.value = 1 ; 
			return;
		}
	}
}
function to_submit(F)
{
	ddns_modify(F);
	if(ddns_check(F,"save") == true){
		F.submit_button.value = "DDNS";
      		F.gui_action.value = "Apply";
		F.submit();
	}
}
function SelDDNS(num,F)
{
        F.submit_button.value = "DDNS";
        F.change_action.value = "gozila_cgi";
        F.ddns_enable.value=F.ddns_enable.options[num].value;
        F.submit();
}
function show_status()
{
        var RetMsg="<% show_ddns_status(); %>";
        if( RetMsg=="  " || RetMsg.length < 2)
                return;
        else if(RetMsg.substring(0, 6) == "ddnsm.")
			Capture(eval(RetMsg));
		else
                Capture(RetMsg);
}

function init()
{
	init_form_session_key(document.forms[0], "apply.cgi");
}


</SCRIPT>
</HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM name=ddns method=<% get_http_method(); %> action=apply.cgi?session_id=<% nvram_get("session_key"); %>>
<input type=hidden name=submit_button>
<input type=hidden name=gui_action>
<input type=hidden name=change_action>
<input type=hidden name=submit_type>
<input type=hidden name=ddns_changed>
<!--input type=hidden name=wait_time value=6-->

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>
  <TBODY>
  <TR bgColor=black>
    <TD 
    style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" borderColor=#e7e7e7 width=163 bgColor=#e7e7e7 height=1>
    <IMG height=15 src="image/UI_03.gif" width=164 border=0></TD>
    <TD style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" width=646 height=1><IMG height=15 src="image/UI_02.gif" width=645 border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD width=156 bgColor=#5b5b5b colSpan=3 height=25>
            <P align=right><B><FONT style="FONT-SIZE: 9pt" face=Arial color=#ffffff><script>Capture(share.ddns)</script></FONT></B></P></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=17 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;<script>Capture(ddns.srv)</script>:&nbsp;</TD>
          <TD width=296 height=25><SELECT onChange=SelDDNS(this.form.ddns_enable.selectedIndex,this.form) name="ddns_enable"> 
	<script>
		var flag;
		var lang = '<% nvram_get("language"); %>';
		var ddns_enable = '<% nvram_selget("ddns_enable"); %>';
		var ddns3322 = '0';
		var peanuthull = '0';
<% support_invmatch("DDNS3322_SUPPORT", "1", "//"); %> ddns3322 = '1';
<% support_invmatch("PEANUTHULL_SUPPORT", "1", "//"); %> peanuthull = '1';

		if(ddns_enable == '0')
			flag = '0';
		if (ddns3322 == '1' && peanuthull == '1') {
			if(lang == "EN" || lang == "SC") {
				flag = "34";
			}
			else {
				flag = "12";
			}
		}
		else
			flag = "12";

		
		if(ddns_enable == "0") {
			document.write("<OPTION value=0 selected>"+share.disable+"<b></b></OPTION>");
		}
		else
			document.write("<OPTION value=0>"+share.disable+"<b></b></OPTION>");

		if(flag == "12") {
			if(ddns_enable == '1')
				document.write("<OPTION value=1 selected>"+ddns.dyndns+"<b></b></OPTION>");
			else
				document.write("<OPTION value=1>"+ddns.dyndns+"<b></b></OPTION>");
			if(ddns_enable == '2')
				document.write("<OPTION value=2 selected>"+ddns.tzo+"<b></b></OPTION>");
			else
				document.write("<OPTION value=2>"+ddns.tzo+"<b></b></OPTION>");
		}
		else if(flag == "34") {
			if(ddns_enable == '3')
				document.write("<OPTION value=3 selected>"+ddns.ddns3322+"<b></b></OPTION>");
			else
				document.write("<OPTION value=3>"+ddns.ddns3322+"<b></b></OPTION>");
			if(ddns_enable == '4')
				document.write("<OPTION value=4 selected>"+ddns.peanuthull+"<b></b></OPTION>");
			else
				document.write("<OPTION value=4>"+ddns.peanuthull+"<b></b></OPTION>");
		}
	</script>

	</SELECT>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD colSpan=4><HR color=#b5b5e6 SIZE=1></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

        <% show_ddns_setting(); %>               

<% nvram_else_selmatch("ddns_enable","0","","<!--"); %>

        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</FONT></TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</FONT></TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
		<TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</FONT></TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
    	<TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</FONT></TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
  
<% nvram_else_selmatch("ddns_enable","0","","-->"); %>
          
        <% nvram_selmatch("ddns_enable","0","<!--"); %>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;<script>Capture(share.interipaddr)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25><FONT style="FONT-SIZE: 8pt" face=Arial><% show_ddns_ip(); %></FONT></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;<script>Capture(bmenu.statu)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25><FONT color=red><script>show_status();</script></FONT></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=397 height=25 colSpan=2><script>document.write("<input type=button name=update" + " value='" + sbutton.update + "' onclick=to_save(this.form)>");</script></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <% nvram_selmatch("ddns_enable","0","-->"); %>

        <TR>
          <TD width=44 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=65 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=47 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=454 colSpan=6>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR>

	</TBODY></TABLE></TD>

    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF"><span ><br>
<script>Capture(hddns2.right1)</script><br>
<script language=javascript>
help_link("help/HDDNS.asp");
Capture(share.more);
document.write("</a></b>");
</script>
</span></font>
</TD>
          <TD width=9 bgColor=#2971b9 height=25>&nbsp;</TD></TR>

</TBODY></TABLE></TD></TR>
  <TR>
    <TD width=809 colSpan=2>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD width=156 bgColor=#e7e7e height=30>&nbsp;</TD>
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
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('DDNS.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
