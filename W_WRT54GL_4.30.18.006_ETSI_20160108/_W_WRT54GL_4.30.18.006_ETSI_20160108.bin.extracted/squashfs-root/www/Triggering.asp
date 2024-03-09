<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Port Triggering</TITLE>
<% no_cache(); %>
<% charset(); %>

<% web_include_file("filelink.asp"); %>

<SCRIPT language=JavaScript>
document.title = trigger2.ptrigger;

function to_submit(F)
{
	if(!check_all(F))
	{
		return;
	}
	F.submit_button.value = "Triggering";
	F.gui_action.value = "Apply";
       	F.submit();
}
function check_all(F)
{
	var i, j,tmp;
	var m = new Array(10);
	var n = new Array(10);
	var m1 = new Array(10);
	var n1 = new Array(10);
	var e = new Array(10);
	var ip = new Array(10);
	
	for(i = 0; i< 10; i++)
	{
		m[i] = Number(eval("F.i_from"+i).value);
		n[i] = Number(eval("F.i_to"+i).value);
		m1[i] = Number(eval("F.o_from"+i).value);
		n1[i] = Number(eval("F.o_to"+i).value);		
		if(m[i] > n[i])
		{
			tmp = n[i];
			n[i] = m[i];
			m[i] = tmp;
		}
		if(m1[i] > n1[i])
		{
			tmp = n1[i];
			n1[i] = m1[i];
			m1[i] = tmp;
		}
		if(eval("F.enable"+i).checked)
		{
			e[i] = "1";
		}
		else
		{
			e[i] = "0";
		}
	}
	for(i = 0; i< 10; i++)
	{
		if(e[i] == "1")
		{
			if(m[i] == 0 || n[i] == 0 || m1[i] == 0 || n1[i] == 0)
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
					if(!(m[i] > n[j] || n[i] < m[j]))
					{
						alert(errmsg.err70);
						return false;
					}
					if(!(m1[i] > n1[j] || n1[i] < m1[j]))
					{
						alert(errmsg.err70);
						return false;
					}
				}
			}
		}
	}
	return true;
}

function init()
{
	init_form_session_key(document.forms[0], "apply.cgi", session_key, close_session);
}
</SCRIPT>
</HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM name=trigger action=apply.cgi method=<% get_http_method(); %>>
<input type=hidden name=submit_button>
<input type=hidden name=change_action>
<input type=hidden name=submit_type>
<input type=hidden name=gui_action>
<input type=hidden name=port_trigger value="10">

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>
  <TBODY>
  <TR bgColor=black>
    <TD style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" borderColor=#e7e7e7 width=163 bgColor=#e7e7e7 height=1><IMG height=15 src="image/UI_03.gif" width=164 border=0></TD>        
    <TD style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" 
    height=1><IMG height=15 src="image/UI_02.gif" width=645 border=0></TD>
  </TR>
