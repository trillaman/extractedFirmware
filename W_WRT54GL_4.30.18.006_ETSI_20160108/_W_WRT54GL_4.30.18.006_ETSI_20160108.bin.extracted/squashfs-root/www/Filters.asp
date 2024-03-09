<% web_include_file("copyright.asp"); %>
<html><head><title>Internet Access</title>
<% no_cache(); %>
<% charset(); %>

<% web_include_file("filelink.asp"); %>

<Script Language="JavaScript">
document.title = secleftmenu.interaccess;
<% filter_init(); %>
var summary_win = null;
var ipmac_win = null;
function dayall(F){
	if(F.day_all.checked == false)
		I = 1;
	else
		I = 0;
	day_enable_disable(F,I);
}
function day_enable_disable(F,I){
        if(I == 1){
		choose_enable(F.week0);
		choose_enable(F.week1);
		choose_enable(F.week2);
		choose_enable(F.week3);
		choose_enable(F.week4);
		choose_enable(F.week5);
		choose_enable(F.week6);
	}
	else if(I == 0){
		choose_disable(F.week0);
		choose_disable(F.week1);
		choose_disable(F.week2);
		choose_disable(F.week3);
		choose_disable(F.week4);
		choose_disable(F.week5);
		choose_disable(F.week6);
	}
}
function timeall(F,I){
	time_enable_disable(F,I);
}
function time_enable_disable(F,I){
	if(I == 1){
		choose_enable(F.start_hour);
		choose_enable(F.start_min);
		choose_enable(F.start_time);
		choose_enable(F.end_hour);
		choose_enable(F.end_min);
		choose_enable(F.end_time);
	}
	else if(I == 0){
		choose_disable(F.start_hour);
		choose_disable(F.start_min);
		choose_disable(F.start_time);
		choose_disable(F.end_hour);
		choose_disable(F.end_min);
		choose_disable(F.end_time);
	}
}
function ViewSummary(){
	summary_win = do_open('FilterSummary.asp','FilterSummary','alwaysRaised,resizable,scrollbars,width=700,height=420');
	summary_win.focus();
}
function ViewFilter(){
	ipmac_win = do_open('FilterIPMAC.asp','FilterTable','alwaysRaised,resizable,scrollbars,width=670,height=500');
	ipmac_win.focus();
}
function to_submit(F)
{
	if(valid(F) == true){
		F.submit_type.value = "save";
  	     	F.submit_button.value = "Filters";
       		F.gui_action.value = "Apply";
       		F.submit();
	}
}
function to_save(F)
{
	if(valid(F) == true){
      	 	F.submit_button.value = "Filters";
       		F.change_action.value = "gozila_cgi";
		F.submit_type.value = "save";
       		F.gui_action.value = "Apply";
       		F.submit();
	}
}
function to_delete(F)
{
//      if(confirm("Delete the Policy?")){
        if(confirm(hfilter2.delpolicy)){
	   	F.submit_button.value = "Filters";
     		F.change_action.value = "gozila_cgi";
		F.submit_type.value = "delete";
	       	F.gui_action.value = "Apply";
       		F.submit();
	}
}
function valid(F)
{
	if(F.day_all.checked == false && F.week0.checked == false && F.week1.checked == false && F.week2.checked == false && F.week3.checked == false && F.week4.checked == false && F.week5.checked == false && F.week6.checked == false){
//              alert("You must at least select a day.");
                alert(errmsg.err3);
		return false;
	}
	if(F.time_all[1].checked == true){
		start = (parseInt(F.start_time.value, 10)*12 + parseInt(F.start_hour.value, 10)) * 60 + parseInt(F.start_min.value, 10);
		end = (parseInt(F.end_time.value, 10)*12 + parseInt(F.end_hour.value, 10)) * 60 + parseInt(F.end_min.value, 10);
		if(end <= start){
//                      alert("The end time must be bigger than start time!");
                        alert(errmsg.err4);
			return false;
		}
	}
	if(F.f_status1[1].checked == true)	// Disable
		F.f_status.value = "0";
	else {					// Enable
		if(F.f_status2[1].checked == true)	// Allow
			F.f_status.value = "2";
		else					// deny
			F.f_status.value = "1";	
	}
	return true;
}
function isascii1(I,M)
{
	for(i=0 ; i<I.value.length; i++){
		ch = I.value.charAt(i);
		if((ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z') || (ch >= '0' && ch <= '9') || ch == '-' || ch == '_'){
			//
		}
		else {
			alert(errmsg.err14+" [A - Z , a - z , 0 - 9 , - , _ ]");
			I.value = I.defaultValue;	
			return false;
		}
	}
	return true;
}
function valid_name1(I,M,flag)
{
	isascii1(I,M);

	var bbb = I.value.replace(/^\s*/,"");
        var ccc = bbb.replace(/\s*$/,"");

        I.value = ccc;

	if(flag & SPACE_NO){
		check_space(I,M);
	}

}
function SelFilter(num,F)
{
        F.submit_button.value = "Filters";
        F.change_action.value = "gozila_cgi";
        F.f_id.value=F.f_id.options[num].value;
        F.submit();
}
function exit()
{
	//closeWin(summary_win);
	closeWin(ipmac_win);
}
function init() 
{               
	init_form_session_key(document.forms[0], "apply.cgi");
	day_enable_disable(document.filters,'<% filter_tod_get("day_all_init"); %>');
	time_enable_disable(document.filters,'<% filter_tod_get("time_all_init"); %>');
	setBlockedServicesValue();
	Status(document.filters, '<% filter_policy_get("f_status","onload_status"); %>');
	choose_disable(document.filters.port0_start);
	choose_disable(document.filters.port0_end);
	choose_disable(document.filters.port1_start);
	choose_disable(document.filters.port1_end);
}

function service(id, name, port_start, port_end, protocol){
	this.id = id;
	this.name = name;
	this.start = port_start;
	this.end = port_end;
	this.protocol = protocol;
	this.deleted = false;
	this.modified = false;
}

services=new Array();
services_length=0;
/* Init. services data structure */
<% filter_port_services_get("all_list", "0"); %>

servport_name0 = "<% filter_port_services_get("service", "0"); %>";
servport_name1 = "<% filter_port_services_get("service", "1"); %>";
function search_service_index(name){
 var i;
        for(i=0 ; i<services_length ; i++){
                if(name == services[i].name){
                        return i;
                }
        }
        return -1;
}
function setBlockedServicesValue(){
var index;
	/* for service port 0 */
	index = search_service_index(servport_name0);
	if(index!=-1){
		document.filters.port0_start.value = services[index].start;
		document.filters.port0_end.value = services[index].end;
		document.filters.blocked_service0.selectedIndex = index+1; /* first will be none */
	}

	/* for service port 1 */
	index = search_service_index(servport_name1);
	if(index!=-1){
		document.filters.port1_start.value = services[index].start;
		document.filters.port1_end.value = services[index].end;
		document.filters.blocked_service1.selectedIndex = index+1; /* first will be none */
	}
}

function onChange_blockedServices(index, start, end){
	index--
	if(index == -1){
		start.value = '';
		end.value = '';
	}
	else{
		start.value = services[index].start;
		end.value = services[index].end;
	}
}
function Status(F,I){
	var start = '';
        var end = '';
        var total = F.elements.length;
        for(i=0 ; i < total ; i++){
                if(F.elements[i].name == "blocked_service0")  start = i;
                if(F.elements[i].name == "url5")  end = i;
        }
        if(start == '' || end == '')    return true;

        if(I == "deny" ) {
                for(i = start; i<=end ;i++)
                        choose_disable(F.elements[i]);
        }
        else {
                for(i = start; i<=end ;i++)
                        choose_enable(F.elements[i]);		
		choose_disable(document.filters.port0_start);
		choose_disable(document.filters.port0_end);
		choose_disable(document.filters.port1_start);
		choose_disable(document.filters.port1_end);
	}
}

</script>

</head>

<BODY onunload=exit() onload=init()>
<DIV align=center>
<FORM name=filters method=<% get_http_method(); %> action=apply.cgi>
<input type=hidden name=submit_button>
<input type=hidden name=change_action>
<input type=hidden name=submit_type>
<input type=hidden name=gui_action>
<input type=hidden name=blocked_service>
<input type=hidden name=filter_web>
<input type=hidden name=filter_policy>
<input type=hidden name=f_status>

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

   <TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>  
  <TR bgColor=black>
    <TD width=163 height=1 style="font-style: normal; font-variant: normal; font-weight: normal; font-size: 10pt; font-family: Arial, Helvetica, sans-serif; color: black" bgcolor="#E7E7E7" bordercolor="#E7E7E7">
			<img border="0" src="image/UI_03.gif" width="164" height="15"></TD>
    <TD width=646 height=1 style="font-style: normal; font-variant: normal; font-weight: normal; font-size: 10pt; font-family: Arial, Helvetica, sans-serif; color: black" bgcolor="#FFFFFF">
			<img border="0" src="image/UI_02.gif" width="645" height="15"></TD></TR>
  </TABLE>


  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber9" width="809" height="23">
    <tr><td width=633><table height=100% border="0" cellpadding="0" cellspacing="0">           
              <tr>
                <td width="156" height="25" bgcolor="#5b5b5b" colspan="3">
                <p align="right"><b>
                <font face="Arial" color="#FFFFFF" style="font-size: 9pt">
                <script>Capture(secleftmenu.interaccess)</script></font></b></td>
                <td width="8" height="25" bgcolor="#5b5b5b">&nbsp;</td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="101" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="296" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>
              
              <tr>
              	<td width="156" height="25" bgcolor="#E7E7E7" colspan=3>&nbsp;</td> 
              	<td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="13">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="101">
                <font style="font-size: 8pt"><script>Capture(share.policy)</script>:&nbsp;</font>
                </td>
                <td height="25" bgcolor="#FFFFFF" width="296">
      &nbsp;<SELECT name=f_id onChange=SelFilter(this.form.f_id.selectedIndex,this.form)> 
<% filter_policy_select(); %>
    </SELECT>&nbsp;

<script>document.write("<input type=button name=delete_button" + " value=\"" + sbutton.del + "\" onClick=to_delete(this.form)>");</script>&nbsp;
<script>document.write("<input type=button name=summary_button" + " value=\"" + share.summary + "\" onClick=ViewSummary()>");</script>&nbsp;

                </td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>
              
              <tr>
                <td width="156" height="1" bgcolor="#E7E7E7" colspan=3>&nbsp;</td>  
                <td width="8" height="1" background=image/UI_04.gif></td>
                <td colspan=6><table><tr>
                <td width="16" height="1" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="1" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="410" height="1" bgcolor="#FFFFFF" colspan="3">
                <hr color="#B5B5E6" size="1"></td>
                <td width="15" height="1" bgcolor="#FFFFFF">&nbsp;</td>
                </tr></table></td>
                <td width="15" height="1" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>
              
              <tr>
              	<td width="156" height="25" bgcolor="#E7E7E7" colspan=3>&nbsp;</td> 
              	<td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="13">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="101">
                <font style="font-size: 8pt"><script>Capture(bmenu.statu)</script>:&nbsp;</font>
                </td>
                <td height="25" bgcolor="#FFFFFF" width="296">
		<INPUT type=radio value=enable name=f_status1 <% filter_policy_get("f_status","enable"); %>><B><script>Capture(share.enable)</script></B>&nbsp;
		<INPUT type=radio value=disable name=f_status1 <% filter_policy_get("f_status","disable"); %>><B><script>Capture(share.disable)</script></B></td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>
              
              <tr>
              	<td width="156" height="25" bgcolor="#E7E7E7" colspan=3>&nbsp;</td> 
              	<td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="13">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="101"><script>Capture(filter.policyname)</script>:&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="296">&nbsp;<INPUT maxLength=30 size=22 name=f_name value='<% filter_policy_get("f_name",""); %>' onBlur=valid_name1(this,"")></td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>
              
              <!--tr>
              	<td width="156" height="25" bgcolor="#E7E7E7" colspan=3>&nbsp;</td> 
              	<td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="13">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="101">
                <font style="font-size: 8pt">Policy Type:</font>
                </td>
                <td height="25" bgcolor="#FFFFFF" width="296">
      &nbsp;<SELECT onchange=connectionType(this.value) name=Encapsulatoin style="font-family:Arial; font-size:9pt"> 
      		<OPTION value=0 >Internet Access</OPTION>
      		<OPTION value=1 >Inbound Traffic</OPTION>
    </SELECT>&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr-->
              
              
              
              <tr>
              	<td width="156" height="25" bgcolor="#E7E7E7" colspan=3>&nbsp;</td>  
              	<td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="13">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="101"><script>Capture(filter.pcs)</script>:&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="296">

<script>document.write("<input type=button name=vfilter_button" + " value=\"" + secbutton.editlist + "\" onClick=ViewFilter()>");</script>
                </td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>
              <tr>
                <td width="156" height="25" bgcolor="#E7E7E7" colspan=3>&nbsp;</td>
                <td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="101" height="25" bgcolor="#FFFFFF">
                <input type=radio <% filter_policy_get("f_status","deny"); %> name=f_status2 value=deny OnClick=Status(this.form,"deny")><script>Capture(filter.deny)</script> <br>
                <input type=radio <% filter_policy_get("f_status","allow"); %> name=f_status2 value=allow OnClick=Status(this.form,"allow")><script>Capture(filter.allow)</script> </td>
                <td width="296" height="25" bgcolor="#FFFFFF"><script>Capture(filter.dayandhr)</script></td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>
              
              <tr>
                <td width="156" height="25" bgcolor="#E7E7E7" colspan=3>&nbsp;</td>
                <td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="410" height="25" bgcolor="#FFFFFF" colspan="3" align="left"> 
                <b><font face="Arial" style="font-size: 8pt"><script>Capture(filter.days)</script></font></b></td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr> 
              
              <tr>
                <td width="156" height="25" bgcolor="#E7E7E7" colspan=3>&nbsp;</td>
                <td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="101">
                <input type=checkbox value=1 name=day_all <% filter_tod_get("day_all"); %> onClick=dayall(this.form)>
                <span style="font-size: 8pt"><script>Capture(filter.everyday)</script></span><font style="font-size: 8pt">&nbsp;&nbsp;
                </font></td>
                <td height="25" bgcolor="#FFFFFF" width="296">
                	<table><tr>
                	<td width=70><INPUT type=checkbox value=1 name=week0 <% filter_tod_get("week0"); %>>&nbsp;&nbsp;<script>Capture(filter.sun)</script>&nbsp;</td>
                	<td width=70><INPUT type=checkbox value=1 name=week1 <% filter_tod_get("week1"); %>>&nbsp;&nbsp;<script>Capture(filter.mon)</script>&nbsp;</td>
                	<td width=70><INPUT type=checkbox value=1 name=week2 <% filter_tod_get("week2"); %>>&nbsp;&nbsp;<script>Capture(filter.tue)</script>&nbsp;</td>
                	<td width=70><INPUT type=checkbox value=1 name=week3 <% filter_tod_get("week3"); %>>&nbsp;&nbsp;<script>Capture(filter.wed)</script>&nbsp;</td>
                	</tr></table>
                </td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>
              
              <tr>
                <td width="156" height="25" bgcolor="#E7E7E7" colspan=3>&nbsp;</td>
                <td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="101">
                <span style="font-size: 8pt"></span><font style="font-size: 8pt">&nbsp;&nbsp;
                </font></td>
                <td height="25" bgcolor="#FFFFFF" width="296">
                	<table><tr>
                	<td width=70><INPUT type=checkbox value=1 name=week4 <% filter_tod_get("week4"); %>>&nbsp;&nbsp;<script>Capture(filter.thu)</script>&nbsp;</td>
                	<td width=70><INPUT type=checkbox value=1 name=week5 <% filter_tod_get("week5"); %>>&nbsp;&nbsp;<script>Capture(filter.fri)</script>&nbsp;</td>
                	<td width=70><INPUT type=checkbox value=1 name=week6 <% filter_tod_get("week6"); %>>&nbsp;&nbsp;<script>Capture(filter.sat)</script>&nbsp;</td>
                	</tr></table>
                </td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>
              
              
              
              <tr>
                <td width="156" height="25" bgcolor="#E7E7E7" colspan=3>&nbsp;</td>
                <td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="410" height="25" bgcolor="#FFFFFF" colspan="3" align="left"> 
                <b><font face="Arial" style="font-size: 8pt"><script>Capture(filter.times)</script></font></b></td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr> 
              
              <tr>
                <td width="156" height="25" bgcolor="#E7E7E7" colspan=3>&nbsp;</td>
                <td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="101">
                <input type=radio value=1 name=time_all <% filter_tod_get("time_all_en"); %> onClick=timeall(this.form,'0')>
                <span style="font-size: 8pt"><script>Capture(filter.tfhrs)</script></span><font style="font-size: 8pt">&nbsp;&nbsp;
                </font></td>
                <td height="25" bgcolor="#FFFFFF" width="296" align=left>
                	<table><tr>
                	<td width="20">
                		<INPUT type=radio value=0 name=time_all <% filter_tod_get("time_all_dis"); %> onClick=timeall(this.form,'1')>
                	</td>
                	<td width="35">
                		<span style="font-size: 8pt">&nbsp;<script>Capture(filter.from)</script>:</span>&nbsp;
                	</td>
                	<td>
                <select name="start_hour" style="font-family:Arial; font-size:9pt">
<% filter_tod_get("start_hour_12"); %>
                </select>
                	</td>
                	<td style="font-family:Arial; font-size:9pt">
                :	
                	</td>
                	<td>
                <select name="start_min" style="font-family:Arial; font-size:9pt">
<% filter_tod_get("start_min_5"); %>
                </select>
                &nbsp;&nbsp;
                	</td>
                	<td>
                <select name="start_time" style="font-family:Arial; font-size:9pt">
                	<option value=0 <% filter_tod_get("start_time_am"); %>><script>Capture(filter.am)</script></option>
                	<option value=1 <% filter_tod_get("start_time_pm"); %>><script>Capture(filter.pm)</script></option>
                </select>
                	</td>
                	</tr></table>
                </td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>
              
              <tr>
                <td width="156" height="25" bgcolor="#E7E7E7" colspan=3>&nbsp;</td>
                <td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td height="25" bgcolor="#FFFFFF" width="101">
                <span style="font-size: 8pt"></span><font style="font-size: 8pt">&nbsp;&nbsp;
                </font></td>
                <td height="25" bgcolor="#FFFFFF" width="296" align=left>
                	<table><tr>
                	<td width="20">
                		<input type=hidden name="allday">
                	</td>
                	<td width="35">
                		<span style="font-size: 8pt">&nbsp;<script>Capture(filter.to)</script>:</span>&nbsp;
                	</td>
                	<td>
                <select name="end_hour" style="font-family:Arial; font-size:9pt">
<% filter_tod_get("end_hour_12"); %>
                </select>
                	</td>
                	<td style="font-family:Arial; font-size:9pt">
                :	
                	</td>
                	<td>
                <select name="end_min" style="font-family:Arial; font-size:9pt">
<% filter_tod_get("end_min_5"); %>
                </select>
                &nbsp;&nbsp;
                	</td>
                	<td>
                <select name="end_time" style="font-family:Arial; font-size:9pt">
                	<option value=0 <% filter_tod_get("end_time_am"); %>><script>Capture(filter.am)</script></option>
                	<option value=1 <% filter_tod_get("end_time_pm"); %>><script>Capture(filter.pm)</script></option>
                </select>
                	</td>
                	</tr></table>
                </td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>
              
              <tr>
                <td width="156" height="1" bgcolor="#E7E7E7" colspan=3>&nbsp;</td>  
                <td width="8" height="1" background=image/UI_04.gif></td>
                <td colspan=6><table><tr>
                <td width="16" height="1" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="1" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="410" height="1" bgcolor="#FFFFFF" colspan="3">
                <hr color="#B5B5E6" size="1"></td>
                <td width="15" height="1" bgcolor="#FFFFFF">&nbsp;</td>
                </tr></table></td>
                <td width="15" height="1" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>

              <tr>
                <td width="156" height="25" bgcolor="#E7E7E7" colspan="3"> <p align="right"><font style="font-weight: 700"><script>Capture(secleftmenu.blocksrv)</script></font></td>   
                <td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="428" height="25" bgcolor="#FFFFFF" colspan=2>&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>  
              <tr>
                <td width="156" height="25" bgcolor="#E7E7E7" colspan="3">&nbsp;</td>   
                <td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="428" height="25" bgcolor="#FFFFFF" colspan=2>
		<SELECT size=1 name=blocked_service0 onChange="onChange_blockedServices(blocked_service0.selectedIndex, port0_start, port0_end)"> 
			<option value=None selected><script>Capture(wlanadv.none)</script></option>
                                        <script>
                                                var i, index;
                                                index = search_service_index(servport_name0);
                                                for(i=0 ; i<services_length ; i++){
                                                        document.write("<option value="+services[i].name);
                                                        if(i==index)
                                                                document.write(" selected");
                                                        document.write(">"+services[i].name+"</option>");
                                                }                       
                                        </script>
		</SELECT>&nbsp;&nbsp; 
		<input maxLength=5 size=5 name=port0_start class=num readonly>&nbsp; ~ &nbsp;
		<input maxLength=5 size=5 name=port0_end class=num readonly></td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>  
              <tr>
                <td width="156" height="25" bgcolor="#E7E7E7" colspan="3">&nbsp;</td>   
                <td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="428" height="25" bgcolor="#FFFFFF" colspan=2>
		<SELECT size=1 name=blocked_service1 onChange="onChange_blockedServices(blocked_service1.selectedIndex, port1_start, port1_end)"> 
			<option value=None selected><script>Capture(wlanadv.none)</script></option>
                                        <script>
                                                var i, index;
                                                index = search_service_index(servport_name1);
                                                for(i=0 ; i<services_length ; i++){
                                                        document.write("<option value="+services[i].name);
                                                        if(i==index)
                                                                document.write(" selected");
                                                        document.write(">"+services[i].name+"</option>");
                                                }                       
                                        </script>
		</SELECT>&nbsp;&nbsp; 
		<input maxLength=5 size=5 name=port1_start class=num readonly>&nbsp; ~ &nbsp;
		<input maxLength=5 size=5 name=port1_end class=num readonly></td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>  
              <tr>
                <td width="156" height="25" bgcolor="#E7E7E7" colspan="3">&nbsp;</td>   
                <td width="8" height="25" background=image/UI_04.gif></td>
                <td width="14" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="17" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="428" height="25" bgcolor="#FFFFFF" colspan=2>

<script>document.write("<INPUT onclick=\"do_open(\'Port_Services.asp\',\'Port_Services\',\'alwaysRised,resizable,scrollbars,width=630,height=360\').focus()\" type=button name=\"add_button\" " + " value=\"" + secbutton.addedit + "\">");</script>

                <td width="13" height="25" bgcolor="#FFFFFF">&nbsp;</td>
                <td width="15" height="25" bgcolor="#FFFFFF" background=image/UI_05.gif></td>
              </tr>  
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 height=1 background=image/UI_04.gif></TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 bgColor=#ffffff height=1>&nbsp;</TD>
                <TD width=13 bgColor=#ffffff height=1>&nbsp;</TD>
                <TD width=410 bgColor=#ffffff colSpan=3 height=1>
                  <HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD width=15 bgColor=#ffffff height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 bgColor=#ffffff height=1 background=image/UI_05.gif></TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>
            <P align=right><FONT style="FONT-WEIGHT: 700"><script>Capture(filter.websiteblock)</script></FONT></P></TD>
          <TD width=8 height=25 background=image/UI_04.gif></TD>
          <TD width=14 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=17 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=13 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=428 bgColor=#ffffff colSpan=2 height=25>
		<INPUT class=num size=30 maxlength=79 name=host0 value='<% filter_web_get("host","0"); %>' style="FONT-SIZE: 9pt; FONT-FAMILY: Arial" onBlur=valid_name(this,"URL")>&nbsp; 
		<INPUT class=num size=30 maxlength=79 name=host1 value='<% filter_web_get("host","1"); %>' style="FONT-SIZE: 9pt; FONT-FAMILY: Arial" onBlur=valid_name(this,"URL")></TD>
          <TD width=13 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=15 bgColor=#ffffff height=25 background=image/UI_05.gif></TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 height=25 background=image/UI_04.gif></TD>
          <TD width=14 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=17 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=13 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=428 bgColor=#ffffff colSpan=2 height=25>
		<INPUT class=num size=30 maxlength=79 name=host2 value='<% filter_web_get("host","2"); %>' style="FONT-SIZE: 9pt; FONT-FAMILY: Arial" onBlur=valid_name(this,"URL")>&nbsp; 
		<INPUT class=num size=30 maxlength=79 name=host3 value='<% filter_web_get("host","3"); %>' style="FONT-SIZE: 9pt; FONT-FAMILY: Arial" onBlur=valid_name(this,"URL")></TD>
          <TD width=13 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=15 bgColor=#ffffff height=25 background=image/UI_05.gif></TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=1>&nbsp;</TD>
          <TD width=8 height=1 background=image/UI_04.gif></TD>
          <TD colSpan=6>
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 bgColor=#ffffff height=1>&nbsp;</TD>
                <TD width=13 bgColor=#ffffff height=1>&nbsp;</TD>
                <TD width=410 bgColor=#ffffff colSpan=3 height=1>
                  <HR color=#b5b5e6 SIZE=1>
                </TD>
                <TD width=15 bgColor=#ffffff height=1>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 bgColor=#ffffff height=1 background=image/UI_05.gif></TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>
            <P align=right><FONT style="FONT-WEIGHT: 700"><script>Capture(filter.blockkeyword)</script></FONT></P></TD>
          <TD width=8 height=25 background=image/UI_04.gif></TD>
          <TD width=14 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=17 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=13 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=428 bgColor=#ffffff colSpan=2 height=25>
		<INPUT class=num size=18 maxlength=79 name=url0 value='<% filter_web_get("url","0"); %>' style="FONT-SIZE: 9pt; FONT-FAMILY: Arial" onBlur=valid_name(this,"Keyword")>&nbsp; 
		<INPUT class=num size=18 maxlength=79 name=url1 value='<% filter_web_get("url","1"); %>' style="FONT-SIZE: 9pt; FONT-FAMILY: Arial" onBlur=valid_name(this,"Keyword")>&nbsp; 
		<INPUT class=num size=18 maxlength=79 name=url2 value='<% filter_web_get("url","2"); %>' style="FONT-SIZE: 9pt; FONT-FAMILY: Arial" onBlur=valid_name(this,"Keyword")></TD>
          <TD width=13 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=15 bgColor=#ffffff height=25 background=image/UI_05.gif></TD></TR>
        <TR>
          <TD width=156 bgColor=#e7e7e7 colSpan=3 height=25>&nbsp;</TD>
          <TD width=8 height=25 background=image/UI_04.gif></TD>
          <TD width=14 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=17 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=13 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=428 bgColor=#ffffff colSpan=2 height=25>
		<INPUT class=num size=18 maxlength=79 name=url3 value='<% filter_web_get("url","3"); %>' style="FONT-SIZE: 9pt; FONT-FAMILY: Arial" onBlur=valid_name(this,"Keyword")>&nbsp; 
		<INPUT class=num size=18 maxlength=79 name=url4 value='<% filter_web_get("url","4"); %>' style="FONT-SIZE: 9pt; FONT-FAMILY: Arial" onBlur=valid_name(this,"Keyword")>&nbsp; 
		<INPUT class=num size=18 maxlength=79 name=url5 value='<% filter_web_get("url","5"); %>' style="FONT-SIZE: 9pt; FONT-FAMILY: Arial" onBlur=valid_name(this,"Keyword")></TD>
          <TD width=13 bgColor=#ffffff height=25>&nbsp;</TD>
          <TD width=15 bgColor=#ffffff height=25 background=image/UI_05.gif></TD></TR>

              <tr>
                <td width="44" bgcolor="#E7E7E7"></td>
                <td width="65" bgcolor="#E7E7E7"></td>
                <td width="47" bgcolor="#E7E7E7"></td>
                <td width="8" background=image/UI_04.gif></td>
                <td width="14" bgcolor="#FFFFFF"></td>
                <td width="17" bgcolor="#FFFFFF"></td>
                <td width="13" bgcolor="#FFFFFF"></td>
                <td width="101" bgcolor="#FFFFFF"></td>
                <td width="296" bgcolor="#FFFFFF"></td>
                <td width="13" bgcolor="#FFFFFF"></td>
                <td width="15" background=image/UI_05.gif></td>
              </tr>
              </table></td>
              
              <td width="176" valign=top bgColor=#2971b9><table border="0" cellpadding="0" cellspacing="0" width="176"><tr>
                <td width="11" height="25" bgcolor="#2971b9">&nbsp;</td>
                <td width="156" height="25" bgcolor="#2971b9"><font color="#FFFFFF"><span style="font-family: Arial"><br>
<script>Capture(hfilter2.right1)</script><br><br>
<script>Capture(hfilter2.right2)</script><br><br>
<script>Capture(hfilter2.right3)</script><br><br>
<script language=javascript>
help_link("help/HFilters.asp");
Capture(share.more);
document.write("</a></b>");
</script>
<br><br>
<script>Capture(hfilter2.right5)</script><br><br>
<script>Capture(hfilter2.right6)</script><br><br>
<script>Capture(hfilter2.right7)</script><br><br>
<script>Capture(hfilter2.right8)</script><br><br>
<script>Capture(hfilter2.right9)</script><br><br>
</span></font></td>
                <td width="9" height="25" bgcolor="#2971b9">&nbsp;</td>
              </tr></table></td>
              
              </tr>

	      <tr>
                <td width="809" colspan=2><table border="0" cellpadding="0" cellspacing="0">
		<tr> 
		<td width="156" height="30" bgcolor="#E7E7E7">&nbsp;</td>
                <td width="8" height="30" background=image/UI_04.gif></td>
                <td width="454" height="30" bgcolor="#FFFFFF">&nbsp;</td>
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
		<TD width=103 bgcolor=#175592 align=center><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:do_replace('Filters.asp?session_id=<% nvram_get("session_key"); %>')"><script>Capture(sbutton.cancel)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></td>
                </tr>
		</table></td>
              </tr>
              </table>
    		</form></div>
            </body>

</html>
