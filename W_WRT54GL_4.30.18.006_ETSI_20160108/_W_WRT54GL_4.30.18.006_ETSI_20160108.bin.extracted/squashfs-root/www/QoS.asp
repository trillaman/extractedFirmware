<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>QoS</TITLE>
<% no_cache(); %>
<% charset(); %>
<% web_include_file("filelink.asp"); %>

<SCRIPT language=JavaScript>
document.title = trigger2.qos;
function CheckSinglePort(port_value, I)
{
	d = parseInt(port_value, 10);
	if ( !( d<65536 && d>=0) )
	{
//		alert('Port value is out of range [0 - 65535]');
		alert(qos.alert1);
		I.value = I.defaultValue;
		return false;
	}

	return true;
}
function PortCheck(I)
{
	dash_index = I.value.indexOf("-");

	if (dash_index == "-1"){
		CheckSinglePort(I.value, I);
	}
	else{
		start_port = I.value.substring(0, dash_index);
		end_port = I.value.substring(dash_index+1, I.value.length);

		if (CheckSinglePort(start_port, I) && CheckSinglePort(end_port, I)){
			start_d = parseInt(start_port, 10);
			end_d = parseInt(end_port, 10);
			
			if (start_d >= end_d){
				//alert('Start port value is larger than end port value');
				alert(qos.alert2);
				I.value = I.defaultValue;
			}
		}
	}
}
function rate_grey(num,F)
{
	var sw_disabled = (num == F.rate_mode[0].value) ? true : false;
	F.manual_rate.disabled = sw_disabled;
}
function eth_port_grey(sw_disabled,F)
{
	for (i=1; i<5; i++)
	{
		var port_priority = eval("F.port_priority_" + i);
		var port_flow_control = eval("F.port_flow_control_" + i);
		//var port_rate_limit = eval("F.port_rate_limit_" + i);
		
		port_priority.disabled = sw_disabled;
		port_flow_control.disabled = sw_disabled;
		//port_rate_limit.disabled = sw_disabled;
	}
}
function application_grey(sw_disabled,F)
{
	for (i=0; i<protocol_item.length; i++)
		eval("F.sel_qos" + protocol_item[i].name).disabled = sw_disabled;
	for (i=1; i<=8; i++){
		eval("F.qos_appname" + i).disabled = sw_disabled;
		eval("F.qos_appport" + i).disabled = sw_disabled;
	}
}
function device_grey(sw_disabled,F)
{
	F.qos_devname1.disabled = sw_disabled;
	F.qos_devname2.disabled = sw_disabled;
	F.qos_devpri1.disabled = sw_disabled;
	F.qos_devpri2.disabled = sw_disabled;
	F.qos_devmac1.disabled = sw_disabled;
	F.qos_devmac2.disabled = sw_disabled;

	for (i=0; i<6; i++)
	{
		eval("F.qos_devmac1_"+i).disabled = sw_disabled;
		eval("F.qos_devmac2_"+i).disabled = sw_disabled;
	}
}
function qos_grey(num,F)
{
	var sw_disabled = (num == F.QoS[1].value) ? true : false;

	F.rate_mode.disabled = sw_disabled;
	F.enable_game_.disabled = sw_disabled;
	
	if (num == F.QoS[0].value)	
		rate_grey(F.rate_mode.value, F);
	else
		rate_grey(F.rate_mode[0].value, F);
	application_grey(sw_disabled, F);
	eth_port_grey(sw_disabled, F);
	device_grey(sw_disabled, F);
}

function protocol_option(name, title, value, port, app_name){
	this.name = name;
	this.title = title;
	this.value = value;
	this.port = port;
	this.app_name = app_name;
}

protocol_item = new Array(
	/*new protocol_option("ftp", "FTP", <% nvram_get("sel_qosftp"); %>, 21, ''),
	new protocol_option("http", "HTTP", <% nvram_get("sel_qoshttp"); %>, 80, ''),
	new protocol_option("telnet", "Telnet", <% nvram_get("sel_qostelnet"); %>, 23, ''),
	new protocol_option("smtp", "SMTP", <% nvram_get("sel_qossmtp"); %>, 25, ''),
	new protocol_option("pop3", "POP3", <% nvram_get("sel_qospop3"); %>, 110, ''),*/
	new protocol_option("port1", "Application Name", <% nvram_get("sel_qosport1"); %>, '<% nvram_get("qos_appport1"); %>', '<% nvram_get("qos_appname1"); %>'),
	new protocol_option("port2", "Application Name", <% nvram_get("sel_qosport2"); %>, '<% nvram_get("qos_appport2"); %>', '<% nvram_get("qos_appname2"); %>'),
	new protocol_option("port3", "Application Name", <% nvram_get("sel_qosport3"); %>, '<% nvram_get("qos_appport3"); %>', '<% nvram_get("qos_appname3"); %>'),
	new protocol_option("port4", "Application Name", <% nvram_get("sel_qosport4"); %>, '<% nvram_get("qos_appport4"); %>', '<% nvram_get("qos_appname4"); %>'),
	new protocol_option("port5", "Application Name", <% nvram_get("sel_qosport5"); %>, '<% nvram_get("qos_appport5"); %>', '<% nvram_get("qos_appname5"); %>'),
	new protocol_option("port6", "Application Name", <% nvram_get("sel_qosport6"); %>, '<% nvram_get("qos_appport6"); %>', '<% nvram_get("qos_appname6"); %>'),
	new protocol_option("port7", "Application Name", <% nvram_get("sel_qosport7"); %>, '<% nvram_get("qos_appport7"); %>', '<% nvram_get("qos_appname7"); %>'),
	new protocol_option("port8", "Application Name", <% nvram_get("sel_qosport8"); %>, '<% nvram_get("qos_appport8"); %>', '<% nvram_get("qos_appname8"); %>')
);

