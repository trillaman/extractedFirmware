<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>List of PCs</TITLE>
<% no_cache(); %>
<% charset(); %>
<link rel="stylesheet" type="text/css" href="style.css">
<SCRIPT src="common.js"></SCRIPT>
<SCRIPT language="Javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capsec.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/share.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/help.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capapp.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capasg.js"></SCRIPT>
<SCRIPT language="javascript" type="text/javascript" src="<% get_lang(); %>_lang_pack/capwrt54g.js"></SCRIPT>

<SCRIPT language=javascript>
document.title = filterpc.listpc;
/*Add for session key*/
var session_key = "<% nvram_get("session_key"); %>";
var close_session = "<% get_session_status(); %>";
/*End for session key*/
function check_value(F,num,obj,defval)
{
	var i,j;
	for(i=0; i<num; i++)
	{
		if ( eval(obj+i).value == defval ) continue ; 
		for(j=i+1; j<num; j++)
		{
			if ( eval(obj+j).value == defval ) continue ; 
			if ( eval(obj+i).value == eval(obj+j).value ) 
			{
				eval(obj+j).value == eval(obj+j).defaultValue ; 
				return true ; 
			}
		}
	}
	return false ; 
}
function check_range(F)
{
	var i , j , k  ; 
	for(i=0; i<2; i++)
	{
		if ( eval("F.ip_range"+i+"_0").value == "0" && eval("F.ip_range"+i+"_1").value == "0") continue ; 
		for(j=i+1; j<2; j++)
		{
			if ( eval("F.ip_range"+j+"_0").value == "0" && eval("F.ip_range"+j+"_1").value == "0") continue ; 
			if ( ( eval("F.ip_range"+i+"_0").value == eval("F.ip_range"+j+"_0").value ) && 
			     ( eval("F.ip_range"+i+"_1").value == eval("F.ip_range"+j+"_1").value ) )
			{
				alert(errmsg.err95 );
			     	eval("F.ip_range"+j+"_0").value = eval("F.ip_range"+j+"_0").defaultValue;
			     	eval("F.ip_range"+j+"_1").value = eval("F.ip_range"+j+"_1").defaultValue;
				return true ; 
			}
		}
	}
	return false ; 
	
}

function to_submit(F)
{
	if ( check_value(F,8,"F.mac","00:00:00:00:00:00")) 
	{
		alert(errmsg.err93);
		return ; 
	}
	if ( check_value(F,6,"F.ip","0")) 
	{
		alert(errmsg.err94);
		return ; 
	}
	if ( check_range(F) ) return ; 
        F.submit_button.value = "FilterIPMAC";
        F.gui_action.value = "Apply";
        F.submit();
}
function valid_macs_all(I)
{
	if(I.value == "")
		return true;
	else if(I.value.length == 12)
		valid_macs_12(I);
	else if(I.value.length == 17)
		valid_macs_17(I);
	else{
//              alert('The MAC Address length is not correct!!');
                alert(errmsg.err5);
		I.value = I.defaultValue;
        }
	
}
function init()
{
	if ( close_session == "1" )
	{
		document.forms[0].action = "apply.cgi";
	}
	else
	{
		document.forms[0].action = "apply.cgi?session_id=<% nvram_get("session_key"); %>";
	}
}
</SCRIPT>
</HEAD>

