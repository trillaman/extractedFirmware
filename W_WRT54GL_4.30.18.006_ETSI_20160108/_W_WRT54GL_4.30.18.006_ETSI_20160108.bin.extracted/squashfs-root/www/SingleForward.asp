<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Single Port Forwarding</TITLE>
<% no_cache(); %>
<% charset(); %>

<% web_include_file("filelink.asp"); %>

<SCRIPT language=JavaScript>
document.title = share.singelforward;
function check_LAN_IP(I, start, end, M, flag)
{
	var lan_ipaddr = '<% get_single_ip("lan_ipaddr","3"); %>';
	valid_range(I, start, end, M);
	M1 = unescape(M);
        isdigit(I,M1);
	d = parseInt(I.value, 10);
	if (flag == 1){
		if(lan_ipaddr == d){
			alert(errmsg.err71);
			I.value = I.defaultValue;
			return false;
		}
	}
}//ita add end
/*--------------------------------------------------------*/
//var NAME = new Array("FTP","Telnet","SMTP","DNS","TFTP","Finger","HTTP","POP3","NNTP","SNMP","PPTP");
var PORT = new Array("---","21","23","25","53","69","79","80","110","119","161");
var PROTO = new Array("---", "TCP","TCP","TCP","UDP","UDP","TCP","TCP","TCP","TCP","UDP");
function change_port_protocol(n,index)
{
	var i=0;

	if ( eval("document.portRange.name"+n+".value") == share.none ) 
	{
		document.getElementById("Xfrom"+n).innerHTML = "---";
		document.getElementById("Xto"+n).innerHTML = "---";
		document.getElementById("Xprotocol"+n).innerHTML = "---";
	}
	else
	{
		for(i=0; i<NAME.length; i++)
		{
			if ( eval("document.portRange.name"+n+".value") == NAME[i] ) 
			{	
				document.getElementById("Xfrom"+n).innerHTML = PORT[i];
				document.getElementById("Xto"+n).innerHTML = PORT[i];
				document.getElementById("Xprotocol"+n).innerHTML = PROTO[i];
			}
		}
	}
}
/*--------------------------------------------------------*/
function chk_default_port(F)
{
	var i,j,k,dport=-1,dip=0; 
	var NAME = new Array("FTP","Telnet","SMTP","DNS","TFTP","Finger","HTTP","POP3","NNTP","SNMP");
	var PORT = new Array( "21","23","25","53","70","79","80","110","119","161");
	for (i=0; i<5; i++)
	{
		if ( eval("F.name"+i+".value") == share.none ) continue;
		for(j=0; j<NAME.length; j++)
		{	
			if ( eval("F.name"+i+".value") == NAME[j] ) 
			{
				/**Default ports can't be equal.*/
				if ( dport == j && ( eval("F.ip"+i+".value") == eval("F.ip"+dip+".value") ) )
				{
					alert ( errmsg.err74 ) ;
					return false ; 
				} 
				/********************************/
				dport = j ; 
				dip = i ; 
				break;
			}
		} 
		for(k=0; k<10; k++)
		{
			if ( eval("F.from"+parseInt(5+k)+".value") == PORT[dport] || eval("F.to"+parseInt(5+i)+".value") == PORT[dport] ) 
			{
				alert ( errmsg.err74 ) ;
				return false ; 
			}
		}
	}
	return true ; 			
}