function check_all_appport(F)
{
	var i, j;
	var m = new Array(8);
	var n = new Array(8);
	var port = '';
	
	for(i = 0; i<8; i++)
	{
		port = eval("F.qos_appport"+(i+1)).value;
		dash_index = port.indexOf("-");
				
		if(dash_index == "-1")
		{
			m[i] = n[i] = port;
		}
		else
		{
			m[i] = port.substring(0, dash_index);
			n[i] = port.substring(dash_index+1, port.length);
		}
	
	}
	for(i = 0; i< 7; i++)
	{
		if(m[i] == 0 && n[i] == 0)
		{
			continue;
		}
		for(j = i +1; j< 8; j++)
		{
			if(m[j] == 0  && n[j] == 0)
			{
				continue;
			}
			//alert("m["+i+"]="+m[i]+" n["+i+"]="+n[i]+" m["+j+"]="+m[j] +"n["+j+"]="+n[j]);
			if(!(m[i] > n[j] || n[i] < m[j]))
			{
				alert(qos.alert3);
				return false;
			}
		}
	}
	return true;
}
function to_submit(F)
{
	var multiple_high = 0;

	if(F.QoS[0].checked == true)
	{
		if(F.rate_mode.options[F.rate_mode.selectedIndex].value == "0")
		{
			if(Number(F.manual_rate.value) < 1 || Number(F.manual_rate.value) > 100000)
			{
				alert(errmsg.qosbanderr);
                        	return;
			}
		}
		if(((Number(F.qos_devmac1_0.value) != 0) 
					|| (Number(F.qos_devmac1_1.value) != 0) 
					|| (Number(F.qos_devmac1_2.value) != 0) 
					|| (Number(F.qos_devmac1_3.value) != 0) 
					|| (Number(F.qos_devmac1_4.value) != 0) 
					|| (Number(F.qos_devmac1_5.value) != 0)) 
				&& ((Number(F.qos_devmac2_0.value) != 0) 
					|| (Number(F.qos_devmac2_1.value) != 0) 
					|| (Number(F.qos_devmac2_2.value) != 0) 
					|| (Number(F.qos_devmac2_3.value) != 0) 
					|| (Number(F.qos_devmac2_4.value) != 0) 
					|| (Number(F.qos_devmac2_5.value) != 0)) 
				&& ((F.qos_devmac2_0.value == F.qos_devmac1_0.value) 
					&& (F.qos_devmac2_1.value == F.qos_devmac1_1.value) 
					&& (F.qos_devmac2_2.value == F.qos_devmac1_2.value) 
					&& (F.qos_devmac2_3.value == F.qos_devmac1_3.value) 
					&& (F.qos_devmac2_4.value == F.qos_devmac1_4.value) 
					&& (F.qos_devmac2_5.value == F.qos_devmac1_5.value)))
		{
			alert(errmsg.qossamemac);
			return;
		}

		/*for(var id1 = 1; id1 <= protocol_item.length - 1; id1++)
		{
			for(var id2 = 2; id2 <= protocol_item.length; id2++)
			{
				if(id1 == id2)
				{
					continue;
				}
				if((Number(eval("F.qos_appport" + id1).value) != 0) 
						&& (Number(eval("F.qos_appport" + id2).value) != 0) 
						&& (Number(eval("F.qos_appport" + id1).value) == Number(eval("F.qos_appport" + id2).value)))
				{
					alert(errmsg.qossameport);
					return;
				}
			}
		}*/
		if(!check_all_appport(F))
			return;
		
	for (i=1; (i<=2)&&(multiple_high<2); i++)
		if (eval("F.qos_devpri" + i).value == 3)
			multiple_high++;

	for (i=1; (i<5)&&(multiple_high<2); i++)
		if (eval("F." + port_based_item[0].name +i).value == 1)
			multiple_high++;
	
	for (i=0; (i<protocol_item.length)&&(multiple_high<2); i++)
		if (eval("F.sel_qos" + protocol_item[i].name).value == 3)
			multiple_high++;
	}
	
	if (multiple_high >=2)
//		if (!confirm("Setting multiple devices, ethernet port or application to high priority may negate the effect of QoS.\nAre you sure you want to proceed?"))
		if (!confirm(qos.confirm1))
		return;

	if (F.enable_game_.checked == true)
		F.enable_game.value = 1;
	else
		F.enable_game.value = 0;

	if((wl_wme_count %2)|| (wl_wme_no_ack_count %2))
	{
		F.need_restart.value ="1"; 
		F.wait_time.value ="30";
	}
       	F.change_action.value = "";
		F.submit_button.value = "QoS";
		F.gui_action.value = "Apply";
        	F.submit();
}
function per_port(priority, flow_control, rate_limit){
	this.port_priority_ = priority;
	this.port_flow_control_ = flow_control;
	this.port_rate_limit_ = rate_limit;
}
function port_based_option(name, item_array){
	this.name = name;
	this.item_array = item_array;
}

