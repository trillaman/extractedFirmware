<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Basic Setup</TITLE>
<% no_cache(); %>
<% charset(); %>
<% web_include_file("filelink.asp"); %>
<SCRIPT language=JavaScript>
document.title = topmenu.basicsetup;
var EN_DIS2 = '<% nvram_get("mtu_enable"); %>';	
var wan_proto = '<% nvram_get("wan_proto"); %>';
var dhcp_win = null;

function valid_mtu(I)
{
	var min = '<% get_mtu("min"); %>';
	var max = '<% get_mtu("max"); %>';
	valid_range(I,min,max,"MTU");
	d = parseInt(I.value, 10);
	if(d > max) {
		I.value = max ;
	}
	if(d < min) {
		I.value = max ;
	}
}
function SelMTU(num,F)
{
	mtu_enable_disable(F,num);
}
function mtu_enable_disable(F,I)
{
	EN_DIS1 = I;
	if ( I == "0" ){
		choose_disable(F.wan_mtu);
	}
	else{
		choose_enable(F.wan_mtu);
	}
}


function SelWAN(num,F)
{
        F.submit_button.value = "index";
        F.change_action.value = "gozila_cgi";
        F.wan_proto.value=F.wan_proto.options[num].value;
        F.submit();
}

function SelPPP(num,F)
{
        F.submit_button.value = "index";
        F.change_action.value = "gozila_cgi";
        F.mpppoe_enable.value = F.mpppoe_enable.options[num].value;
        F.submit();
}

function to_submit(F)
{
	if(valid_value(F) && valid_lan_ip(F) ){
<% support_invmatch("PPTP_DHCPC_SUPPORT", "1", "/*"); %>
		if(valid_wan_ip(F))
		{
			return;
		}
<% support_invmatch("PPTP_DHCPC_SUPPORT", "1", "*/"); %>
		if(F._daylight_time.checked == false)
			F.daylight_time.value = 0;
		else
			F.daylight_time.value = 1;

		F.submit_button.value = "index";
		F.gui_action.value = "Apply";
        	F.submit();
	}
}
function valid_value(F)
{
	if(F.now_proto.value == "pptp" || F.now_proto.value == "static"){
<% support_invmatch("PPTP_DHCPC_SUPPORT", "1", "/*"); %>
		if((F.now_proto.value == "pptp" && F.sel_pptp_dhcp[1].checked == true) || F.now_proto.value == "static")
		{
<% support_invmatch("PPTP_DHCPC_SUPPORT", "1", "*/"); %>
		if(!valid_ip(F,"F.wan_ipaddr","IP",ZERO_NO|MASK_NO))
                        return false;

		if(!valid_mask(F,"F.wan_netmask",ZERO_NO|BCST_NO))
			return false;
<% support_invmatch("PPTP_DHCPC_SUPPORT", "1", "/*"); %>
		}
<% support_invmatch("PPTP_DHCPC_SUPPORT", "1", "*/"); %>

		if(F.now_proto.value == "static"){
			if(!valid_ip(F,"F.wan_gateway","Gateway",ZERO_NO|MASK_NO))
              		  	return false;
			//if(!valid_ip(F,"F.wan_dns0","DNS",MASK_NO))
			//	return false;
			//if(!valid_ip(F,"F.wan_dns1","DNS",MASK_NO))
			//	return false;
			//if(!valid_ip(F,"F.wan_dns2","DNS",MASK_NO))
			//	return false;
			if(!valid_ip_gw(F,"F.wan_ipaddr","F.wan_netmask","F.wan_gateway"))
				return false;
		}

		if(F.now_proto.value == "pptp"){
<% support_invmatch("PPTP_DHCPC_SUPPORT", "1", "/*"); %>
			if(F.sel_pptp_dhcp[1].checked == true)
			{
			if(!valid_ip(F,"F.wan_pptp_gateway","Gateway",ZERO_NO|MASK_NO))
				return false;
	
			if(!valid_ip_gw(F,"F.wan_ipaddr","F.wan_netmask","F.wan_pptp_gateway"))
				return false;
			}
				
			if(!valid_ip(F,"F.pptp_server_ip","PPTP Server IP",ZERO_NO|MASK_NO))
                		return false;
			if(F.sel_pptp_dhcp[1].checked == true)
			{
				if(!valid_ip_for_dns(F,"F.wan_pptp_dns0","IP",ZERO_NO|MASK_NO) 
					&& !valid_ip_for_dns(F,"F.wan_pptp_dns1","IP",ZERO_NO|MASK_NO) 
					&& !valid_ip_for_dns(F,"F.wan_pptp_dns2","IP",ZERO_NO|MASK_NO) )
				{
					alert(errmsg.pptpnodns);
						return false;
				}
				if(F.pptp_server_ip_0.value == F.wan_ipaddr_0.value 
					&& F.pptp_server_ip_1.value == F.wan_ipaddr_1.value 
					&& F.pptp_server_ip_2.value == F.wan_ipaddr_2.value 
					&& F.pptp_server_ip_3.value == F.wan_ipaddr_3.value)
				{
					alert(errmsg.pptpsameserver);
					return false;
				}
			}
<% support_invmatch("PPTP_DHCPC_SUPPORT", "1", "*/"); %>
<% support_match("PPTP_DHCPC_SUPPORT", "1", "/*"); %>
			if(!valid_ip(F,"F.pptp_server_ip","Gateway",ZERO_NO|MASK_NO))
                		return false;
			if(!valid_ip_gw(F,"F.wan_ipaddr","F.wan_netmask","F.pptp_server_ip"))
				return false;
<% support_match("PPTP_DHCPC_SUPPORT", "1", "*/"); %>
		}

	}
	if(F.now_proto.value == "pppoe" || F.now_proto.value == "pptp" || F.now_proto.value == "l2tp" || F.now_proto.value == "heartbeat"){
		if(F.ppp_username.value == ""){
//                      alert("You must input a username!");
                        alert(errmsg.err0);
			F.ppp_username.focus();
			return false;
		}
		if(F.ppp_passwd.value == ""){
//                      alert("You must input a passwd!");
                        alert(errmsg.err6);
			F.ppp_passwd.focus();
			return false;
		}
	}
	
	if(!valid_dhcp_server(F))
		return false;

	if(F.router_name.value == ""){
//              alert("You must input a Router Name!");
                alert(errmsg.err1);
                F.router_name.focus();
                return false;
	}	

	return true;
}
function valid_hb(I,M)
{
	if(I.value == "0.0.0.0" || I.value == "255.255.255.255") {
//		alert("The Telstra Cable Server IP Address is invalid!");
//              alert("The HeartBeat Server IP Address is invalid!");
                alert(errmsg2.err0);
		I.value = I.defaultValue;
		return false;
	}
	return valid_name(I,M);
}

