<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Advanced Wireless Settings</TITLE>
<% no_cache(); %>
<% charset(); %>
<% web_include_file("filelink.asp"); %>

<SCRIPT language=JavaScript>
re1 = /<br>/gi;
str = wlantopmenu.advwireless.replace(re1, " ");
document.title = str;
var win_options = 'alwaysRaised,resizable,scrollbars,width=660,height=460' ;

var wl_filter_win = null;
var EN_DIS =  '<% nvram_get("wl_macmode"); %>'

function to_submit(F)
{
        F.submit_button.value = "Wireless_Advanced";
        F.gui_action.value = "Apply";
        F.submit();
}
function SelWME(num,F)
{
	wme_enable_disable(F,num);
}
function wme_enable_disable(F,I)
{
	var start = '';
	var end = '';
	var total = F.elements.length;
	for(i=0 ; i < total ; i++){
                if(F.elements[i].name == "wl_wme_no_ack")  start = i;
                if(F.elements[i].name == "wl_wme_sta_vo5")  end = i;
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
function auth_enable_disable(F,I)
{
	if(I == "wep" || I == "radius" || I == "disabled") 
                        choose_enable(F.wl_auth);
	else
                        choose_disable(F.wl_auth);
}
function init()
{
	init_form_session_key(document.forms[0], "apply.cgi");
	wme_enable_disable(document.wireless, '<% nvram_get("wl_wme"); %>');
	auth_enable_disable(document.wireless, '<% nvram_get("security_mode"); %>');
}

</SCRIPT>

</HEAD>
<BODY onload=init()>
<DIV align=center>
<FORM method=<% get_http_method(); %> name=wireless action=apply.cgi>
<input type=hidden name=submit_button>
<input type=hidden name=change_action>
<input type=hidden name=gui_action>

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>
  <TBODY>
  <TR bgColor=black>
    <TD style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" borderColor=#e7e7e7 width=163 bgColor=#e7e7e7 height=1><IMG height=15 src="image/UI_03.gif" width=164 border=0></TD>
    <TD style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" width=646 height=1><IMG height=15 src="image/UI_02.gif" width=645 border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 height=23 cellSpacing=0 cellPadding=0 width=809 border=0><TBODY>
  <TR>
    <TD width=633>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>

        <TR>
          <TD width=156 bgColor=#5b5b5b height=25>
		<P align=right><b><font face="Arial" color="#FFFFFF" style="font-size: 9pt"><script>Capture(wlanleftmenu.advwireless)</script></font></b></P>
          </TD>
          <TD width=8 height=25 bgColor=#5b5b5b>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><script>Capture(hwlad2.authtyp)</script>:&nbsp;</TD>
          <TD width=296 height=25><SELECT name="wl_auth"> 
    <option value="0" <% nvram_selmatch("wl_auth", "0", "selected"); %>><script>Capture(share.auto)</script></option>
    <option value="1" <% nvram_selmatch("wl_auth", "1", "selected"); %>><script>Capture(wlansec.sharekey)</script></option>
    </SELECT>&nbsp;&nbsp;<script>Capture(wlanadv.deftransrate)</script></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><script>Capture(hwlad2.basrate)</script>:&nbsp;</TD>
          <TD width=296 height=25><SELECT  name="wl_rateset"> 
     		 <OPTION value="12" <% nvram_selmatch("wl_rateset", "12", "selected"); %>>1-2 Mbps&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</OPTION> 
      		 <OPTION value="default" <% nvram_selmatch("wl_rateset", "default", "selected"); %>><script>Capture(hwlad2.def)</script></OPTION>  
        	 <OPTION value="all" <% nvram_selmatch("wl_rateset", "all", "selected"); %>><script>Capture(hwlad2.all)</script></OPTION>
    		</SELECT>&nbsp;&nbsp;<script>Capture(hwlad2.defdef)</script></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><script>Capture(wlanadv.transrate)</script>:&nbsp; </font></TD>
          <TD width=296 height=25>
                
      <SELECT name="wl_rate"> 
      	<OPTION value="1000000" <% nvram_selmatch("wl_rate", "1000000", "selected"); %>>1 Mbps</OPTION> 
	<OPTION value="2000000" <% nvram_selmatch("wl_rate", "2000000", "selected"); %>>2 Mbps</OPTION> 
	<OPTION value="5500000" <% nvram_selmatch("wl_rate", "5500000", "selected"); %>><% nvram_else_match("language","DE","5,5", "5.5"); %> Mbps</OPTION> 
        <OPTION value="6000000" <% nvram_selmatch("wl_rate", "6000000", "selected"); %>>6 Mbps</OPTION>
        <OPTION value="9000000" <% nvram_selmatch("wl_rate", "9000000", "selected"); %>>9 Mbps</OPTION>
        <OPTION value="11000000" <% nvram_selmatch("wl_rate", "11000000", "selected"); %>>11 Mbps</OPTION>
        <OPTION value="12000000" <% nvram_selmatch("wl_rate", "12000000", "selected"); %>>12 Mbps</OPTION>
        <OPTION value="18000000" <% nvram_selmatch("wl_rate", "18000000", "selected"); %>>18 Mbps</OPTION>
        <OPTION value="24000000" <% nvram_selmatch("wl_rate", "24000000", "selected"); %>>24 Mbps</OPTION>
        <OPTION value="36000000" <% nvram_selmatch("wl_rate", "36000000", "selected"); %>>36 Mbps</OPTION>
        <OPTION value="48000000" <% nvram_selmatch("wl_rate", "48000000", "selected"); %>>48 Mbps</OPTION>
        <OPTION value="54000000" <% nvram_selmatch("wl_rate", "54000000", "selected"); %>>54 Mbps</OPTION>
        <OPTION value="0" <% nvram_selmatch("wl_rate", "0", "selected"); %>><script>Capture(share.auto)</script>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</OPTION>
    </SELECT>&nbsp;&nbsp;<script>Capture(wlanadv.deftransrate)</script></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
         <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><script>Capture(wlanadv.protectmode)</script>:&nbsp;</TD>
          <TD width=296 height=25>
          <SELECT name="wl_gmode_protection"> 
    <option value="off" <% nvram_selmatch("wl_gmode_protection", "off", "selected"); %>><script>Capture(share.disable)</script>&nbsp;&nbsp;&nbsp;</option>
    <option value="auto" <% nvram_selmatch("wl_gmode_protection", "auto", "selected"); %>><script>Capture(share.auto)</script></option>
    </SELECT>&nbsp;&nbsp;(<script>Capture(hwlad2.def)</script>:&nbsp;<% support_elsematch("SPEED_BOOSTER_SUPPORT", "1", "<script>Capture(share.disable)</script>", "<script>Capture(share.disable)</script>"); %>)</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>   
         <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><span ><script>Capture(hwlad2.fburst)</script></span>:&nbsp;</span></TD>
          <TD width=296 height=25>
          <SELECT name="wl_frameburst"> 
    <option value="off" <% nvram_selmatch("wl_frameburst", "off", "selected"); %>><script>Capture(share.disable)</script>&nbsp;&nbsp;&nbsp;</option>
    <option value="on" <% nvram_selmatch("wl_frameburst", "on", "selected"); %>><script>Capture(share.enable)</script></option>
    </SELECT>&nbsp;&nbsp;(<script>Capture(hwlad2.def)</script>:&nbsp;<% support_elsematch("SPEED_BOOSTER_SUPPORT", "1", "<script>Capture(share.enable)</script>", "<script>Capture(share.disable)</script>"); %>)</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><script>Capture(wlanadv.beacon)</script>:&nbsp;</TD>
          <TD width=296 height=25><INPUT maxLength=5 onBlur=valid_range(this,20,1000,"Beacon%20Interval") size=6 value='<% nvram_selget("wl_bcn"); %>' name="wl_bcn">&nbsp;&nbsp;(<script>Capture(hwlad2.def)</script>:&nbsp;100, <script>Capture(hwlad2.milli)</script>, <script>Capture(hwlad2.range)</script>&nbsp;:&nbsp;20 - 1000)</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><script>Capture(wlanadv.dtim)</script>:&nbsp;</TD>
          <TD width=296 height=25><INPUT maxLength=3 onBlur=valid_range(this,1,255,"DTIM%20Interval") size=6 value='<% nvram_selget("wl_dtim"); %>' name="wl_dtim">&nbsp;&nbsp;(<script>Capture(hwlad2.def)</script>:&nbsp;<% get_wl_value("default_dtim"); %>, <script>Capture(hwlad2.range)</script>&nbsp;:&nbsp;1 - 255)</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><script>Capture(hwlad2.frathrh)</script>:&nbsp;</TD>
          <TD width=296 height=25><INPUT maxLength=4 onBlur=valid_range(this,256,2346,"Fragmentation%20Threshold") size=6 value='<% nvram_selget("wl_frag"); %>' name="wl_frag">&nbsp;&nbsp;(<script>Capture(hwlad2.def)</script>:&nbsp;2346, <script>Capture(hwlad2.range)</script>&nbsp;:&nbsp;256 - 2346)</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>       
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><script>Capture(wlanadv.rts)</script>:&nbsp;</TD>
          <TD width=296 height=25><INPUT maxLength=4 onBlur=valid_range(this,0,2347,"RTS%20Threshold") size=6 value='<% nvram_selget("wl_rts"); %>' name="wl_rts">&nbsp;&nbsp;(<script>Capture(hwlad2.def)</script>:&nbsp;2347, <script>Capture(hwlad2.range)</script>&nbsp;:&nbsp;0 - 2347)</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>    
         <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><span ><script>Capture(hwlad2.apiso)</script></span>:&nbsp;</span></TD>
          <TD width=296 height=25>
          <SELECT name="wl_ap_isolate"> 
    <option value="0" <% nvram_selmatch("wl_ap_isolate", "0", "selected"); %>><script>Capture(hwlad2.off)</script>&nbsp;&nbsp;&nbsp;</option>
    <option value="1" <% nvram_selmatch("wl_ap_isolate", "1", "selected"); %>><script>Capture(hwlad2.on)</script></option>
    </SELECT>&nbsp;&nbsp;(<script>Capture(hwlad2.def)</script>:&nbsp;<script>Capture(hwlad2.off)</script>)</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<% support_invmatch("SES_SUPPORT", "1", "<!--"); %>
         <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><span ><script>Capture(ses.ses)</script></span>:&nbsp;</span></TD>
          <TD width=296 height=25>
          <SELECT name="ses_enable"> 
    <option value="0" <% nvram_selmatch("ses_enable", "0", "selected"); %>><script>Capture(share.disabled)</script>&nbsp;&nbsp;&nbsp;</option>
    <option value="1" <% nvram_selmatch("ses_enable", "1", "selected"); %>><script>Capture(share.enabled)</script></option>
    </SELECT>&nbsp;&nbsp;(<script>Capture(hwlad2.def)</script>:&nbsp;<script>Capture(share.enabled)</script>)</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
<% support_invmatch("SES_SUPPORT", "1", "-->"); %>
         <!--TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD colSpan=3 height=25>&nbsp;</TD>
          <TD width=101 height=25><span >Preabmle</span>:</TD>
          <TD width=296 height=25>
          <SELECT name="wl_plcphdr"> 
    <option value="long" <% nvram_selmatch("wl_plcphdr", "long", "selected"); %>>long&nbsp;</option>
    <option value="short" <% nvram_selmatch("wl_plcphdr", "short", "selected"); %>>short</option>
    </SELECT>&nbsp;&nbsp;(Default: long)</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR-->

<% support_invmatch("GOOGLE_SUPPORT", "1", "<!--"); %>
          <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><span><script>Capture(gsa.titlestring)</script> :&nbsp;</span></TD>
	<TD width=296 height=25>
	<SELECT name="google_enable">
	<option value="0" <% nvram_selmatch("google_enable", "0", "selected"); %>><script>Capture(share.disable)</script></option>
	<option value="1" <% nvram_selmatch("google_enable", "1", "selected"); %>><script>Capture(share.enable)</script></option>
	</SELECT>
	&nbsp;&nbsp;(<script>Capture(hwlad2.def)</script>&nbsp;:&nbsp;<script>Capture(share.disable)</script>)</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

<% support_invmatch("GOOGLE_SUPPORT", "1", "-->"); %>


<!--  Wireless QoS is move to QoS.asp?session_id=<% nvram_get("session_key"); %>

        <TR>
          <TD width=156 bgColor=#5b5b5b height=25>
		<P align=right><b><font face="Arial" color="#FFFFFF" style="font-size: 9pt">Wireless QoS</font></b></P>
          </TD>
          <TD width=8 height=25 bgColor=#5b5b5b>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>WME Support:</TD>
          <TD width=296 height=25><SELECT name="wl_wme" onChange=SelWME(this.form.wl_wme.selectedIndex,this.form)> 
    <option value="off" <% nvram_selmatch("wl_wme", "off", "selected"); %>>Off</option>
    <option value="on" <% nvram_selmatch("wl_wme", "on", "selected"); %>>On</option>
    </SELECT>&nbsp;&nbsp;(Default: Off)</TD></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>No-Acknowledgement:</TD>
          <TD width=296 height=25><SELECT name="wl_wme_no_ack"> 
    <option value="off" <% nvram_selmatch("wl_wme_no_ack", "off", "selected"); %>>Off</option>
    <option value="on" <% nvram_selmatch("wl_wme_no_ack", "on", "selected"); %>>On</option>
    </SELECT>&nbsp;&nbsp;(Default: Off)</TD></TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25 align=right>EDCA AP Parameters:</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>&nbsp;</TD>
          <TD width=296 height=25>CWmin&nbsp;&nbsp;CWmax&nbsp;&nbsp;&nbsp;AIFSN&nbsp;&nbsp;TXOP(b)&nbsp;&nbsp;TXOP(a/g)&nbsp;Admin Forced</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>AC_BK:</TD>
          <TD width=296 height=25><input type="hidden" name="wl_wme_ap_bk" value="5">
	  <input class=num name="wl_wme_ap_bk0" value="<% nvram_list("wl_wme_ap_bk", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_ap_bk1" value="<% nvram_list("wl_wme_ap_bk", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_ap_bk2" value="<% nvram_list("wl_wme_ap_bk", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_ap_bk3" value="<% nvram_list("wl_wme_ap_bk", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_ap_bk4" value="<% nvram_list("wl_wme_ap_bk", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_ap_bk5">
            <option value="off" <% wme_match_op("wl_wme_ap_bk", "off", "selected"); %>>Off</option>
            <option value="on" <% wme_match_op("wl_wme_ap_bk", "on", "selected"); %>>On</option>
          </select>
</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>AC_BE:</TD>
          <TD width=296 height=25><input type="hidden" name="wl_wme_ap_be" value="5">
	  <input class=num name="wl_wme_ap_be0" value="<% nvram_list("wl_wme_ap_be", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_ap_be1" value="<% nvram_list("wl_wme_ap_be", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_ap_be2" value="<% nvram_list("wl_wme_ap_be", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_ap_be3" value="<% nvram_list("wl_wme_ap_be", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_ap_be4" value="<% nvram_list("wl_wme_ap_be", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_ap_be5">
            <option value="off" <% wme_match_op("wl_wme_ap_be", "off", "selected"); %>>Off</option>
            <option value="on" <% wme_match_op("wl_wme_ap_be", "on", "selected"); %>>On</option>
          </select>
</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>AC_VI:</TD>
          <TD width=296 height=25><input type="hidden" name="wl_wme_ap_vi" value="5">
	  <input class=num name="wl_wme_ap_vi0" value="<% nvram_list("wl_wme_ap_vi", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_ap_vi1" value="<% nvram_list("wl_wme_ap_vi", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_ap_vi2" value="<% nvram_list("wl_wme_ap_vi", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_ap_vi3" value="<% nvram_list("wl_wme_ap_vi", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_ap_vi4" value="<% nvram_list("wl_wme_ap_vi", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_ap_vi5">
            <option value="off" <% wme_match_op("wl_wme_ap_vi", "off", "selected"); %>>Off</option>
            <option value="on" <% wme_match_op("wl_wme_ap_vi", "on", "selected"); %>>On</option>
          </select>
</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>AC_VO:</TD>
          <TD width=296 height=25><input type="hidden" name="wl_wme_ap_vo" value="5">
	  <input class=num name="wl_wme_ap_vo0" value="<% nvram_list("wl_wme_ap_vo", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_ap_vo1" value="<% nvram_list("wl_wme_ap_vo", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_ap_vo2" value="<% nvram_list("wl_wme_ap_vo", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_ap_vo3" value="<% nvram_list("wl_wme_ap_vo", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_ap_vo4" value="<% nvram_list("wl_wme_ap_vo", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_ap_vo5">
            <option value="off" <% wme_match_op("wl_wme_ap_vo", "off", "selected"); %>>Off</option>
            <option value="on" <% wme_match_op("wl_wme_ap_vo", "on", "selected"); %>>On</option>
          </select>
</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25 align=right>EDCA STA Parameters:</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>&nbsp;</TD>
          <TD width=296 height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>AC_BK:</TD>
          <TD width=296 height=25><input type="hidden" name="wl_wme_sta_bk" value="5">
	  <input class=num name="wl_wme_sta_bk0" value="<% nvram_list("wl_wme_sta_bk", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_sta_bk1" value="<% nvram_list("wl_wme_sta_bk", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_sta_bk2" value="<% nvram_list("wl_wme_sta_bk", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_sta_bk3" value="<% nvram_list("wl_wme_sta_bk", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_sta_bk4" value="<% nvram_list("wl_wme_sta_bk", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_sta_bk5">
            <option value="off" <% wme_match_op("wl_wme_sta_bk", "off", "selected"); %>>Off</option>
            <option value="on" <% wme_match_op("wl_wme_sta_bk", "on", "selected"); %>>On</option>
          </select>
</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>AC_BE:</TD>
          <TD width=296 height=25><input type="hidden" name="wl_wme_sta_be" value="5">
	  <input class=num name="wl_wme_sta_be0" value="<% nvram_list("wl_wme_sta_be", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_sta_be1" value="<% nvram_list("wl_wme_sta_be", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_sta_be2" value="<% nvram_list("wl_wme_sta_be", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_sta_be3" value="<% nvram_list("wl_wme_sta_be", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_sta_be4" value="<% nvram_list("wl_wme_sta_be", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_sta_be5">
            <option value="off" <% wme_match_op("wl_wme_sta_be", "off", "selected"); %>>Off</option>
            <option value="on" <% wme_match_op("wl_wme_sta_be", "on", "selected"); %>>On</option>
          </select>
</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>AC_VI:</TD>
          <TD width=296 height=25><input type="hidden" name="wl_wme_sta_vi" value="5">
	  <input class=num name="wl_wme_sta_vi0" value="<% nvram_list("wl_wme_sta_vi", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_sta_vi1" value="<% nvram_list("wl_wme_sta_vi", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_sta_vi2" value="<% nvram_list("wl_wme_sta_vi", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_sta_vi3" value="<% nvram_list("wl_wme_sta_vi", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_sta_vi4" value="<% nvram_list("wl_wme_sta_vi", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_sta_vi5">
            <option value="off" <% wme_match_op("wl_wme_sta_vi", "off", "selected"); %>>Off</option>
            <option value="on" <% wme_match_op("wl_wme_sta_vi", "on", "selected"); %>>On</option>
          </select>
</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25>AC_VO:</TD>
          <TD width=296 height=25><input type="hidden" name="wl_wme_sta_vo" value="5">
	  <input class=num name="wl_wme_sta_vo0" value="<% nvram_list("wl_wme_sta_vo", 0); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmin")>
	  <input class=num name="wl_wme_sta_vo1" value="<% nvram_list("wl_wme_sta_vo", 1); %>" size="5" maxlength="6" onBlur=valid_range(this,0,32767,"AC%20CWmax")>
	  <input class=num name="wl_wme_sta_vo2" value="<% nvram_list("wl_wme_sta_vo", 2); %>" size="5" maxlength="6" onBlur=valid_range(this,1,15,"AC%20AIFSN")>
	  <input class=num name="wl_wme_sta_vo3" value="<% nvram_list("wl_wme_sta_vo", 3); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(b)")>
	  <input class=num name="wl_wme_sta_vo4" value="<% nvram_list("wl_wme_sta_vo", 4); %>" size="5" maxlength="6" onBlur=valid_range(this,0,65504,"AC%20TXOP(a/g)")>
				<select class=num name="wl_wme_sta_vo5">
            <option value="off" <% wme_match_op("wl_wme_sta_vo", "off", "selected"); %>>Off</option>
            <option value="on" <% wme_match_op("wl_wme_sta_vo", "on", "selected"); %>>On</option>
          </select>