//options_priority=new Array('Low','High');
//options_flow_control=new Array('Disable','Enable');
options_priority=new Array(qos.low,qos.high);
options_flow_control=new Array(share.disabled,share.enabled);
//options_rate_limit=new Array('Disable','256k','512k','1M','2M','5M','10M','20M','50M');

port_based_item=new Array(
	new port_based_option("port_priority_", options_priority), 
	new port_based_option("port_flow_control_", options_flow_control) 
	//new port_based_option("port_flow_control_", options_flow_control), 
	//new port_based_option("port_rate_limit_", options_rate_limit)
);

var wl_wme_count = 1;
var wl_wme_no_ack_count = 0;
function SelWME(num,F)
{
	wme_enable_disable(F,num);
	wl_wme_count=wl_wme_count + 1;
}
function ChgVal()
{
        wl_wme_no_ack_count = wl_wme_no_ack_count + 1 ; 
}
function wme_enable_disable(F,I)
{
	var start = '';
	var end = '';
	var total = F.elements.length;
	for(i=0 ; i < total ; i++){
                if(F.elements[i].name == "wl_wme_no_ack")  start = i;
                //if(F.elements[i].name == "wl_wme_sta_vo5")  end = i;
                if(F.elements[i].name == "wl_wme_no_ack")  end = i;
        }
        if(start == '' || end == '')    return true;

	if( I == "0" || I == "off") {
		EN_DIS = 0;
		for(i = start; i<=end ;i++)
                        choose_disable(F.elements[i]);
	}
	else {
		EN_DIS = 1;
                for(i = start; i<=end ;i++)
                        choose_enable(F.elements[i]);
	}
}
function init2()
{
//	wme_enable_disable(document.wireless, '<% nvram_get("wl_wme"); %>');
}

options_port=new Array();
options_port[0]=new per_port(<% per_port_option("1"); %>);
options_port[1]=new per_port(<% per_port_option("2"); %>);
options_port[2]=new per_port(<% per_port_option("3"); %>);
options_port[3]=new per_port(<% per_port_option("4"); %>);

function init(){
	init_form_session_key(document.forms[0], "apply.cgi");
	qos_grey(<% nvram_get("QoS"); %>,document.QoS);
	wme_enable_disable(document.QoS, '<% nvram_get("wl_wme"); %>');
}

</SCRIPT>

</HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM name=QoS method=<% get_http_method(); %> action=apply.cgi>
<input type="hidden" name="ip_forward_disable" value="0">
<input type="hidden" name=enable_game value=0>
<input type="hidden" name=submit_button>
<input type="hidden" name=change_action>
<input type="hidden" name=need_restart value=0>
<input type=hidden name="wait_time" value="5">
<input type="hidden" name=gui_action>

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
    <TD width=605>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD width=156 bgcolor=#5b5b5b height=25><P align=right><B><FONT style="FONT-SIZE: 9pt" face=Arial color=#ffffff><script>Capture(qos.wqos)</script></FONT></B></P></TD>
          <TD width=8 bgcolor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=127 height=25>&nbsp;</TD>
          <TD width=300 height=25><INPUT onclick=qos_grey(this.value,this.form) type=radio value=1 name=QoS <% nvram_match("QoS","1","checked"); %>><script>Capture(share.enable)</script>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT onclick=qos_grey(this.value,this.form) type=radio value=0 
            name=QoS <% nvram_match("QoS","0","checked"); %>><script>Capture(share.disable)</script>&nbsp;</TD>
        </TR>
	<TR>
          <TD bgColor=#e7e7e7 height=1>&nbsp;</TD>
          <TD background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
          <TD height=25><B><script>Capture(qos.uband)</script></B></TD>
          <TD height=25>
		<SELECT name=rate_mode onChange=rate_grey(this.value,this.form)>
			<OPTION value=1 <% nvram_match("rate_mode","1","selected"); %>><script>Capture(share.auto)</script></OPTION>
			<OPTION value=0 <% nvram_match("rate_mode","0","selected"); %>><script>Capture(share.mtumanual)</script></OPTION>
		</SELECT>&nbsp;<INPUT class=num maxLength=6 size=6 value="<% nvram_get("manual_rate"); %>" name=manual_rate onBlur=valid_range(this,1,100000,"Bandwidth")>&nbsp;Kbps</TD>
        </TR>  


        <TR>
          <TD bgColor=#e7e7e7 height=25 align=right>&nbsp;</TD>
          <TD background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
          <TD width=417 height=25 colspan=2><HR color=#b5b5e6 SIZE=1></TD>
        </TR>



        <TR>
          <TD align=right bgColor=#e7e7e7 height=5><b><script>Capture(qos.dpriority)</script></b></TD>
          <TD background=image/UI_04.gif height=5></TD>
          <TD height=5></TD>
          <TD width=417 colSpan=2>
            <TABLE>
              <TR>
                <TD width=100 height=5>&nbsp;<b><script>Capture(qos.dname)</script><b></TD>
                <TD width=297 height=25>
                  <TABLE>
                    <CENTER>
                    <TR>
                      <TD align=middle width=80><B><script>Capture(qos.priority)</script></B></TD>
                      <TD align=middle width=217><B><script>Capture(share.macaddr)</script></B></TD>
		    </TR></CENTER>
		    
		  </TABLE>
		</TD>
	      </TR>
	    </TABLE>
	  </TD>
        </TR>
        <TR>
          <TD bgColor=#e7e7e7 height=5>&nbsp;</TD>
          <TD background=image/UI_04.gif height=5></TD>
          <TD height=5></TD>
          <TD width=417 colSpan=2>
            <TABLE>
              <TR>
                <TD width=100 height=5>
		<INPUT class=num maxLength=7 size=7 value="<% nvram_get("qos_devname1");%>" name=qos_devname1 onBlur=valid_name(this,"")></TD>
                <TD width=297 height=25>
                  <TABLE>
                    <CENTER>
                    <TR>
                      <TD align=middle width=80>
			<SELECT name=qos_devpri1>
				<OPTION value=0 <% nvram_match("qos_devpri1", "0", "selected"); %>><script>Capture(qos.low)</script></OPTION>
				<OPTION value=1 <% nvram_match("qos_devpri1", "1", "selected"); %>><script>Capture(qos.medium)</script></OPTION>
				<OPTION value=2 <% nvram_match("qos_devpri1", "2", "selected"); %>><script>Capture(qos.high)</script></OPTION>
				<OPTION value=3 <% nvram_match("qos_devpri1", "3", "selected"); %>><script>Capture(qos.highest)</script></OPTION>
			</SELECT>
		      </TD>
                     <TD align=middle>
 			<input type=hidden name="qos_devmac1"  value="6">
                                  <input name="qos_devmac1_0" value='<% get_single_mac("qos_devmac1", "0"); %>' size=2 maxlength=2 onBlur=valid_mac(this,0) class=num> :
                                  <input name="qos_devmac1_1" value='<% get_single_mac("qos_devmac1", "1"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num> :
                                  <input name="qos_devmac1_2" value='<% get_single_mac("qos_devmac1", "2"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num> :
                                  <input name="qos_devmac1_3" value='<% get_single_mac("qos_devmac1", "3"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num> :
                                  <input name="qos_devmac1_4" value='<% get_single_mac("qos_devmac1", "4"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num> :
                                  <input name="qos_devmac1_5" value='<% get_single_mac("qos_devmac1", "5"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num></TD>
		      </TD>
		    </CENTER>
		    </TR>
		  </TABLE>
		</TD>
	      </TR>
	    </TABLE>
	  </TD>
        </TR>
        <TR>
          <TD bgColor=#e7e7e7 height=5>&nbsp;</TD>
          <TD background=image/UI_04.gif height=5></TD>
          <TD height=5></TD>
          <TD width=417 colSpan=2>
            <TABLE>
              <TR>
                <TD width=100 height=5>
		<INPUT class=num maxLength=7 size=7 value="<% nvram_get("qos_devname2");%>" name=qos_devname2></TD>
                <TD width=297 height=25>
                  <TABLE>
                    <CENTER>
                    <TR>
                      <TD align=middle width=80>
			<SELECT name=qos_devpri2>
				<OPTION value=0 <% nvram_match("qos_devpri2", "0", "selected"); %>><script>Capture(qos.low)</script></OPTION>
				<OPTION value=1 <% nvram_match("qos_devpri2", "1", "selected"); %>><script>Capture(qos.medium)</script></OPTION>
				<OPTION value=2 <% nvram_match("qos_devpri2", "2", "selected"); %>><script>Capture(qos.high)</script></OPTION>
				<OPTION value=3 <% nvram_match("qos_devpri2", "3", "selected"); %>><script>Capture(qos.highest)</script></OPTION>
			</SELECT>
		      </TD>
                     <TD align=middle>
 			<input type=hidden name="qos_devmac2"  value="6">
                                  <input name="qos_devmac2_0" value='<% get_single_mac("qos_devmac2", "0"); %>' size=2 maxlength=2 onBlur=valid_mac(this,0) class=num> :
                                  <input name="qos_devmac2_1" value='<% get_single_mac("qos_devmac2", "1"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num> :
                                  <input name="qos_devmac2_2" value='<% get_single_mac("qos_devmac2", "2"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num> :
                                  <input name="qos_devmac2_3" value='<% get_single_mac("qos_devmac2", "3"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num> :
                                  <input name="qos_devmac2_4" value='<% get_single_mac("qos_devmac2", "4"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num> :
                                  <input name="qos_devmac2_5" value='<% get_single_mac("qos_devmac2", "5"); %>' size=2 maxlength=2 onBlur=valid_mac(this,1) class=num></TD>
		      </TD>
		    </CENTER>
		    </TR>
		  </TABLE>
		</TD>
	      </TR>
	    </TABLE>
	  </TD>
        </TR>

        <TR>
          <TD bgColor=#e7e7e7 height=25 align=right>&nbsp;</TD>
          <TD background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
          <TD width=417 height=25 colspan=2><HR color=#b5b5e6 SIZE=1></TD>
        </TR>

        <TR>
          <TD align=right bgColor=#e7e7e7 height=5><b><script>Capture(qos.eppriority)</script></b></TD>
          <TD background=image/UI_04.gif height=5></TD>
          <TD height=5></TD>
          <TD width=417 colSpan=2>
            <TABLE>
              <TR>
                <TD width=110 height=5>&nbsp;</TD>
                <TD width=287 height=25>
                  <TABLE>
                    <CENTER>
                    <TR>
                      <TD align=middle width=120><B><script>Capture(qos.priority)</script></B></TD>
                      <TD align=middle width=120><B><script>Capture(qos.flowctrl)</script></B></TD>
                      <!--TD align=middle width=80><B>Incoming Rate Limit</B></TD-->
		    </TR></CENTER>
		    
		  </TABLE>
		</TD>
	      </TR>
	    </TABLE>
	  </TD>
        </TR>


  <SCRIPT> 
  		for(i=1;i<5;i++)
  		{        
			document.write("<TR>");
			document.write("<TD bgColor=#e7e7e7 height=25></TD>");
			document.write("<TD background=image/UI_04.gif height=25>&nbsp;</TD>");
			document.write("<TD height=25>&nbsp;</TD>");
			document.write("<TD width=417 colSpan=2>");
			document.write("<TABLE valign='top'>");
			document.write("<TR>");        
			document.write("<TD width=100 height=25><B>" + errmsg.err46 + " ");
			document.write(i);
			document.write("</B>&nbsp;&nbsp; </TD>");
			document.write("<TD width=287 height=25>");
			document.write("<TABLE valign='top'>");
			document.write("<TR>");        

			for (j=0; j<port_based_item.length; j++){	
				document.write("<TD align=middle width=120>");
				document.write("<SELECT name=");
				document.write(port_based_item[j].name);
				document.write(i);
				document.write(">");
				for (k=0 ; k<port_based_item[j].item_array.length ; k++){
					document.write("<option value=" +k);
					if (k == eval("options_port[i-1]." + port_based_item[j].name))
						document.write(" selected");
					document.write(">"+port_based_item[j].item_array[k]+"</option>");
				}
				document.write("</SELECT>");
				document.write("</TD>");
			}
			
			document.write(" </TR>");
			document.write(" </TABLE>");
			document.write("</TD>");
			document.write(" </TR>");
			document.write(" </TABLE>");
			document.write("</TD>");
			document.write("</TR>");
           }
	  </SCRIPT>       



