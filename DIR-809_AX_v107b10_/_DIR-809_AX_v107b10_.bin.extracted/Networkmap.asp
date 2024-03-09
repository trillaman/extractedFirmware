<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE8>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<link rel="stylesheet" rev="stylesheet" href="../style.css" type="text/css" />
<link rel="stylesheet" rev="stylesheet" href="../networkmap.css" type="text/css" />
<script language="JavaScript" type="text/javascript">
<!--
var lang = "<% getLangInfo("lang");%>";
//-->
</script>
<script type="text/javascript" src="../ubicom.js"></script>
<script type="text/javascript" src="../xml_data.js"></script>
<script type="text/javascript" src="../navigation.js"></script>
<% getLangInfo("LangPath");%>
<script type="text/javascript" src="../utility.js"></script>
<script type="text/javascript">
//<![CDATA[
var pcmac;
var lan_ip_str = "<% getInfo("ip-rom"); %>";
var lan_mask_str = "<% getInfo("mask-rom"); %>";
var wancon;
var SSID24G,SSID5G,Passwd24G,Passwd5G;
function initdef()
{
	var oElem;
	var form;
	form = document.getElementById("wz_form_pg_4");
	for (var i = 0; i < form.elements.length; i++)
	{
		oElem = form[i];
		var name = oElem.tagName.toLowerCase();
		if(name == "input")
		{
			switch (oElem.type)
			{
				case "text" :
				case "password" :
				case "textarea" :
				case "hidden" :
					oElem.defaultValue = oElem.value;
					break;
				case "checkbox" :
				case "radio" :
					oElem.defaultChecked = oElem.checked;
					break;
			}
		}
		else if(name == "select")
		{
			oElem.defaultSelected = oElem.value;
		}
	}
}