function valid_dhcp_server(F)
{
	if(F.lan_proto.selectedIndex == 0)
                return true;

        a1 = parseInt(F.dhcp_start.value,10);
        a2 = parseInt(F.dhcp_num.value,10);
        a3 = parseInt(F.lan_ipaddr_3.value,10);
        //if(a1 + a2 > 255){
		if(((a3 < a1 || a3 > a1 + a2) && ((a1 + a2) > (et - 1))) 
				|| ((a3 >= a1 && a3 <= (a1 + a2)) && (a1 + a2 + 1) > (et - 1))){
//                alert("Out of range, please adjust start IP address or user's numbers.");
                alert(errmsg.err2);
                return false;
        }       
	  if(F.lan_ipaddr_3.value == F.dhcp_start.value)
	  {
		alert(errmsg.err75);
                return false;
	  }

        if(!valid_ip(F,"F.wan_dns0","DNS",MASK_NO))
                return false;
        if(!valid_ip(F,"F.wan_dns1","DNS",MASK_NO))
                return false;
        if(!valid_ip(F,"F.wan_dns2","DNS",MASK_NO))
                return false;
        if(!valid_ip(F,"F.wan_wins","WINS",MASK_NO))
                return false;

	return true;
}
function SelDHCP(T,F)
{
	dhcp_enable_disable(F,T);
}