<!-- HR -->


        <TR>
          <TD bgColor=#e7e7e7 height=25 align=right>&nbsp;</TD>
          <TD background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
          <TD width=417 height=25 colspan=2><HR color=#b5b5e6 SIZE=1></TD>
        </TR>


<!-- HR -->

        <TR>
          <TD align=right bgColor=#e7e7e7 height=25><b><script>Capture(qos.appriority)</script></b></TD>
          <TD background="image/UI_04.gif">&nbsp;</TD>
          <TD>&nbsp;</TD>
          <TD width=110 height=25>&nbsp;</TD>
          <TD width=287 height=25><input type=checkbox name=enable_game_ <% nvram_match("enable_game", "1", "checked"); %>><B>&nbsp;<script>Capture(qos.optgame)</script><B>
	  </TD>
        </TR>

        <TR>
          <TD bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD background="image/UI_04.gif">&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
          <TD height=25>&nbsp;<B><script>Capture(qos.appname)</script></TD>
          <TD height=25>
            <TABLE>
              <CENTER>
              <TR>
                <TD align=middle width=120><B><script>Capture(qos.priority)</script></B></TD>
                <TD align=middle width=120><B><script>Capture(qos.specport)</script></B></TD>
	      </TR></CENTER>
	      
	    </TABLE>
	  </TD>
        </TR>

  <SCRIPT> 
	for(i =0, j=1; i< protocol_item.length; i++){	
		document.write("<TR>");
          	document.write("<TD bgColor=#e7e7e7 height=5>&nbsp;</TD>");
          	document.write("<TD background=image/UI_04.gif>&nbsp;</TD>");
          	document.write("<TD></TD>");
          	document.write("<TD height=5><B>");
//		document.write(protocol_item[i].title);
		/*if (protocol_item[i].title != "Application Name")
                        document.write(protocol_item[i].title);
                else
                        document.write(qos.appname + "<br>");
		document.write("</B>");*/

		if (protocol_item[i].title == "Application Name")
		{
			document.write("<INPUT class=num maxLength=7 size=7 value='");
	    		document.write(protocol_item[i].app_name + "' "); 
            		document.write("name=qos_appname" + j);
			document.write(" onBlur=valid_name(this,'')>");
          	}	
		document.write("</TD>");
		document.write("<TD height=25>"); 
            	document.write("<TABLE valign=top>");
              	document.write("<TR>");
                document.write("<TD align=middle width=120><SELECT name=");
		document.write("sel_qos" + protocol_item[i].name + ">");
                document.write("<OPTION value=0");
		if (protocol_item[i].value == 0)
			document.write(" selected");
		document.write(">" + qos.low + "</OPTION>");
                document.write("<OPTION value=1");
		if (protocol_item[i].value == 1)
			document.write(" selected");
		document.write(">" + qos.medium + "</OPTION>");
		document.write("<OPTION value=2");
		if (protocol_item[i].value == 2)
			document.write(" selected");
                document.write(">" + qos.high + "</OPTION>");
                document.write("<OPTION value=3");
		if (protocol_item[i].value == 3)
			document.write(" selected");
                document.write(">" + qos.highest + "</OPTION>");
                document.write("</SELECT></TD>");
                document.write("<TD align=middle width=120>");
		if (protocol_item[i].title == "Application Name")
		{
			document.write("<INPUT class=num maxLength=11 onBlur=PortCheck(this) size=11 value='");
	    		document.write(protocol_item[i].port + "' "); 
            		document.write("name=qos_appport" + j);
			document.write(">");
			j++;
          	}    	
		else
		{
	    		document.write(protocol_item[i].port); 
		}
	    	document.write("</TD>"); 
	      	document.write("</TR>");
	    	document.write("</TABLE>");
	  	document.write("</TD>");
        	document.write("</TR>");
	}
  </SCRIPT> 

        <TR>
          <TD bgColor=#e7e7e7 height=25 align=right>&nbsp;</TD>
          <TD background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
          <TD width=417 height=25 colspan=2><HR color=#b5b5e6 SIZE=1></TD>
        </TR>