function get_update_page_ok()
{
		var conn_msg="";		
					
		if (__AjaxReq != null && __AjaxReq.readyState == 4)
		{	  
		
				//alert(__AjaxReq.status);
		
			if (__AjaxReq.status == 200)
			{
				//alert(__AjaxReq.responseText.length);
				if (__AjaxReq.responseText.length <= 1) /* No data */
				{					
						return;		
				}
			
				var wlSiteLists=__AjaxReq.responseText.split('<wantype>');
				wancon =wlSiteLists[0];
				var wanlink =wlSiteLists[1];
			    //alert(__AjaxReq.responseText);
			 	//1:internet connect;2:detecting;0:internet disconect;3:phy disconnect
        if(wancon == '0')
        {
                document.getElementById("connect").src = "../Images/line1.jpg";
        }
        else
        {
                document.getElementById("connect").src = "../Images/line2.jpg";
        }
				wanlink = wanlink * 1 ;
        if(wanlink == '1')
        {
                document.getElementById("internet").src = "../Images/earth.jpg";
        }
        else if(wanlink != '2')
        {
                document.getElementById("internet").src = "../Images/earth_no.jpg";
        }
			}
			else
			{
				return;
			}
					
	   } 	
}
function send_dns_query_request(url)
{
	if (__AjaxReq == null) __AjaxReq = __createRequest();
	__AjaxReq.open("GET", url, true);
	__AjaxReq.onreadystatechange = get_update_page_ok;
	__AjaxReq.send(null);

}
function xml_load()
{
	send_dns_query_request("/Basic/get_networkmap_status.asp?r="+generate_random_str());
}
function get_value()
{
	xml_load();
	setTimeout(get_value,10000);
}
function on_change_wan_type(selectValue)
{	
	//selectValue = selectValue *1;
	//get_by_id("wan_type").value = selectValue;
	var mf = document.forms.wz_form_pg_4;
	if(selectValue == "pptp") 
	{
mf.wan_type.disabled = true;
	mf.wan_type[0] = new Option(sw("txtStaticIP"), "fixedIp", false, false);
	mf.wan_type[1] = new Option(sw("txtDynamicIP"), "autoIp", false, false);
	mf.wan_type[2] = new Option("PPPoE("+sw("txtUsernamePassword")+")", "ppp", false, false);	
	mf.wan_type[3] = new Option(sw("txtPPTP"), "pptp", false, false);
	}
	else if(selectValue == "l2tp")
	{
	mf.wan_type.disabled = true;
	mf.wan_type[0] = new Option(sw("txtStaticIP"), "fixedIp", false, false);
	mf.wan_type[1] = new Option(sw("txtDynamicIP"), "autoIp", false, false);
	mf.wan_type[2] = new Option("PPPoE("+sw("txtUsernamePassword")+")", "ppp", false, false);
	mf.wan_type[3] = new Option(sw("txtL2TP"), "l2tp", false, false);
	}
	else
	{
	mf.wan_type.disabled = false;
	mf.wan_type[0] = new Option(sw("txtStaticIP"), "fixedIp", false, false);
	mf.wan_type[1] = new Option(sw("txtDynamicIP"), "autoIp", false, false);
	mf.wan_type[2] = new Option("PPPoE("+sw("txtUsernamePassword")+")", "ppp", false, false);
	}
	if(selectValue == "fixedIp")
	{
		get_by_id("wan_type").value = "fixedIp";
		get_by_id("static_setting").style.display = "";
		get_by_id("pppoe_setting").style.display = "none";
		get_by_id("pptp_setting").style.display = "none";
		get_by_id("l2tp_setting").style.display = "none";
		get_by_id("dhcpplus_setting").style.display = "none";
		get_by_id("smartsetup").disabled=false;
	}
	else if(selectValue == "autoIp")
	{
		get_by_id("static_setting").style.display = "none";
		get_by_id("pppoe_setting").style.display = "none";
		get_by_id("pptp_setting").style.display = "none";
		get_by_id("l2tp_setting").style.display = "none";
		get_by_id("dhcpplus_setting").style.display = "none";
		get_by_id("wan_type").value = "autoIp";
		get_by_id("smartsetup").disabled=false;
	}
	else if(selectValue == "ppp")
	{
		get_by_id("static_setting").style.display = "none";
		get_by_id("pppoe_setting").style.display = "";
		get_by_id("pptp_setting").style.display = "none";
		get_by_id("l2tp_setting").style.display = "none";
		get_by_id("dhcpplus_setting").style.display = "none";
		get_by_id("wan_type").value = "ppp";
		get_by_id("smartsetup").disabled=false;
	}
	else if(selectValue == "pptp")
	{
		get_by_id("static_setting").style.display = "none";
		get_by_id("pppoe_setting").style.display = "none";
		get_by_id("pptp_setting").style.display = "";
		get_by_id("l2tp_setting").style.display = "none";
		get_by_id("dhcpplus_setting").style.display = "none";
		get_by_id("wan_type").value = "pptp";
		get_by_id("smartsetup").disabled=true;
	}
	else if(selectValue == "l2tp")
	{
		get_by_id("static_setting").style.display = "none";
		get_by_id("pppoe_setting").style.display = "none";
		get_by_id("pptp_setting").style.display = "none";
		get_by_id("l2tp_setting").style.display = "";
		get_by_id("dhcpplus_setting").style.display = "none";
		get_by_id("wan_type").value = "l2tp";
			get_by_id("smartsetup").disabled=true;
	}
	else if(selectValue == "dhcpplus")
	{
		get_by_id("static_setting").style.display = "none";
		get_by_id("pppoe_setting").style.display = "none";
		get_by_id("pptp_setting").style.display = "none";
		get_by_id("l2tp_setting").style.display = "none";
		get_by_id("dhcpplus_setting").style.display = "";
		get_by_id("wan_type").value = "dhcpplus";
		get_by_id("smartsetup").disabled=false;
	}
}
function wz_verify_4()
{
	var form_handle = document.forms[0];
	var wantype=get_by_id("wan_type").value;
	//PPPOE
	if(wantype == "ppp")
	{
		if(is_blank(form_handle.pppoe_username.value))
		{
			alert(sw("txtUserNameBlank"));
			form_handle.pppoe_username.focus();
			return false;
		}
		if(strchk_unicode(form_handle.pppoe_username.value) == true)
		{
			alert(sw("txtEasyUsername")+sw("txtisInvalid"));
			form_handle.pppoe_username.focus();
			return false;
		}
                if(__is_str_in_deny_chars(mf.pppoe_username.value, 1, "<>\""))
                {
                        alert(sw("txtForSecurity")+"\n< > \"");
                        mf.pppoe_username.focus();
                        return false;
                }
		if(is_blank(form_handle.pppoe_password.value))
		{
			alert(sw("txtPassWordBlank"));
			form_handle.pppoe_password.focus();
			return false;
		}
		if(strchk_unicode(form_handle.pppoe_password.value) == true)//kity
		{
			alert(sw("txtInvalidPwd"));
			form_handle.pppoe_password.focus();
			return false;
		}
		//form_handle.pppoe_password.value = trim_string(form_handle.pppoe_password.value);
		
	}
	else if(wantype == "dhcpplus")
	{
		if (is_blank(form_handle.wan_dhcpplus_username.value))
		{
			alert(sw("txtUserNameBlank"));
			form_handle.wan_dhcpplus_username.focus();
			return false;
		}
		if(strchk_unicode(form_handle.wan_dhcpplus_username.value) == true)//kity
		{
			alert(sw("txtInvalidUsername"));
			form_handle.wan_dhcpplus_username.focus();
			return false;
		}	
		if(strchk_unicode(form_handle.wan_dhcpplus_password.value) == true)//kity
		{
			alert(sw("txtInvalidPwd"));
			form_handle.wan_dhcpplus_password.focus();
			return false;
		}	
	}
	else if(wantype =="fixedIp")
	{
		//STATIC
		if (!is_ipv4_valid(form_handle.wan_ip_address.value) || form_handle.wan_ip_address.value=="0.0.0.0" || is_FF_IP(form_handle.wan_ip_address.value))
		{
			alert(sw("txtInvalidIPAddress"));
			form_handle.wan_ip_address.select();
			form_handle.wan_ip_address.focus();
			return false;
		}
		if (!is_ipv4_valid(form_handle.wan_subnet_mask.value) || !is_mask_valid(form_handle.wan_subnet_mask.value))
		{
			alert(sw("txtInvalidSubnetMask"));
			form_handle.wan_subnet_mask.select();
			form_handle.wan_subnet_mask.focus();
			return false;
		}
		if (!is_ipv4_valid(form_handle.wan_gateway.value) || form_handle.wan_gateway.value=="0.0.0.0" || is_FF_IP(form_handle.wan_gateway.value))
		{
			alert(sw("txtInvalidGatewayAddress"));
			form_handle.wan_gateway.select();
			form_handle.wan_gateway.focus();
			return false;
		}
		var LAN_IP = ipv4_to_unsigned_integer("<% getInfo("ip-rom"); %>");
		var LAN_MASK = ipv4_to_unsigned_integer("<% getInfo("mask-rom"); %>");		
		var wan_ip = ipv4_to_unsigned_integer(form_handle.wan_ip_address.value);
		var mask_ip = ipv4_to_unsigned_integer(form_handle.wan_subnet_mask.value);
		var gw_ip = ipv4_to_unsigned_integer(form_handle.wan_gateway.value);
		var dns_ip = ipv4_to_unsigned_integer(form_handle.wan_primary_dns.value);//kity
		var dns_ip2 = ipv4_to_unsigned_integer(form_handle.wan_secondary_dns.value);//kity
		var b255 = ipv4_to_unsigned_integer("255.255.255.255");//kity
        b255 ^= mask_ip;//kity
		<!--kity add IP address opinion-->
		if((b255 & wan_ip) == b255)
		{
		 	alert(sw("txtWanIp")+" "+integer_to_ipv4(wan_ip)+" "+sw("txtShouldNotBroadcast"));
			return false;
		}
		if((wan_ip & b255) == 0)
		{
			alert(sw("txtWanIp")+" "+integer_to_ipv4(wan_ip)+" "+sw("txtShouldNotNetworkAddr"));
			return false;
		}
		if((b255 & gw_ip) == b255)
		{
            alert(sw("txtWANGwIp")+" "+integer_to_ipv4(gw_ip)+" "+sw("txtShouldNotBroadcast"));
		    return false;
		}
		if((gw_ip & b255) == 0)
		{
			alert(sw("txtWANGwIp")+" "+integer_to_ipv4(gw_ip)+" "+sw("txtShouldNotNetworkAddr"));
			return false;
		}
		<!--kity end-->
		if ((wan_ip & mask_ip) !== (gw_ip & mask_ip))
		{
			alert(sw("txtWANGwIp")+" "+integer_to_ipv4(gw_ip)+" "+sw("txtWithinWanSubnet"));
			return false;
		}
		if ((LAN_IP & LAN_MASK) == (wan_ip & LAN_MASK))
		{
			alert(sw("txtWanSubConflitLanSub"));
			return false;
		}
		/*
		 * Allow blank as wel as 0.0.0.0 for primary and secondary
		 */
		form_handle.wan_primary_dns.value = form_handle.wan_primary_dns.value == "" ? "0.0.0.0" : form_handle.wan_primary_dns.value;
		form_handle.wan_secondary_dns.value = form_handle.wan_secondary_dns.value == "" ? "0.0.0.0" : form_handle.wan_secondary_dns.value;

		if (!is_ipv4_valid(form_handle.wan_primary_dns.value) || form_handle.wan_primary_dns.value=="0.0.0.0" || is_FF_IP(form_handle.wan_primary_dns.value) || ((ipv4_to_unsigned_integer(form_handle.wan_primary_dns.value) & 0xFF000000) != 0x00000000 && (ipv4_to_unsigned_integer(form_handle.wan_primary_dns.value) & 0x000000FF) == 0x00000000   ))
		{
			alert(sw("txtInvalidPrimaryDNSAddress"));
			form_handle.wan_primary_dns.select();
			form_handle.wan_primary_dns.focus();
			return false;
		}
		if (!is_ipv4_valid(form_handle.wan_secondary_dns.value) || is_FF_IP(form_handle.wan_secondary_dns.value) || ((ipv4_to_unsigned_integer(form_handle.wan_secondary_dns.value) & 0xFF000000) != 0x00000000 && (ipv4_to_unsigned_integer(form_handle.wan_secondary_dns.value) & 0x000000FF) == 0x00000000   ))
		{
			alert(sw("txtInvalidSecondaryDNSAddress"));
			form_handle.wan_secondary_dns.select();
			form_handle.wan_secondary_dns.focus();
			return false;
		}
		
		<!--kity add DNS IP address opinion-->
		if((b255 & dns_ip) == b255)
		{
		 	alert(sw("txtInvalidPrimaryDNSAddress")+" "+integer_to_ipv4(dns_ip)+" "+sw("txtShouldNotBroadcast"));
			return false;
		}
		if((dns_ip & b255) == 0)
		{
			alert(sw("txtInvalidPrimaryDNSAddress")+" "+integer_to_ipv4(dns_ip)+" "+sw("txtShouldNotNetworkAddr"));
			return false;
		}
		if((b255 & dns_ip2) == b255)
		{
		 	alert(sw("txtInvalidSecondaryDNSAddress")+" "+integer_to_ipv4(dns_ip2)+" "+sw("txtShouldNotBroadcast"));
			return false;
		}
		if((dns_ip2 & b255) == 0 && form_handle.wan_secondary_dns.value!="0.0.0.0")
		{
			alert(sw("txtInvalidSecondaryDNSAddress")+" "+integer_to_ipv4(dns_ip2)+" "+sw("txtShouldNotNetworkAddr"));
			return false;
		}
		<!--kity end-->
		
		<!--kity add the DNS is not same-->
		if((mf.wan_primary_dns.value != "0.0.0.0") && mf.wan_primary_dns.value == mf.wan_secondary_dns.value)
		{
        	alert(sw("txtSameDNS"));
        	mf.wan_secondary_dns.select();
        	mf.wan_secondary_dns.focus();
        	return false;
		}
	}
	else if(wantype == "pptp")
	{
		var srv_addr_is_ipv4 = 0;

		if(is_ipv4_valid(form_handle.wan_pptp_server.value))
		{
			srv_addr_is_ipv4 = 1;
		}

		if(is_blank(form_handle.wan_pptp_username.value))
		{
			alert(sw("txtUserNameBlank"));
			form_handle.wan_pptp_username.focus();
			return false;
		}
		if(strchk_unicode(form_handle.wan_pptp_password.value) == true)//kity
		{
			alert(sw("txtInvalidPwd"));
			form_handle.wan_pptp_password.focus();
			return false;
		}
		if(form_handle.wan_pptp_use_dynamic_carrier_radio_0.checked == true ) 
		{
			var LAN_IP = ipv4_to_unsigned_integer("<% getInfo("ip-rom"); %>");
			var LAN_MASK = ipv4_to_unsigned_integer("<% getInfo("mask-rom"); %>");	
			var wan_ip = ipv4_to_unsigned_integer(form_handle.wan_pptp_ip_address.value);
			var mask_ip = ipv4_to_unsigned_integer(form_handle.wan_pptp_subnet_mask.value);
			var gw_ip = ipv4_to_unsigned_integer(form_handle.wan_pptp_gateway.value);
			var srv_ip = ipv4_to_unsigned_integer(form_handle.wan_pptp_server.value);
			var b255 = ipv4_to_unsigned_integer("255.255.255.255");
			b255 ^= mask_ip;
			
			if (!is_ipv4_valid(form_handle.wan_pptp_ip_address.value) || 
				form_handle.wan_pptp_ip_address.value=="0.0.0.0" || 
				is_FF_IP(form_handle.wan_pptp_ip_address.value) ||
				wan_ip == gw_ip || (  srv_addr_is_ipv4 &&(wan_ip == srv_ip)) ||
				0 == (wan_ip & b255) ||
				b255 == (b255 & wan_ip)){
				alert(sw("txtInvalidPPTPIPaddress") + form_handle.wan_pptp_ip_address.value);
					try	{
						form_handle.wan_pptp_ip_address.select();
						form_handle.wan_pptp_ip_address.focus();
					} catch (e) {
					}
					return;
			}

			if (!is_ipv4_valid(form_handle.wan_pptp_subnet_mask.value) || !is_mask_valid(form_handle.wan_pptp_subnet_mask.value)) 
			{
				alert(sw("txtInvalidPPTPsubnetMask") + form_handle.wan_pptp_subnet_mask.value);
				try	{
					form_handle.wan_pptp_subnet_mask.select();
					form_handle.wan_pptp_subnet_mask.focus();
				} catch (e) {
				}
				return;
			}

			//|| gw_ip == srv_ip	==> we accept the case when gw ip == server ip
			if (!is_ipv4_valid(form_handle.wan_pptp_gateway.value) || 
				form_handle.wan_pptp_gateway.value=="0.0.0.0" || 
				is_FF_IP(form_handle.wan_pptp_gateway.value) ||
				0 == (gw_ip & b255) ||
				b255 == ((gw_ip & b255)) ){
				alert(sw("txtInvalidPPTPgatewayIPaddress") + form_handle.wan_pptp_gateway.value);
				try	{
					form_handle.wan_pptp_gateway.select();
					form_handle.wan_pptp_gateway.focus();
				} catch (e) {
				}
				return;
			}
				
			if ((wan_ip & mask_ip) !== (gw_ip & mask_ip))
			{
				alert(sw("txtPPTPWANGwIp")+" "+integer_to_ipv4(gw_ip)+" "+sw("txtWithinWanSubnet"));
				return false;
			}
			
			if ((LAN_IP & LAN_MASK) == (wan_ip & LAN_MASK))
			{
				alert(sw("txtWanSubConflitLanSub"));
				return false;
			}
		}
		if(form_handle.wan_pptp_server.value == "0.0.0.0")
		{
            		alert(sw("txtInvalidPPTPserverIPaddress") + form_handle.wan_pptp_server.value);
			try {
				form_handle.wan_pptp_server.select();
				form_handle.wan_pptp_server.focus();
			} catch (e) {
			}
			return;
		}
		if(is_blank(form_handle.wan_pptp_server.value))//kity
		{
			alert(sw("txtInvalidPPTPserverIPaddress") + form_handle.wan_pptp_server.value);
			form_handle.wan_pptp_server.focus();
			return false;
		}

		if(  form_handle.wan_pptp_use_dynamic_carrier_radio_0.checked == true
			&& srv_addr_is_ipv4 &&(!is_valid_ip(form_handle.wan_pptp_server.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,form_handle.wan_pptp_server.value) 
			|| !is_valid_gateway(form_handle.wan_pptp_ip_address.value,form_handle.wan_pptp_subnet_mask.value,form_handle.wan_pptp_server.value)))	{ 
			alert(sw("txtInvalidPPTPserverIPaddress") + form_handle.wan_pptp_server.value);
			try	{
				form_handle.wan_pptp_server.select();
				form_handle.wan_pptp_server.focus();
			} catch (e) {
			}
			return;
		}

		if(  form_handle.wan_pptp_use_dynamic_carrier_radio_1.checked == true
			&& srv_addr_is_ipv4&& (!is_valid_ip(form_handle.wan_pptp_server.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,form_handle.wan_pptp_server.value)))	{
			alert(sw("txtInvalidPPTPserverIPaddress") + form_handle.wan_pptp_server.value);
			try	{
				form_handle.wan_pptp_server.select();
				form_handle.wan_pptp_server.focus();
			} catch (e) {
			}
			return;
		}

		form_handle.wan_pptp_primary_dns.value = trim_string(form_handle.wan_pptp_primary_dns.value);
		form_handle.wan_pptp_primary_dns.value = form_handle.wan_pptp_primary_dns.value == "" ? "0.0.0.0" : form_handle.wan_pptp_primary_dns.value;
		
		if(  form_handle.wan_pptp_primary_dns.value!="0.0.0.0" && form_handle.wan_pptp_use_dynamic_carrier_radio_0.checked == true
			&& (!is_valid_ip(form_handle.wan_pptp_primary_dns.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,form_handle.wan_pptp_primary_dns.value) 
			|| !is_valid_gateway(form_handle.wan_pptp_ip_address.value,form_handle.wan_pptp_subnet_mask.value,form_handle.wan_pptp_primary_dns.value))){ 
			alert(sw("txtInvalidPPPoEPrimaryDNS") +  form_handle.wan_pptp_primary_dns.value);
			try {
				form_handle.wan_pptp_primary_dns.select();
				form_handle.wan_pptp_primary_dns.focus();
			} catch (e) {
			}
			return;
		}
				
		if(  form_handle.wan_pptp_primary_dns.value!="0.0.0.0" && form_handle.wan_pptp_use_dynamic_carrier_radio_1.checked == true
		     && (!is_valid_ip(form_handle.wan_pptp_primary_dns.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,form_handle.wan_pptp_primary_dns.value))){
			alert(sw("txtInvalidPPPoEPrimaryDNS") +  form_handle.wan_pptp_primary_dns.value);
			try {
				form_handle.wan_pptp_primary_dns.select();
				form_handle.wan_pptp_primary_dns.focus();
			} catch (e) {
			}
			return;
		}
		
		form_handle.wan_pptp_primary_dns2.value = trim_string(form_handle.wan_pptp_primary_dns2.value);
		form_handle.wan_pptp_primary_dns2.value = form_handle.wan_pptp_primary_dns2.value == "" ? "0.0.0.0" : form_handle.wan_pptp_primary_dns2.value;
		
		if(  form_handle.wan_pptp_primary_dns2.value!="0.0.0.0" && form_handle.wan_pptp_use_dynamic_carrier_radio_0.checked == true
			&& (!is_valid_ip(form_handle.wan_pptp_primary_dns2.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,form_handle.wan_pptp_primary_dns2.value) 
			|| !is_valid_gateway(form_handle.wan_pptp_ip_address.value,form_handle.wan_pptp_subnet_mask.value,form_handle.wan_pptp_primary_dns2.value))){ 
			alert(sw("txtInvalidPPPoEPrimaryDNS") +  form_handle.wan_pptp_primary_dns2.value);
			try {
				form_handle.wan_pptp_primary_dns2.select();
				form_handle.wan_pptp_primary_dns2.focus();
			} catch (e) {
			}
			return;
		}

		if(  form_handle.wan_pptp_primary_dns2.value!="0.0.0.0" && form_handle.wan_pptp_use_dynamic_carrier_radio_1.checked == true
		     && (!is_valid_ip(form_handle.wan_pptp_primary_dns2.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,form_handle.wan_pptp_primary_dns2.value))){
			alert(sw("txtInvalidPPPoEPrimaryDNS") +  form_handle.wan_pptp_primary_dns2.value);
			try {
				form_handle.wan_pptp_primary_dns2.select();
				form_handle.wan_pptp_primary_dns2.focus();
			} catch (e) {
			}
			return;
		}

		if ((form_handle.wan_pptp_primary_dns.value != "0.0.0.0") || (form_handle.wan_pptp_primary_dns2.value != "0.0.0.0")) {
			form_handle.wan_force_static_dns_servers.value = "true";
		} else {
			form_handle.wan_force_static_dns_servers.value = "false";
		}
		<!--kity add DNS is not same -->
		if((mf.wan_pptp_primary_dns.value != "0.0.0.0") && mf.wan_pptp_primary_dns.value == mf.wan_pptp_primary_dns2.value)
		{
        	alert(sw("txtSameDNS"));
        	mf.wan_pptp_primary_dns2.select();
        	mf.wan_pptp_primary_dns2.focus();
        	return false;
		}

		form_handle.pptp_mac_cloning_address.value = trim_string(form_handle.pptp_mac_cloning_address.value);
		//if(!is_mac_valid(form_handle.pptp_mac_cloning_address.value, true)) {
		if(!verify_mac(form_handle.pptp_mac_cloning_address.value,form_handle.pptp_mac_cloning_address)){
			alert (sw("txtInvalidMACAddress") + form_handle.pptp_mac_cloning_address.value + ".");
			return;
		}
		if(form_handle.pptp_mac_cloning_address.value == "00:00:00:00:00:00") {
			form_handle.pptp_mac_cloning_enabled.value = "false";
		}			
		else
		{
			var mac_addr = form_handle.pptp_mac_cloning_address.value.split(":");					
			form_handle.pptp_mac_cloning_enabled.value = "true";
			form_handle.pptp_mac_clone.value = "";	

			for(var i=0;i<mac_addr.length;i++)
			{
				form_handle.pptp_mac_clone.value += mac_addr[i];	
			}
		}

	}
	else if(wantype == "l2tp")//L2TP
	{
		var mac_addr;
		var srv_addr_is_ipv4 = 0;

		if(is_ipv4_valid(form_handle.wan_l2tp_server.value))
		{
			srv_addr_is_ipv4 = 1;
		}
	
		if(is_blank(form_handle.wan_l2tp_username.value))
		{
			alert(sw("txtUserNameBlank"));
			form_handle.wan_l2tp_username.focus();
			return false;
		}
		if(strchk_unicode(form_handle.wan_l2tp_password.value) == true)//kity
		{
			alert(sw("txtInvalidPwd"));
			form_handle.wan_l2tp_password.focus();
			return false;
		}
		if(form_handle.wan_l2tp_use_dynamic_carrier_radio_0.checked == true ) 
		{
			var LAN_IP = ipv4_to_unsigned_integer("<% getInfo("ip-rom"); %>");
			var LAN_MASK = ipv4_to_unsigned_integer("<% getInfo("mask-rom"); %>");		
			var wan_ip = ipv4_to_unsigned_integer(form_handle.wan_l2tp_ip_address.value);
			var mask_ip = ipv4_to_unsigned_integer(form_handle.wan_l2tp_subnet_mask.value);
			var gw_ip = ipv4_to_unsigned_integer(form_handle.wan_l2tp_gateway.value);
			var srv_ip = ipv4_to_unsigned_integer(form_handle.wan_l2tp_server.value);
			var b255 = ipv4_to_unsigned_integer("255.255.255.255");
			b255 ^= mask_ip;
			
			if (!is_ipv4_valid(form_handle.wan_l2tp_ip_address.value) || 
				form_handle.wan_l2tp_ip_address.value=="0.0.0.0" || 
				is_FF_IP(form_handle.wan_l2tp_ip_address.value) ||
				wan_ip == gw_ip || wan_ip == srv_ip ||
				0 == (wan_ip & b255) ||
				b255 == (b255 & wan_ip)){
					alert(sw("txtInvalidL2TPIP") + form_handle.wan_l2tp_ip_address.value);
					try	{
						form_handle.wan_l2tp_ip_address.select();
						form_handle.wan_l2tp_ip_address.focus();
					}	 
					catch (e) {
					}
				return;
			}
			if (!is_ipv4_valid(form_handle.wan_l2tp_subnet_mask.value) || !is_mask_valid(form_handle.wan_l2tp_subnet_mask.value)) {
				alert(sw("txtInvalidL2TPsubnetMask") + form_handle.wan_l2tp_subnet_mask.value);
				try	{
					form_handle.wan_l2tp_subnet_mask.select();
					form_handle.wan_l2tp_subnet_mask.focus();
				} catch (e) {
				}
				return;
			}
			//||gw_ip == srv_ip==>we accept the case when gw ip == server ip
			if (!is_ipv4_valid(form_handle.wan_l2tp_gateway.value) || 
				form_handle.wan_l2tp_gateway.value=="0.0.0.0" || 
				is_FF_IP(form_handle.wan_l2tp_gateway.value)  ||
				0 == (gw_ip & b255) ||
				b255 == (gw_ip & b255)){
					alert(sw("txtInvalidL2TPgatewayIP") + form_handle.wan_l2tp_gateway.value);
					try	{
						form_handle.wan_l2tp_gateway.select();
						form_handle.wan_l2tp_gateway.focus();
					}	 
					catch (e) {
					}
					return;
			}
			
			if ((wan_ip & mask_ip) !== (gw_ip & mask_ip))
			{
				alert(sw("txtL2TPWANGwIp")+" "+integer_to_ipv4(gw_ip)+" "+sw("txtWithinWanSubnet"));
				return false;
			}
			if ((LAN_IP & LAN_MASK) == (wan_ip & LAN_MASK))
			{
				alert(sw("txtWanSubConflitLanSub"));
				return false;
			}
		}
		
		if(form_handle.wan_l2tp_server.value == "0.0.0.0"){
			alert(sw("txtInvalidL2TPserver") + form_handle.wan_l2tp_server.value);
			try     {
				form_handle.wan_l2tp_server.select();
				form_handle.wan_l2tp_server.focus();
			} catch (e) {
			}
			return;
		}
		if(is_blank(form_handle.wan_l2tp_server.value))//kity
		{
			alert(sw("txtInvalidL2TPserver") + form_handle.wan_l2tp_server.value);
			form_handle.wan_l2tp_server.focus();
			return false;
		}
		
		if(  form_handle.wan_l2tp_use_dynamic_carrier_radio_0.checked == true
	     &&srv_addr_is_ipv4  &&(!is_valid_ip(form_handle.wan_l2tp_server.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,form_handle.wan_l2tp_server.value)
	     || !is_valid_gateway(form_handle.wan_l2tp_ip_address.value,form_handle.wan_l2tp_subnet_mask.value,form_handle.wan_l2tp_server.value))){
			alert(sw("txtInvalidL2TPserver") + form_handle.wan_l2tp_server.value);
			try     {
				form_handle.wan_l2tp_server.select();
				form_handle.wan_l2tp_server.focus();
			} catch (e) {
			}
			return;
		}

		if(  form_handle.wan_l2tp_use_dynamic_carrier_radio_1.checked == true
		  && srv_addr_is_ipv4 &&(!is_valid_ip(form_handle.wan_l2tp_server.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,form_handle.wan_l2tp_server.value))){
			alert(sw("txtInvalidL2TPserver") + form_handle.wan_l2tp_server.value);
			try     {
				form_handle.wan_l2tp_server.select();
				form_handle.wan_l2tp_server.focus();
			} catch (e) {
			}
			return;
		}
	
		form_handle.wan_l2tp_primary_dns.value = trim_string(form_handle.wan_l2tp_primary_dns.value);

		form_handle.wan_l2tp_primary_dns.value = form_handle.wan_l2tp_primary_dns.value == "" ? "0.0.0.0" : form_handle.wan_l2tp_primary_dns.value;

		//if (!is_ipv4_valid(form_handle.wan_l2tp_primary_dns.value) || is_FF_IP(form_handle.wan_l2tp_primary_dns.value) || ((ipv4_to_unsigned_integer(form_handle.wan_l2tp_primary_dns.value) & 0xFF000000) != 0x00000000 && (ipv4_to_unsigned_integer(form_handle.wan_primary_dns.value) & 0x000000FF) == 0x00000000   )) {
		if(  form_handle.wan_l2tp_primary_dns.value!="0.0.0.0" && form_handle.wan_l2tp_use_dynamic_carrier_radio_0.checked == true
		     && (!is_valid_ip(form_handle.wan_l2tp_primary_dns.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,form_handle.wan_l2tp_primary_dns.value)
		     || !is_valid_gateway(form_handle.wan_l2tp_ip_address.value,form_handle.wan_l2tp_subnet_mask.value,form_handle.wan_l2tp_primary_dns.value))){
			alert(sw("txtInvalidPPPoEPrimaryDNS") +  form_handle.wan_l2tp_primary_dns.value);
			try {
				form_handle.wan_l2tp_primary_dns.select();
				form_handle.wan_l2tp_primary_dns.focus();
			} catch (e) {
			}
			return;
		}

		if(  form_handle.wan_l2tp_primary_dns.value!="0.0.0.0" && form_handle.wan_l2tp_use_dynamic_carrier_radio_1.checked == true
		     && (!is_valid_ip(form_handle.wan_l2tp_primary_dns.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,form_handle.wan_l2tp_primary_dns.value) )){
			alert(sw("txtInvalidPPPoEPrimaryDNS") +  form_handle.wan_l2tp_primary_dns.value);
			try {
				form_handle.wan_l2tp_primary_dns.select();
				form_handle.wan_l2tp_primary_dns.focus();
			} catch (e) {
			}
			return;
		}

		if ((form_handle.wan_l2tp_primary_dns.value != "0.0.0.0")) {
		form_handle.wan_force_static_dns_servers.value = "true";
		} else {
		form_handle.wan_force_static_dns_servers.value = "false";
		}
		
		form_handle.wan_l2tp_primary_dns2.value = trim_string(mf.wan_l2tp_primary_dns2.value);

		form_handle.wan_l2tp_primary_dns2.value = form_handle.wan_l2tp_primary_dns2.value == "" ? "0.0.0.0" : form_handle.wan_l2tp_primary_dns2.value;

		//if (!is_ipv4_valid(form_handle.wan_l2tp_primary_dns2.value) || is_FF_IP(form_handle.wan_l2tp_primary_dns2.value) || ((ipv4_to_unsigned_integer(form_handle.wan_l2tp_primary_dns2.value) & 0xFF000000) != 0x00000000 && (ipv4_to_unsigned_integer(form_handle.wan_primary_dns2.value) & 0x000000FF) == 0x00000000   )) {
		if(  form_handle.wan_l2tp_primary_dns2.value!="0.0.0.0" && form_handle.wan_l2tp_use_dynamic_carrier_radio_0.checked == true
		     && (!is_valid_ip(form_handle.wan_l2tp_primary_dns2.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,form_handle.wan_l2tp_primary_dns2.value)
		     || !is_valid_gateway(form_handle.wan_l2tp_ip_address.value,form_handle.wan_l2tp_subnet_mask.value,form_handle.wan_l2tp_primary_dns2.value))){
			alert(sw("txtInvalidPPPoEPrimaryDNS") +  form_handle.wan_l2tp_primary_dns2.value);
			try {
				form_handle.wan_l2tp_primary_dns2.select();
				form_handle.wan_l2tp_primary_dns2.focus();
			} catch (e) {
			}
			return;
		}

		if(  form_handle.wan_l2tp_primary_dns2.value!="0.0.0.0" && form_handle.wan_l2tp_use_dynamic_carrier_radio_1.checked == true
		     && (!is_valid_ip(form_handle.wan_l2tp_primary_dns2.value) || !is_valid_gateway(lan_ip_str,lan_mask_str,form_handle.wan_l2tp_primary_dns2.value) )){
			alert(sw("txtInvalidPPPoEPrimaryDNS") +  form_handle.wan_l2tp_primary_dns2.value);
			try {
				form_handle.wan_l2tp_primary_dns2.select();
				form_handle.wan_l2tp_primary_dns2.focus();
			} catch (e) {
			}
			return;
		}

		if ((form_handle.wan_l2tp_primary_dns2.value != "0.0.0.0")) {
		form_handle.wan_force_static_dns_servers.value = "true";
		} else {
		form_handle.wan_force_static_dns_servers.value = "false";
		}
		<!--kity add the DNS is not same-->
		if((mf.wan_l2tp_primary_dns.value != "0.0.0.0") && mf.wan_l2tp_primary_dns.value == mf.wan_l2tp_primary_dns2.value)
		{
        	alert(sw("txtSameDNS"));
        	mf.wan_l2tp_primary_dns2.select();
        	mf.wan_l2tp_primary_dns2.focus();
        	return false;
		}
		
		form_handle.l2tp_mac_cloning_address.value = trim_string(form_handle.l2tp_mac_cloning_address.value);
		if(!verify_mac(form_handle.l2tp_mac_cloning_address.value,form_handle.l2tp_mac_cloning_address))
		{
			alert (sw("txtInvalidMACAddress") + " "+form_handle.l2tp_mac_cloning_address.value + ".");
			return;
		}
		if(form_handle.l2tp_mac_cloning_address.value == "00:00:00:00:00:00") {
			form_handle.l2tp_mac_cloning_enabled.value = "false";
		}			
		else
		{
			form_handle.l2tp_mac_cloning_enabled.value = "true";	
		}
		mac_addr = form_handle.l2tp_mac_cloning_address.value.split(":");					
		form_handle.l2tp_mac_clone.value = "";
		for(var i=0;i<mac_addr.length;i++)
		{
			form_handle.l2tp_mac_clone.value += mac_addr[i];
		}	
	
	}
    
    //check wireless setting 2.4G
    form_handle.wireless_SSID.value = trim_string(form_handle.wireless_SSID.value);
    if (is_blank(form_handle.wireless_SSID.value))
    {
        alert(sw("txtSSIDBlank"));
        form_handle.wireless_SSID.select();
        form_handle.wireless_SSID.focus();
        return false;
    }
    if(strchk_unicode(form_handle.wireless_SSID.value))
    {
        alert(sw("txtInvalidSSID"));
        form_handle.wireless_SSID.select();
        form_handle.wireless_SSID.focus();
        return false;
    }
    if(strchk_special(form_handle.wireless_SSID.value))
    {
        alert(sw("txtInvalidSSID"));
        form_handle.wireless_SSID.select();
        form_handle.wireless_SSID.focus();
        return false;
    }
    if(__is_str_in_deny_chars(form_handle.wireless_SSID.value, 1, "<>\""))
    {
        alert(sw("txtForSecurity")+"\n< > \"");
        form_handle.wireless_SSID.select();
        form_handle.wireless_SSID.focus();
        return false;
    }
        
    var keyvalue = form_handle.wlan_password.value;
    var key_len = keyvalue.length;
    var test_char, i;
    if (key_len < 8 || key_len > 64)
    {
        alert(sw("txtWizard_WlanStr1"));
        return false;
    }
    if(key_len >= 8 && key_len < 64)
    {
        if(keyvalue.charAt(0) == ' '|| keyvalue.charAt(key_len-1) == ' ')
        {
            alert(sw("txtheadtailnospeace"));
            return false;
        }
    } 	
    if(key_len == 64)
    {	
        for(i=0; i<key_len; i++)
        {
            test_char=keyvalue.charAt(i);
            if( (test_char >= '0' && test_char <= '9') ||
                (test_char >= 'a' && test_char <= 'f') ||
                (test_char >= 'A' && test_char <= 'F'))
                continue;
            alert(sw("txtWPAKeyHexadecimalDigits"));
            return false;
        }
        form_handle.pskFormat1.value = 1;	
    }
    else
    {
        if(strchk_unicode(keyvalue))
        {
            alert(sw("txtWizard_WlanStrerr"));
            return false;
        }	
        form_handle.pskFormat1.value = 0;	
    }   

    //check wireless setting 5G
    form_handle.wireless_SSID_5.value = trim_string(form_handle.wireless_SSID_5.value);
    if (is_blank(form_handle.wireless_SSID_5.value))
    {
        alert(sw("txtSSIDBlank"));
        form_handle.wireless_SSID_5.select();
        form_handle.wireless_SSID_5.focus();
        return false;
    }
    if(strchk_unicode(form_handle.wireless_SSID_5.value))
    {
        alert(sw("txtInvalidSSID"));
        form_handle.wireless_SSID_5.select();
        form_handle.wireless_SSID_5.focus();
        return false;
    }
    if(strchk_special(form_handle.wireless_SSID_5.value))
    {
        alert(sw("txtInvalidSSID"));
        form_handle.wireless_SSID_5.select();
        form_handle.wireless_SSID_5.focus();
        return false;
    }
    if(__is_str_in_deny_chars(form_handle.wireless_SSID_5.value, 1, "<>\""))
    {
        alert(sw("txtForSecurity")+"\n< > \"");
        form_handle.wireless_SSID_5.select();
        form_handle.wireless_SSID_5.focus();
        return false;
    }
        
    var keyvalue_5 = form_handle.wlan_password_5.value;
    var key_len_5 = keyvalue_5.length;		
    var test_char_5, i;
    if (key_len_5 < 8 || key_len_5 > 64)
    {
        alert(sw("txtWizard_WlanStr1"));
        return false;
    }
    if(key_len_5 >= 8 && key_len_5 < 64)
    {
        if(keyvalue.charAt(0) == ' '|| keyvalue.charAt(key_len-1) == ' ')
        {
            alert(sw("txtheadtailnospeace"));
            return false;
        }
    } 	
    if(key_len_5 == 64)
    {	
        for(i=0; i<key_len_5; i++)
        {
            test_char_5=keyvalue_5.charAt(i);
            if( (test_char_5 >= '0' && test_char_5 <= '9') ||
                (test_char_5 >= 'a' && test_char_5 <= 'f') ||
                (test_char_5 >= 'A' && test_char_5 <= 'F'))
                continue;
            alert(sw("txtWPAKeyHexadecimalDigits"));
            return false;
        }
            form_handle.pskFormat0.value = 1;	
    }
    else
    {
        if(strchk_unicode(keyvalue_5))
        {
            alert(sw("txtWizard_WlanStrerr"));
            return false;
        }	
        form_handle.pskFormat0.value = 0;	
    }

    return true;
}
function is_form_modified(form_id)
{
    var oElem;
    var form;
    form = document.getElementById(form_id);
    for (var i = 0; i < form.elements.length; i++)
    {
        oElem = form[i];
        var name = oElem.tagName.toLowerCase();
        if(name == "input")
        {
            switch (oElem.type)
            {
                case "text" :
                case "password" :
                case "textarea" :
                case "file" :
                case "hidden" :
                    if(oElem.defaultValue != oElem.value)
                    {
                        return true;
                        break;
                    }
                case "checkbox" :
                case "radio" :
                    if(oElem.defaultChecked != oElem.checked)
                    {
                        return true;
                        break;
                    }
            }
        }
        else if(name == "select")
        {
            if(oElem.defaultSelected != oElem.value)
            {
                return true;
            }
        }
    }
    return false;
}
function strchk_special(str)
{
        var strlen=str.length;
        if(strlen>0)
        {
                     var c = '';
                for(var i=0;i<strlen;i++)
                {
                                                c = escape(str.charAt(i));
                                        if(c.charAt(0) == '%' && c.charAt(1)=='B' && c.charAt(2)=='7')
                          return true;
                }

        }
        return false;
}
function page_submit()
{
var mf = document.forms.wz_form_pg_4;
mf.curTime.value = new Date().getTime();
	if(wancon =='1')
	{
		self.location.href="NetworkmapNoWan.asp?t="+new Date().getTime();
		return;
	}
	if (!is_form_modified("wz_form_pg_4"))
	{
        //Added that we could entry next webpage whereas this wedpage is not modified.
        if (SSID24G == get_by_id("wireless_SSID").value && Passwd24G == get_by_id("wlan_password").value
            && SSID5G == get_by_id("wireless_SSID_5").value && Passwd5G == get_by_id("wlan_password_5").value)
        {
            ;
        }
        else
        {
            alert(sw("txtisnomodified"));
            return false;
        }
	}
	else{	
		get_by_id("settingsChanged").value = 1;
	}
	if(wz_verify_4() == true)
	{
		get_by_id("curTime").value = new Date().getTime();
		get_by_id("smartsetup").disabled = true;
        mf.pskValue1.value = aes_encrypt(get_by_id("wlan_password").value);
        mf.pskValue0.value = aes_encrypt(get_by_id("wlan_password_5").value);
        get_by_id("pppoe_password").value = aes_encrypt(get_by_id("pppoe_password").value);
		var PrivateKey = sessionStorage.getItem('PrivateKey');
var current_time = Math.floor(mf.curTime.value / 1000) % 2000000000;
var auth = hex_hmac_md5(PrivateKey, current_time.toString()+"/Basic/Networkmap.asp");
auth = auth.toUpperCase();
	
mf.HNAP_AUTH.value = auth + " " + current_time;	

		document.wz_form_pg_4.submit();
	}

	
}
function save_submit(spanObj)
{
var mf = document.forms.wz_form_pg_4;
mf.curTime.value = new Date().getTime();
	if (!is_form_modified("wz_form_pg_4") )
	{
			self.location.href = '../logout.asp?t='+new Date().getTime();
			return;
	}
	else{	
		get_by_id("settingsChanged").value = 1;
		get_by_id("save_logout").value = 1;
	}
	if(wz_verify_4() == true)
	{
		get_by_id("curTime").value = new Date().getTime();
        mf.pskValue1.value = aes_encrypt(get_by_id("wlan_password").value);
        mf.pskValue0.value = aes_encrypt(get_by_id("wlan_password_5").value);
        get_by_id("pppoe_password").value = aes_encrypt(get_by_id("pppoe_password").value);
		spanObj.onclick = function(){};
		var PrivateKey = sessionStorage.getItem('PrivateKey');
var current_time = Math.floor(mf.curTime.value / 1000) % 2000000000;
var auth = hex_hmac_md5(PrivateKey, current_time.toString()+"/Basic/Networkmap.asp");
auth = auth.toUpperCase();
	
mf.HNAP_AUTH.value = auth + " " + current_time;	

		document.wz_form_pg_4.submit();
	}
}
var __AjaxAsk = null;
function doCheckSubmit(actionUrl)
{
        if (__AjaxAsk == null) __AjaxAsk = __createRequest();
        __AjaxAsk.open("POST", actionUrl, true);
        __AjaxAsk.setRequestHeader('Content-type','application/x-www-form-urlencoded');
        __AjaxAsk.send("ttt");
}
function GotoWan()
{
	doCheckSubmit("/goform/formEasySetupWizard");
	//self.location.href="WAN.asp?t="+new Date().getTime();
	setTimeout('self.location.href="WAN.asp?t="+new Date().getTime()', 500);
	return;
}
function GotoStatus()
{
	doCheckSubmit("/goform/formEasySetupWizard");
	setTimeout('self.location.href="../Status/Device_Info.asp?t="+new Date().getTime()', 500);
	return;
}
function wan_l2tp_use_dynamic_carrier_selector(mode){
	var mf = document.forms.wz_form_pg_4;
	mf.wan_l2tp_use_dynamic_carrier.value = mode;
	/*
	if(mode == "true") {
		mf.wan_l2tp_use_dynamic_carrier_radio_1.checked = true;
		mf.wan_l2tp_ip_address.disabled = true;
		mf.wan_l2tp_subnet_mask.disabled = true;
		mf.wan_l2tp_gateway.disabled = true;
		mf.wan_l2tp_primary_dns.disabled = true;
		mf.wan_l2tp_primary_dns2.disabled = true;
	} else {
		mf.wan_l2tp_use_dynamic_carrier_radio_0.checked = true;
		mf.wan_l2tp_ip_address.disabled = false;
		mf.wan_l2tp_subnet_mask.disabled = false;
		mf.wan_l2tp_gateway.disabled = false;
		mf.wan_l2tp_primary_dns.disabled = false;
		mf.wan_l2tp_primary_dns2.disabled = false;
	}
	*/

	mf.wan_l2tp_use_dynamic_carrier_radio_1.checked = true;
	mf.wan_l2tp_ip_address.disabled = true;
	mf.wan_l2tp_subnet_mask.disabled = true;
	mf.wan_l2tp_gateway.disabled = true;
	mf.wan_l2tp_primary_dns.disabled = true;
	mf.wan_l2tp_primary_dns2.disabled = true;
	mf.wan_l2tp_use_dynamic_carrier_radio_1.disabled = true;
	mf.wan_l2tp_use_dynamic_carrier_radio_0.disabled = true;
	mf.wan_l2tp_server.disabled = true;
	mf.wan_l2tp_username.disabled = true;
	mf.wan_l2tp_password.disabled = true;
	mf.l2tp_mac_cloning_address.disabled = true;
	mf.l2tp_clone_mac_addr.disabled = true;

}
function pptp_clone_mac() {
	var mf = document.forms.wz_form_pg_4;
	mf.pptp_mac_cloning_address.value = pcmac;
	mf.pptp_mac_cloning_enabled.value = "true";
}
function l2tp_clone_mac() {
	var mf = document.forms.wz_form_pg_4;
	mf.l2tp_mac_cloning_address.value = pcmac;
	mf.l2tp_mac_cloning_enabled.value = "true";
}
function wan_pptp_use_dynamic_carrier_selector(mode)
{
	var mf = document.forms.wz_form_pg_4;
	mf.wan_pptp_use_dynamic_carrier.value = mode;
	/*
	if(mode == "true") {
		mf.wan_pptp_use_dynamic_carrier_radio_1.checked = true;
		mf.wan_pptp_ip_address.disabled = true;	
		mf.wan_pptp_subnet_mask.disabled = true;
		mf.wan_pptp_gateway.disabled = true;
		mf.wan_pptp_primary_dns.disabled = true;
		mf.wan_pptp_primary_dns2.disabled = true;
		
	} else {
		mf.wan_pptp_use_dynamic_carrier_radio_0.checked = true;
		mf.wan_pptp_ip_address.disabled = false;
		mf.wan_pptp_subnet_mask.disabled = false;
		mf.wan_pptp_gateway.disabled = false;
		mf.wan_pptp_primary_dns.disabled = false;
		mf.wan_pptp_primary_dns2.disabled = false;
	}
	*/

	mf.wan_pptp_use_dynamic_carrier_radio_1.checked = true;
	mf.wan_pptp_ip_address.disabled = true;	
	mf.wan_pptp_subnet_mask.disabled = true;
	mf.wan_pptp_gateway.disabled = true;
	mf.wan_pptp_primary_dns.disabled = true;
	mf.wan_pptp_primary_dns2.disabled = true;
	mf.wan_pptp_use_dynamic_carrier_radio_1.disabled=true;
	mf.wan_pptp_use_dynamic_carrier_radio_0.disabled=true;
	mf.wan_pptp_server.disabled=true;
	mf.wan_pptp_username.disabled=true;
	mf.wan_pptp_password.disabled=true;
	mf.pptp_mac_cloning_address.disabled=true;
	mf.pptp_clone_mac_addr.disabled=true;
	

	
	
}
function init()
{
var DOC_Title= sw("txtTitle")+" : NETWORK MAP";
document.title = DOC_Title;
mf = document.forms[0];
pcmac = "<% getInfo("host-hwaddr"); %>";
remote_login = (pcmac == "00:00:00:00:00:00") ? true : false;
get_by_id("l2tp_clone_mac_addr").value = sw("txtWizardEasyStepCopyMAC");
get_by_id("pptp_clone_mac_addr").value = sw("txtWizardEasyStepCopyMAC");
get_by_id("smartsetup").value = sw("txtConnect");

get_by_id("pppoe_password").value = aes_decrypt("<% getInfo("pppPassword"); %>");
get_value();
wan_pptp_use_dynamic_carrier_selector(mf.wan_pptp_use_dynamic_carrier.value);
wan_l2tp_use_dynamic_carrier_selector(mf.wan_l2tp_use_dynamic_carrier.value);
if(LangCode == "SC")
{
	
}
var wantype = "<%getInfo("wanType");%>";
if(wantype == "0")
{
	var wan_type = "fixedIp";
	document.getElementById("wan_connect_mode").innerHTML = "Static IP";
}
else if(wantype == "1")
{	
	var wan_type = "autoIp";
	document.getElementById("wan_connect_mode").innerHTML = "DHCP";
}
else if(wantype == "2")
{
	var wan_type = "ppp";
	document.getElementById("wan_connect_mode").innerHTML = "PPPOE";
}
else if(wantype == "3")
{
	var wan_type = "pptp";
	document.getElementById("wan_connect_mode").innerHTML = "PPTP";
}
else if(wantype == "4")
{
	var wan_type = "l2tp";
	document.getElementById("wan_connect_mode").innerHTML = "L2TP";
}
else if(wantype == "9")
{
	var wan_type = "dhcpplus";
	document.getElementById("wan_connect_mode").innerHTML = "DHCP+";
}
else
{
	var wan_type = "autoIp";
	document.getElementById("wan_connect_mode").innerHTML = "Unknown";
}


on_change_wan_type(wan_type);	

var lan_mac_addr = "<% getInfo("lanMacAddr"); %>";
var wireless_SSID_24G_var = "<%getInfo("ssid","1");%>";
var wireless_SSID_5G_var = "<%getInfo("ssid","0");%>";
var wlan_password_24G_var = aes_decrypt("<%getInfo("pskValue","1");%>");
var wlan_password_5G_var = aes_decrypt("<%getInfo("pskValue","0");%>");


if("<%getIndexInfo("wscConfig");%>" == "0")
{
	//get_by_id("wireless_SSID").value = "dlink-"+lan_mac_addr.substring(12,14)+lan_mac_addr.substring(15,17);
	get_by_id("wireless_SSID").value = "D-Link_<% getInfo("hostName"); %>"
	get_by_id("wlan_password").value = "12345678";
}
else
{
	get_by_id("wireless_SSID").value = retranslate_control_code(wireless_SSID_24G_var);
        get_by_id("wlan_password").value = retranslate_control_code(wlan_password_24G_var);
    
    SSID24G = retranslate_control_code(wireless_SSID_24G_var);
    Passwd24G = retranslate_control_code(wlan_password_24G_var);

	get_by_id("wireless_SSID_5").value = retranslate_control_code(wireless_SSID_5G_var);
        get_by_id("wlan_password_5").value = retranslate_control_code(wlan_password_5G_var);
        
    SSID5G = retranslate_control_code(wireless_SSID_5G_var);
    Passwd5G = retranslate_control_code(wlan_password_5G_var);
}
<!--end-->
}
function DrawMastheadContainer1()
{
        document.write("<table id=\"masthead_container1\" cellspacing=\"0\" cellpadding=\"0\" summary=\"\" style=\"width:820px; height:92px;  \">");
        document.write("<map id=\"masthead_image_map\" name=\"masthead_image_map\">");
        document.write("<area shape=\"rect\" coords=\"10,10,180,70\" target=\"_blank\" href=\"http://www.dlink.com.tw\">");
        document.write("</area>");
        document.write("</map>");
        document.write("        <tr padding=\"0\">");
        document.write("                <td padding=\"0\">");
        document.write("                        <img src=\"/Images/img_masthead_red1.gif\" usemap=\"#masthead_image_map\" width=\"842px\" height=\"92px\" bordder=\"0\"/>");
        document.write("                </td>");
        document.write("        </tr>");
        document.write("</table>");
}

