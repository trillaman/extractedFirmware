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

var MAXNUM_URLFILTER = "<% getInfo("maxUrlFltNum");%>"*1;
var schedule_options = [
    <%virSevSchRuleList();%>
];

function get_webserver_ssi_uri() {
return ("" !== "") ? "/Basic/Setup.asp" : "/Advanced/URL_Filter.asp";
}

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

function on_timeout(dataInstance)
{
/* we really need this so keep trying! */
dataInstance.retrieveData();
}

var mf;

var verify_failed = '<%getInfo("err_msg")%>';

function disable_url_filter_table(val)
{
var url_table_size = MAXNUM_URLFILTER;
for (var i = 0; i < url_table_size; i++)
{
mf["url_addr_" + i].disabled = val;
}
}

function filtering_mode_selector(val)
{
switch(val) {
case "0":
mf["url_filter_mode"].value = 0;
disable_url_filter_table(true);
break;

case "1":
mf["url_filter_mode"].value = 1;
disable_url_filter_table(false);
break;

case "2":
mf["url_filter_mode"].value = 2;
disable_url_filter_table(false);
break;
}
}

function set_filtering_mode()
{
if (mf["url_filter_mode"].value == 0) {
mf["mode"].value = "0";
disable_url_filter_table(true);
return;
}

if (mf["url_filter_mode"].value == 1) {
mf["mode"].value = "1";
return;
}

if (mf["url_filter_mode"].value == 2) {
mf["mode"].value = "2";
return;
}
}

function clear_url(i)
{
mf["url_addr_" + i].value = "";
}

function url_enabled_selector(index, value)
{
if(value==true)
mf["enabled_" + index].value = "1";
else
mf["enabled_" + index].value = "0";

mf["url_enabled_" + index].checked = value;
mf["used_" + index].value = value ? "1" : "0";
}

function set_url_addresses()
{
var val = MAXNUM_URLFILTER;
for (i = 0; i < val; i++) {
if(mf["url_addr_" + i].value == "http://") {
mf["url_addr_" + i].value = "";
}
}
}
function verify_url(urlValue, urlObj)
{
var strRegex = "^((https|http)?:\/\/)"
            + "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?"
            + "(([0-9]{1,3}\\.){3}[0-9]{1,3}|"
            + "([0-9a-z_!~*'()-]+\\.)*"
            + "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\\."
            + "[a-z]{2,6})"
            + "(:[0-9]{1,4})?"
            + "((\/?)|(\/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+\/?)$";
var re=new RegExp(strRegex);

if(re.test(urlValue))
{
urlObj.value = urlValue;
}
else
{
urlObj.value = "";
return false;
}
return true;
}
function validate_url_addresses()
{
var val = MAXNUM_URLFILTER;
var url_value;
for(i = 0; i < val; i++)
 {
    url = mf["url_addr_" + i].value;
    url= trim_string(url);
    if(mf["url_enabled_" + i].checked==true)
    {
        mf["url_enabled_" + i].value = 1;
    }
    else
    {
        mf["url_enabled_" + i].value = 0;
        mf["url_"+i].value = mf["url_addr_" + i].value;
        continue;
    }

    if(url == "") 
    {
        mf["used_" + i].value = 0;
        mf["enabled_" + i].value = false;
        alert (sw("txtInvalidURLAddress"));
        mf["url_addr_" + i].select();
        mf["url_addr_" + i].focus();
        return false;
    }

    if(!verify_url(url, mf["url_addr_" + i]))
    {
        mf["used_" + i].value = 0;
        mf["enabled_" + i].value = false;
        alert (sw("txtInvalidURLAddress") + " "+url + ".");
        mf["url_addr_" + i].select();
        mf["url_addr_" + i].focus();
        return false;
    }

    mf["used_" + i].value = 1;
    mf["enabled_" + i].value = true;

    if(mf["url_filter_mode"].value != 0)
    {
        var url = mf["url_addr_" + i].value;
        if(url == "")
            continue;
        for(var j=0;j<MAXNUM_URLFILTER;j++)
        {
            if(i==j || mf["url_addr_" + j].value == "")
                continue;

            if(url == mf["url_addr_" + j].value)
            {
                alert(sw("txtURLAddress")+" "+sw("txtIsAlreadyUsed")+":"+url);
                return false;
            }
        }
    }

    mf["url_"+i].value = mf["url_addr_" + i].value;
 }

    if(mf["url_filter_mode"].value == 2)
    {
        for(var j=0;j<MAXNUM_URLFILTER;j++)
        {
            if(mf["enabled_" + j].value == "true")
                break;
        }
        if(j == MAXNUM_URLFILTER)
        {
            alert(sw("txtInvalidURLFilterSettings"));
            return false;
        }
    }

    return true;
}

