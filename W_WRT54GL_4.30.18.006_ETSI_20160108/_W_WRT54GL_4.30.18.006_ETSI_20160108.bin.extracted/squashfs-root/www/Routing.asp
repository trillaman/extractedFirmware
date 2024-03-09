<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Advanced Routing</TITLE>
<% no_cache(); %>
<% charset(); %>
<% web_include_file("filelink.asp"); %>
<meta http-equiv="content-type" content="text/html; charset=<script>document.write(lang_charset.set)</script>">

<SCRIPT language=javascript>
document.title = topmenu.advrouting;
var route_win = null;

function ViewRoute()
{
	route_win = do_open('RouteTable.asp', 'Route', 'alwaysRaised,resizable,scrollbars,width=720,height=600');
	route_win.focus();
}
function DeleteEntry(F)
{
//      if(confirm("Delete the Entry?")){
        if(confirm(errmsg2.err1)){
		F.submit_button.value = "Routing";
		F.change_action.value = "gozila_cgi";
		F.submit_type.value = 'del';
		F.submit();
	}
}
function i_data(F,data,k,isend,item)
{
	var i , idata=""; 
	if ( item == 0 ) 
	{
		idata = eval(data).value ; 
		return idata ; 
	}
	for(i=0; i<k; i++)
	{
                idata = idata + eval(data+i).value ;
		if ( i == k-1 )
		{
		    if ( !isend )idata = idata + ":";
		}
		else 
		    idata = idata + ".";
	}
	return idata ; 
} 
function chk_ip_gw(lanip,wanip,lanmask,wanmask,data)
{
	var sip = data[0].split(".");
	var mask = data[1].split(".");
	var gw = data[2].split(".");
	var i , dip,dmask;

	for(i=0; i<4; i++)
	{
		if (sip[i] != (mask[i]&sip[i]) ) return true ; 
		if ( data[3] == "wan" ) 
		{	
			dip = wanip.split(".");
			dmask = wanmask.split(".");
		}
		else
		{
			dip = lanip.split(".");
			dmask = lanmask.split(".");
		}
		if ( (gw[i] & dmask[i]) != ( dmask[i] & dip[i] ) ) return true ; 
	}
	return false ; 
}	
function chk_static_entry(F)
{
	var data = new Array();
	var sdata = new Array();
	var ddata = new Array();
	var i,j,k,idata="",returnvalue = ""; 
	var lanip = "<% nvram_get("lan_ipaddr"); %>";
	var wanip = "<% nvram_get("wan_ipaddr"); %>";
	var lanmask = "<% nvram_get("lan_netmask"); %>";
	var wanmask = "<% nvram_get("wan_netmask"); %>";
	data = "<% nvram_get("static_route"); %>".split(" ");
	idata = idata + i_data(F,"F.route_ipaddr_",4,0,1);
	idata = idata + i_data(F,"F.route_netmask_",4,0,1);
	idata = idata + i_data(F,"F.route_gateway_",4,0,1);
	idata = idata + i_data(F,"F.route_ifname",1,1,0);

	if(F.route_ipaddr_0.value == "0" && F.route_ipaddr_1.value == "0" && F.route_ipaddr_2.value == "0" && F.route_ipaddr_3.value == "0" && F.route_netmask_0.value == "0" && F.route_netmask_1.value == "0" && F.route_netmask_2.value == "0" && F.route_netmask_3.value == "0" && F.route_gateway_0.value == "0" && F.route_gateway_1.value == "0" && F.route_gateway_2.value == "0" && F.route_gateway_3.value == "0") {
		return true;
	}
	

	for(i=0; i<data.length; i++)
	{
		sdata = data[i].split(":"); 
		ddata = idata.split(":");
		k=0; 
		returnvalue = chk_ip_gw(lanip,wanip,lanmask,wanmask,ddata);		
		if ( (ddata[3]=="lan" && ddata[2] == lanip) || (ddata[3]=="wan" && ddata[2] == wanip) || returnvalue == true)
		{
			alert(errmsg.err82);	
			return false ; 
		}
		if( F.route_page.selectedIndex != i ) 
		{
		
			for(j=0; j<2; j++)
			{
				if ( sdata[j] == ddata[j] )
					k++;
			}
			if ( k==2 ) 
			{ 	
				//errmsg.err82="Invalid static route entry!";
				alert(errmsg.err82);	
				return false ; 
			}
		}
	}
	return true ; 
}
function to_submit(F)
{
	if(!chk_static_entry(F)) return;
	if(valid_value(F)){
		if( F.wk_mode.value != '<% nvram_get("wk_mode"); %>' ) {
			F.need_reboot.value = "1";
			F.wait_time.value = "10";
		}
		F.submit_button.value = "Routing";
		F.gui_action.value = "Apply";
		F.submit();
	}
}
function valid_value(F)
{
	if(!valid_ip(F,"F.route_ipaddr","IP",0))
		return false;
	if(!valid_mask(F,"F.route_netmask",ZERO_OK))
		return false;
	if(!valid_ip(F,"F.route_gateway","Gateway",MASK_NO))
		return false;

	if(F.route_ipaddr_3.value != "0" && F.route_netmask_3.value == "0") {
		if(errmsg2.err14) {
			alert(errmsg2.err14);	
			return false;
		}
	}

	//if(F.route_ifname.selectedIndex == 0 &&
	//   !valid_ip_gw(F,"F.route_ipaddr","F.route_netmask","F.route_gateway"))
	//	return false;
	return true;
}
function SelRoute(num,F)
{
	F.submit_button.value = "Routing";
	F.change_action.value = "gozila_cgi";
	F.route_page.value=F.route_page.options[num].value;
	F.submit();
}
function SelMode(num,F)
{
        F.submit_button.value = "Routing";
        F.change_action.value = "gozila_cgi";
        F.wk_mode.value=F.wk_mode.options[num].value;
        F.submit();
}