<!--
        </TABLE></TD>

    <TD width=13 bgcolor=#ffffff></TD>
    <TD width=15 background="image/UI_05.gif">&nbsp;</TD>

-->


<!-- ************************************* -->

        <TR>
          <TD bgcolor=#5b5b5b height=25>
            <P align=right><b><font face="Arial" color="#FFFFFF" style="font-size: 9pt"><script>Capture(qos.wlqos)</script></font></b></P></TD>
          <TD bgcolor=#5b5b5b height=25>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
        </TR>
        <TR>
          <TD bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD>&nbsp;</TD>
          <TD height=25><b><script>Capture(qos.wme)</script>:</b></TD>
          <TD height=25><SELECT name="wl_wme" onChange=SelWME(this.form.wl_wme.selectedIndex,this.form)> 
    <option value="off" <% nvram_selmatch("wl_wme", "off", "selected"); %>><script>Capture(share.disable)</script></option>
    <option value="on" <% nvram_selmatch("wl_wme", "on", "selected"); %>><script>Capture(share.enable)</script></option>
    </SELECT>&nbsp;&nbsp;<script>Capture(qos.defdis)</script></TD></TD>
        </TR>
        <TR>
          <TD bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
          <TD height=25><b><script>Capture(qos.noack)</script>:</b></TD>
          <TD height=25><SELECT name="wl_wme_no_ack" onChange="ChgVal()"> 
    <option value="off" <% nvram_selmatch("wl_wme_no_ack", "off", "selected"); %>><script>Capture(share.disable)</script></option>
    <option value="on" <% nvram_selmatch("wl_wme_no_ack", "on", "selected"); %>><script>Capture(share.enable)</script></option>
    </SELECT>&nbsp;&nbsp;<script>Capture(qos.defdis)</script></TD></TD>
        </TR>



<!--  Wireless QoS detail setting

        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25 align=right><b><script>Capture(qos.edca_ap)</script></b></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=24 height=25>&nbsp;</TD>
          <TD width=110 height=25>&nbsp;</TD>
          <TD height=25><script>Capture(qos.cwmin)</script>&nbsp;&nbsp;<script>Capture(qos.cwmax)</script>&nbsp;&nbsp;&nbsp;<script>Capture(qos.aifsn)</script>&nbsp;&nbsp;<script>Capture(qos.txopb)</script>&nbsp;&nbsp;<script>Capture(qos.txopag)</script>&nbsp;<script>Capture(qos.admin)</script>&nbsp;<script>Capture(qos.forced)</script></TD>
        </TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=24 height=25>&nbsp;</TD>
          <TD width=110 height=25><script>Capture(qos.ac_bk)</script>:</TD>
          <TD height=25><input type="hidden" name="wl_wme_ap_bk" value="5">
	  <input class=num name="wl_wme_ap_bk0" value="<% nvram_list("wl_wme_ap_bk", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_ap_bk1" value="<% nvram_list("wl_wme_ap_bk", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_ap_bk2" value="<% nvram_list("wl_wme_ap_bk", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_ap_bk3" value="<% nvram_list("wl_wme_ap_bk", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_ap_bk4" value="<% nvram_list("wl_wme_ap_bk", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_ap_bk5">
            <option value="off" <% wme_match_op("wl_wme_ap_bk", "off", "selected"); %>><script>Capture(hwlad2.off)</script></option>
            <option value="on" <% wme_match_op("wl_wme_ap_bk", "on", "selected"); %>><script>Capture(hwlad2.on)</script></option>
          </select>