function dhcp_enable_disable(F,T)
{
	var start = '';
	var end = '';
 	var total = F.elements.length;
	for(i=0 ; i < total ; i++){
		if(F.elements[i].name == "dhcp_start")	start = i;
		if(F.elements[i].name == "wan_wins_3")	end = i;
	}
	if(start == '' || end == '')	return true;

	if( T == "static" ) {
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
function SelTime(num,f)
{
	var str = f.time_zone.options[num].value;
	var Arr = new Array();
	Arr = str.split(' ');
	aaa = Arr[2];
	daylight_enable_disable(f,aaa);
}

function ppp_enable_disable(F,I)
{
	if( I == "0"){
		choose_disable(F.ppp_idletime);
		choose_enable(F.ppp_redialperiod);
	}
	else{
		choose_enable(F.ppp_idletime);
		choose_disable(F.ppp_redialperiod);
	}
}
function daylight_enable_disable(F,aaa)
{
	if(aaa == 0){
                F._daylight_time.checked = false;
                choose_disable(F._daylight_time);
                F.daylight_time.value = 0;
        }
        else{
                choose_enable(F._daylight_time);                
                F._daylight_time.checked = true;
                F.daylight_time.value = 1;
        }

}
function init()
{
	init_form_session_key(document.forms[0], "apply.cgi");
	mtu_enable_disable(document.setup,'<% nvram_get("mtu_enable"); %>');
	var str = document.setup.time_zone.options[document.setup.time_zone.selectedIndex].value;
	var Arr = new Array();
	Arr = str.split(' ');
	aaa = Arr[2];

	if(aaa == 0){
                document.setup._daylight_time.checked = false;
                choose_disable(document.setup._daylight_time);
                document.setup.daylight_time.value = 0;
        }

	if(document.setup.now_proto.value == "pppoe" || document.setup.now_proto.value == "pptp" || document.setup.now_proto.value == "l2tp" || document.setup.now_proto.value == "heartbeat")
		ppp_enable_disable(document.setup,'<% nvram_get("ppp_demand"); %>');

<% support_invmatch("PPTP_DHCPC_SUPPORT", "1", "/*"); %>
	if(document.setup.now_proto.value == "pptp") {
		pptp_dhcp = "<% nvram_else_match("sel_pptp_dhcp","1","1", "0"); %>" ; 
		selpptpmode(pptp_dhcp);
		if ( pptp_dhcp == 1 ) 
			document.setup.sel_pptp_dhcp[0].checked = true ; 
		else
			document.setup.sel_pptp_dhcp[1].checked = true ; 
	}
<% support_invmatch("PPTP_DHCPC_SUPPORT", "1", "*/"); %>

	dhcp_enable_disable(document.setup,'<% nvram_get("lan_proto"); %>');

	var max_mtu = <% get_mtu("max"); %>;
	if(document.setup.wan_mtu.value > max_mtu || document.setup.mtu_enable.value == '0') 
	{
		document.setup.wan_mtu.value = max_mtu;
	}
	init_range_value();

}

function valid_lan_ip(F)
{
		M1 = "value is out of range";
		var mask = new Array(4);
		var ip = new Array(4);
		var netid = new Array(4);
		var brcastip = new Array(4);
		for(i=0,j=0;i<4;i++,j=j+4)
		{
			ip[i]=eval("F.lan_ipaddr_"+i).value;
			mask[i]=F.lan_netmask.value.substring(j,j+3);
			netid[i]=eval(ip[i]&mask[i]);
			if(i<3)
				brcastip[i]=netid[i];
			else
				brcastip[i]=eval(netid[i]+255-mask[i]);	
		}
		startip = eval(netid[3]+1);
		endip = eval(brcastip[3]-1);
		if( ip[0] == netid[0] && ip[1] == netid[1] && ip[2] == netid[2] && ip[3] == netid[3])
		{
			alert(M1+" ["+startip+"-"+endip+"]");
			F.lan_ipaddr_0.value = F.lan_ipaddr_0.defaultValue;
			F.lan_ipaddr_1.value = F.lan_ipaddr_1.defaultValue;
			F.lan_ipaddr_2.value = F.lan_ipaddr_2.defaultValue;
			F.lan_ipaddr_3.value = F.lan_ipaddr_3.defaultValue;
			return false;
		}	
		
		if( ip[0] == brcastip[0] && ip[1] == brcastip[1] && ip[2] == brcastip[2] && ip[3] == brcastip[3])
		{
			alert(M1+" ["+startip+"-"+endip+"]");
			F.lan_ipaddr_0.value = F.lan_ipaddr_0.defaultValue;
			F.lan_ipaddr_1.value = F.lan_ipaddr_1.defaultValue;
			F.lan_ipaddr_2.value = F.lan_ipaddr_2.defaultValue;
			F.lan_ipaddr_3.value = F.lan_ipaddr_3.defaultValue;
			return false;
		}	
		if( (F.lan_ipaddr_0.value != F.lan_ipaddr_0.defaultValue) || (F.lan_ipaddr_1.value != F.lan_ipaddr_1.defaultValue) || (F.lan_ipaddr_2.value != F.lan_ipaddr_2.defaultValue) || (F.lan_ipaddr_3.value != F.lan_ipaddr_3.defaultValue) )
		{
			//F.router2gateway.value="1";
			F.wait_time.value="21";
			F.need_reboot.value="1";
		}
		return true;
}

var et = 256;	//const value
var st = 0;
var sip = new Array();
var eip = new Array();
function Sel_SubMask(F,I)
{
	var mask = new Array();
	var lanip3;
        var ucount;
	var iplen, iprange;
	var i; 
        var set2 = false;        
                
	mask = F.value.split(".");
	iprange = 256 - parseInt(mask[3]);
	iplen = 256 / iprange;

	lanip3 = I.lan_ipaddr_3.value ; 
	if (iprange > 50) 
		ucount = 50 ; 
	else 
		ucount = iprange - 3 ; 
        
	I.dhcp_num.value = ucount;
	now_count = ucount;
    for(i = 0; i < iplen; i++)
	{
		if (iplen == 1) 
		{
			if(parseInt(lanip3) != 100)
			        sip[0] = "100";
			else 
				sip[0] = "101";
				
			if((parseInt(lanip3) > parseInt(sip[0])) && ((parseInt(lanip3) - parseInt(sip[0])) < parseInt(ucount)))
			{
				eip[0] = parseInt(lanip3) - 1;
				sip[1] = parseInt(lanip3) + 1;
				eip[1] = parseInt(sip[1]) + parseInt(ucount) - (parseInt(eip[0]) - parseInt(sip[0])) - 2;
				set2 = true; 
			}
			else 
			eip[0] = parseInt(sip[0])+parseInt(ucount) - 1;
			et = 256;
			break;
		}
		else
		{
			st = i*iprange; 
			et = (i + 1) * iprange;
			if (lanip3 == st) 
			{
				alert(errmsg.errdhcpnetip);
				document.getElementById("DymRange").innerHTML = ""; 	
				return;
			}		
			if (lanip3 == et - 1) 
			{
				alert(errmsg.errdhcpbroip);
				document.getElementById("DymRange").innerHTML = ""; 	
				return;
			}		

			if ((st < lanip3) && (lanip3 < et))
			{
				st = st + 1 ; //It can not be the network IP
				if (st == lanip3)
				{
					sip[0] = st+1;
					eip[0] = parseInt(sip[0]) + parseInt(ucount) - 1;
				}
				else
				{
					if (lanip3 - st >= ucount)
					{
						sip[0] = st ; 
						eip[0] = parseInt(sip[0]) + parseInt(ucount) - 1;
					}
					else
					{
						sip[0] = st ; 
						eip[0] = parseInt(lanip3) - 1;
						sip[1] = parseInt(lanip3) + 1;
						eip[1] = parseInt(sip[1]) + parseInt(ucount)-( parseInt(eip[0]) - parseInt(sip[0])) - 2;
						set2 = true; 
					}
				}			
				break;		
			}
		}
	}

	document.getElementById("DymRange").innerHTML = I.lan_ipaddr_0.value + "." + I.lan_ipaddr_1.value + "." + I.lan_ipaddr_2.value + "." + sip[0] + " to " + eip[0]; 	
	if (set2 == true)
	{
       		document.getElementById("DymRange").innerHTML += "<BR>" + I.lan_ipaddr_0.value + "." + I.lan_ipaddr_1.value + "." + I.lan_ipaddr_2.value + "." + sip[1] + " to " + eip[1];
	}

	I.dhcp_start.value = sip[0];
}
function Sel_SubMask_onblur(F,I)
{
	var mask = new Array();
	var lanip3;
        var ucount;
	var iplen, iprange;
	var i; 
        var set2 = false;
    var start_ip, max_num;
	mask = F.value.split(".");
	iprange = 256 - parseInt(mask[3]);
	iplen = 256 / iprange;

	lanip3 = parseInt(I.lan_ipaddr_3.value) ;       
    start_ip = parseInt(I.dhcp_start.value) ;
	max_num = parseInt(I.dhcp_num.value);
	if ((iprange - 3) >= max_num) 
		ucount = max_num ; 
	else 
	{
    	alert(errmsg.err2);
		document.getElementById("DymRange").innerHTML = "";
		return;
	}    
	now_count = ucount;
    for(i = 0; i < iplen; i++)
	{
		if (iplen == 1) 
		{
			sip[0] = start_ip;

			if((parseInt(lanip3) > parseInt(sip[0])) && ((parseInt(lanip3) - parseInt(sip[0])) < parseInt(ucount)))
			{
				eip[0] = parseInt(lanip3) - 1;
				sip[1] = parseInt(lanip3) + 1;
				eip[1] = parseInt(sip[1]) + parseInt(ucount) - (parseInt(eip[0]) - parseInt(sip[0])) - 2;
				set2 = true; 
			}
			else 
				eip[0] = parseInt(sip[0])+parseInt(ucount) - 1;
			et = 256;
			break;
		}
		else
		{
			st = i*iprange; 
			et = (i + 1) * iprange;

			if ((st < lanip3) && (lanip3 < et))
			{
				st = st + 1 ; //It can not be the network IP
				if (st == lanip3)
				{
					sip[0] = st+1;
					if((st < start_ip) && (start_ip <= et))
					{
						sip[0] = start_ip;
					}
					eip[0] = parseInt(sip[0]) + parseInt(ucount) - 1;
				}
				else
				{
					if (lanip3 - st >= ucount)
	{
						sip[0] = st ; 
						if((st < start_ip) && (start_ip < et))
						{
							sip[0] = start_ip;
						}
						if((parseInt(lanip3) > parseInt(sip[0])) 
								&& ((parseInt(lanip3) - parseInt(sip[0])) < parseInt(ucount)))
						{
							eip[0] = parseInt(lanip3) - 1;
							sip[1] = parseInt(lanip3) + 1;
							eip[1] = parseInt(sip[1]) + parseInt(ucount) - (parseInt(eip[0]) - parseInt(sip[0])) - 2;
							set2 = true; 
	}
	else 
							eip[0] = parseInt(sip[0]) + parseInt(ucount) - 1;
					}
					else
	{
						sip[0] = st ; 
						if((st < start_ip) && (start_ip < et))
						{
							sip[0] = start_ip;
						}
						if((parseInt(lanip3) > parseInt(sip[0])) 
								&& ((parseInt(lanip3) - parseInt(sip[0])) < parseInt(ucount)))
						{
							eip[0] = parseInt(lanip3) - 1;
							sip[1] = parseInt(lanip3) + 1;
							eip[1] = parseInt(sip[1]) + parseInt(ucount) - (parseInt(eip[0]) - parseInt(sip[0])) - 2;
							set2 = true; 
						}
						else 
							eip[0] = parseInt(sip[0]) + parseInt(ucount) - 1;
					}
				}			
				break;		
			}
		}
	}
	
	if((!set2 && (parseInt(sip[0]) + parseInt(ucount)) > (et - 1)) 
			|| (set2 && (parseInt(sip[0]) + parseInt(ucount) + 1) > (et - 1)))
	{
		alert(errmsg.err2);
		document.getElementById("DymRange").innerHTML = ""; 	
		return;
	}

	document.getElementById("DymRange").innerHTML = I.lan_ipaddr_0.value + "." + I.lan_ipaddr_1.value + "." + I.lan_ipaddr_2.value + "." + sip[0] + " to " + eip[0]; 	
	if (set2 == true)
	{
       		document.getElementById("DymRange").innerHTML += "<BR>" + I.lan_ipaddr_0.value + "." + I.lan_ipaddr_1.value + "." + I.lan_ipaddr_2.value + "." + sip[1] + " to " + eip[1];
	}
	
   	I.dhcp_num.value = ucount;
	I.dhcp_start.value = sip[0];

}

function init_range_value()
{
	Sel_SubMask_onblur(document.setup.lan_netmask, document.setup);
}

function valid_dhcpd_start_ip(F, F1)
{
	if(F.lan_ipaddr_3.value == F.dhcp_start.value)
	{
		alert(errmsg.err75);
		F1.value = F1.defaultValue;
		return false;
	}
	return true;
}

<% support_invmatch("PPTP_DHCPC_SUPPORT", "1", "/*"); %>
function selpptpmode(I)
{
	var F = document.setup ; 
	var len = F.elements.length;
	var start ; 
	var end ; 
	var i ; 
	
	for(i=0; i<len; i++)
	{
		if(F.elements[i].name=="wan_ipaddr") start = i ; 
		if(F.elements[i].name=="wan_pptp_dns2_3") end = i ; 
	}
	if ( start == '' || end == '') return true ; 
	for(i=start; i<=end; i++)
	{
		if ( I == 0 ) 
			choose_enable(F.elements[i]);
		else
			choose_disable(F.elements[i]);
	}
}

function valid_wan_ip(F)
{
	var arrLanMask = new Array(4);
	arrLanMask = F.lan_netmask.options[F.lan_netmask.selectedIndex].value.split(".");
	
	if((F.now_proto.value == "pptp" && F.sel_pptp_dhcp[1].checked == true) || F.now_proto.value == "static")
	{
		if(((F.lan_ipaddr_0.value & arrLanMask[0]) == (F.wan_ipaddr_0.value & arrLanMask[0])) 
			&& ((F.lan_ipaddr_1.value & arrLanMask[1]) == (F.wan_ipaddr_1.value & arrLanMask[1]))
			&& ((F.lan_ipaddr_2.value & arrLanMask[2]) == (F.wan_ipaddr_2.value & arrLanMask[2]))
			&& ((F.lan_ipaddr_3.value & arrLanMask[3]) == (F.wan_ipaddr_3.value & arrLanMask[3])))
		{
			alert(errmsg.err74);
			return true;
		}
	}
	if(F.now_proto.value == "pptp")
	{
		if(((F.lan_ipaddr_0.value & arrLanMask[0]) == (F.pptp_server_ip_0.value & arrLanMask[0])) 
			&& ((F.lan_ipaddr_1.value & arrLanMask[1]) == (F.pptp_server_ip_1.value & arrLanMask[1]))
			&& ((F.lan_ipaddr_2.value & arrLanMask[2]) == (F.pptp_server_ip_2.value & arrLanMask[2]))
			&& ((F.lan_ipaddr_3.value & arrLanMask[3]) == (F.pptp_server_ip_3.value & arrLanMask[3])))
		{
			alert(errmsg.pptpservererr);
			return true;
		}
	}
	if(F.now_proto.value == "l2tp")
	{
		if(((F.lan_ipaddr_0.value & arrLanMask[0]) == (F.l2tp_server_ip_0.value & arrLanMask[0])) 
			&& ((F.lan_ipaddr_1.value & arrLanMask[1]) == (F.l2tp_server_ip_1.value & arrLanMask[1]))
			&& ((F.lan_ipaddr_2.value & arrLanMask[2]) == (F.l2tp_server_ip_2.value & arrLanMask[2]))
			&& ((F.lan_ipaddr_3.value & arrLanMask[3]) == (F.l2tp_server_ip_3.value & arrLanMask[3])))
		{
			alert(errmsg.l2tpservererr);
			return true;
		}
	}
	return false;
}

function valid_ip_for_dns(F,N,M1,flag){
    var m = new Array(4);
    M = unescape(M1);
 
    for(i=0;i<4;i++)
        m[i] = eval(N+"_"+i).value
 
    if(m[0] == 127 || m[0] == 224){
        return false;
    }
    if(m[0] == "0" && (m[1] != "0" || m[2] != "0" || m[3] != "0"))
    {
                return false;
    }
    if(m[0] == "0" && m[1] == "0" && m[2] == "0" && m[3] == "0"){
        if(flag & ZERO_NO){
            return false;
        }       
    }
 
    if((m[0] != "0" || m[1] != "0" || m[2] != "0") && m[3] == "0"){
        if(flag & MASK_NO){
            return false;
        }       
    }
    return true;
}
<% support_invmatch("PPTP_DHCPC_SUPPORT", "1", "*/"); %>

<% support_invmatch("MULTILANG_SUPPORT", "1", "*/"); %>
function SelLang(num,F)
{
	F.submit_button.value = "index";
	F.change_action.value = "gozila_cgi";
	F.submit_type.value = "language";
	F.ui_language.value=F.ui_language.options[num].value;
	F.submit();
      	
}
<% support_invmatch("MULTILANG_SUPPORT", "1", "*/"); %>
</SCRIPT>
</HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM name=setup method=<% get_http_method(); %> action=apply.cgi>
<input type=hidden name=submit_button>
<input type=hidden name=change_action>
<input type=hidden name=submit_type>
<input type=hidden name=gui_action>
<input type=hidden name=now_proto value='<% nvram_gozila_get("wan_proto"); %>'>
<input type=hidden name=daylight_time value=0>
<input type=hidden name="lan_ipaddr" value="4">
<input type=hidden name="wait_time" value="0">
<input type=hidden name="need_reboot" value="0">

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>
  <TBODY>
  <TR bgColor=black>
    <TD 
    style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" 
    borderColor=#e7e7e7 width=163 bgColor=#e7e7e7 height=1>
    <IMG height=15 src="image/UI_03.gif" width=164 border=0></TD>
    <TD 
    style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" 
    width=646 height=1>
    <IMG height=15 src="image/UI_02.gif" width=645 border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 
height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
	<% support_invmatch("MULTILANG_SUPPORT", "1", "<!--"); %>	
        <TR>
          <TD align=right width=156 bgColor=#5b5b5b colSpan=3 
            height=25><B><FONT style="FONT-SIZE: 9pt" face=Arial 
            color=#ffffff><script>Capture(lefemenu.lang)</script></FONT></B></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=17 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
	<TR>
          <TD align=right width=156 bgColor=#e7e7e7 colSpan=3 height=1><B><script>Capture(lefemenu.selan)</script></B></TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=28 height=1>&nbsp;</TD>               
                <TD width=396 colSpan=3 height=1><select name="ui_language" onChange=SelLang(this.form.ui_language.selectedIndex,this.form)>
<option value="en" <% nvram_match("ui_language", "en", "selected"); %>><script>Capture(lang1.en)</script></option>
<option value="fr" <% nvram_match("ui_language", "fr", "selected"); %>><script>Capture(lang1.fr)</script></option>
<option value="de" <% nvram_match("ui_language", "de", "selected"); %>><script>Capture(lang1.de)</script></option>
<option value="sp" <% nvram_match("ui_language", "sp", "selected"); %>><script>Capture(lang1.sp)</script></option>
<option value="it" <% nvram_match("ui_language", "it", "selected"); %>><script>Capture(lang1.it)</script></option>
<option value="sw" <% nvram_match("ui_language", "sw", "selected"); %>><script>Capture(lang1.sw)</script></option>
</select></TD>
                <TD>&nbsp;</TD></TR></TBODY></TABLE></TD>
                <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR> 
 <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>
                  <HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR>
		<% support_invmatch("MULTILANG_SUPPORT", "1", "-->"); %>			  
        <TR>
          <TD align=right width=156 bgColor=#5b5b5b colSpan=3 
            height=25><B><FONT style="FONT-SIZE: 9pt" face=Arial 
            color=#ffffff><script>Capture(lefemenu.intersetup)</script></FONT></B></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=17 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 colSpan=3 height=1><B><script>Capture(lefemenu.conntype)</script></B></TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=28 height=1>&nbsp;</TD>               
                <TD width=396 colSpan=3 height=1><select name="wan_proto" onChange=SelWAN(this.form.wan_proto.selectedIndex,this.form)>
                  <option value="dhcp" <% nvram_selmatch("wan_proto", "dhcp", "selected"); %>>
                    <script>Capture(setupcontent.dhcp)</script>
                    </option>
                  <option value="static" <% nvram_selmatch("wan_proto", "static", "selected"); %>>
                    <script>Capture(share.staticip)</script>
                    </option>
                  <option value="pppoe" <% nvram_selmatch("wan_proto", "pppoe", "selected"); %>>
                    <script>Capture(share.pppoe)</script>
                    </option>
                  <option value="pptp" <% nvram_selmatch("wan_proto", "pptp", "selected"); %>>
                    <script>Capture(share.pptp)</script>
                    </option>
                  <% support_invmatch("L2TP_SUPPORT", "1", "<!--"); %>
                  <option value="l2tp" <% nvram_selmatch("wan_proto", "l2tp", "selected"); %>>
                    <script>Capture(hstatrouter2.l2tp)</script>
                    </option>
                  <% support_invmatch("L2TP_SUPPORT", "1", "-->"); %>
                  <% support_invmatch("HEARTBEAT_SUPPORT", "1", "<!--"); %>
                  <option value="heartbeat" <% nvram_selmatch("wan_proto", "heartbeat", "selected"); %>>
                    <script>Capture(hindex2.telstra)</script>
                    </option>
                  <% support_invmatch("HEARTBEAT_SUPPORT", "1", "-->"); %>
                </select></TD>
                <TD>&nbsp;</TD></TR></TBODY></TABLE></TD>
                <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR>                        
        
     
        <% show_index_setting(); %>
        
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>
                  <HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>
            <P align=right><FONT style="FONT-WEIGHT: 700"><B><script>Capture(lefemenu.optset)</script></B><BR><B><script>Capture(lefemenu.requireisp)</script></B></FONT></P></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;<script>Capture(share.routename)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial><INPUT maxLength=39 name="router_name" size="20" value='<% nvram_get("router_name"); %>' onBlur=valid_name(this,"Router%20Name",SHELL_EXE_NO)></FONT></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;<script>Capture(share.hostname)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial><INPUT maxLength=39 name="wan_hostname" size="20" value='<% nvram_get("wan_hostname"); %>' onBlur=valid_name(this,"Host%20Name",SHELL_EXE_NO)></FONT></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;<script>Capture(share.domainname)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial><INPUT maxLength=63 name="wan_domain" size="20" value='<% nvram_get("wan_domain"); %>' onBlur=valid_name(this,"Domain%20name",SPACE_NO|SHELL_EXE_NO)></FONT></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;<script>Capture(share.mtu)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25><B><select name="mtu_enable" onChange=SelMTU(this.form.mtu_enable.selectedIndex,this.form)>
			<option value="0" <% nvram_match("mtu_enable", "0", "selected"); %>><b><script>Capture(share.auto)</script></b></option>
			<option value="1" <% nvram_match("mtu_enable", "1", "selected"); %>><b><script>Capture(share.mtumanual)</script>&nbsp;</b></option>
		</select></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;</FONT><script>Capture(share.mtusize)</script>:&nbsp;</B></TD>
          <TD width=296 height=25><INPUT class=num maxLength=4 onBlur=valid_mtu(this) size=5 value='<% nvram_get("wan_mtu"); %>' name="wan_mtu"></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <!--TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;Speed &amp; Duplex:</FONT></TD>
          <TD width=296 height=25><B><select name="wan_speed")>
			<option value="0" <% nvram_match("wan_speed", "0", "selected"); %>><b>10 Mb Full</b></option>
			<option value="1" <% nvram_match("wan_speed", "1", "selected"); %>><b>10 Mb Half</b></option>
			<option value="2" <% nvram_match("wan_speed", "2", "selected"); %>><b>100 Mb Full</b></option>
			<option value="3" <% nvram_match("wan_speed", "3", "selected"); %>><b>100 Mb Half</b></option>
			<option value="4" <% nvram_match("wan_speed", "4", "selected"); %>><b>Auto</b></option>
		</select></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR-->
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>
                  <HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#5b5b5b colSpan=3 
            height=25><B><FONT style="FONT-SIZE: 9pt" face=Arial 
            color=#ffffff><script>Capture(lefemenu.netsetup)</script></FONT></B></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=14 height=25>&nbsp;</TD>
          <TD width=17 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 colSpan=3 height=25><B><script>Capture(lefemenu.routerip)</script></B></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;<script>Capture(setupcontent.localipaddr)</script>:&nbsp;</TD>
          <TD width=296 height=25><INPUT class=num maxLength=3 onBlur=valid_range(this,1,223,"IP") size=3 value='<% get_single_ip("lan_ipaddr","0"); %>' name="lan_ipaddr_0"> . 
            <INPUT class=num maxLength=3 onBlur=valid_range(this,0,255,"IP") size=3 value='<% get_single_ip("lan_ipaddr","1"); %>' name="lan_ipaddr_1"> . 
            <INPUT class=num maxLength=3 onBlur=valid_range(this,0,255,"IP") size=3 value='<% get_single_ip("lan_ipaddr","2"); %>' name="lan_ipaddr_2"> . 
            <INPUT class=num maxLength=3 onBlur="valid_range(this,1,254,'IP');Sel_SubMask(this.form.lan_netmask,this.form);" size=3 value='<% get_single_ip("lan_ipaddr","3"); %>' name="lan_ipaddr_3"></TD>  
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" face=Arial>&nbsp;<script>Capture(share.submask)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25><SELECT class=num size=1 name="lan_netmask" onchange=Sel_SubMask(this.form.lan_netmask,this.form)><OPTION 
              value=255.255.255.0 <% nvram_match("lan_netmask", "255.255.255.0", "selected"); %>>255.255.255.0</OPTION><OPTION 
              value=255.255.255.128 <% nvram_match("lan_netmask", "255.255.255.128", "selected"); %>>255.255.255.128</OPTION><OPTION 
              value=255.255.255.192 <% nvram_match("lan_netmask", "255.255.255.192", "selected"); %>>255.255.255.192</OPTION><OPTION 
              value=255.255.255.224 <% nvram_match("lan_netmask", "255.255.255.224", "selected"); %>>255.255.255.224</OPTION><OPTION 
              value=255.255.255.240 <% nvram_match("lan_netmask", "255.255.255.240", "selected"); %>>255.255.255.240</OPTION><OPTION 
              value=255.255.255.248 <% nvram_match("lan_netmask", "255.255.255.248", "selected"); %>>255.255.255.248</OPTION><OPTION 
              value=255.255.255.252 <% nvram_match("lan_netmask", "255.255.255.252", "selected"); %>>255.255.255.252</OPTION></SELECT></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1><HR color=#b5b5e6 SIZE=1></TD>
                <TD height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 colSpan=3 height=25><B><script>Capture(lefemenu.netaddr)</script></B><BR><B><script>Capture(lefemenu.dhcpserverset)</script></B></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;<script>Capture(share.dhcpsrv)</script>:&nbsp;</TD>
          <TD width=296 height=25><input type="radio" name="lan_proto" value="dhcp" <% nvram_selmatch("lan_proto", "dhcp", "checked"); %> onClick="SelDHCP('dhcp',this.form)"><B><span ><script>Capture(share.enable)</script></span></B>
          <input type="radio" name="lan_proto" value="static" <% nvram_selmatch("lan_proto", "static", "checked"); %> onClick="SelDHCP('static',this.form)"><B><span ><script>Capture(share.disable)</script></span></B></TD>  
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<input type=hidden name=dhcp_check>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" face=Arial>&nbsp;<script>Capture(share.startipaddr)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25>&nbsp;<b><% prefix_ip_get("lan_ipaddr",1); %></b><B><INPUT maxLength=3 onBlur=valid_range(this,1,254,"DHCP%20starting%20IP");Sel_SubMask_onblur(this.form.lan_netmask,this.form) size=3 value='<% nvram_get("dhcp_start"); %>' name="dhcp_start" class=num onChange="valid_dhcpd_start_ip(this.form, this)"></B></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" face=Arial>&nbsp;<script>Capture(setupcontent.maxdhcpusr)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25>&nbsp;<INPUT maxLength=3 onBlur=valid_range(this,1,253,"Number%20of%20DHCP%20users");Sel_SubMask_onblur(this.form.lan_netmask,this.form) size=3 value='<% nvram_get("dhcp_num"); %>' name="dhcp_num" class=num></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" face=Arial>&nbsp;<script>Capture(setupcontent.dhcprange)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25><SPAN id=DymRange></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;<script>Capture(share.clileasetime)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25>&nbsp;<INPUT maxLength=4 onBlur=valid_range(this,0,9999,"DHCP%20Lease%20Time") size=4 value='<% nvram_get("dhcp_lease"); %>' name="dhcp_lease" class=num>&nbsp;<script>Capture(setupcontent.clileasetimemin)</script></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<% nvram_selmatch("wan_proto","static","<!--"); %>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;<script>Capture(setupcontent.stadns1)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25>&nbsp;<input type=hidden name=wan_dns value=4><INPUT maxLength=3 onBlur=valid_range(this,0,223,"DNS") size=3 value='<% get_dns_ip("wan_dns","0","0"); %>' name="wan_dns0_0" class=num> . 
            <INPUT maxLength=3 onBlur=valid_range(this,0,255,"DNS") size=3 value='<% get_dns_ip("wan_dns","0","1"); %>' name="wan_dns0_1" class=num> . 
            <INPUT maxLength=3 onBlur=valid_range(this,0,255,"DNS") size=3 value='<% get_dns_ip("wan_dns","0","2"); %>' name="wan_dns0_2" class=num> . 
            <INPUT maxLength=3 onBlur=valid_range(this,0,254,"DNS") size=3 value='<% get_dns_ip("wan_dns","0","3"); %>' name="wan_dns0_3" class=num></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;<script>Capture(setupcontent.stadns2)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25>&nbsp;<INPUT maxLength=3 onBlur=valid_range(this,0,223,"DNS") size=3 value='<% get_dns_ip("wan_dns","1","0"); %>' name="wan_dns1_0" class=num> . 
            <INPUT maxLength=3 onBlur=valid_range(this,0,255,"DNS") size=3 value='<% get_dns_ip("wan_dns","1","1"); %>' name="wan_dns1_1" class=num> . 
            <INPUT maxLength=3 onBlur=valid_range(this,0,255,"DNS") size=3 value='<% get_dns_ip("wan_dns","1","2"); %>' name="wan_dns1_2" class=num> . 
            <INPUT maxLength=3 onBlur=valid_range(this,0,254,"DNS") size=3 value='<% get_dns_ip("wan_dns","1","3"); %>' name="wan_dns1_3" class=num></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;<script>Capture(hindex2.dns3)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25>&nbsp;<INPUT maxLength=3 onBlur=valid_range(this,0,223,"DNS") size=3 value='<% get_dns_ip("wan_dns","2","0"); %>' name="wan_dns2_0" class=num> . 
            <INPUT maxLength=3 onBlur=valid_range(this,0,255,"DNS") size=3 value='<% get_dns_ip("wan_dns","2","1"); %>' name="wan_dns2_1" class=num> . 
            <INPUT maxLength=3 onBlur=valid_range(this,0,255,"DNS") size=3 value='<% get_dns_ip("wan_dns","2","2"); %>' name="wan_dns2_2" class=num> . 
            <INPUT maxLength=3 onBlur=valid_range(this,0,254,"DNS") size=3 value='<% get_dns_ip("wan_dns","2","3"); %>' name="wan_dns2_3" class=num></B></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<% nvram_selmatch("wan_proto","static","-->"); %>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;<script>Capture(share.wins)</script>:&nbsp;</FONT></TD>
          <TD width=296 height=25>&nbsp;<input type=hidden name=wan_wins value=4><INPUT maxLength=3 onBlur=valid_range(this,0,223,"WINS") size=3 value='<% get_single_ip("wan_wins","0"); %>' name="wan_wins_0" class=num> . 
            <INPUT maxLength=3 onBlur=valid_range(this,0,255,"WINS") size=3 value='<% get_single_ip("wan_wins","1"); %>' name="wan_wins_1" class=num> . 
            <INPUT maxLength=3 onBlur=valid_range(this,0,255,"WINS") size=3 value='<% get_single_ip("wan_wins","2"); %>' name="wan_wins_2" class=num> . 
            <INPUT maxLength=3 onBlur=valid_range(this,0,254,"WINS") size=3 value='<% get_single_ip("wan_wins","3"); %>' name="wan_wins_3" class=num></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>        
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>
                  <HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR>
        <!--TR>
          <TD align=right width=156 bgColor=#e7e7e7 colSpan=3 height=25><B>Time Setting</B></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><input type=radio name=time_mode>Manually</TD>
          <TD width=296 height=25>&nbsp;</TD>  
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;Date:</FONT></TD>
          <TD width=296 height=25>&nbsp;<font face="Arial" style="font-size: 8pt">
                	<INPUT class=num maxLength=4 size=4 name="year" value="<% show_time_setting("year","0"); %>" style="font-family:Courier; font-size:10pt">&nbsp;-&nbsp;
                	<INPUT class=num maxLength=3 size=3 name="mon" value="<% show_time_setting("mon","0"); %>" style="font-family:Courier; font-size:10pt">&nbsp;-&nbsp;
                	<INPUT class=num maxLength=3 size=3 name="mday" value="<% show_time_setting("mday","0"); %>" style="font-family:Courier; font-size:10pt">&nbsp;
                	(yyyy-mm-dd)</font></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><FONT style="FONT-SIZE: 8pt" 
            face=Arial>&nbsp;Time:</FONT></TD>
          <TD width=296 height=25>&nbsp;<font face="Arial" style="font-size: 8pt">
                	<INPUT class=num maxLength=3 size=3 name="hour" value="<% show_time_setting("hour","0"); %>" style="font-family:Courier; font-size:10pt">:&nbsp;
                	<INPUT class=num maxLength=3 size=3 name="min" value="<% show_time_setting("min","0"); %>" style="font-family:Courier; font-size:10pt">:&nbsp;
                	<INPUT class=num maxLength=3 size=3 name="sec" value="<% show_time_setting("sec","0"); %>" style="font-family:Courier; font-size:10pt">&nbsp;(hh-mm-ss)	</font></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 colSpan=3 height=1>
                  <HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD width=15 height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 colSpan=3 height=25><B>Time Setting</B></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><input type=radio name=time_mode checked value="1">Automatically</TD>
          <TD width=296 height=25>&nbsp;</TD>  
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR-->
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 colSpan=3 height=25><b><script>Capture(lefemenu.timeset)</script></b></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25>&nbsp;<script>Capture(share.timezone)</script>:&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>  
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=397 height=25 colspan="2">&nbsp;<select name="time_zone" onChange=SelTime(this.form.time_zone.selectedIndex,this.form)>
	  <option value="-12 1 0" <% nvram_match("time_zone", "-12 1 0", "selected"); %>><script>Capture(timezone.Kwajalein)</script></option>
	  <option value="-11 1 0" <% nvram_match("time_zone", "-11 1 0", "selected"); %>><script>Capture(timezone.Midway)</script></option>
	  <option value="-10 1 0" <% nvram_match("time_zone", "-10 1 0", "selected"); %>><script>Capture(timezone.Hawaii)</script></option>
	  <option value="-09 1 1" <% nvram_match("time_zone", "-09 1 1", "selected"); %>><script>Capture(timezone.Alaska)</script></option>
	  <option value="-08 1 1" <% nvram_match("time_zone", "-08 1 1", "selected"); %>><script>Capture(timezone.Pacific)</script></option>
	  <option value="-07 1 0" <% nvram_match("time_zone", "-07 1 0", "selected"); %>><script>Capture(timezone.Arizona)</script></option>
	  <option value="-07 2 1" <% nvram_match("time_zone", "-07 2 1", "selected"); %>><script>Capture(timezone.Mountain)</script></option>
	  <option value="-06 1 6" <% nvram_match("time_zone", "-06 1 6", "selected"); %>><script>Capture(timezone.Mexico)</script></option>
	  <option value="-06 2 1" <% nvram_match("time_zone", "-06 2 1", "selected"); %>><script>Capture(timezone.Central)</script></option>
	  <option value="-05 1 0" <% nvram_match("time_zone", "-05 1 0", "selected"); %>><script>Capture(timezone.Indiana)</script></option>
	  <option value="-05 2 1" <% nvram_match("time_zone", "-05 2 1", "selected"); %>><script>Capture(timezone.Eastern)</script></option>
	  <option value="-04 1 0" <% nvram_match("time_zone", "-04 1 0", "selected"); %>><script>Capture(timezone.Bolivia)</script></option>
	  <option value="-04 2 1" <% nvram_match("time_zone", "-04 2 1", "selected"); %>><script>Capture(timezone.Atlantic)</script></option>
	  <option value="-03.5 1 1" <% nvram_match("time_zone", "-03.5 1 1", "selected"); %>><script>Capture(timezone.Newfoundland)</script></option>
	  <option value="-03 1 0" <% nvram_match("time_zone", "-03 1 0", "selected"); %>><script>Capture(timezone.Guyana)</script></option>
	  <option value="-03 2 1" <% nvram_match("time_zone", "-03 2 1", "selected"); %>><script>Capture(timezone.Brazil)</script></option>
	  <option value="-02 1 2" <% nvram_match("time_zone", "-02 1 2", "selected"); %>><script>Capture(timezone.Mid)</script></option>
	  <option value="-01 1 2" <% nvram_match("time_zone", "-01 1 2", "selected"); %>><script>Capture(timezone.Azores)</script></option>
	  <option value="+00 1 0" <% nvram_match("time_zone", "+00 1 0", "selected"); %>><script>Capture(timezone.Gambia)</script></option>
	  <option value="+00 2 2" <% nvram_match("time_zone", "+00 2 2", "selected"); %>><script>Capture(timezone.England)</script></option>
	  <option value="+01 1 0" <% nvram_match("time_zone", "+01 1 0", "selected"); %>><script>Capture(timezone.Tunisia)</script></option>
	  <option value="+01 2 2" <% nvram_match("time_zone", "+01 2 2", "selected"); %>><script>Capture(timezone.France)</script></option>
	  <option value="+02 1 0" <% nvram_match("time_zone", "+02 1 0", "selected"); %>><script>Capture(timezone.South)</script></option>
	  <option value="+02 2 2" <% nvram_match("time_zone", "+02 2 2", "selected"); %>><script>Capture(timezone.Greece)</script></option>
	  <option value="+03 1 0" <% nvram_match("time_zone", "+03 1 0", "selected"); %>><script>Capture(timezone.Iraq)</script></option>
	  <option value="+04 1 0" <% nvram_match("time_zone", "+04 1 0", "selected"); %>><script>Capture(timezone.Armenia)</script></option>
	  <option value="+05 1 0" <% nvram_match("time_zone", "+05 1 0", "selected"); %>><script>Capture(timezone.Pakistan)</script></option>
	  <option value="+05.5 1 0" <% nvram_match("time_zone", "+05.5 1 0", "selected"); %>><script>Capture(timezone.india)</script></option>
	  <option value="+06 1 0" <% nvram_match("time_zone", "+06 1 0", "selected"); %>><script>Capture(timezone.Bangladesh)</script></option>
	  <option value="+07 1 0" <% nvram_match("time_zone", "+07 1 0", "selected"); %>><script>Capture(timezone.Thailand)</script></option>
	  <option value="+08 1 0" <% nvram_match("time_zone", "+08 1 0", "selected"); %>><script>Capture(timezone.China)</script></option>
	  <option value="+08 2 0" <% nvram_match("time_zone", "+08 2 0", "selected"); %>><script>Capture(timezone.Singapore)</script></option>
	  <option value="+09 1 0" <% nvram_match("time_zone", "+09 1 0", "selected"); %>><script>Capture(timezone.Japan)</script></option>
	  <option value="+10 1 0" <% nvram_match("time_zone", "+10 1 0", "selected"); %>><script>Capture(timezone.Guam)</script></option>
	  <option value="+10 2 4" <% nvram_match("time_zone", "+10 2 4", "selected"); %>><script>Capture(timezone.Australia)</script></option>
	  <option value="+11 1 0" <% nvram_match("time_zone", "+11 1 0", "selected"); %>><script>Capture(timezone.Solomon)</script></option>
	  <option value="+12 1 0" <% nvram_match("time_zone", "+12 1 0", "selected"); %>><script>Capture(timezone.Fiji)</script></option>
	  <option value="+12 2 3" <% nvram_match("time_zone", "+12 2 3", "selected"); %>><script>Capture(timezone.New_Zealand)</script></option>
	</select></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 colSpan=3 height=25></TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=397 height=25 colspan="2"><INPUT type=checkbox value="1" name="_daylight_time" <% nvram_match("daylight_time","1","checked"); %>><font face="Arial" style="font-size: 8pt"><script>Capture(setupcontent.autoadjtime)</script></font></TD>
          <TD height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

        <TR>
          <TD width=44 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=65 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=47 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=454 colSpan=6></TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR>


	</TBODY></TABLE></TD>

    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF">
          <span ></span></font><br><font color="#FFFFFF"><span style="font-family: Arial"><br>
<script language=javascript>
if(document.setup.now_proto.value == "dhcp"){
Capture(hindex2.hdhcp);
}
else if(document.setup.now_proto.value == "pppoe"){
Capture(hindex2.hpppoe1);
document.write("<br>");
Capture(hindex2.hpppoe2);
document.write("<br>");
Capture(hindex2.hpppoe3);
help_link('help/HSetup.asp');
Capture(share.more);
document.write("</a></b><br><br><br><br>");

}
else if(document.setup.now_proto.value == "static"){
Capture(hindex2.hstatic1);
document.write("<br>");
Capture(hindex2.hstatic2);
document.write("<br>");
Capture(hindex2.hstatic3);
help_link("help/HSetup.asp");
Capture(share.more);
document.write("</a></b><br><br><br><br>");
}
else if(document.setup.now_proto.value == "pptp"){
Capture(hindex2.hpptp1);
document.write("<br>");
Capture(hindex2.hpptp2);
document.write("<br>");
Capture(hindex2.hpptp3);
document.write("<br>");
Capture(hindex2.hpptp4);

help_link('help/HSetup.asp');
Capture(share.more);
document.write("</a></b><br><br><br><br>");

//Capture(hindex2.hpptp5);
}
else if(document.setup.now_proto.value == "l2tp"){
Capture(hindex2.hl2tp1);
document.write("<br>");
Capture(hindex2.hl2tp2);
document.write("<br>");
Capture(hindex2.hl2tp3);


help_link('help/HSetup.asp');
Capture(share.more);
document.write("</a></b><br><br><br><br>");

//Capture(hindex2.hl2tp4);
}
else if(document.setup.now_proto.value == "heartbeat"){
Capture(hindex2.hhb1);
document.write("<br>");
Capture(hindex2.hhb2);
document.write("<br>");
Capture(hindex2.hhb3);

help_link('help/HSetup.asp');
Capture(share.more);
document.write("</a></b><br><br><br><br>");

//Capture(hindex2.hhb4);
}
</script>
<script>Capture(hindex2.right1)</script>
<script>document.write("<br>")</script>
<script>Capture(hindex2.right2)</script>

<script language=javascript>
help_link('help/HSetup.asp');
Capture(share.more);
document.write("</a></b><br><br><br><br>");
</script>
<script>Capture(hindex2.right3)</script>
<script>document.write("<br>")</script>
<script>Capture(hindex2.right4)</script>
<script>document.write("<br>")</script>
<script>Capture(hindex2.right5)</script>
<script>document.write("<br>")</script>
<script>Capture(hindex2.right6)</script>
<script>document.write("<br>")</script>
<script language=javascript>
if(document.setup.now_proto.value == "dhcp"){
Capture(hindex2.hdhcps1);
help_link('help/HSetup.asp');
Capture(share.more);
document.write("</a></b><br><br><br>");
//document.write("<b>Maximum number of DHCP Users: </b>You may limit the number of addresses your router hands out.<br>");
//document.write("<b><a target=_blank href=help/HSetup.asp?session_id=<% nvram_get("session_key"); %>>More...</a></b><br><br><br>");
}
else if(document.setup.now_proto.value == "static"){
help_link('help/HSetup.asp');
Capture(share.more);
document.write("</a></b><br><br><br>");
}
else if(document.setup.now_proto.value == "pppoe"){
//document.write("<b>Maximum number of DHCP Users: </b>You may limit the number of addresses your router hands out.<br>");
//document.write("<b><a target=_blank href=help/HSetup.asp?session_id=<% nvram_get("session_key"); %>>More...</a></b><br><br><br><br>");
Capture(hindex2.hdhcps1);

help_link('help/HSetup.asp');
Capture(share.more);
document.write("</a></b><br><br><br><br>");
}
else if(document.setup.now_proto.value == "pptp"){
//document.write("<b>Maximum number of DHCP Users: </b>You may limit the number of addresses your router hands out.<br>");
//document.write("<b><a target=_blank href=help/HSetup.asp?session_id=<% nvram_get("session_key"); %>>More...</a></b><br><br><br>");
Capture(hindex2.hdhcps1);
help_link('help/HSetup.asp');
Capture(share.more);
document.write("</a></b><br><br><br><br>");
}
else if(document.setup.now_proto.value == "l2tp"){
//document.write("<b>Maximum number of DHCP Users: </b>You may limit the number of addresses your router hands out.<br>");
//document.write("<b><a target=_blank href=help/HSetup.asp?session_id=<% nvram_get("session_key"); %>>More...</a></b><br><br><br>");
Capture(hindex2.hdhcps1);

help_link('help/HSetup.asp');
Capture(share.more);
document.write("</a></b><br><br><br><br>");
}
else if(document.setup.now_proto.value == "heartbeat"){
//document.write("<b>Maximum number of DHCP Users: </b>You may limit the number of addresses your router hands out.<br>");
//document.write("<b><a target=_blank href=help/HSetup.asp?session_id=<% nvram_get("session_key"); %>>More...</a></b><br><br><br><br>");
Capture(hindex2.hdhcps1);
help_link('help/HSetup.asp');
Capture(share.more);
document.write("</a></b><br><br><br><br>");
}
</script>
<script>document.write("<br>")</script>
<script>Capture(hindex2.right7)</script>
</span></font>
</TD>
          <TD width=9 bgColor=#2971b9 height=25>&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
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
          <TD width=454 align=right bgColor=#2971b9>
<TABLE>
<TR>
<TD width=101 bgcolor=#175592 align=center height=20><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:to_submit(document.forms[0])"><script>Capture(sbutton.save)</script></A></font></TD>
		<TD width=8></TD>
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('index.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
