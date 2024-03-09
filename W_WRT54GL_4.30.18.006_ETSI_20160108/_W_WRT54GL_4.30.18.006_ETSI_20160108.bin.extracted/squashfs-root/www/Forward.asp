<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Port Range Forward</TITLE>
<% no_cache(); %>
<% charset(); %>

<% web_include_file("filelink.asp"); %>

<SCRIPT language=JavaScript>
document.title = apptopmenu.portrange;

function to_submit(F)
{
		if(!check_all(F))
		{
			return;
		}
        F.submit_button.value = "Forward";
        F.gui_action.value = "Apply";
        F.submit();
}
function check_all(F)
{
	var i, j, lan_ip3, tmp;
	var m = new Array(10);
	var n = new Array(10);
	var e = new Array(10);
	var ip = new Array(10);
	var pros = new Array(10);
	lan_ip3 = Number('<% get_single_ip("lan_ipaddr","3"); %>');
	for(i = 0; i< 10; i++)
	{
		m[i] = Number(eval("F.from"+i).value);
		n[i] = Number(eval("F.to"+i).value);
		
		if(m[i] > n[i])
		{
			tmp = n[i];
			n[i] = m[i];
			m[i] = tmp;
		}
		if(eval("F.enable"+i).checked)
		{
			e[i] = "1";
		}
		else
		{
			e[i] = "0";
		}
		ip[i] = Number(eval("F.ip"+i).value);
		pros[i] = eval("F.pro" + i).options[eval("F.pro" + i).selectedIndex].value;
	}
	for(i = 0; i< 10; i++)
	{
		if(e[i] == "1")
		{
			if(ip[i] == lan_ip3)
			{
				alert(errmsg.err68);
				return false;
			}
			if(m[i] == 0 || n[i] == 0 || ip[i] == 0)
			{
				alert(errmsg.err71);
				return false;
			}
		}
	}	

	for(i = 0; i< 9; i++)
	{
		if(e[i] == "1")
		{
			for(j = i +1; j< 10; j++)
			{
				if(e[j] == "1")
				{
					//alert("m["+i+"]="+m[i]+" n["+i+"]="+n[i]+" m["+j+"]="+m[j] +"n["+j+"]="+n[j]);
					if(pros[i] == pros[j] || pros[i] == "both" || pros[j] == "both")
					{
						if(!(m[i] > n[j] || n[i] < m[j]))
						{
							alert(errmsg.err70);
							return false;
						}
					}
				}
			}
		}
	}
	return true;
}
var lanip3=Number('<% get_single_ip("lan_ipaddr",3); %>');
var lanmask3 = Number('<% get_single_ip("lan_netmask",3); %>');

function init()
{
	init_form_session_key(document.forms[0], "apply.cgi");
}
</SCRIPT></HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM name=portRange method=<% get_http_method(); %> action=apply.cgi>
<input type=hidden name=submit_button>
<input type=hidden name=gui_action>
<input type=hidden name="forward_port" value="10">

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
    width=646 height=1><IMG height=15 src="image/UI_02.gif" 
      width=645 border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 