</TD>
        </TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=24 height=25>&nbsp;</TD>
          <TD width=110 height=25><script>Capture(qos.ac_be)</script>:</TD>
          <TD height=25><input type="hidden" name="wl_wme_ap_be" value="5">
	  <input class=num name="wl_wme_ap_be0" value="<% nvram_list("wl_wme_ap_be", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_ap_be1" value="<% nvram_list("wl_wme_ap_be", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_ap_be2" value="<% nvram_list("wl_wme_ap_be", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_ap_be3" value="<% nvram_list("wl_wme_ap_be", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_ap_be4" value="<% nvram_list("wl_wme_ap_be", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_ap_be5">
            <option value="off" <% wme_match_op("wl_wme_ap_be", "off", "selected"); %>><script>Capture(hwlad2.off)</script></option>
            <option value="on" <% wme_match_op("wl_wme_ap_be", "on", "selected"); %>><script>Capture(hwlad2.on)</script></option>
          </select>
</TD>
        </TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=24 height=25>&nbsp;</TD>
          <TD width=110 height=25><script>Capture(qos.ac_vi)</script>:</TD>
          <TD height=25><input type="hidden" name="wl_wme_ap_vi" value="5">
	  <input class=num name="wl_wme_ap_vi0" value="<% nvram_list("wl_wme_ap_vi", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_ap_vi1" value="<% nvram_list("wl_wme_ap_vi", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_ap_vi2" value="<% nvram_list("wl_wme_ap_vi", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_ap_vi3" value="<% nvram_list("wl_wme_ap_vi", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_ap_vi4" value="<% nvram_list("wl_wme_ap_vi", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_ap_vi5">
            <option value="off" <% wme_match_op("wl_wme_ap_vi", "off", "selected"); %>><script>Capture(hwlad2.off)</script></option>
            <option value="on" <% wme_match_op("wl_wme_ap_vi", "on", "selected"); %>><script>Capture(hwlad2.on)</script></option>
          </select>
</TD>
        </TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=24 height=25>&nbsp;</TD>
          <TD width=110 height=25><script>Capture(qos.ac_vo)</script>:</TD>
          <TD height=25><input type="hidden" name="wl_wme_ap_vo" value="5">
	  <input class=num name="wl_wme_ap_vo0" value="<% nvram_list("wl_wme_ap_vo", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_ap_vo1" value="<% nvram_list("wl_wme_ap_vo", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_ap_vo2" value="<% nvram_list("wl_wme_ap_vo", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_ap_vo3" value="<% nvram_list("wl_wme_ap_vo", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_ap_vo4" value="<% nvram_list("wl_wme_ap_vo", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_ap_vo5">
            <option value="off" <% wme_match_op("wl_wme_ap_vo", "off", "selected"); %>><script>Capture(hwlad2.off)</script></option>
            <option value="on" <% wme_match_op("wl_wme_ap_vo", "on", "selected"); %>><script>Capture(hwlad2.on)</script></option>
          </select>
</TD>
        </TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25 align=right><b><script>Capture(qos.edca_sta)</script><b></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=24 height=25>&nbsp;</TD>
          <TD width=110 height=25>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
        </TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=24 height=25>&nbsp;</TD>
          <TD width=110 height=25><script>Capture(qos.ac_bk)</script>:</TD>
          <TD height=25><input type="hidden" name="wl_wme_sta_bk" value="5">
	  <input class=num name="wl_wme_sta_bk0" value="<% nvram_list("wl_wme_sta_bk", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_sta_bk1" value="<% nvram_list("wl_wme_sta_bk", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_sta_bk2" value="<% nvram_list("wl_wme_sta_bk", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_sta_bk3" value="<% nvram_list("wl_wme_sta_bk", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_sta_bk4" value="<% nvram_list("wl_wme_sta_bk", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_sta_bk5">
            <option value="off" <% wme_match_op("wl_wme_sta_bk", "off", "selected"); %>><script>Capture(hwlad2.off)</script></option>
            <option value="on" <% wme_match_op("wl_wme_sta_bk", "on", "selected"); %>><script>Capture(hwlad2.on)</script></option>
          </select>
</TD>
        </TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=24 height=25>&nbsp;</TD>
          <TD width=110 height=25><script>Capture(qos.ac_be)</script>:</TD>
          <TD height=25><input type="hidden" name="wl_wme_sta_be" value="5">
	  <input class=num name="wl_wme_sta_be0" value="<% nvram_list("wl_wme_sta_be", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_sta_be1" value="<% nvram_list("wl_wme_sta_be", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_sta_be2" value="<% nvram_list("wl_wme_sta_be", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_sta_be3" value="<% nvram_list("wl_wme_sta_be", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_sta_be4" value="<% nvram_list("wl_wme_sta_be", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_sta_be5">
            <option value="off" <% wme_match_op("wl_wme_sta_be", "off", "selected"); %>><script>Capture(hwlad2.off)</script></option>
            <option value="on" <% wme_match_op("wl_wme_sta_be", "on", "selected"); %>><script>Capture(hwlad2.on)</script></option>
          </select>