function page_submit()
{
    mf.curTime.value = new Date().getTime();
    
    var PrivateKey = sessionStorage.getItem('PrivateKey');
    var current_time = Math.floor(mf.curTime.value / 1000) % 2000000000;
    var auth = hex_hmac_md5(PrivateKey, current_time.toString()+"/Advanced/URL_Filter.asp");
    auth = auth.toUpperCase();
    mf.HNAP_AUTH.value = auth + " " + current_time;

    if(!is_form_modified("mainform"))  //nothing changed
    {
        if (!confirm(sw("txtSaveAnyway")))
            return false;
    }
    else
    {
        if(!validate_url_addresses())
        {
            return false;
        }
        else
            mf["settingsChanged"].value = 1;
    }

    mf.submit();
}

function page_load()
{
mf = document.forms.mainform;

displayOnloadPage("<%getInfo("ok_msg")%>");

mf = document.forms["mainform"];

set_url_addresses();

for(var index = 0; index < MAXNUM_URLFILTER; index++)
{
url_enabled_selector(index, mf["enabled_" + index].value == "1");
schedule_populate_select(mf["schedule_" + index]);
mf["schedule_" + index].value = mf["sched_name_" + index].value;
}

/* Check for validation errors. */
if(verify_failed != "") 
{
set_form_always_modified("mainform");
alert(verify_failed);
}

set_filtering_mode();
set_form_default_values("mainform");
}

function init()
{
var DOC_Title= sw("txtTitle")+" : "+sw("txtAdvanced")+'/'+sw("txtURLFilter");
document.title = DOC_Title;
get_by_id("RestartNow").value = sw("txtRebootNow");
get_by_id("RestartLater").value = sw("txtRebootLater");
get_by_id("DontSaveSettings").value = sw("txtDontSaveSettings");
get_by_id("SaveSettings").value = sw("txtSaveSettings");
get_by_id("DontSaveSettings_Btm").value = sw("txtDontSaveSettings");
get_by_id("SaveSettings_Btm").value = sw("txtSaveSettings");
for (var i = 0; i < MAXNUM_URLFILTER; i++)
{
    get_by_id("schedule_btn_"+i).value = sw("txtAddNew");
}
}

var token= new Array(MAXNUM_URLFILTER);
var DataArray = new Array();

function URLFilteringRulesList(num)
{
token[0]="<% urlFilter_List("urlFtrList_1");%>";
token[1]="<% urlFilter_List("urlFtrList_2");%>";
token[2]="<% urlFilter_List("urlFtrList_3");%>";
token[3]="<% urlFilter_List("urlFtrList_4");%>";
token[4]="<% urlFilter_List("urlFtrList_5");%>";
token[5]="<% urlFilter_List("urlFtrList_6");%>";
token[6]="<% urlFilter_List("urlFtrList_7");%>";
token[7]="<% urlFilter_List("urlFtrList_8");%>";
token[8]="<% urlFilter_List("urlFtrList_9");%>";
token[9]="<% urlFilter_List("urlFtrList_10");%>";
token[10]="<% urlFilter_List("urlFtrList_11");%>";
token[11]="<% urlFilter_List("urlFtrList_12");%>";
token[12]="<% urlFilter_List("urlFtrList_13");%>";
token[13]="<% urlFilter_List("urlFtrList_14");%>";
token[14]="<% urlFilter_List("urlFtrList_15");%>";
token[15]="<% urlFilter_List("urlFtrList_16");%>";
token[16]="<% urlFilter_List("urlFtrList_17");%>";
token[17]="<% urlFilter_List("urlFtrList_18");%>";
token[18]="<% urlFilter_List("urlFtrList_19");%>";
token[19]="<% urlFilter_List("urlFtrList_20");%>";
token[20]="<% urlFilter_List("urlFtrList_21");%>";
token[21]="<% urlFilter_List("urlFtrList_22");%>";
token[22]="<% urlFilter_List("urlFtrList_23");%>";
token[23]="<% urlFilter_List("urlFtrList_24");%>";

for(var i = 0; i < num; i++)
{
DataArray = token[i].split("<devide>");

document.write("<tr>");
document.write("<td rowspan=\"1\" colspan=\"1\">");
document.write("<input type=\"hidden\" name=\"index\" value=\""+(i+1)+"\" />");
document.write("<input type=\"checkbox\" id=\"url_enabled_"+i+"\" onclick=\"url_enabled_selector(&quot;"+i+"&quot;, this.checked );\" />");
document.write("<input type=\"hidden\" id=\"used_"+i+"\" name=\"used_"+i+"\" value=\""+DataArray[0]+"\" />");
document.write("<input type=\"hidden\" id=\"enabled_"+i+"\" name=\"enabled_"+i+"\" value=\""+DataArray[0]+"\" />");
document.write("</td>");
document.write("<td rowspan=\"1\" colspan=\"1\">");
document.write("<input type=\"hidden\" id=\"url_"+i+"\" name=\"url_"+i+"\" value=\"\" />");
document.write("<input type=\"text\" size=\"32\" maxlength=\"63\" id=\"url_addr_"+i+"\" name=\"url_addr_"+i+"\" value=\""+DataArray[1]+"\"/>");
document.write("</td>");

document.write("<input type=\"hidden\" id=\"sched_name_"+i+"\" name=\"sched_name_"+i+"\" value=\""+DataArray[2]+"\" />");
document.write("<td align=middle style=\"DISPLAY: none\"><select id=\"schedule_"+i+"\" style=\"width:100px;\" onChange=\"sched_name_selector(&quot;"+i+"&quot;, this.value);\">");
document.write("</select>&nbsp;&nbsp;");
document.write("<input type=\"button\" id=\"schedule_btn_"+i+"\" value=\"\" onclick=\"do_add_new_schedule()\">");

document.write("</tr>");
}
}

