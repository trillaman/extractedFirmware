<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML>
<head>
<meta http-equiv=X-UA-Compatible content=IE=EmulateIE7>
<meta http-equiv="content-type" content="text/html; charset=<% getLangInfo("charset");%>" />
<link rel="stylesheet" rev="stylesheet" href="../style.css" type="text/css" />

<script type="text/javascript" src="../ubicom.js"></script>
<script type="text/javascript" src="../xml_data.js"></script>
<script type="text/javascript" src="../navigation.js"></script>
<% getLangInfo("LangPath");%>
<script type="text/javascript" src="../utility.js"></script>
<script type="text/javascript">
//<![CDATA[
var WLAN_ENABLED; 
var OP_MODE;
if('<%getInfo("opmode");%>' =='Disabled')
OP_MODE='1';
else
OP_MODE='0';
if('<%getIndexInfo("wlanDisabled");%>'=='Disabled')
WLAN_ENABLED='0';
else
WLAN_ENABLED='1';	
		var MAXNUM_TRIGPORT = "<% getInfo("maxTrigPortNum");%>"*1;

function get_webserver_ssi_uri() {
return ("" !== "") ? "/Basic/Setup.asp" : "/Advanced/Special_Applications.asp";
}

var ItvID=0;
function web_timeout()
{
setTimeout('do_timeout()','<%getIndex("logintimeout");%>'*60*1000);
}
function template_load()
{
var global_fw_minor_version = "<%getInfo("fwVersion")%>";
var fw_extend_ver = "";			
var fw_minor;
assign_firmware_version(global_fw_minor_version,fw_extend_ver,fw_minor);
var hw_version="<%getInfo("hwVersion")%>";
document.getElementById("hw_version_head").innerHTML = hw_version;
document.getElementById("product_model_head").innerHTML = modelname;
SubnavigationLinks(WLAN_ENABLED, OP_MODE);
topnav_init(document.getElementById("topnav_container"));
page_load();
RenderWarnings();
}

var schedule_options = [
	<%virSevSchRuleList();%>
];

var mf;

var verify_failed = "<%getInfo("err_msg")%>";

var spec_apps = [
{name: sw("txtApplicationName"), trigger_protocol: "", trigger_ports: "", input_protocol: "", input_ports: ""},
{name: sw("txtAIMTalk"), trigger_protocol: "6", trigger_ports: "4099", input_protocol: "6", input_ports: "5190"},
{name: sw("txtBitTorrent"), trigger_protocol: "6", trigger_ports: "6969", input_protocol: "6", input_ports: "6881-6889"},
{name: sw("txtCalistaIPPhone"), trigger_protocol: "6", trigger_ports: "5190", input_protocol: "17", input_ports: "3000"},
{name: sw("txtICQ"), trigger_protocol: "17", trigger_ports: "4000", input_protocol: "6", input_ports: "20000,20019,20039,20059"},
{name: sw("txtPalTalk"), trigger_protocol: "6", trigger_ports: "5001-5020", input_protocol: "255", input_ports: "2090,2091,2095"},
];

function spec_app_populate_select(select_id)
{
if(select_id.options.length <= 0)
for (var j = 0; j < spec_apps.length; j++) {
/*
* Check for overrun which occurs in an array if you have
* a comma but no ending element.
*/
if (typeof(spec_apps[j]) == "undefined") {
break;
}
select_id.options.add(new Option(spec_apps[j].name, j));
}
}

/*
* Selectors.
*/
function enabled_select_selector(index, checked)
{
if(	checked==true)
mf["enabled_" + index].value = "1";
else
mf["enabled_" + index].value = "0";	

mf["enabled_select_" + index].checked = checked;
mf["used_" + index].value = checked ? "1" : "0";
}

function entry_name_selector(index)
{
var idx = mf["entry_name_select_" + index].value;
if (idx == "0") {
return;
}
mf["entry_name_" + index].value = spec_apps[idx].name;
mf["trigger_protocol_" + index].value = spec_apps[idx].trigger_protocol;
mf["trigger_ports_" + index].value = spec_apps[idx].trigger_ports;
mf["input_protocol_" + index].value = spec_apps[idx].input_protocol;
mf["input_ports_" + index].value = spec_apps[idx].input_ports;
trigger_protocol_selector(index, mf["trigger_protocol_" + index].value);
input_protocol_selector(index, mf["input_protocol_" + index].value);


/*
* Reset the game to the default "Application Name"
*/
mf["entry_name_select_" + index].value = 0;
}