function web_timeout()
{
setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);
}
function template_load()
{
var global_fw_minor_version = "<%getInfo("fwVersion")%>";
var hw_version="<%getInfo("hwVersion")%>";
//var productModel="<%getInfo("productModel")%>";
document.getElementById("product_model_head").innerHTML = modelname;
document.getElementById("fw_minor_head").innerHTML = global_fw_minor_version;
document.getElementById("hw_version_head").innerHTML = hw_version;
RenderWarnings();			
}
//]]>
</script>
</head>
<body class="mainbg" onload="template_load();init();web_timeout();initdef();">
<div id="loader_container" onclick="return false;" style="display: none">&nbsp;</div>
<!--kity--><div id="outside" style="display:none">
<div class="maincontainer">

<SCRIPT >
DrawHeaderContainer();
DrawMastheadContainer1();
</SCRIPT>
		
<div class="simple2container">
<div class="simple2body">
<form id="wz_form_pg_4" name="wz_form_pg_4" action="/formWizard.htm" method="post">
<input type="hidden" id="settingsChanged" name="settingsChanged" value="<%getWizardInformation("wizardSettingChanged");%>"/>
<input type="hidden" name="config.wan_force_static_dns_servers" id="wan_force_static_dns_servers" value="false" />
<input type="hidden" name="config.wan_l2tp_use_dynamic_carrier" id="wan_l2tp_use_dynamic_carrier" value="<%getIndexInfo("l2tp_wan_ip_mode");%>" />
<input type="hidden" name="config.wan_pptp_use_dynamic_carrier" id="wan_pptp_use_dynamic_carrier" value="<%getIndexInfo("pptp_wan_ip_mode");%>" />
<input type="hidden" id="pptp_mac_cloning_enabled" name="config.pptp_mac_cloning_enabled" value="true"/>
<input type="hidden" id="l2tp_mac_cloning_enabled" name="config.l2tp_mac_cloning_enabled" value="true"/>
<input type="hidden" id="pptp_mac_clone" name="pptp_mac_clone" value=""/>
<input type="hidden" id="l2tp_mac_clone" name="l2tp_mac_clone" value=""/>
<input type="hidden" id="curTime" name="curTime" value=""/>
<input type="hidden" id="HNAP_AUTH" name="HNAP_AUTH" value=""/>
<input type="hidden" value="/Basic/Networkmap.asp" name="submit-url">
<input type="hidden" id="wireless_ieee8021x_enabled" name="config.wireless.ieee8021x_enabled" value="<%getIndexInfo("wpa_enterprise_enabled");%>" />
<input type="hidden" id="wlBandMode" name="wlBandMode" value="2" />
<input type="hidden" id="security_type_radio1" name="method1" value="6" />
<input type="hidden" id="wpaAuth1" name="wpaAuth1" value="psk" />
<input type="hidden" id="pskFormat1" name="pskFormat1" value="0" />