</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>

-->

         <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=20 height=25>&nbsp;</TD>
          <TD width=125 height=25><script>Capture(wlanadv.lazywds)</script>:&nbsp;</TD>
          <TD width=296 height=25>
          <SELECT name="wl_lazywds"> 
    <option value="0" <% nvram_selmatch("wl_lazywds", "0", "selected"); %>><script>Capture(share.disable)</script>&nbsp;&nbsp;&nbsp;</option>
    <option value="1" <% nvram_selmatch("wl_lazywds", "1", "selected"); %>><script>Capture(share.enable)</script></option>
    </SELECT>&nbsp;&nbsp;(<script>Capture(hwlad2.def)</script>:&nbsp;<script>Capture(share.disable)</script>)</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>   
         <TR>
          <TD bgColor=#e7e7e7></TD>
          <TD background=image/UI_04.gif></TD>
          <TD></TD>
          <TD></TD>
          <TD></TD>
          <TD></TD>
          <TD background=image/UI_05.gif></TD>
         </TR>

        </TBODY></TABLE></TD>
    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF"><span style="font-family: Arial"><br>

<script>Capture(hwlad2.right1)</script><br>
<script language=javascript>
help_link("help/HWireless.asp");
Capture(share.more);
document.write("</a></b>");
</script>
<br>
</span></font>
          </TD>
          <TD width=9 bgColor=#2971b9 height=25>&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
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
<TABLE>
<TR>
<TD width=101 bgcolor=#175592 align=center height=20><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:to_submit(document.forms[0])"><script>Capture(sbutton.save)</script></A></font></TD>
		<TD width=8></TD>
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Wireless_Advanced.asp')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</FORM></DIV></BODY></HTML>