function to_submit(F)
{
	if ( chk_default_port(F) == false ) return ; 
        if ( chk_multi_port(F,10,5,"F.from","F.to","F.pro") == false ) return;
	F.submit_button.value = "SingleForward";
        F.gui_action.value = "Apply";
        F.submit();
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
	var wk_mode = "<% nvram_get("wk_mode"); %>"; 
	// NAT disable
	if ( wk_mode == "router") DISABLE_ALL(true,document.portRange);
	else DISABLE_ALL(false,document.portRange);
}
</SCRIPT>
</HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM name=portRange method=<% get_http_method(); %> action=apply.cgi>
<input type=hidden name=submit_button>
<input type=hidden name=gui_action>
<input type=hidden name="forward_single" value="15">
<input type=hidden name="wait_time" value="3">
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
          <TD width=156 bgColor=#5b5b5b height=25 align="right"><B><FONT style="FONT-SIZE: 9pt" color=#ffffff><script>Capture(share.singelforward)</script></FONT></B></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=17 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
          height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25 align="right">
		  <TABLE class=BORDERTABLE_LEFT>
		  	<script>
                	var NAME = new Array(share.none,"FTP","Telnet","SMTP","DNS","TFTP","Finger","HTTP","POP3","NNTP","SNMP");
				document.write("<TR><TH><font color=#000000><B>"+portforward.app+"</B><font></TH></TR>");
								for(i=0; i<5; i++)
				{
				    if ( i == 0 ) name = "<% single_forward_table("name","0"); %>";
	                            else if ( i == 1 ) name = "<% single_forward_table("name","1"); %>";
            		            else if ( i == 2 ) name = "<% single_forward_table("name","2"); %>";
                         	    else if ( i == 3 ) name = "<% single_forward_table("name","3"); %>";
		                    else if ( i == 4 ) name = "<% single_forward_table("name","4"); %>";
                			if(name == "") { name = share.none; }
					document.write("<TR><TD><SELECT size=1 name=name"+i+" onChange=change_port_protocol("+i+",this,form.name"+i+".selectedIndex)>");
                			for(j=0; j<NAME.length; j++) {
		                        	if(name == NAME[j])     selected = "selected";
	                		        else                    selected = "";
			                        document.write("<OPTION value="+NAME[j]+" "+selected+">"+NAME[j]+"</OPTION>");
                			}
					document.write("</SELECT></TD></TR>");
				}
				for(i=5; i<15; i++)
				{
 					if ( i == 5 ) name = "<% single_forward_table("name","5"); %>";
		                        else if ( i == 6 ) name = "<% single_forward_table("name","6"); %>";
		                        else if ( i == 7 ) name = "<% single_forward_table("name","7"); %>";
                		        else if ( i == 8 ) name = "<% single_forward_table("name","8"); %>";
			                else if ( i == 9 ) name = "<% single_forward_table("name","9"); %>";
		                        else if ( i == 10) name = "<% single_forward_table("name","10"); %>";
                		        else if ( i == 11) name = "<% single_forward_table("name","11"); %>";
		                        else if ( i == 12) name = "<% single_forward_table("name","12"); %>";
				        else if ( i == 13) name = "<% single_forward_table("name","13"); %>";                         				     else if ( i == 14) name = "<% single_forward_table("name","14"); %>";

					document.write("<TR><TD><INPUT  maxLength=12 size=12 name=name"+i+" onBlur=valid_name(this,\"Name\") value='"+name+"' class=num></TD></TR>");
				}
				</script>
		  </TABLE>		  </TD>
          <TD width=8 background=image/UI_04.gif 