</TD>
        </TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=24 height=25>&nbsp;</TD>
          <TD width=110 height=25><script>Capture(qos.ac_vi)</script>:</TD>
          <TD height=25><input type="hidden" name="wl_wme_sta_vi" value="5">
	  <input class=num name="wl_wme_sta_vi0" value="<% nvram_list("wl_wme_sta_vi", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_sta_vi1" value="<% nvram_list("wl_wme_sta_vi", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_sta_vi2" value="<% nvram_list("wl_wme_sta_vi", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_sta_vi3" value="<% nvram_list("wl_wme_sta_vi", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_sta_vi4" value="<% nvram_list("wl_wme_sta_vi", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_sta_vi5">
            <option value="off" <% wme_match_op("wl_wme_sta_vi", "off", "selected"); %>><script>Capture(hwlad2.off)</script></option>
            <option value="on" <% wme_match_op("wl_wme_sta_vi", "on", "selected"); %>><script>Capture(hwlad2.on)</script></option>
          </select>
</TD>
        </TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=24 height=25>&nbsp;</TD>
          <TD width=110 height=25><script>Capture(qos.ac_vo)</script>:</TD>
          <TD height=25><input type="hidden" name="wl_wme_sta_vo" value="5">
	  <input class=num name="wl_wme_sta_vo0" value="<% nvram_list("wl_wme_sta_vo", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_sta_vo1" value="<% nvram_list("wl_wme_sta_vo", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_sta_vo2" value="<% nvram_list("wl_wme_sta_vo", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_sta_vo3" value="<% nvram_list("wl_wme_sta_vo", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_sta_vo4" value="<% nvram_list("wl_wme_sta_vo", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_sta_vo5">
            <option value="off" <% wme_match_op("wl_wme_sta_vo", "off", "selected"); %>><script>Capture(hwlad2.off)</script></option>
            <option value="on" <% wme_match_op("wl_wme_sta_vo", "on", "selected"); %>><script>Capture(hwlad2.on)</script></option>
          </select>
</TD>
        </TR>



-->

<!-- ************************************* -->
        <TR>
          <TD width=156 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background="image/UI_04.gif">&nbsp;</TD>
          <TD width=439 colspan=3>&nbsp;</TD>
        </TR>
	</TABLE></TD>
    
    <TD width=13 bgcolor=#ffffff></TD>
    <TD width=15 background="image/UI_05.gif">&nbsp;</TD> 
    
    <TD vAlign=top width=176 bgcolor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TR>
          <TD width=11 height=25>&nbsp;</TD>
          <TD width=156 height=25><font color="#FFFFFF"><br>

<script>Capture(qos.right1)</script>
<br><br>
<b><script>Capture(qos.wqos)</script></b>
<br><br>
<script>Capture(qos.right2)</script>
<br><br>
<script>Capture(qos.right3)</script>
<br><br>
<script>Capture(qos.right4)</script>
<br><br>
<b><script>Capture(qos.wlqos)</script></b>
<br><br>
<script>Capture(qos.right5)</script>
<br><br>
<script>Capture(qos.right6)</script>
<br>

          <span ><!--a target="_blank" href="help/HQoS.asp?session_id=<% nvram_get("session_key"); %>"><b>More...</b></a--></span></font></TD>
          <TD width=9 height=25>&nbsp;</TD>
	</TR>
      </TABLE>
    </TD>
    </TR>

  <TR>
    <TD width=809 colSpan=4><TABLE cellSpacing=0 cellPadding=0 border=0 bgcolor="#FFFFFF">
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=30>&nbsp;</TD>
          <TD width=8 background="image/UI_04.gif">&nbsp;</TD>
          <TD width=454>&nbsp;</TD>
	  <TD width="15" rowspan="2" background="image/UI_05.gif">&nbsp;</TD>
          <TD width="176" rowspan="2" align="right" bgcolor="#2971b9" border="0" height="64">&nbsp;</TD>
          </TR>
        <TR>
          <TD width=156 height=33 bgcolor=#5b5b5b>&nbsp;</TD>
          <TD width=8 bgcolor=#5b5b5b>&nbsp;</TD>
          <TD width=454 bgcolor=#2971b9 align=right>
<TABLE>
<TR>
<TD width=101 bgcolor=#175592 align=center height=20><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:to_submit(document.forms[0])"><script>Capture(sbutton.save)</script></A></font></TD>
		<TD width=8></TD>
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('QoS.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE>	  </TD>
          </TR>
      </TABLE>
      </TD>
      </TR>
      </TABLE>
<input type="hidden" name="ip_forward_enable" value="1">
  </FORM>
  </DIV>
  </BODY>
</HTML>