function exit()
{
	closeWin(route_win);
}
function init()
{
	init_form_session_key(document.forms[0], "apply.cgi");
}
</SCRIPT>

</HEAD>
<BODY onload=init()  onunload=exit()>
<DIV align=center>
<FORM name=static action=apply.cgi method=<% get_http_method(); %>>
<input type=hidden name=submit_button>
<input type=hidden name=submit_type>
<input type=hidden name=change_action>
<input type=hidden name=gui_action>
<input type=hidden name=static_route>
<input type=hidden name=need_reboot value=0>
<input type=hidden name=wait_time value=0>

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
          <TD align=right width=156 bgColor=#5b5b5b colSpan=3 
            height=25><B><FONT style="FONT-SIZE: 9pt" face=Arial 
            color=#ffffff><script>Capture(topmenu.advrouting)</script></FONT></B></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=17 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=103 height=25>&nbsp;</TD>
          <TD width=294 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
        height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>
            <P align=right><FONT style="FONT-WEIGHT: 700"><script>Capture(share.optmode)</script></FONT></P></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=397 height=25 colspan="2"><SELECT name="wk_mode" onChange=SelMode(this.form.wk_mode.selectedIndex,this.form)> 
		<OPTION value="gateway" <% nvram_selmatch("wk_mode", "gateway", "selected"); %>><script>Capture(share.gateway)</script>&nbsp;</OPTION> 
		<OPTION value="router" <% nvram_selmatch("wk_mode", "router", "selected"); %>><script>Capture(share.router)</script></OPTION>
	</SELECT></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
        height=25>&nbsp;</TD></TR>

<% nvram_selmatch("wk_mode","gateway","<!--"); %>

        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=18 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>
                  <HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif 