<BODY bgColor=white onload=init()>
<FORM name=ipfilter action=apply.cgi?session_id=<% nvram_get("session_key"); %> method=<% get_http_method(); %>>
<input type=hidden name=submit_button>
<input type=hidden name=change_action>
<input type=hidden name=small_screen>
<input type=hidden name=gui_action>
<input type=hidden name=filter_ip_value>
<input type=hidden name=filter_mac_value>
<CENTER>
<TABLE cellSpacing=0 cellPadding=10 width=620 border=1 height="397">
  <TBODY>
  <TR>
    <TD width=610>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD height=35>
            <P align=center><b><FONT face=Arial color=#0000ff><SPAN STYLE="FONT-SIZE: 14pt"><script>Capture(filterpc.listpc)</script></SPAN></FONT></b></P></TD></TR>
        <TR>
          <TD align=right height=27>
            <p align="center">
            <FONT face=Arial><SPAN STYLE="FONT-SIZE: 10pt"><script>Capture(filterpc.entermacaddr)</script>: xxxxxxxxxxxx</SPAN></FONT></TD>
          </TR>
        <TR>
          <TD align=center height=27>
            <b><font face="Arial"><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.mac01)</script>:&nbsp;</SPAN></B></FONT><font face="Arial">&nbsp; 
            <INPUT maxLength=17 onBlur=valid_macs_all(this) size=17 name=mac0 value='<% filter_mac_get(0); %>' class=num></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <b><font face="Arial"><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.mac05)</script>:&nbsp;</SPAN></B></FONT><font face="Arial">&nbsp; 
            <INPUT maxLength=17 onBlur=valid_macs_all(this) size=17 name=mac4 value='<% filter_mac_get(4); %>' class=num></font></TD>
          </TR>
        <TR>
          <TD align=center height=27>
            <b><font face="Arial"><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.mac02)</script>:&nbsp;</SPAN></B></FONT><font face="Arial">&nbsp; 
            <INPUT maxLength=17 onBlur=valid_macs_all(this) size=17 name=mac1 value='<% filter_mac_get(1); %>' class=num></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <b><font face="Arial"><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.mac06)</script>:&nbsp;</SPAN></B></FONT><font face="Arial">&nbsp; 
            <INPUT maxLength=17 onBlur=valid_macs_all(this) size=17 name=mac5 value='<% filter_mac_get(5); %>' class=num></font></TD>
          </TR>
        <TR>
          <TD align=center height=27>
            <b><font face="Arial"><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.mac03)</script>:&nbsp;</SPAN></B></FONT><font face="Arial">&nbsp; 
            <INPUT maxLength=17 onBlur=valid_macs_all(this) size=17 name=mac2 value='<% filter_mac_get(2); %>' class=num></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <b><font face="Arial"><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.mac07)</script>:&nbsp;</SPAN></B></FONT><font face="Arial">&nbsp; 
            <INPUT maxLength=17 onBlur=valid_macs_all(this) size=17 name=mac6 value='<% filter_mac_get(6); %>' class=num></font></TD>
          </TR>
        <TR>
          <TD align=center height=27>
            <b><font face="Arial"><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.mac04)</script>:&nbsp;</SPAN></B></FONT><font face="Arial">&nbsp; 
            <INPUT maxLength=17 onBlur=valid_macs_all(this) size=17 name=mac3 value='<% filter_mac_get(3); %>' class=num></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <b><font face="Arial"><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.mac08)</script>:&nbsp;</SPAN></B></FONT><font face="Arial">&nbsp; 
            <INPUT maxLength=17 onBlur=valid_macs_all(this) size=17 name=mac7 value='<% filter_mac_get(7); %>' class=num></font></TD>
          </TR>
        <TR>
          <TD align=right> <HR color=#c0c0c0 align="right"> </TD>
          </TR>
        <TR>
          <TD align=right height=27>
            <p align="center"><font face="Arial"><SPAN STYLE="FONT-SIZE: 10pt"><script>Capture(filterpc.enterip)</script></SPAN></font></TD>
          </TR>
        <TR>
          <TD align=center height=27>
            <FONT face=Arial><B><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.ip01)</script>:&nbsp;</B>&nbsp; <% prefix_ip_get("lan_ipaddr",1); %></SPAN></font> 
            <INPUT maxLength=3  onBlur=valid_range(this,0,254,"IP") size=3 name=ip0 value='<% filter_ip_get("ip",0); %>' class=num></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <FONT face=Arial><B><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.ip04)</script>:&nbsp;</B>&nbsp; <% prefix_ip_get("lan_ipaddr",1); %></SPAN></font> 
            <INPUT maxLength=3  onBlur=valid_range(this,0,254,"IP") size=3 name=ip3 value='<% filter_ip_get("ip",3); %>' class=num></font></TD>
          </TR>
        <TR>
          <TD align=center height=27>
            <FONT face=Arial><B><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.ip02)</script>:&nbsp;</B>&nbsp; <% prefix_ip_get("lan_ipaddr",1); %> </SPAN></font> 
            <INPUT maxLength=3  onBlur=valid_range(this,0,254,"IP") size=3 name=ip1 value='<% filter_ip_get("ip",1); %>' class=num></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <FONT face=Arial><B><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.ip05)</script>:&nbsp;</B>&nbsp; <% prefix_ip_get("lan_ipaddr",1); %> </SPAN></font> 
            <INPUT maxLength=3  onBlur=valid_range(this,0,254,"IP") size=3 name=ip4 value='<% filter_ip_get("ip",4); %>' class=num></font></TD>
          </TR>
        <TR>
          <TD align=center height=27>
            <FONT face=Arial><B><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.ip03)</script>:&nbsp;</B>&nbsp; <% prefix_ip_get("lan_ipaddr",1); %> </SPAN></font> 
            <INPUT maxLength=3  onBlur=valid_range(this,0,254,"IP") size=3 name=ip2 value='<% filter_ip_get("ip",2); %>' class=num></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <FONT face=Arial><B><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.ip06)</script>:&nbsp;</B>&nbsp; <% prefix_ip_get("lan_ipaddr",1); %> </SPAN></font> 
            <INPUT maxLength=3  onBlur=valid_range(this,0,254,"IP") size=3 name=ip5 value='<% filter_ip_get("ip",5); %>' class=num></font></TD>
          </TR>
        <TR>
          <TD align=right>
      <HR color=#c0c0c0 align="right">
          </TD>
          </TR>
        <TR>
          <TD align=right height=27>
            <p align="center"><font face="Arial"><SPAN STYLE="FONT-SIZE: 10pt"><script>Capture(filterpc.enteriprange)</script></SPAN></font></TD>
          </TR>
        <TR>
          <TD align=right height=27>
            <p align="left">
            <FONT face=Arial><B><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.iprange01)</script>:&nbsp;</B>&nbsp; <% prefix_ip_get("lan_ipaddr",1); %> </SPAN></font> 
            <INPUT maxLength=3 onBlur=valid_range(this,0,254,"IP") size=3 name=ip_range0_0 value='<% filter_ip_get("ip_range0_0",6); %>' class=num><b><SPAN STYLE="FONT-SIZE: 12pt"> ~ </SPAN></b> 
            <INPUT maxLength=3 onBlur=valid_range(this,0,254,"IP") size=3 name=ip_range0_1 value='<% filter_ip_get("ip_range0_1",6); %>' class=num><font size="2">&nbsp; </font> </font>

            <FONT face=Arial><B><SPAN STYLE="FONT-SIZE: 12pt"><script>Capture(filterpc.iprange02)</script>:&nbsp;</B>&nbsp; <% prefix_ip_get("lan_ipaddr",1); %> </SPAN></font> 
            <INPUT maxLength=3 onBlur=valid_range(this,0,254,"IP") size=3 name=ip_range1_0 value='<% filter_ip_get("ip_range1_0",7); %>' class=num><b><SPAN STYLE="FONT-SIZE: 12pt"> ~ </SPAN></b> 
            <INPUT maxLength=3 onBlur=valid_range(this,0,254,"IP") size=3 name=ip_range1_1 value='<% filter_ip_get("ip_range1_1",7); %>' class=num><font size="2">&nbsp; </font> </font>
          </TD>
          </TR>
        </TBODY></TABLE></TD></TR></TBODY></TABLE>
	<P>
<script>document.write("<input type=button name=save_button" + " value=\"" + sbutton.save + "\" onClick=to_submit(this.form)>");</script>&nbsp;
<script>document.write("<input type=button name=cancel_button" + " value=\"" + sbutton.cancel + "\" onClick=window.location.replace(\"FilterIPMAC.asp?session_id=<% nvram_get("session_key"); %>\")>");</script>

</CENTER></P></FORM></BODY></HTML>