function trigger_protocol_selector(index, val)
{			
mf["trigger_protocol_" + index].value = val;
mf["trigger_protocol_select_" + index].value = val;
}			

function input_protocol_selector(index, val)
{
mf["input_protocol_" + index].value = val;
mf["input_protocol_select_" + index].value = val;
}			

function sched_name_selector(index, val)
{
mf["sched_name_" + index].value = val;
mf["sched_name_select_" + index].value = val;
}

function populate_list_selectors(sz)
{
for (var i = 0; i < sz; i++) {
var entry_name_handle = mf["entry_name_select_" + i];
//var sched_name_handle = mf["sched_name_select_" + i];
spec_app_populate_select(entry_name_handle);
//schedule_populate_select(sched_name_handle);
//if (mf["used_" + i].value == "1") 
{
enabled_select_selector(i, mf["enabled_" + i].value == "1");
trigger_protocol_selector(i, mf["trigger_protocol_" + i].value);
input_protocol_selector(i, mf["input_protocol_" + i].value);
//sched_name_selector(i, mf["sched_name_" + i].value);
}
}
}

function page_submit()
{
    mf.curTime.value = new Date().getTime();
    
    var PrivateKey = sessionStorage.getItem('PrivateKey');
    var current_time = Math.floor(mf.curTime.value / 1000) % 2000000000;
    var auth = hex_hmac_md5(PrivateKey, current_time.toString()+"/Advanced/Special_Applications.asp");
    auth = auth.toUpperCase();
    mf.HNAP_AUTH.value = auth + " " + current_time;
    
    if (!is_form_modified("mainform"))  //nothing changed
    {
        if (!confirm(sw("txtSaveAnyway"))) 				
        return false;
    }
    else
    {
        if (page_verify()) 
            mf["settingsChanged"].value = 1;
        else
            return false;				
    }
    mf.submit();
}

function check_trigger_port(index)
{
	var trigger_port_n = mf["trigger_ports_" + index];
	var obj;

	var trigger = (trigger_port_n.value).split(",");
	if (trigger.length != 1) return false;

	var ports = trigger[0].split("-");
	if (ports.length == 1)
	{
		if(ports[0].substring(0,1)== "0") return false;
		if (is_valid_port_str(ports[0]))
		{
			return true;
		}
	}
	else if (ports.length == 2)
	{
		if(ports[0].substring(0,1)== "0") return false;
		if(ports[1].substring(0,1)== "0") return false;
		if (is_valid_port_range_str(ports[0], ports[1]))
		{
			return true;
		}
	}
	return false;
}

function check_public_port(index)
{
	var ports;
	var pub_port_n = mf["input_ports_" + index];

	var pubport = (pub_port_n.value).split(",");
	if (pubport.length < 1) return false;
	if (pubport.length > 5) return false;

	for (i=0; i<pubport.length; i++)
	{
		ports = pubport[i].split("-");
		if (ports.length == 1)
		{
			if(ports[0].substring(0,1)== "0") return false;
			if (!is_valid_port_str(ports[0])) return false;
		}
		else if (ports.length == 2)
		{
			if(ports[0].substring(0,1)== "0") return false;
			if(ports[1].substring(0,1)== "0") return false;
			if (!is_valid_port_range_str(ports[0], ports[1])) return false;
		}
		else
		{
			return false;
		}
	}
	return true;
}

var bMAXNUM_VIRTUAL_SERVER = 24;
var chk_start = 0;
var chk_end = 0;
var check_port = 0;

var VS_port = [
    <%dumpVirtualServList();%>
];
var PF_port = [
    <%dumpPortFwList();%>
];