<input type="hidden" id="security_type_radio0" name="method0" value="6" />
<input type="hidden" id="wpaAuth0" name="wpaAuth0" value="psk" />
<input type="hidden" id="pskFormat0" name="pskFormat0" value="0" />
<input type="hidden" id="save_logout" name="save_logout" value="0" />
	<img src="../Images/title.jpg"/>
	<div class="networkmap" align="center">
		<div class="gap"></div>
		<div class="gap"></div>
		<div class="gap"></div>
		<div class="gap"></div>
		<div class="gap"></div>
		<div class="gap"></div>
		<div class="gap"></div>
		<div class="gap"></div>
		<div class="gap"></div>
		<table id="map">
		<tr>
			<th width="134"><script language=javascript type=text/javascript>ddw("txtWizardComputerStr");</script></th>
			<th width="114"></th>
			<th width="134"><script language=javascript type=text/javascript>ddw("txtWizardRouterStr");</script></th>
			<th width="114"></th>
			<th width="134"><script language=javascript type=text/javascript>ddw("txtInternet");</script></th>
		</tr>
		<tr>
			<td><center><img src="../Images/computer.jpg" width="134"/></center><center><span class="value" id="wiredcnt">LAN IP:<% getInfo("ip");%></span></center></td>
			<td><img src="../Images/line1.jpg" width="114"/></td>
			<td>
			<div>
				<span onclick="GotoStatus();" style="text-decoration:underline; cursor:pointer;">
					<img src="../Images/router.jpg" width="134" id="router" />
				</span>
			</div>
				<center><span class="value" id="internet_ip">INTERNET IP:<% getInfo("wan-ip");%></span></center>
			</td>
			<td><img src="../Images/line2.jpg" width="114" id="connect"/></td>
			<td>
			<div>
				<span onclick="GotoWan();" style="text-decoration:underline; cursor:pointer;">
					<img src="../Images/earth_no.jpg" width="134" id="internet" />
				</span>
			</div>
			<center><span class="value" id="wan_connect_mode"></span></center><center><span class="value" id="st_wanipaddr"></span></center>
			</td>
		</tr>
		</table>
		<div class="gap"></div>
		<div class="gap"></div>
	</div><!-- networkmap -->
	<div class="gap"></div>
	<div class="gap"></div>
	<div class="gap"></div>

	<div class="networkmap" align="center">
	<h2><SCRIPT>ddw("txtEasyInternetSetting");</SCRIPT></h2>
		<div class="gap"></div>
		<div class="gap"></div>
		<table width="100%">
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"  style="font-size:14px;font-weight: bold;"><B><SCRIPT language=javascript type=text/javascript>ddw("txtBroadbandType");</SCRIPT></B></font></td>
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
			  <select id="wan_type" onchange="on_change_wan_type(this.value)" name="wanType" style="width:150px">
 
			  <option value = "fixedIp">
                  <script language=javascript type=text/javascript>ddw("txtStaticIP");</script>
                  </option>
                <option value = "autoIp">
                  <script language=javascript type=text/javascript>ddw("txtDynamicIP");</script>
                  </option>
                <option value = "ppp">
                  <script language=javascript type=text/javascript>ddw("txtUserNamePassWordOfPPPOE");</script>
                  </option>
           <!--    <option value = "pptp" style="display:none">
                  <script language=javascript type=text/javascript>ddw("txtPPTP");</script>
                  </option>
                <option value = "l2tp" style="display:none">
                  <script language=javascript type=text/javascript>ddw("txtL2TP");</script>
                  </option>
                  -->
              </select>	
         <font style="font-size:14px;font-weight: bold;"><SCRIPT>ddw("txtWizardOthermode");</SCRIPT></font>		 
			  </td>
		</tr>	
		</table>
		<!--pppoe mode-->
		<div id=pppoe_setting style="DISPLAY:none ">
		<table width="100%">
		<tr>
			<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtEasyUsername");</SCRIPT></B></font></td>
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type=text id="pppoe_username" name="pppUserName" size=20 maxlength=63 value="<% getInfo("pppUserName"); %>"><font color="#0000FF" style="font-size:14px;font-weight: bold;text-align:center;"><SCRIPT>ddw("txtWizardEasyStepSMustFill");</SCRIPT></font>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtEasyPasswd");</SCRIPT></B></font></td>
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="password" id="pppoe_password" name="pppPassword" size=20 maxlength=63 value="">
				<input type="password" id="ppppwd" style="DISPLAY:none" >
			</td>
		</tr>
		</table>
		</div>
		<!--static mode-->
	<div id=static_setting style="DISPLAY:none ">
			<table width="100%">
			<tr>
				<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtIPAddress");</SCRIPT></B></font></td>
				<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
					<input type=text id="wan_ip_address" name="wan_ip" size=20 maxlength=15 value="<% getInfo("wan-ip-rom");%>"><font color="#0000FF" style="font-size:14px;font-weight: bold;text-align:center;"><SCRIPT>ddw("txtWizardEasyStepSMustFill");</SCRIPT></font>
				</td>
			</tr>
			<tr>
				<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtSubnetMask");</SCRIPT></B></font></td>
				<td class="l_tb1"width="60%"><font color="#000000"><B>:</B></font>&nbsp;
					<input type=text id="wan_subnet_mask"  name="wan_mask" size=20 maxlength=15 value="<% getInfo("wan-mask-rom");%>">
				</td>
			</tr>
			<tr>
				<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtGatewayAddress");</SCRIPT></B></font></td>
				<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
					<input type=text id="wan_gateway" name="wan_gateway"  size=20 maxlength=15 value="<% getInfo("wan-gateway-rom");%>">
				</td>
			</tr>
			<tr>
				<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtPrimaryDNSServer");</SCRIPT></B></font></td>
				<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
					<input type=text id="wan_primary_dns" name="dns1" size=20 maxlength=15 value="<% getInfo("wan-dns1");%>">
				</td>
			</tr>
			<tr>
				<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtSecondaryDNSServer");</SCRIPT></B></font></td>
				<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
					<input type=text id="wan_secondary_dns" name="config.wan_secondary_dns" size=20 maxlength=15 value="<% getInfo("wan-dns2");%>">
				</td>
			</tr>
			</table>	
		  </div>
		<!--pptp mode-->
		<div id=pptp_setting style="DISPLAY:none ">
		<table width="100%">
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtWizardEasyStepAddressMode");</SCRIPT></B></font></td><!--show Address Mode-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input id="wan_pptp_use_dynamic_carrier_radio_1" type="radio" name="wan_pptp_use_dynamic_carrier_radio" value="true" onclick="wan_pptp_use_dynamic_carrier_selector(this.value);"/><label><font color="#000000"><SCRIPT >ddw("txtDynamicIP");</SCRIPT></font></label>
				<input id="wan_pptp_use_dynamic_carrier_radio_0" type="radio" name="wan_pptp_use_dynamic_carrier_radio" value="false" onclick="wan_pptp_use_dynamic_carrier_selector(this.value);"/><label><font color="#000000"><SCRIPT >ddw("txtStaticIP");</SCRIPT></font></label>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtWizardEasyStepPPTPIPAddr");</SCRIPT></B></font></td><!--show PPTP IP Address-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_pptp_ip_address" size="20" maxlength="15" value="<% getInfo("pptpIp"); %>" name="pptpIpAddr"/><font color="#0000FF" style="font-size:14px;font-weight: bold;text-align:center;"><SCRIPT>ddw("txtWizardEasyStepSMustFill");</SCRIPT></font>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtWizardEasyStepPPTPNetmask");</SCRIPT></B></font></td><!--show PPTP Subnet Mask-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_pptp_subnet_mask" size="20" maxlength="15" value="<% getInfo("pptpSubnet"); %>" name="pptpSubnetMask"/>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtWizardEasyStepPPTPGateWay");</SCRIPT></B></font></td><!--show PPTP Gateway IP Address-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_pptp_gateway" size="20" maxlength="15" value="<% getInfo("pptpDefGw");%>" name="pptpDefGw"/>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtWizardEasyStepPPTPServerAddr");</SCRIPT></B></font></td><!--show PPTP Server IP Address-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_pptp_server" size="20" maxlength="128" value="<% getInfo("pptpServerIp"); %>" name="pptpServerIpAddr"/>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtUserName");</SCRIPT></B></font></td><!--show Username-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_pptp_username" size="20" maxlength="63" value="<% getInfo("pptpUserName"); %>" name="pptpUserName"/>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtPassword");</SCRIPT></B></font></td><!--show Password-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="password" id="wan_pptp_password" size="20" maxlength="63" onfocus="select();" value="<% getInfo("pptpPassword"); %>" name="pptpPassword"/>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtPrimaryDNSServer");</SCRIPT></B></font></td><!--show Primary DNS Server-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_pptp_primary_dns" size="20" maxlength="15" value="<% getInfo("wan-dns1");%>" name="config.wan_pptp_primary_dns"/>
			</td>
		</tr>
	
		<tr style="DISPLAY:none ">
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtSecondaryDNSServer");</SCRIPT></B></font></td>
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_pptp_primary_dns2" size="20" maxlength="15" value="<% getInfo("wan-dns2");%>" name="config.wan_pptp_primary_dns2"/>
			</td>
		</tr>
	
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtMACAddress");</SCRIPT></B></font></td><!--show MAC Address-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="pptp_mac_cloning_address" size="20" maxlength="17" value="<% getInfo("wanMac"); %>" name="config.pptp_mac_cloning_address" /> 
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%">&nbsp;</td><!--show MAC Address button-->
			<td class="l_tb1" width="60%">&nbsp;&nbsp;
				<input class="button_submit" type="button" id="pptp_clone_mac_addr" value="" onclick="pptp_clone_mac();" />
			</td>
		</tr>
		</table>
		</div>
		<!--l2tp mode-->
		<div id=l2tp_setting style="DISPLAY:none ">
		<table width="100%">
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtWizardEasyStepAddressMode");</SCRIPT></B></font></td><!--show Address Mode-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input id="wan_l2tp_use_dynamic_carrier_radio_1" type="radio" name="wan_l2tp_use_dynamic_carrier_radio" value="true" onclick="wan_l2tp_use_dynamic_carrier_selector(this.value);"/>
				<label><font color="#000000"><SCRIPT >ddw("txtDynamicIP");</SCRIPT></font></label> 
				<input id="wan_l2tp_use_dynamic_carrier_radio_0" type="radio" name="wan_l2tp_use_dynamic_carrier_radio" value="false" onclick="wan_l2tp_use_dynamic_carrier_selector(this.value);"/>
				<label><font color="#000000"><SCRIPT >ddw("txtWizardEasyStepStaticIp");</SCRIPT></font></label> 
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtWizardEasyStepL2TPIp");</SCRIPT></B></font></td><!--Show L2TP IP Address-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_l2tp_ip_address" size="20" maxlength="15" value="<% getInfo("l2tpIp"); %>" name="l2tpIpAddr"/><font color="#0000FF" style="font-size:14px;font-weight: bold;text-align:center;"><SCRIPT>ddw("txtWizardEasyStepSMustFill");</SCRIPT></font>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtWizardEasyStepL2tpmask");</SCRIPT></B></font></td><!--Show L2TP Subnet Mask-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_l2tp_subnet_mask" size="20" maxlength="15" value="<% getInfo("l2tpSubnet"); %>" name="l2tpSubnetMask"/>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtWizardEasyStepL2tpGateway");</SCRIPT></B></font></td><!--Show L2TP Gateway IP Address-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_l2tp_gateway" size="20" maxlength="15" value="<% getInfo("l2tpDefGw");%>" name="l2tpDefGw"/>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtWizardEasyStepL2tpServeraddr");</SCRIPT></B></font></td><!--Show L2TP Server IP Address-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_l2tp_server" size="20" maxlength="128" value="<% getInfo("l2tpServerIp"); %>" name="l2tpServerIpAddr"/>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtL2TPUserName");</SCRIPT></B></font></td><!--Show Username-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_l2tp_username" size="20" maxlength="63" value="<% getInfo("l2tpUserName"); %>" name="l2tpUserName"/>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtL2TPPassword");</SCRIPT></B></font></td><!--Show Password-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="password" id="wan_l2tp_password" size="20" maxlength="63" onfocus="select();" value="<% getInfo("l2tpPassword"); %>" name="l2tpPassword"/>
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtPrimaryDNSServer");</SCRIPT></B></font></td><!--Show Primary DNS Server-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_l2tp_primary_dns" size="20" maxlength="15" value="<% getInfo("wan-dns1");%>" name="config.wan_l2tp_primary_dns"/>
			</td>
		</tr>
		
		<tr style="DISPLAY:none ">
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtSecondaryDNSServer");</SCRIPT></B></font></td>
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_l2tp_primary_dns2" size="20" maxlength="15" value="<% getInfo("wan-dns2");%>" name="config.wan_l2tp_primary_dns2"/>
			</td>
		</tr>
		
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtMACAddress");</SCRIPT></B></font></td><!--Show MAC Address-->
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="l2tp_mac_cloning_address" size="20" maxlength="17" value="<% getInfo("wanMac"); %>" name="config.l2tp_mac_cloning_address" />
			</td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%">&nbsp;</td><!--Show MAC Address-->
			<td class="l_tb1" width="60%">&nbsp;&nbsp;
				<input class="button_submit" type="button" id="l2tp_clone_mac_addr" value="" onclick="l2tp_clone_mac();" />
			</td>
		</tr>
		</table>
		</div>
		<!--dhcpplus mode-->
		<div id=dhcpplus_setting style="DISPLAY:none ">
		<table width="100%">
		<tr>
			<td class=br_tb1 width="40%"><font color="#0000FF">*</font><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtUserName");</SCRIPT></B></font></td>
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="text" id="wan_dhcpplus_username" size="20" maxlength="39" value="<% getInfo("pppUserName"); %>" name="config.wan_dhcpplus_username"/><font color="#0000FF" style="font-size:14px;font-weight: bold;text-align:center;"><SCRIPT>ddw("txtWizardEasyStepSMustFill");</SCRIPT></font>
			</td>
		</tr>	
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT language=javascript type=text/javascript>ddw("txtPassword");</SCRIPT></B></font></td>
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
				<input type="password" id="wan_dhcpplus_password" size="20" maxlength="39" value="<% getInfo("pppPassword"); %>" name="config.wan_dhcpplus_password"/>
			</td>
		</tr>	
		</table>
		</div>	
		<div class="gap"></div>
		<div class="gap"></div>
	</div><!-- networkmap -->	
	<div class="gap"></div>
	<div class="gap"></div>
	<div class="gap"></div>
		<div class="networkmap" align="center">
		<h2><SCRIPT>ddw("txtEasyWlanSetting");</SCRIPT></h2>
		<div class="gap"></div>
		<div class="gap"></div>
		<table width="100%">
			<td><strong><font color="#000000" size="2"><SCRIPT>ddw("txtWiFiBand2G");</SCRIPT></font></strong></td>			
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT>ddw("txtWirelessNetworkNameSSID");</SCRIPT></B></font></td>
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
			<input type="text" id="wireless_SSID" name="ssid1" size="20" maxlength="32"></td>