height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD colspan="2">
		  <TABLE class=BORDERTABLE1><TR>
			<script>
			document.write("<TH ><font color=#000000><B>"+share.extport+"</B></font></TD>");
			document.write("<TH ><font color=#000000><B>"+share.intport+"</B></font></TD>");
			document.write("<TH ><font color=#000000><B>"+share.protocol+"</B></font></TD>");
			document.write("<TH ><font color=#000000><B>"+share.toipaddr+"</B></font></TD>");
			document.write("<TH ><font color=#000000><B>"+share.enableBK+"</B></font></TD>");
			</script>
		</TR>
		<script>
		var name1,i,lip ,en ,from , to ,selt,selu,selb;
		for(i=0; i<5; i++)
		{
			if ( i == 0 ) 
			{
				name = "<% single_forward_table("name","0"); %>";
				lip = "<% single_forward_table("ip","0"); %>";
				en = "<% single_forward_table("enable","0"); %>";
				from = "<% single_forward_table("from","0"); %>";
				to = "<% single_forward_table("to","0"); %>";
				selt = "<% single_forward_table("sel_tcp","0"); %>";
				selu = "<% single_forward_table("sel_udp","0"); %>";
				selb = "<% single_forward_table("sel_both","0"); %>";
			}
                        else if ( i == 1 ) 
			{
				name = "<% single_forward_table("name","1"); %>";
				lip = "<% single_forward_table("ip","1"); %>";
				en = "<% single_forward_table("enable","1"); %>";
				from = "<% single_forward_table("from","1"); %>";
				to = "<% single_forward_table("to","1"); %>";
				selt = "<% single_forward_table("sel_tcp","1"); %>";
				selu = "<% single_forward_table("sel_udp","1"); %>";
				selb = "<% single_forward_table("sel_both","1"); %>";
			}
                        else if ( i == 2 ) 
			{
				name = "<% single_forward_table("name","2"); %>";
				lip = "<% single_forward_table("ip","2"); %>";
				en = "<% single_forward_table("enable","2"); %>";
				from = "<% single_forward_table("from","2"); %>";
				to = "<% single_forward_table("to","2"); %>";
				selt = "<% single_forward_table("sel_tcp","2"); %>";
				selu = "<% single_forward_table("sel_udp","2"); %>";
				selb = "<% single_forward_table("sel_both","2"); %>";
			}
                        else if ( i == 3 ) 
			{
				name = "<% single_forward_table("name","3"); %>";
				lip = "<% single_forward_table("ip","3"); %>";
				en = "<% single_forward_table("enable","3"); %>";
				from = "<% single_forward_table("from","3"); %>";
				to = "<% single_forward_table("to","3"); %>";
				selt = "<% single_forward_table("sel_tcp","3"); %>";
				selu = "<% single_forward_table("sel_udp","3"); %>";
				selb = "<% single_forward_table("sel_both","3"); %>";
			}
                        else if ( i == 4 ) 
			{
				name = "<% single_forward_table("name","4"); %>";
				lip = "<% single_forward_table("ip","4"); %>";
				en = "<% single_forward_table("enable","4"); %>";
				from = "<% single_forward_table("from","4"); %>";
				to = "<% single_forward_table("to","4"); %>";
				selt = "<% single_forward_table("sel_tcp","4"); %>";
				selu = "<% single_forward_table("sel_udp","4"); %>";
				selb = "<% single_forward_table("sel_both","4"); %>";
			}
			var val_1 = "---";
			var val_2 = "---";
			var val_3 = "---";

			if(name != "" && name != "None"){
				val_1=from;
				val_2=to;
				if(selt=="selected")val_3="TCP";
				else if(selu=="selected")val_3="UDP";
				else if(selb=="selected")val_3="Both";
			}

//			document.write("<TR><TD>---</TD><TD>---</TD><TD>---</TD>");
			document.write("<TR>");
			document.write("<TD width=77 height=30 id=\"Xfrom"+i+"\"> <font face=\"Arial\" style=\"font-size: 8pt\"> "+val_1+" </font></TD>");
			document.write("<TD width=77 height=30 id=\"Xto"+i+"\"> <font face=\"Arial\" style=\"font-size: 8pt\"> "+val_2+" </font></TD>");
			document.write("<TD align=middle width=60 height=30 id=\"Xprotocol"+i+"\"> <font face=\"Arial\" style=\"font-size: 8pt\"> "+val_3+" </font></TD>");

			document.write("<TD><% prefix_ip_get("lan_ipaddr",1); %><INPUT  maxLength=3 size=3 value='"+lip+"' name=ip"+i+" onBlur=check_LAN_IP(this,0,254,\"IP\",1) class=num></TD>");
			document.write("<TD><INPUT type=checkbox value=on name=enable"+i+" "+en+"></TD></TR>");
		}
		for(i=5; i<15; i++)
		{
			if ( i == 5 )
                        {
                                from = "<% single_forward_table("from","5"); %>";
                                to = "<% single_forward_table("to","5"); %>";
                                lip = "<% single_forward_table("ip","5"); %>";
                                selt = "<% single_forward_table("sel_tcp","5"); %>";
                                selu = "<% single_forward_table("sel_udp","5"); %>";
                                selb = "<% single_forward_table("sel_both","5"); %>";
				en = "<% single_forward_table("enable","5"); %>";
                        }
			else if ( i == 6 )
                        {
                                from = "<% single_forward_table("from","6"); %>";
                                to = "<% single_forward_table("to","6"); %>";
                                lip = "<% single_forward_table("ip","6"); %>";
                                selt = "<% single_forward_table("sel_tcp","6"); %>";
                                selu = "<% single_forward_table("sel_udp","6"); %>";
                                selb = "<% single_forward_table("sel_both","6"); %>";
				en = "<% single_forward_table("enable","6"); %>";
                        }
			else if ( i == 7 )
                        {
                                from = "<% single_forward_table("from","7"); %>";
                                to = "<% single_forward_table("to","7"); %>";
                                lip = "<% single_forward_table("ip","7"); %>";
                                selt = "<% single_forward_table("sel_tcp","7"); %>";
                                selu = "<% single_forward_table("sel_udp","7"); %>";
                                selb = "<% single_forward_table("sel_both","7"); %>";
				en = "<% single_forward_table("enable","7"); %>";
                        }
			else if ( i == 8 )
                        {
                                from = "<% single_forward_table("from","8"); %>";
                                to = "<% single_forward_table("to","8"); %>";
                                lip = "<% single_forward_table("ip","8"); %>";
                                selt = "<% single_forward_table("sel_tcp","8"); %>";
                                selu = "<% single_forward_table("sel_udp","8"); %>";
                                selb = "<% single_forward_table("sel_both","8"); %>";
				en = "<% single_forward_table("enable","8"); %>";
                        }
			else if ( i == 9 )
                        {
                                from = "<% single_forward_table("from","9"); %>";
                                to = "<% single_forward_table("to","9"); %>";
                                lip = "<% single_forward_table("ip","9"); %>";
                                selt = "<% single_forward_table("sel_tcp","9"); %>";
                                selu = "<% single_forward_table("sel_udp","9"); %>";
                                selb = "<% single_forward_table("sel_both","9"); %>";
				en = "<% single_forward_table("enable","9"); %>";
                        }
			else if ( i == 10 )
                        {
                                from = "<% single_forward_table("from","10"); %>";
                                to = "<% single_forward_table("to","10"); %>";
                                lip = "<% single_forward_table("ip","10"); %>";
                                selt = "<% single_forward_table("sel_tcp","10"); %>";
                                selu = "<% single_forward_table("sel_udp","10"); %>";
                                selb = "<% single_forward_table("sel_both","10"); %>";
				en = "<% single_forward_table("enable","10"); %>";
                        }
			else if ( i == 11 )
                        {
                                from = "<% single_forward_table("from","11"); %>";
                                to = "<% single_forward_table("to","11"); %>";
                                lip = "<% single_forward_table("ip","11"); %>";
                                selt = "<% single_forward_table("sel_tcp","11"); %>";
                                selu = "<% single_forward_table("sel_udp","11"); %>";
                                selb = "<% single_forward_table("sel_both","11"); %>";
				en = "<% single_forward_table("enable","11"); %>";
                        }
			else if ( i == 12 )
                        {
                                from = "<% single_forward_table("from","12"); %>";
                                to = "<% single_forward_table("to","12"); %>";
                                lip = "<% single_forward_table("ip","12"); %>";
                                selt = "<% single_forward_table("sel_tcp","12"); %>";
                                selu = "<% single_forward_table("sel_udp","12"); %>";
                                selb = "<% single_forward_table("sel_both","12"); %>";
				en = "<% single_forward_table("enable","12"); %>";
                        }
			else if ( i == 13 )
                        {
                                from = "<% single_forward_table("from","13"); %>";
                                to = "<% single_forward_table("to","13"); %>";
                                lip = "<% single_forward_table("ip","13"); %>";
                                selt = "<% single_forward_table("sel_tcp","13"); %>";
                                selu = "<% single_forward_table("sel_udp","13"); %>";
                                selb = "<% single_forward_table("sel_both","13"); %>";
				en = "<% single_forward_table("enable","13"); %>";
                        }
			else if ( i == 14 )
                        {
                                from = "<% single_forward_table("from","14"); %>";
                                to = "<% single_forward_table("to","14"); %>";
                                lip = "<% single_forward_table("ip","14"); %>";
                                selt = "<% single_forward_table("sel_tcp","14"); %>";
                                selu = "<% single_forward_table("sel_udp","14"); %>";
                                selb = "<% single_forward_table("sel_both","14"); %>";
				en = "<% single_forward_table("enable","14"); %>";
                        }

			document.write("<TR><TD><INPUT maxLength=5 size=5 value='"+ from +"' name=from"+i+" onBlur=valid_range(this,0,65535,\"Port\") class=num></TD>");
                	document.write("<TD><INPUT maxLength=5 size=5 value='"+ to +"' name=to"+i+" onBlur=valid_range(this,0,65535,\"Port\") class=num></TD>");
	                document.write("<TD><SELECT size=1 name=pro"+i+">");
			document.write("<OPTION value=tcp "+selt+">"+share.tcp+"</OPTION>");
			document.write("<OPTION value=udp "+selu+">"+share.udp+"</OPTION>");
			document.write("<OPTION value=both "+selb+">"+share.both+"</OPTION>");
                        document.write("</SELECT></TD><TD><% prefix_ip_get("lan_ipaddr",1); %><INPUT maxLength=3 size=3 value='"+lip+"' name=ip"+i+" onBlur=check_LAN_IP(this,0,254,\"IP\",1) class=num></TD><TD><INPUT type=checkbox value=on name=enable"+i+" "+en+"></TD></TR>");
		}
		</script>
		</TABLE>
		  </TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif 
          height=25>&nbsp;</TD></TR> 
        </TBODY></TABLE></TD>
    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=10 bgColor=#2971b9 height=25>&#12288;</TD>
          <TD width=156 bgColor=#2971b9 height=25><br><span style="font-family: Arial">
	  <font color="#FFFFFF"><span style="font-family: Arial"><br>
	  <script>Capture(hsingle.right)</script><br>
	  <script language=javascript>
	  help_link("help/Hsingle.asp");
	  Capture(share.more);
	  document.write("</a></b>");
	  </script>
	  </span></font>
          </TD>
          <TD width=9 bgColor=#2971b9 height=25>&#12288;
	  </TD>
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
                      <td width="454" height="33" bgcolor="#2971b9" align="right">
<TABLE>
<TR>
<TD width=101 bgcolor=#175592 align=center height=20><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:to_submit(document.forms[0])"><script>Capture(sbutton.save)</script></A></font></TD>
		<TD width=8></TD>
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('SingleForward.asp?session_id=<% nvram_get("session_key"); %>')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE>                      </td>
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