function page_verify()
{
for(var i=0; i <MAXNUM_TRIGPORT; i++)
{
	var sa_name = mf["entry_name_" + i].value;			
	var triPorts = mf["trigger_ports_" + i].value;
	var triProto = mf["trigger_protocol_" + i].value;
	var inPorts = mf["input_ports_" + i].value;
	var inProto = mf["input_protocol_" + i].value;
if (mf["enabled_" + i].value == "1" || sa_name !="" || triPorts !="" || inPorts !="")
{ 
	if(sa_name == "")
	{
	alert(sw("txtNameBlank"));					
	return false;				
	}
	else if(strchk_unicode(sa_name))//kity
	{
		alert(sw("txtRuleNameInvalid"));	
		mf["entry_name_" + i].select();
		mf["entry_name_" + i].focus();				
		return false
	}
	else if(utf8len(sa_name) > 20)
	{
		alert(sw("txtRuleNameInvalid"));	
		mf["entry_name_" + i].select();
		mf["entry_name_" + i].focus();				
		return false;
        }
        else if(__is_str_in_deny_chars(sa_name, 1, "<>\""))
        {
                alert(sw("txtForSecurity")+"\n< > \"");
                mf["entry_name_" + i].select();
                mf["entry_name_" + i].focus();
                return false;
        }

if (is_blank(triPorts))
{
alert(sw("txtTrigger")+" "+sw("txtPortRange")+" "+sw("txtIsEmpty"));
mf["trigger_ports_" + i].select();
mf["trigger_ports_" + i].focus();
return false;
}
if (is_blank(inPorts))
{
alert(sw("txtFirewall")+" "+sw("txtPortRange")+" "+sw("txtIsEmpty"));
mf["input_ports_" + i].select();
mf["input_ports_" + i].focus();
return false;
}
if ((triProto != 6) && (triProto != 17) && (triProto != 255))
{
    alert(sw("txtTrigger")+" "+sw("txtCommunicationTyp")+" "+sw("txtIsEmpty"));
    mf["trigger_protocol_select_" + i].focus();
    return false;
}
if ((inProto != 6) && (inProto != 17) && (inProto != 255))
{
    alert(sw("txtFirewall")+" "+sw("txtCommunicationTyp")+" "+sw("txtIsEmpty"));
    mf["input_protocol_select_" + i].focus();
    return false;
}

if(check_trigger_port(i) == false && triPorts!="")
{
alert(sw("txtTrigger")+" "+sw("txtPortRange")+" "+triPorts+" ("+sa_name+") "+sw("txtisInvalid"));
mf["trigger_ports_" + i].select();
mf["trigger_ports_" + i].focus();
return false;
}

if(check_public_port(i) == false && inPorts!="")
{
alert(sw("txtFirewall")+" "+sw("txtPortRange")+" "+inPorts+" ("+sa_name+") "+sw("txtisInvalid"));
mf["input_ports_" + i].select();
mf["input_ports_" + i].focus();
return false;
}			

//boer add start

//check the port conflict 
    var allow_wan_http = "<%getIndex("webWanAccess");%>";
    var allow_wan_port = "<%getInfo("webWanAccessport");%>";
    var ports;
    var pub_port_n = inPorts;
    var pubport = pub_port_n.split(",");

    for (var j = 0; j < pubport.length; j++)
    {
        ports = pubport[j].split("-");
        if (ports.length == 1)
        {
            //remote management port
            if(allow_wan_http == "true")
            {
                if (inProto == "6" || inProto == "255")
                {
                    if (ports[0] == allow_wan_port)
                    {
                        alert(sw("txtInvalidPort")+"["+allow_wan_port+"]"+sw("txtPort")+sw("txtIsAlreadyUsed"));
                        return false;
                    }
                }
            }

            //virtual server public port
            var  check_port;
            for(var k = 0; k < bMAXNUM_VIRTUAL_SERVER; k++)
            {
                if(VS_port[k].used != "1")
                    break;

                check_port = VS_port[k].public_port;
                if(ports[0] == check_port)
                {
                    alert(sw("txtInvalidPort")+"["+check_port+"]"+sw("txtPort")+sw("txtIsAlreadyUsed"));
                    mf["input_ports_" + i].select();
                    mf["input_ports_" + i].focus();
                    return false;
                }
            }

            //port forwarding public port
            for(var k = 0; k < bMAXNUM_VIRTUAL_SERVER; k++)
            {
                if(PF_port[k].used != "1")
                    break;

                chk_start = PF_port[k].start_port;
                chk_end = PF_port[k].end_port;

                if((ports[0] - chk_start >= 0) && (chk_end - ports[0] >= 0))
                {
                    alert(sw("txtInvalidPort")+"["+chk_start+"-"+chk_end+"]"+sw("txtPort")+sw("txtIsAlreadyUsed"));
                    mf["input_ports_" + i].select();
                    mf["input_ports_" + i].focus();
                    return false;
                }
            }
        }
        else if (ports.length == 2)
        {
            if(allow_wan_http == "true")
            {
                if (inProto == "6" || inProto == "255")
                {
                    if (( ports[0] <= allow_wan_port) && (ports[1] >= allow_wan_port))
                    {
                        alert(sw("txtInvalidPort")+"["+allow_wan_port+"]"+sw("txtPort")+sw("txtIsAlreadyUsed"));
                        return false;
                    }
                }
            }

            for(var k = 0; k < bMAXNUM_VIRTUAL_SERVER; k++)
            {
                if(VS_port[k].used != "1")
                    break;

                check_port = VS_port[k].public_port;
                if((ports[0] <= check_port) && (ports[1] >= check_port))
                {
                    alert(sw("txtInvalidPort")+"["+check_port+"]"+sw("txtPort")+sw("txtIsAlreadyUsed"));
                    return false;
                }
            }

            for (var k = 0; k < bMAXNUM_VIRTUAL_SERVER; k++)
            {
                if(PF_port[k].used != "1")
                    break;

                chk_start = PF_port[k].start_port;
                chk_end = PF_port[k].end_port;

                if(!(((ports[0] - chk_end) > 0) || ((chk_start - ports[1]) > 0)))
                {
                    alert(sw("txtInvalidPort")+"["+chk_start+"-"+chk_end+"]"+sw("txtPort")+sw("txtIsAlreadyUsed"));
                    mf["input_ports_" + i].select();
                    mf["input_ports_" + i].focus();
                    return false;
                }
            }
        }
    }

//boer add end
	
for(var j=0; j<MAXNUM_TRIGPORT ;j++)
{
if(i==j || mf["enabled_" + j].value != "1")
continue;

if(mf["entry_name_" + j].value == sa_name)
{
alert(sw("txtName")+" '"+sa_name+"' "+sw("txtIsAlreadyUsed"));
return false;
}

if(triPorts == mf["trigger_ports_" + j].value && 
triProto == mf["trigger_protocol_" + j].value && 
inPorts == mf["input_ports_" + j].value && 
inProto == mf["input_protocol_" + j].value)
{
alert(sw("txtRecord")+" '"+sa_name+" "+sw("txtIsDuplicateStr2_1")+" '"+mf["entry_name_" + j].value+"'"+sw("txtIsDuplicateStr2_2"));
return false;
}

if(inPorts == mf["input_ports_" + j].value && (inProto == mf["input_protocol_" + j].value || inProto == 255 || mf["input_protocol_" + j].value == 255))
{
var protoStrTri;
var protoStrIn;
if(inProto == 6)
protoStrTri = "TCP";
else if(inProto == 17)
protoStrTri = "UDP";
else
protoStrTri = "BOTH";

if(mf["input_protocol_" + j].value == 6)
protoStrIn = "TCP";
else if(mf["input_protocol_" + j].value == 17)
protoStrIn = "UDP";
else
protoStrIn = "BOTH";

alert(sw("txtFirewallPort")+"("+sa_name+") "+"["+protoStrTri+":"+inPorts+"]->"+inPorts+" "+sw("txtConflictWithStr1")+" '"+mf["entry_name_" + j].value+"' [" +protoStrIn+":"+mf["input_ports_" + j].value+"]->"+mf["input_ports_" + j].value+sw("txtConflictWithStr2"));
return false;
}

if(triPorts == mf["trigger_ports_" + j].value && (triProto == mf["trigger_protocol_" + j].value || triProto == 255 || mf["trigger_protocol_" + j].value == 255))
{
var protoStrTri;
var protoStrIn;
if(triProto = 6)
protoStrTri = "TCP";
else if(triProto == 17)
protoStrTri = "UDP";
else
protoStrTri = "BOTH";

if(mf["trigger_protocol_" + j].value = 6)
protoStrIn = "TCP";
else if(mf["trigger_protocol_" + j].value == 17)
protoStrIn = "UDP";
else
protoStrIn = "BOTH";

alert(sw("txtTriggerPort")+" ("+sa_name+") "+"["+protoStrTri+":"+triPorts+"]->"+triPorts+" "+sw("txtConflictWithStr1")+" '"+mf["entry_name_" + j].value+"' [" +protoStrIn+":"+mf["trigger_ports_" + j].value+"]->"+mf["trigger_ports_" + j].value+sw("txtConflictWithStr2"));
return false;
}
}
}
}
return true;
}
function page_load()
{
mf = document.forms.mainform;

displayOnloadPage("<%getInfo("ok_msg")%>");	

var sz = MAXNUM_TRIGPORT;
populate_list_selectors(sz);
set_form_default_values("mainform");


/* Check for validation errors. */
if (verify_failed != "") {
set_form_always_modified("mainform");
alert(verify_failed);
}
}