</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT>ddw("txtWirelessPasswd");</SCRIPT></B></font></td>
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
			<input type="hidden" name="pskValue1" value="">
			<input id="wlan_password" size="20" maxlength="64"></td>
		</tr>
		</table>
		<table width="100%">
			<td><strong><font color="#000000" size="2"><SCRIPT>ddw("txtWiFiBand5G");</SCRIPT></font></strong></td>			
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT>ddw("txtWirelessNetworkNameSSID");</SCRIPT></B></font></td>
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
			<input type="text" id="wireless_SSID_5" name="ssid0" size="20" maxlength="32"></td>
		</tr>
		<tr>
			<td class=br_tb1 width="40%"><font color="#000000"><B><SCRIPT>ddw("txtWirelessPasswd");</SCRIPT></B></font></td>
			<td class="l_tb1" width="60%"><font color="#000000"><B>:</B></font>&nbsp;
			<input type="hidden" name="pskValue0" value="">
			<input id="wlan_password_5" size="20" maxlength="64"></td>
		</tr>
		</table>
		<div class="gap"></div>
		<div class="gap"></div>
	</div><!-- networkmap -->	
	<div class="gap"></div>
	<div class="gap"></div>
	<div class="centerline">
		<table width="100%"><tr><td width="280"></td>
		<td align="left">
		<input type="button" id="smartsetup" value="" onClick="page_submit()"; class="button_submit" style="background:url(../Images/button_n.jpg); border-style:none; width:187px; height:48px;"/></td>
		<td width="20"></td>
		<td align="right" width="80">
		<div>
			<span onclick="save_submit(this);" style="text-decoration:underline; cursor:pointer;"><!--kity -->
				<font color=#FFFFFF><B><SCRIPT>ddw("txtEasySaveLogout");</SCRIPT></B></font>
			</span>
		</div>
		</td>
		
		<td width="15"></td>
		<td align="right" width="90">
		<div>
			<span onclick="GotoWan();" style="text-decoration:underline; cursor:pointer;">
				<font color=#FFFFFF><B><SCRIPT>ddw("txtAdvancedNetwork");</SCRIPT></B></font>
			</span>
		</div>
		</td>
		</tr></table>
	</div>
</form>
</div><!-- simple2body -->
</div><!-- simple2container -->
</div><!-- maincontainer -->
<!-- <div class="copyright">Copyright &copy; 2009-2013 D-Link Systems, Inc.</div> -->
<font style="font-size:12px"><SCRIPT language=javascript>print_copyright();</SCRIPT></font>
</div>
</body>
</html>