</TBODY></TABLE>
<TABLE style="BORDER-COLLAPSE: collapse" borderColor=#111111 height=23 
cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD>
      <TABLE height=100% cellSpacing=0 cellPadding=0 width=633 border=0>
        <TBODY>
        <TR>
          <TD align=right width=156 bgcolor=#5b5b5b colSpan=3 height=25><B><FONT style="FONT-SIZE: 9pt" face=Arial color=#ffffff><script>Capture(trigger2.ptrigger)</script></FONT></B></TD>
          <TD width=8 bgcolor=#5b5b5b height=25></TD>
          <TD colSpan=6 height=25></TD>
          <TD width=15 background=image/UI_05.gif></TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif></TD>
          <TD width=3 height=25></TD>
          <TD align=middle width=448 colSpan=4 height=51>
            <TABLE id=AutoNumber16 style="BORDER-COLLAPSE: collapse" 
            borderColor=#e7e7e7 height=24 cellSpacing=0 cellPadding=0 width=448 border=0>
              <TBODY>
              <TR>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=99 bgColor=#CCCCCC height=30></TD>
                <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle bgColor=#CCCCCC colSpan=2 height=30><B><script>Capture(trigger2.trirange)</script></B></TD>
                <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle bgColor=#CCCCCC colSpan=2 height=30><B><script>Capture(trigger2.forrange)</script></B></TD>
              	<TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=33 bgColor=#CCCCCC height=30></TD></TR>
              <TR>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle bgColor=#CCCCCC height=30><B><script>Capture(portforward.app)</script></B></TD>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=65 bgColor=#CCCCCC height=30><B><script>Capture(trigger2.sport)</script></B></TD>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=55 bgColor=#CCCCCC height=30><B><script>Capture(trigger2.eport)</script></B></TD>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=65 bgColor=#CCCCCC height=30><B><script>Capture(trigger2.sport)</script></B></TD>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=55 bgColor=#CCCCCC height=30><B><script>Capture(trigger2.eport)</script></B></TD>
                <TD 
                style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
                align=middle width=30 bgColor=#CCCCCC height=30><B><script>Capture(share.enable)</script> 
                </B></TD>
              </TR>
              
              <TR>
                <TD align=middle height=30><FONT size=2><INPUT class=num maxLength=12 size=12 name=name0 onBlur=valid_name(this,"Name") value='<% port_trigger_table("name","0"); %>'></FONT></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_from0 value='<% port_trigger_table("i_from","0"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_to0 value='<% port_trigger_table("i_to","0"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_from0 value='<% port_trigger_table("o_from","0"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_to0 value='<% port_trigger_table("o_to","0"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30>
                <INPUT type=checkbox name=enable0 value=on <% port_trigger_table("enable","0"); %>></TD>    
              </TR>
              <TR>
                <TD align=middle height=30><FONT size=2><INPUT class=num maxLength=12 size=12 name=name1 onBlur=valid_name(this,"Name") value='<% port_trigger_table("name","1"); %>'></FONT></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_from1 value='<% port_trigger_table("i_from","1"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_to1 value='<% port_trigger_table("i_to","1"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_from1 value='<% port_trigger_table("o_from","1"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_to1 value='<% port_trigger_table("o_to","1"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30>
                <INPUT type=checkbox name=enable1 value=on <% port_trigger_table("enable","1"); %>></TD>    
              </TR>
              <TR>
                <TD align=middle height=30><FONT size=2><INPUT class=num maxLength=12 size=12 name=name2 onBlur=valid_name(this,"Name") value='<% port_trigger_table("name","2"); %>'></FONT></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_from2 value='<% port_trigger_table("i_from","2"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_to2 value='<% port_trigger_table("i_to","2"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_from2 value='<% port_trigger_table("o_from","2"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_to2 value='<% port_trigger_table("o_to","2"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30>
                <INPUT type=checkbox name=enable2 value=on <% port_trigger_table("enable","2"); %>></TD>    
              </TR>
              <TR>
                <TD align=middle height=30><FONT size=2><INPUT class=num maxLength=12 size=12 name=name3 onBlur=valid_name(this,"Name") value='<% port_trigger_table("name","3"); %>'></FONT></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_from3 value='<% port_trigger_table("i_from","3"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_to3 value='<% port_trigger_table("i_to","3"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_from3 value='<% port_trigger_table("o_from","3"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_to3 value='<% port_trigger_table("o_to","3"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30>
                <INPUT type=checkbox name=enable3 value=on <% port_trigger_table("enable","3"); %>></TD>    
              </TR>
              <TR>
                <TD align=middle height=30><FONT size=2><INPUT class=num maxLength=12 size=12 name=name4 onBlur=valid_name(this,"Name") value='<% port_trigger_table("name","4"); %>'></FONT></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_from4 value='<% port_trigger_table("i_from","4"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_to4 value='<% port_trigger_table("i_to","4"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_from4 value='<% port_trigger_table("o_from","4"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_to4 value='<% port_trigger_table("o_to","4"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30>
                <INPUT type=checkbox name=enable4 value=on <% port_trigger_table("enable","4"); %>></TD>    
              </TR>
              <TR>
                <TD align=middle height=30><FONT size=2><INPUT class=num maxLength=12 size=12 name=name5 onBlur=valid_name(this,"Name") value='<% port_trigger_table("name","5"); %>'></FONT></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_from5 value='<% port_trigger_table("i_from","5"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_to5 value='<% port_trigger_table("i_to","5"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_from5 value='<% port_trigger_table("o_from","5"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_to5 value='<% port_trigger_table("o_to","5"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30>
                <INPUT type=checkbox name=enable5 value=on <% port_trigger_table("enable","5"); %>></TD>    
              </TR>
              <TR>
                <TD align=middle height=30><FONT size=2><INPUT class=num maxLength=12 size=12 name=name6 onBlur=valid_name(this,"Name") value='<% port_trigger_table("name","6"); %>'></FONT></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_from6 value='<% port_trigger_table("i_from","6"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_to6 value='<% port_trigger_table("i_to","6"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_from6 value='<% port_trigger_table("o_from","6"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_to6 value='<% port_trigger_table("o_to","6"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30>
                <INPUT type=checkbox name=enable6 value=on <% port_trigger_table("enable","6"); %>></TD>    
              </TR>
              <TR>
                <TD align=middle height=30><FONT size=2><INPUT class=num maxLength=12 size=12 name=name7 onBlur=valid_name(this,"Name") value='<% port_trigger_table("name","7"); %>'></FONT></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_from7 value='<% port_trigger_table("i_from","7"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_to7 value='<% port_trigger_table("i_to","7"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_from7 value='<% port_trigger_table("o_from","7"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_to7 value='<% port_trigger_table("o_to","7"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30>
                <INPUT type=checkbox name=enable7 value=on <% port_trigger_table("enable","7"); %>></TD>    
              </TR>
              <TR>
                <TD align=middle height=30><FONT size=2><INPUT class=num maxLength=12 size=12 name=name8 onBlur=valid_name(this,"Name") value='<% port_trigger_table("name","8"); %>'></FONT></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_from8 value='<% port_trigger_table("i_from","8"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_to8 value='<% port_trigger_table("i_to","8"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_from8 value='<% port_trigger_table("o_from","8"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_to8 value='<% port_trigger_table("o_to","8"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30>
                <INPUT type=checkbox name=enable8 value=on <% port_trigger_table("enable","8"); %>></TD>    
              </TR>
              <TR>
                <TD align=middle height=30><FONT size=2><INPUT class=num maxLength=12 size=12 name=name9 onBlur=valid_name(this,"Name") value='<% port_trigger_table("name","9"); %>'></FONT></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_from9 value='<% port_trigger_table("i_from","9"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=i_to9 value='<% port_trigger_table("i_to","9"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_from9 value='<% port_trigger_table("o_from","9"); %>' onBlur=valid_range(this,0,65535,"Port")>&nbsp;<script>Capture(portforward.to)</script></TD>
                <TD align=middle height=30><INPUT class=num maxLength=5 size=5 name=o_to9 value='<% port_trigger_table("o_to","9"); %>' onBlur=valid_range(this,0,65535,"Port")></TD>
                <TD align=middle height=30>
                <INPUT type=checkbox name=enable9 value=on <% port_trigger_table("enable","9"); %>></TD>    
              </TR>
	     	
              <TR>
                <TD></TD>
                <TD></TD>
                <TD></TD>
                <TD></TD>
                <TD></TD>
                <TD></TD>
              </TR>



              </TBODY></TABLE></TD>
          <TD width=3 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR></TBODY></TABLE></TD>
    <TD vAlign=top width=176 bgcolor=#2971b9>
    <font color="#FFFFFF"><span >
				<br>
				<b><script>Capture(trigger2.ptrigger)</script>:</b> 
				<br>

<script>Capture(trigger2.right1)</script>&nbsp;&nbsp;

<!--a target="_blank" href="HTrigger.asp?session_id=<% nvram_get("session_key"); %>">More...</a--></span></font></TD></TR>
  <TR>
    <TD width=809 colSpan=2>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=30></TD>
          <TD width=8 background=image/UI_04.gif></TD>
          <TD width=454></TD>
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
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Triggering.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE>          </TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