function init()
{
var DOC_Title= sw("txtTitle")+" : "+sw("txtAdvanced")+'/'+sw("txtApplicationRules");
document.title = DOC_Title;
get_by_id("RestartNow").value = sw("txtRebootNow");
get_by_id("RestartLater").value = sw("txtRebootLater");
get_by_id("DontSaveSettings").value = sw("txtDontSaveSettings");
get_by_id("SaveSettings").value = sw("txtSaveSettings");			
get_by_id("DontSaveSettings_Btm").value = sw("txtDontSaveSettings");
get_by_id("SaveSettings_Btm").value = sw("txtSaveSettings");	

}

var token= new Array(MAXNUM_TRIGPORT);
var DataArray = new Array();

function specialApplicationList(num)
{
token[0]="<% triggporList("trigPort_1");%>"
token[1]="<% triggporList("trigPort_2");%>"
token[2]="<% triggporList("trigPort_3");%>"
token[3]="<% triggporList("trigPort_4");%>"
token[4]="<% triggporList("trigPort_5");%>"
token[5]="<% triggporList("trigPort_6");%>"
token[6]="<% triggporList("trigPort_7");%>"
token[7]="<% triggporList("trigPort_8");%>"
token[8]="<% triggporList("trigPort_9");%>"
token[9]="<% triggporList("trigPort_10");%>"
token[10]="<% triggporList("trigPort_11");%>"
token[11]="<% triggporList("trigPort_12");%>"
token[12]="<% triggporList("trigPort_13");%>"
token[13]="<% triggporList("trigPort_14");%>"
token[14]="<% triggporList("trigPort_15");%>"
token[15]="<% triggporList("trigPort_16");%>"
token[16]="<% triggporList("trigPort_17");%>"
token[17]="<% triggporList("trigPort_18");%>"
token[18]="<% triggporList("trigPort_19");%>"
token[19]="<% triggporList("trigPort_20");%>"
token[20]="<% triggporList("trigPort_21");%>"
token[21]="<% triggporList("trigPort_22");%>"
token[22]="<% triggporList("trigPort_23");%>"
token[23]="<% triggporList("trigPort_24");%>"

for (var i = 0; i < num; i++)
{				
DataArray = token[i].split("<devide>"); /* Enabled, comment, triPortRng, tri_protoType, incPortRng, inc_protoType, scheRule */

document.write("<tr>")
document.write("	<td class=\"centered\" rowspan=\"2\" colspan=\"1\">")
document.write("		<input type=\"hidden\" id=\"used_"+i+"\" name=\"used_"+i+"\" value=\""+DataArray[0]+"\" />")
document.write("		<input type=\"hidden\" id=\"enabled_"+i+"\" name=\"enabled_"+i+"\" value=\""+DataArray[0]+"\" />")
document.write("		<input type=\"checkbox\" id=\"enabled_select_"+i+"\" onclick=\"enabled_select_selector(&quot;"+i+"&quot;, this.checked);\" />	")													
document.write("	</td>")
document.write("	<td class=\"centered\" rowspan=\"2\" colspan=\"1\">")
document.write("		"+sw("txtName")+"")
document.write("		<br clear=\"none\"/>")
document.write("		<input type=\"text\" size=\"20\" maxlength=\"20\" id=\"entry_name_"+i+"\"  name=\"entry_name_"+i+"\" value=\""+DataArray[1]+"\" />")
document.write("	</td>")
document.write("	<td class=\"centered\" rowspan=\"2\" colspan=\"1\">")
document.write("		"+sw("txtApplication")+"")
document.write("		<br clear=\"none\"/>")
document.write("		<input type=\"button\" value=\"&lt;&lt;\" class=\"arrow\" onclick=\"entry_name_selector(&quot;"+i+"&quot;);\" />")
document.write("		<select id=\"entry_name_select_"+i+"\">")
document.write("		</select>")
document.write("	</td>")
document.write("	<td class=\"centered\" rowspan=\"1\" colspan=\"1\">")
document.write("		"+sw("txtTrigger")+"")
document.write("		<br clear=\"none\"/>")
document.write("		<input type=\"text\" size=\"20\" maxlength=\"11\" id=\"trigger_ports_"+i+"\" name=\"trigPortRng_"+i+"\" value=\""+DataArray[2]+"\" />")
document.write("	</td>")
document.write("	<td class=\"centered\" rowspan=\"1\" colspan=\"1\">")
document.write("		<input type=\"hidden\" id=\"trigger_protocol_"+i+"\" name=\"trigPortPtc_"+i+"\" value=\""+DataArray[3]+"\" />")
document.write("		<select id=\"trigger_protocol_select_"+i+"\" onChange=\"trigger_protocol_selector(&quot;"+i+"&quot;, this.value);\" >")
document.write("			<option value=\"6\">TCP</option>")
document.write("			<option value=\"17\">UDP</option>")
document.write("			<option value=\"255\">")
document.write("				"+sw("txtAny")+"")
document.write("			</option>")
document.write("		</select>")
document.write("	</td>")
document.write("	<input type=\"hidden\" id=\"sched_name_"+i+"\" name=\"sched_name_"+i+"\" value=\""+DataArray[6]+"\"/>")
/*
document.write("	<td class=\"centered\" rowspan=\"2\" colspan=\"1\">")
document.write("		<input type=\"hidden\" id=\"sched_name_"+i+"\" name=\"sched_name_"+i+"\" value=\""+DataArray[6]+"\"/>")
document.write("		<select id=\"sched_name_select_"+i+"\" onchange=\"sched_name_selector(&quot;"+i+"&quot;, this.value);\">")
document.write("		</select>")
document.write("	</td>")
*/
document.write("</tr>")
document.write("<tr>")
document.write("	<td class=\"centered\" rowspan=\"1\" colspan=\"1\">")
document.write("		"+sw("txtFirewall")+"")
document.write("		<br clear=\"none\"/>")
document.write("		<input type=\"text\" size=\"20\" maxlength=\"64\" id=\"input_ports_"+i+"\" name=\"inputPortRng_"+i+"\" value=\""+DataArray[4]+"\" />")
document.write("	</td>")
document.write("	<td class=\"centered\" rowspan=\"1\" colspan=\"1\">")
document.write("		<input type=\"hidden\" id=\"input_protocol_"+i+"\" name=\"inputPortPtc_"+i+"\" value=\""+DataArray[5]+"\" />")
document.write("		<select id=\"input_protocol_select_"+i+"\" onChange=\"input_protocol_selector(&quot;"+i+"&quot;, this.value);\" >")												
document.write("			<option value=\"6\">TCP</option>")
document.write("			<option value=\"17\">UDP</option>")
document.write("			<option value=\"255\">")
document.write("				"+sw("txtAny")+"")
document.write("			</option>")
document.write("		</select>")
document.write("	</td>")
document.write("</tr>")
}
}
//]]>
</script>
<!-- InstanceEndEditable -->
</head>
<body onload="template_load(); init();web_timeout();">
<div id="loader_container" onclick="return false;">&nbsp;</div>
<div id="outside" style="display:none">
<table id="table_shell" cellspacing="0" summary=""><col span="1"/>
<tr>
<td>
<SCRIPT >
DrawHeaderContainer();
DrawMastheadContainer();
DrawTopnavContainer();
</SCRIPT>
<table id="content_container" border="0" cellspacing="0" summary=""><col span="3"/>
<tr>	
<td id="sidenav_container">
<div id="sidenav">
<SCRIPT >
DrawBasic_subnav();
DrawAdvanced_subnav();
DrawTools_subnav();
DrawStatus_subnav();
DrawHelp_subnav();
DrawRebootButton();
</SCRIPT>
</div>						
</td>
<td id="maincontent_container">
<SCRIPT >
DrawRebootContent("wan");
</SCRIPT>
<div id="warnings_section" style="display:none">
<div class="section" >
<div class="section_head">
<h2><SCRIPT >ddw("txtConfigurationWarnings");</SCRIPT></h2>
<div style="display:block" id="warnings_section_content">
</div></div></div></div> <!-- warnings_section -->
<div id="maincontent" style="display: block">
<!-- InstanceBeginEditable name="Main Content" -->
<form name="mainform" action="/formSetPortTr.htm" method="post" enctype="application/x-www-form-urlencoded" id="mainform">
<input type="hidden" id="settingsChanged" name="settingsChanged" value="0"/>
<input type="hidden" id="curTime" name="curTime" value="<% getInfo("currTimeSec");%>"/>
<input type="hidden" id="HNAP_AUTH" name="HNAP_AUTH" value=""/>
<input type="hidden" value="/Advanced/Special_Applications.asp" name="submit-url">
<div class="section">
<div class="section_head"> 
<h2><SCRIPT >ddw("txtApplicationRules");</SCRIPT></h2>
<p><SCRIPT >ddw("txtSpecialAppStr4");</SCRIPT></p>
<SCRIPT language=javascript>DrawSaveButton();</SCRIPT>
</div>
<div class="box"> 
<h3>24--<SCRIPT >ddw("txtApplicationRules");</SCRIPT></h3>
<table border="0" cellpadding="0" cellspacing="1" class="formlisting" id="adv_specialapps_ruleslist" summary="">
	