function sched_name_selector(index, value)
{
mf["sched_name_"+index].value = value;
mf["schedule_"+index].value = value;
}

function do_add_new_schedule()
{
    top.location = "../Tools/Schedules.asp";
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
<h2>
<SCRIPT >ddw("txtConfigurationWarnings");</SCRIPT>
</h2>
<div style="display:block" id="warnings_section_content">
</div><!-- box warnings_section_content -->
</div>
</div>
</div> <!-- warnings_section -->
<div id="maincontent" style="display: block">
<form name="mainform" action="/formURLFilter.htm" method="post" enctype="application/x-www-form-urlencoded" id="mainform">
<input type="hidden" id="settingsChanged" name="settingsChanged" value="0"/>
<input type="hidden" id="curTime" name="curTime" value="<% getInfo("currTimeSec");%>"/>
<input type="hidden" id="HNAP_AUTH" name="HNAP_AUTH" value=""/>
<input type="hidden" value="/Advanced/URL_Filter.asp" name="submit-url">
<input type="hidden" id="wifisc_enable" name="config.wifisc.enabled" value="<%getIndexInfo("wsc_enabled");%>"/>
<div class="section">
<div class="section_head">
<h2>
<SCRIPT >ddw("txtURLFilter");</SCRIPT>
</h2>
<p>
<SCRIPT >ddw("txtUrlFilterStr1");</SCRIPT>
</p>
<SCRIPT language=javascript>DrawSaveButton();</SCRIPT>
</div>
<div class="box">
<h3>
24
--
<SCRIPT >ddw("txtURLFilterRules");</SCRIPT>
</h3>
<table summary="">
<tr>
<td rowspan="1" colspan="1">
<SCRIPT >ddw("txtConfigureURLFiltering");</SCRIPT>:
</td>
</tr>
<tr>
<td rowspan="1" colspan="1">
<input type="hidden" id="url_filter_mode" name="urlFltMode" value="<% getInfo("urlFltMode");%>" />

<select name="mode" onchange="filtering_mode_selector(this.value)" style="width: 280px;">
<option value="0">
<SCRIPT >ddw("txtTurnURLFilteringOFF");</SCRIPT>
</option>
<option value="2">
<SCRIPT >ddw("txtURLFilterStr2");</SCRIPT>
</option>
<option value="1">
<SCRIPT >ddw("txtURLFilterStr3");</SCRIPT>
</option>
</select>
</td>
</tr>
</table>
<p id="select_url_container" style="display:none"> </p>
<table border="0" cellpadding="0" cellspacing="1" class="formlisting">

<SCRIPT >ddw("txtRemainRulesCanbeCreated");</SCRIPT>
 : <font color=red>
<%getIndexInfo("reamin_urlflt_num");%>
</font>
<br><br>

<tr class="form_label_row">
<td class="formlist_col1" rowspan="1" colspan="1">&nbsp;</td>
<td class="formlist_col2" rowspan="1" colspan="1">
<SCRIPT >ddw("txtURLAddress");</SCRIPT>
</td>
</tr>
<SCRIPT >URLFilteringRulesList(MAXNUM_URLFILTER);</SCRIPT>
</table>
</div>
</div>
</form>

<SCRIPT language=javascript>DrawSaveButton_Btm();</SCRIPT>

</div>
</td>
<td id="sidehelp_container">
<div id="help_text">
<strong>
<SCRIPT >ddw("txtHelpfulHints");</SCRIPT>
...</strong>
<p><SCRIPT >ddw("txtUrlFilterStr4");</SCRIPT></p>
<p><SCRIPT >ddw("txtUrlFilterStr5");</SCRIPT></p>
<!--
<p><SCRIPT >ddw("txtUrlFilterStr6");</SCRIPT></p>
-->
<p class="more">
<a href="../Help/Advanced.asp#URL_Filter" onclick="return jump_if();">
<SCRIPT >ddw("txtMore");</SCRIPT>...
</a></p></div></td></tr></table>
<table id="footer_container" border="0" cellspacing="0" summary="">
<tr><td><img src="../Images/img_wireless_bottom.gif" width="114" height="35" alt="" /></td><td>&nbsp;</td>
</tr></table></td></tr></table>
<SCRIPT language=javascript>print_copyright();</SCRIPT>
</div><!-- outside -->
</body></html>