height=1>&nbsp;</TD></TR>

        
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>
            <P align=right><FONT style="FONT-WEIGHT: 700"><script>Capture(advroute.dynrouting)</script></FONT></P></TD>
          <TD width=8 background=image/UI_04.gif height=40>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=103 height=25><span ><script>Capture(advroute.rip)</script>:&nbsp;</span></TD>
          <TD width=294 height=25>
		<SELECT size=1 name=dr_setting> 
			<OPTION value=0 <% nvram_match("dr_setting", "0", "selected"); %>><script>Capture(share.disabled)</script></OPTION>
			<OPTION value=1 <% nvram_match("dr_setting", "1", "selected"); %>><script>Capture(share.lanwireless)</script></OPTION>
			<OPTION value=2 <% nvram_match("dr_setting", "2", "selected"); %>><script>Capture(advroute.waninternet)</script></OPTION> 
			<OPTION value=3 <% nvram_match("dr_setting", "3", "selected"); %>><script>Capture(share.both)</script></OPTION>
		</SELECT></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
        height=25>&nbsp;</TD></TR>
<% nvram_selmatch("wk_mode","gateway","-->"); %>        
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=18 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>
                  <HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif 
height=1>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>
            <P align=right><FONT style="FONT-WEIGHT: 700"><script>Capture(lefemenu.staticroute)</script></FONT></P></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=103 height=25><script>Capture(advroute.selsetnum)</script>:&nbsp;</TD>
          <TD width=294 height=25>
            <TABLE id=AutoNumber10 style="BORDER-COLLAPSE: collapse" 
            borderColor=#111111 cellSpacing=0 cellPadding=0 width=265 align=left 
            border=0>
              <TBODY>
              <TR>
                <TD width=120 colSpan=2>&nbsp;<SELECT size=1 name="route_page" onChange=SelRoute(this.form.route_page.selectedIndex,this.form)>
	<% static_route_table("select"); %></SELECT>
                <TD>
                <TD>&nbsp;&nbsp;

<script>document.write("<INPUT onclick=DeleteEntry(this.form) type=button name=delentry value=\"" + advroute.delentries + "\">");</script>

                </TD></TR></TBODY></TABLE></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
        height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=45>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=45>&nbsp;</TD>
          <TD colSpan=3 height=45>&nbsp;</TD>
          <TD width=103 height=45><script>Capture(advroute.routename)</script>:&nbsp;</TD>
          <TD width=294 height=45>&nbsp;<input name="route_name" value='<% static_route_setting("name",""); %>' size="20" maxlength="20" onBlur=valid_name(this,"Route%20Name") class=num> </TD>
          <TD width=13 height=45>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=45>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=24>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=103 height=24><FONT style="FONT-SIZE: 8pt"><script>Capture(advroute.deslanip)</script>:&nbsp;</FONT></TD>
          <TD width=294 height=24><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;<input type="hidden" name="route_ipaddr" value="4"><input name="route_ipaddr_0" value="<% static_route_setting("ipaddr","0"); %>" size="3" maxlength="3" onBlur=valid_range(this,0,223,"IP") class=num>.
	<input name="route_ipaddr_1" value="<% static_route_setting("ipaddr","1"); %>" size="3" maxlength="3" onBlur=valid_range(this,0,255,"IP") class=num>.
	<input name="route_ipaddr_2" value="<% static_route_setting("ipaddr","2"); %>" size="3" maxlength="3" onBlur=valid_range(this,0,255,"IP") class=num>.
	<input name="route_ipaddr_3" value="<% static_route_setting("ipaddr","3"); %>" size="3" maxlength="3" onBlur=valid_range(this,0,254,"IP") class=num>
