<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Firmware Upgrade</TITLE>
<% no_cache(); %>
<% charset(); %>

<% web_include_file("filelink.asp"); %>
<SCRIPT language=javascript>
document.title = adtopmenu.upgarde;
var showchar = '|';
var maxchars = 60;
var delay_time = 1000;
var counter=0;
var num=0;

function progress(){
	var F = document.forms[0];
	if(num == 2){
		clearTimeout(timerID);
//              alert("Upgrade are failed!");
                alert(errmsg.err13);
		return false;
	}
	if (counter < maxchars)	{
		counter++;
		var tmp = '';
		for (var i=0; i < counter; i++)
			tmp = tmp + showchar;
		F.process.value = tmp;
		timerID = setTimeout('progress()',delay_time);
	}
	else{
		counter = 0;
		num ++;
		progress();	
        }
}

function stop(){
	if(ie4)
  		document.all['style0'].style.visibility = 'hidden';
}

function upgrade(F){
	var len = F.file.value.length;
	var ext = new Array('.','b','i','n');
	if (F.file.value == '')	{
//              alert('Please select a file to upgrade !');
                alert(fwupgrade.upgradefile);
		return;
	}
	var IMAGE = F.file.value.toLowerCase();
	for (i=0; i < 4; i++)	{
		if (ext[i] != IMAGE.charAt(len-4+i)){
//                      alert('Incorrect image file!');
                        alert(hupgrade.wrimage);
			return;
		}
	}

	if(ns4)
		delay_time = 1500;
   		
	choose_disable(F.Upgrade_b);

	F.submit_button.value = "Upgrade";
   	F.submit();
   	//document.onstop = stop;
   	progress();
}
function init()
{
	init_form_session_key(document.forms[0], "upgrade.cgi");

}
</script>
</HEAD>
<BODY onload=init()> 
<DIV align=center>

<FORM name="firmware" method=post action=upgrade.cgi encType=multipart/form-data>
<input type=hidden name=submit_button>
<input type=hidden name=change_action>
<input type=hidden name=gui_action>

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=809 bgColor=black border=0>
  <TBODY>
  <TR bgColor=black>
    <TD 
    style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" 
    borderColor=#e7e7e7 width=163 bgColor=#e7e7e7 height=1><IMG height=15 
      src="image/UI_03.gif" width=163 border=0></TD>
    <TD 
    style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" 
    width=646 height=1><IMG height=15 src="image/UI_02.gif" width=646 
      border=0></TD></TR></TBODY></TABLE>
<TABLE height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD align=right width=156 bgColor=#5b5b5b 
            height=25><B><FONT style="FONT-SIZE: 9pt" face=Arial 
            color=#ffffff><script>Capture(adleftmenu.upgradefw)</script></FONT></B></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=402 height=25>&nbsp;</TD>
          <TD width=39 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=402 height=25>
          <p align="center"><FONT face=Arial color=#0000ff><B><SPAN style="FONT-SIZE: 16pt"><script>Capture(adtopmenu.upgarde)</script></SPAN></B></FONT></TD>
          <TD width=39 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=402 align=right height=25>&nbsp;<script>Capture(fwupgrade.upgradefile)</script>:&nbsp;&nbsp;<INPUT type=file name=file size="20"></TD>
          <TD width=39 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=402 align=right height=25>
          <p align="center"><FONT face=Arial color=#ff0000><script>Capture(fwupgrade.warning)</script></FONT></TD>
          <TD width=39 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=402>&nbsp;</TD>
          <TD width=39 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <CENTER>
          <TD width=13 height=25>&nbsp;</TD>
          <TD align=middle height=25 width=402>&nbsp;<INPUT type=text name=process size=40 maxlength=120 value='' onFocus=blur()></UBR></TD>
          <TD height=25 width=39>&nbsp;</TD></CENTER>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
        <TR>
          <TD align=right width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=13 height=25>&nbsp;</TD>
          <TD width=402 align=middle height=25><B><FONT color=red>
                 <script>Capture(fwupgrade.notinterrupted)</script></FONT></B>
          </TD>
          <TD width=39 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD></TR>
	
	<TR>
          <TD width=156 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=13>&nbsp;</TD>
          <TD width=402></TD>
          <TD width=39>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD></TR>


	</TBODY></TABLE></TD>

    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF"><span style="font-family: Arial"><br>

<script>Capture(hupgrade.right1)</script><br><br>
<script>Capture(hupgrade.right2)</script><br>
<script language=javascript>
help_link("help/HUpgrade.asp");
Capture(share.more);
document.write("</a></b>");
</script>
</span></font></TD>
          <TD width=9 bgColor=#2971b9 
  height=25>&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
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
          <TD width=454 bgColor=#2971b9 align="right">
<TABLE>
<TR>
<TD width=101 bgcolor=#175592 align=center height=20><font color=#FFFFFF style="font-size: 8pt; font-weight: 700" face="Arial"><A href="javascript:upgrade(document.forms[0])"><script>Capture(adbutton.upgrade)</script></A></font></TD>
		<TD width=8></TD>
		</TR>
	  </TABLE></TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