height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD align=right width=156 bgcolor=#5b5b5b colSpan=3 
            height=25><B><FONT face=Arial color=#ffffff><script>Capture(apptopmenu.portrange)</script></FONT></B></TD>
          <TD width=8 bgcolor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=17 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD colSpan=4>
            <CENTER>
            <TABLE style="BORDER-COLLAPSE: collapse" borderColor=#e7e7e7 height=24 cellSpacing=0 cellPadding=0 width=421 border=0>
              <TBODY>
              <TR>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle bgColor=#CCCCCC colSpan=6 height=30><B><script>Capture(portsrv.portrange)</script> </B></TD></TR>
              <TR>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=66 bgColor=#CCCCCC height=30><B><script>Capture(portforward.app)</script></B></TD>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=82 bgColor=#CCCCCC height=30><B><script>Capture(share.start)</script></B></TD>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=58 bgColor=#CCCCCC height=30><B><script>Capture(portforward.end)</script></B></TD>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=69 bgColor=#CCCCCC height=30><B><script>Capture(share.protocol)</script></B></TD>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=85 bgColor=#CCCCCC height=30><B><script>Capture(share.ipaddr)</script></B></TD>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=47 bgColor=#CCCCCC height=30><B><script>Capture(share.enable)</script></B></TD></TR>
              <TR align=middle>
                <TD width=66 height=30><FONT size=2><INPUT  maxLength=12 size=7 name=name0 onBlur=valid_name(this,"Name") value='<% port_forward_table("name","0"); %>' class=num></FONT></TD>
                <TD width=82 height=30><FONT face="Arial, Helvetica, sans-serif"><INPUT  maxLength=5 size=5 value='<% port_forward_table("from","0"); %>' name=from0 onBlur=valid_range(this,0,65535,"Port") class=num><span >&nbsp; <script>Capture(portforward.to)</script></span></FONT></TD>
                <TD width=58 height=30><INPUT  maxLength=5 size=5 value='<% port_forward_table("to","0"); %>' name=to0 onBlur=valid_range(this,0,65535,"Port") class=num></TD>
                <TD align=middle width=69 height=30><FONT face=Arial color=blue>
			<SELECT size=1 name=pro0>
				<OPTION value=tcp <% port_forward_table("sel_tcp","0"); %>><script>Capture(share.tcp)</script></OPTION>
				<OPTION value=udp <% port_forward_table("sel_udp","0"); %>><script>Capture(share.udp)</script></OPTION>
				<OPTION value=both <% port_forward_table("sel_both","0"); %>><script>Capture(share.both)</script></OPTION>
			</SELECT></FONT></TD>
                <TD width=105 height=30><FONT style="FONT-SIZE: 8pt" face=Arial><% prefix_ip_get("lan_ipaddr",1); %><INPUT  maxLength=3 size=3 value='<% port_forward_table("ip","0"); %>' name=ip0 onBlur=valid_range_forward(this,0,254,"IP",lanip3,lanmask3) class=num></FONT></TD>
                <TD width=47 height=30><INPUT type=checkbox value=on name=enable0 <% port_forward_table("enable","0"); %>></TD></TR>

              <TR align=middle>
                <TD width=66 height=30><FONT size=2><INPUT  maxLength=12 size=7 name=name1 onBlur=valid_name(this,"Name") value='<% port_forward_table("name","1"); %>' class=num></FONT></TD>
                <TD width=82 height=30><FONT face="Arial, Helvetica, sans-serif"><INPUT  maxLength=5 size=5 value='<% port_forward_table("from","1"); %>' name=from1 onBlur=valid_range(this,0,65535,"Port") class=num><span >&nbsp; <script>Capture(portforward.to)</script></span></FONT></TD>
                <TD width=58 height=30><INPUT  maxLength=5 size=5 value='<% port_forward_table("to","1"); %>' name=to1 onBlur=valid_range(this,0,65535,"Port") class=num></TD>
                <TD align=middle width=69 height=30><FONT face=Arial color=blue>
			<SELECT size=1 name=pro1>
				<OPTION value=tcp <% port_forward_table("sel_tcp","1"); %>><script>Capture(share.tcp)</script></OPTION>
				<OPTION value=udp <% port_forward_table("sel_udp","1"); %>><script>Capture(share.udp)</script></OPTION>
				<OPTION value=both <% port_forward_table("sel_both","1"); %>><script>Capture(share.both)</script></OPTION>
			</SELECT></FONT></TD>
                <TD width=105 height=30><FONT style="FONT-SIZE: 8pt" face=Arial><% prefix_ip_get("lan_ipaddr",1); %><INPUT  maxLength=3 size=3 value='<% port_forward_table("ip","1"); %>' name=ip1 onBlur=valid_range_forward(this,0,254,"IP",lanip3,lanmask3) class=num></FONT></TD>
                <TD width=47 height=30><INPUT type=checkbox value=on name=enable1 <% port_forward_table("enable","1"); %>></TD></TR>
              <TR align=middle>
                <TD width=66 height=30><FONT size=2><INPUT  maxLength=12 size=7 name=name2 onBlur=valid_name(this,"Name") value='<% port_forward_table("name","2"); %>' class=num></FONT></TD>
                <TD width=82 height=30><FONT face="Arial, Helvetica, sans-serif"><INPUT  maxLength=5 size=5 value='<% port_forward_table("from","2"); %>' name=from2 onBlur=valid_range(this,0,65535,"Port") class=num><span >&nbsp; <script>Capture(portforward.to)</script></span></FONT></TD>
                <TD width=58 height=30><INPUT  maxLength=5 size=5 value='<% port_forward_table("to","2"); %>' name=to2 onBlur=valid_range(this,0,65535,"Port") class=num></TD>
                <TD align=middle width=69 height=30><FONT face=Arial color=blue>
			<SELECT size=1 name=pro2>
				<OPTION value=tcp <% port_forward_table("sel_tcp","2"); %>><script>Capture(share.tcp)</script></OPTION>
				<OPTION value=udp <% port_forward_table("sel_udp","2"); %>><script>Capture(share.udp)</script></OPTION>
				<OPTION value=both <% port_forward_table("sel_both","2"); %>><script>Capture(share.both)</script></OPTION>
			</SELECT></FONT></TD>
                <TD width=105 height=30><FONT style="FONT-SIZE: 8pt" face=Arial><% prefix_ip_get("lan_ipaddr",1); %><INPUT  maxLength=3 size=3 value='<% port_forward_table("ip","2"); %>' name=ip2 onBlur=valid_range_forward(this,0,254,"IP",lanip3,lanmask3) class=num></FONT></TD>
                <TD width=47 height=30><INPUT type=checkbox value=on name=enable2 <% port_forward_table("enable","2"); %>></TD></TR>
              <TR align=middle>
                <TD width=66 height=30><FONT size=2><INPUT  maxLength=12 size=7 name=name3 onBlur=valid_name(this,"Name") value='<% port_forward_table("name","3"); %>' class=num></FONT></TD>
                <TD width=82 height=30><FONT face="Arial, Helvetica, sans-serif"><INPUT  maxLength=5 size=5 value='<% port_forward_table("from","3"); %>' name=from3 onBlur=valid_range(this,0,65535,"Port") class=num><span >&nbsp; <script>Capture(portforward.to)</script></span></FONT></TD>
                <TD width=58 height=30><INPUT  maxLength=5 size=5 value='<% port_forward_table("to","3"); %>' name=to3 onBlur=valid_range(this,0,65535,"Port") class=num></TD>
                <TD align=middle width=69 height=30><FONT face=Arial color=blue>
			<SELECT size=1 name=pro3>
				<OPTION value=tcp <% port_forward_table("sel_tcp","3"); %>><script>Capture(share.tcp)</script></OPTION>
				<OPTION value=udp <% port_forward_table("sel_udp","3"); %>><script>Capture(share.udp)</script></OPTION>
				<OPTION value=both <% port_forward_table("sel_both","3"); %>><script>Capture(share.both)</script></OPTION>
			</SELECT></FONT></TD>
                <TD width=105 height=30><FONT style="FONT-SIZE: 8pt" face=Arial><% prefix_ip_get("lan_ipaddr",1); %><INPUT  maxLength=3 size=3 value='<% port_forward_table("ip","3"); %>' name=ip3 onBlur=valid_range_forward(this,0,254,"IP",lanip3,lanmask3) class=num></FONT></TD>
                <TD width=47 height=30><INPUT type=checkbox value=on name=enable3 <% port_forward_table("enable","3"); %>></TD></TR>
              <TR align=middle>
                <TD width=66 height=30><FONT size=2><INPUT  maxLength=12 size=7 name=name4 onBlur=valid_name(this,"Name") value='<% port_forward_table("name","4"); %>' class=num></FONT></TD>
                <TD width=82 height=30><FONT face="Arial, Helvetica, sans-serif"><INPUT  maxLength=5 size=5 value='<% port_forward_table("from","4"); %>' name=from4 onBlur=valid_range(this,0,65535,"Port") class=num><span >&nbsp; <script>Capture(portforward.to)</script></span></FONT></TD>
                <TD width=58 height=30><INPUT  maxLength=5 size=5 value='<% port_forward_table("to","4"); %>' name=to4 onBlur=valid_range(this,0,65535,"Port") class=num></TD>
                <TD align=middle width=69 height=30><FONT face=Arial color=blue>
			<SELECT size=1 name=pro4>
				<OPTION value=tcp <% port_forward_table("sel_tcp","4"); %>><script>Capture(share.tcp)</script></OPTION>
				<OPTION value=udp <% port_forward_table("sel_udp","4"); %>><script>Capture(share.udp)</script></OPTION>
				<OPTION value=both <% port_forward_table("sel_both","4"); %>><script>Capture(share.both)</script></OPTION>
			</SELECT></FONT></TD>
                <TD width=105 height=30><FONT style="FONT-SIZE: 8pt" face=Arial><% prefix_ip_get("lan_ipaddr",1); %><INPUT  maxLength=3 size=3 value='<% port_forward_table("ip","4"); %>' name=ip4 onBlur=valid_range_forward(this,0,254,"IP",lanip3,lanmask3) class=num></FONT></TD>
                <TD width=47 height=30><INPUT type=checkbox value=on name=enable4 <% port_forward_table("enable","4"); %>></TD></TR>
              <TR align=middle>
                <TD width=66 height=30><FONT size=2><INPUT  maxLength=12 size=7 name=name5 onBlur=valid_name(this,"Name") value='<% port_forward_table("name","5"); %>' class=num></FONT></TD>
                <TD width=82 height=30><FONT face="Arial, Helvetica, sans-serif"><INPUT  maxLength=5 size=5 value='<% port_forward_table("from","5"); %>' name=from5 onBlur=valid_range(this,0,65535,"Port") class=num><span >&nbsp; <script>Capture(portforward.to)</script></span></FONT></TD>
                <TD width=58 height=30><INPUT  maxLength=5 size=5 value='<% port_forward_table("to","5"); %>' name=to5 onBlur=valid_range(this,0,65535,"Port") class=num></TD>
                <TD align=middle width=69 height=30><FONT face=Arial color=blue>
			<SELECT size=1 name=pro5>
				<OPTION value=tcp <% port_forward_table("sel_tcp","5"); %>><script>Capture(share.tcp)</script></OPTION>
				<OPTION value=udp <% port_forward_table("sel_udp","5"); %>><script>Capture(share.udp)</script></OPTION>
				<OPTION value=both <% port_forward_table("sel_both","5"); %>><script>Capture(share.both)</script></OPTION>
			</SELECT></FONT></TD>
                <TD width=105 height=30><FONT style="FONT-SIZE: 8pt" face=Arial><% prefix_ip_get("lan_ipaddr",1); %><INPUT  maxLength=3 size=3 value='<% port_forward_table("ip","5"); %>' name=ip5 onBlur=valid_range_forward(this,0,254,"IP",lanip3,lanmask3) class=num></FONT></TD>
                <TD width=47 height=30><INPUT type=checkbox value=on name=enable5 <% port_forward_table("enable","5"); %>></TD></TR>
              <TR align=middle>
                <TD width=66 height=30><FONT size=2><INPUT  maxLength=12 size=7 name=name6 onBlur=valid_name(this,"Name") value='<% port_forward_table("name","6"); %>' class=num></FONT></TD>
                <TD width=82 height=30><FONT face="Arial, Helvetica, sans-serif"><INPUT  maxLength=5 size=5 value='<% port_forward_table("from","6"); %>' name=from6 onBlur=valid_range(this,0,65535,"Port") class=num><span >&nbsp; <script>Capture(portforward.to)</script></span></FONT></TD>
                <TD width=58 height=30><INPUT  maxLength=5 size=5 value='<% port_forward_table("to","6"); %>' name=to6 onBlur=valid_range(this,0,65535,"Port") class=num></TD>
                <TD align=middle width=69 height=30><FONT face=Arial color=blue>
			<SELECT size=1 name=pro6>
				<OPTION value=tcp <% port_forward_table("sel_tcp","6"); %>><script>Capture(share.tcp)</script></OPTION>
				<OPTION value=udp <% port_forward_table("sel_udp","6"); %>><script>Capture(share.udp)</script></OPTION>
				<OPTION value=both <% port_forward_table("sel_both","6"); %>><script>Capture(share.both)</script></OPTION>
			</SELECT></FONT></TD>
                <TD width=105 height=30><FONT style="FONT-SIZE: 8pt" face=Arial><% prefix_ip_get("lan_ipaddr",1); %><INPUT  maxLength=3 size=3 value='<% port_forward_table("ip","6"); %>' name=ip6 onBlur=valid_range_forward(this,0,254,"IP",lanip3,lanmask3) class=num></FONT></TD>
                <TD width=47 height=30><INPUT type=checkbox value=on name=enable6 <% port_forward_table("enable","6"); %>></TD></TR>
              <TR align=middle>
                <TD width=66 height=30><FONT size=2><INPUT  maxLength=12 size=7 name=name7 onBlur=valid_name(this,"Name") value='<% port_forward_table("name","7"); %>' class=num></FONT></TD>
                <TD width=82 height=30><FONT face="Arial, Helvetica, sans-serif"><INPUT  maxLength=5 size=5 value='<% port_forward_table("from","7"); %>' name=from7 onBlur=valid_range(this,0,65535,"Port") class=num><span >&nbsp; <script>Capture(portforward.to)</script></span></FONT></TD>
                <TD width=58 height=30><INPUT  maxLength=5 size=5 value='<% port_forward_table("to","7"); %>' name=to7 onBlur=valid_range(this,0,65535,"Port") class=num></TD>
                <TD align=middle width=69 height=30><FONT face=Arial color=blue>
			<SELECT size=1 name=pro7>
				<OPTION value=tcp <% port_forward_table("sel_tcp","7"); %>><script>Capture(share.tcp)</script></OPTION>
				<OPTION value=udp <% port_forward_table("sel_udp","7"); %>><script>Capture(share.udp)</script></OPTION>
				<OPTION value=both <% port_forward_table("sel_both","7"); %>><script>Capture(share.both)</script></OPTION>
			</SELECT></FONT></TD>
                <TD width=105 height=30><FONT style="FONT-SIZE: 8pt" face=Arial><% prefix_ip_get("lan_ipaddr",1); %><INPUT  maxLength=3 size=3 value='<% port_forward_table("ip","7"); %>' name=ip7 onBlur=valid_range_forward(this,0,254,"IP",lanip3,lanmask3) class=num></FONT></TD>
                <TD width=47 height=30><INPUT type=checkbox value=on name=enable7 <% port_forward_table("enable","7"); %>></TD></TR>
              <TR align=middle>
                <TD width=66 height=30><FONT size=2><INPUT  maxLength=12 size=7 name=name8 onBlur=valid_name(this,"Name") value='<% port_forward_table("name","8"); %>' class=num></FONT></TD>
                <TD width=82 height=30><FONT face="Arial, Helvetica, sans-serif"><INPUT  maxLength=5 size=5 value='<% port_forward_table("from","8"); %>' name=from8 onBlur=valid_range(this,0,65535,"Port") class=num><span >&nbsp; <script>Capture(portforward.to)</script></span></FONT></TD>
                <TD width=58 height=30><INPUT  maxLength=5 size=5 value='<% port_forward_table("to","8"); %>' name=to8 onBlur=valid_range(this,0,65535,"Port") class=num></TD>
                <TD align=middle width=69 height=30><FONT face=Arial color=blue>
			<SELECT size=1 name=pro8>
				<OPTION value=tcp <% port_forward_table("sel_tcp","8"); %>><script>Capture(share.tcp)</script></OPTION>
				<OPTION value=udp <% port_forward_table("sel_udp","8"); %>><script>Capture(share.udp)</script></OPTION>
				<OPTION value=both <% port_forward_table("sel_both","8"); %>><script>Capture(share.both)</script></OPTION>
			</SELECT></FONT></TD>
                <TD width=105 height=30><FONT style="FONT-SIZE: 8pt" face=Arial><% prefix_ip_get("lan_ipaddr",1); %><INPUT  maxLength=3 size=3 value='<% port_forward_table("ip","8"); %>' name=ip8 onBlur=valid_range_forward(this,0,254,"IP",lanip3,lanmask3) class=num></FONT></TD>
                <TD width=47 height=30><INPUT type=checkbox value=on name=enable8 <% port_forward_table("enable","8"); %>></TD></TR>
              <TR align=middle>
                <TD width=66 height=30><FONT size=2><INPUT  maxLength=12 size=7 name=name9 onBlur=valid_name(this,"Name") value='<% port_forward_table("name","9"); %>' class=num></FONT></TD>
                <TD width=82 height=30><FONT face="Arial, Helvetica, sans-serif"><INPUT  maxLength=5 size=5 value='<% port_forward_table("from","9"); %>' name=from9 onBlur=valid_range(this,0,65535,"Port") class=num><span >&nbsp; <script>Capture(portforward.to)</script></span></FONT></TD>
                <TD width=58 height=30><INPUT  maxLength=5 size=5 value='<% port_forward_table("to","9"); %>' name=to9 onBlur=valid_range(this,0,65535,"Port") class=num></TD>
                <TD align=middle width=69 height=30><FONT face=Arial color=blue>
			<SELECT size=1 name=pro9>
				<OPTION value=tcp <% port_forward_table("sel_tcp","9"); %>><script>Capture(share.tcp)</script></OPTION>
				<OPTION value=udp <% port_forward_table("sel_udp","9"); %>><script>Capture(share.udp)</script></OPTION>
				<OPTION value=both <% port_forward_table("sel_both","9"); %>><script>Capture(share.both)</script></OPTION>
			</SELECT></FONT></TD>
                <TD width=105 height=30><FONT style="FONT-SIZE: 8pt" face=Arial><% prefix_ip_get("lan_ipaddr",1); %><INPUT  maxLength=3 size=3 value='<% port_forward_table("ip","9"); %>' name=ip9 onBlur=valid_range_forward(this,0,254,"IP",lanip3,lanmask3) class=num></FONT></TD>
                <TD width=47 height=30><INPUT type=checkbox value=on name=enable9 <% port_forward_table("enable","9"); %>></TD></TR>

	      <TR>
                <TD></TD>
                <TD></TD>
                <TD></TD>
                <TD></TD>
                <TD></TD>
                <TD></TD>
              </TR>

                </TBODY></TABLE></CENTER></TD>
          <TD width=13 height=25>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top width=176 bgcolor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TR>
          <TD width=11 height=25>&nbsp;</TD>
          <TD width=156 height=25><font color="#FFFFFF"><span style="font-family: Arial"><br>
<script>Capture(hforward2.right1)</script><br>
<script language=javascript>
help_link("help/HForward.asp");
Capture(share.more);
document.write("</a></b>");
</script>
</span></font></TD>
          <TD width=9 height=25>&nbsp;</TD>
	</TR>
      </TABLE>
    </TD>
    </TR>
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
          <TD width=156 height="33" bgcolor=#5b5b5b>&nbsp;</TD>
          <TD width=8 bgcolor=#5b5b5b>&nbsp;</TD>
          <TD width=454 bgcolor=#2971b9 align=right>
<TABLE>
<TR>
<TD width=101 bgcolor=#175592 align=center height=20><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:to_submit(document.forms[0])"><script>Capture(sbutton.save)</script></A></font></TD>
		<TD width=8></TD>
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Forward.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