</SPAN></TD>
          <TD width=13 height=24>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
        height=24>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=24>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=103 height=24><FONT style="FONT-SIZE: 8pt"><SPAN 
            ><script>Capture(share.submask)</script>:&nbsp;</SPAN></FONT></TD>
          <TD width=294 height=24>&nbsp;<input type="hidden" name="route_netmask" value="4"><input name="route_netmask_0" value="<% static_route_setting("netmask","0"); %>" size="3" maxlength="3" onBlur=valid_range(this,0,255,"IP") class=num>.
	<input name="route_netmask_1" value="<% static_route_setting("netmask","1"); %>" size="3" maxlength="3" onBlur=valid_range(this,0,255,"IP") class=num>.
	<input name="route_netmask_2" value="<% static_route_setting("netmask","2"); %>" size="3" maxlength="3" onBlur=valid_range(this,0,255,"IP") class=num>.
	<input name="route_netmask_3" value="<% static_route_setting("netmask","3"); %>" size="3" maxlength="3" onBlur=valid_range(this,0,255,"IP") class=num>
</TD>
          <TD width=13 height=24>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
        height=24>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=24>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=103 height=24><FONT style="FONT-SIZE: 8pt"><SPAN 
            ><script>Capture(share.defgateway)</script>:&nbsp;</SPAN></FONT></TD>
          <TD width=294 height=24>&nbsp;<input type="hidden" name="route_gateway" value="4"><input name="route_gateway_0" value="<% static_route_setting("gateway","0"); %>" size="3" maxlength="3" onBlur=valid_range(this,0,223,"IP") class=num>.
	<input name="route_gateway_1" value="<% static_route_setting("gateway","1"); %>" size="3" maxlength="3" onBlur=valid_range(this,0,255,"IP") class=num>.
	<input name="route_gateway_2" value="<% static_route_setting("gateway","2"); %>" size="3" maxlength="3" onBlur=valid_range(this,0,255,"IP") class=num>.
	<input name="route_gateway_3" value="<% static_route_setting("gateway","3"); %>" size="3" maxlength="3" onBlur=valid_range(this,0,254,"IP") class=num>
</TD>
          <TD width=13 height=24>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
        height=24>&nbsp;</TD></TR>
        
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=103 height=25><FONT style="FONT-SIZE: 8pt"><script>Capture(share.inter_face)</script>:&nbsp; 
            </FONT></TD>
          <TD align=left width=294 height=25>
            <TABLE cellSpacing=0 cellPadding=0 width=265 border=0>
              <TBODY>
              <TR>
                <TD width=265>&nbsp;<select name="route_ifname">
          <option value="lan" <% static_route_setting("lan","0"); %>><script>Capture(share.lanwireless)</script></option>
          <option value="wan" <% static_route_setting("wan","0"); %>><script>Capture(advroute.waninternet)</script></option>
        </select>
                <TD>
                <TD align=middle width=100 height=25></TD>
                <TD>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=18 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>
                  <HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif 
height=1>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=18 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>

<script>document.write("<INPUT onclick=ViewRoute() type=button name=button2 value=\"" + advroute.showroutetbl + "\">");</script>&nbsp;
                </TD>
                <TD height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR>

        <TR>
	  <TD width=156 bgColor=#e7e7e7 colSpan=3>&nbsp;</TD>
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

<script>Capture(hrouting2.right1)</script><br>
<script>document.write("<br>");</script>
<script>Capture(hrouting2.right2)</script><br>
<script>document.write("<br>");</script>
<script>Capture(hrouting2.right3)</script><br>
<script>document.write("<br>");</script>
<script>Capture(hrouting2.right4)</script><br>
<script>document.write("<br>");</script>
<script>Capture(hrouting2.right5)</script><br>
<script language=javascript>
help_link("help/HRouting.asp");
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
          <TD width=454 bgColor=#2971b9 align=right>
			<INPUT type=hidden value=0 name=Route_reload>
<TABLE>
<TR>
<TD width=101 bgcolor=#175592 align=center height=20><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:to_submit(document.forms[0])"><script>Capture(sbutton.save)</script></A></font></TD>
		<TD width=8></TD>
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Routing.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