<SCRIPT >ddw("txtRemainRulesCanbeCreated");</SCRIPT>
 : <font color=red>
<%getIndexInfo("reamin_specialApp_num");%> 	
</font>
<br><br>

<tr class="form_label_row">
<th class="formlist_col1" rowspan="1" colspan="1">&nbsp;</th>
<th class="formlist_col2" rowspan="1" colspan="1">&nbsp;</th>
<th class="formlist_col3" rowspan="1" colspan="1">&nbsp;</th>
<th class="formlist_col4" rowspan="1" colspan="1"><SCRIPT >ddw("txtPort");</SCRIPT></th>
<th class="formlist_col5" rowspan="1" colspan="1"><SCRIPT >ddw("txtCommunicationTyp");</SCRIPT></th>											
<!-- keith remove
<th class="formlist_col6" rowspan="1" colspan="1">
<SCRIPT >ddw("txtSchedules");</SCRIPT>
</th>
-->
</tr>
<SCRIPT >specialApplicationList(MAXNUM_TRIGPORT);</SCRIPT>
</table></div></div></form>
<SCRIPT language=javascript>DrawSaveButton_Btm();</SCRIPT>
</div></td>
<td id="sidehelp_container">
<div id="help_text">
<strong><SCRIPT >ddw("txtHelpfulHints");</SCRIPT>...</strong>
<p><SCRIPT >ddw("txtSpecialAppStr2");</SCRIPT></p>

<p class="more">
<a href="../Help/Advanced.asp#Special_Applications" onclick="return jump_if();">
<SCRIPT >ddw("txtMore");</SCRIPT>...</a>	
</p></div></td></tr></table>
<table id="footer_container" border="0" cellspacing="0" summary="">
<tr><td><img src="../Images/img_wireless_bottom.gif" width="114" height="35" alt="" />
</td><td>&nbsp;</td></tr></table></td></tr></table>
<SCRIPT language=javascript>print_copyright();</SCRIPT>
</div></body></html>
