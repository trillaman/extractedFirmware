<% web_include_file("copyright.asp"); %>
<HTML><HEAD><TITLE>Config Management</TITLE>
<% no_cache(); %>
<% charset(); %>
<% web_include_file("filelink.asp"); %>
<SCRIPT language=JavaScript>
document.title = bakres2.conman;
function to_restore(F)
{
	var len = F.restore.value.length;
	var ext = new Array('.','c','f','g');
	if (F.restore.value == '')	{
//              alert('Please select a file to upgrade !');
                alert(fwupgrade.upgradefile);
		return false;
	}
	var IMAGE = F.restore.value.toLowerCase();
	for (i=0; i < 4; i++)	{
		if (ext[i] != IMAGE.charAt(len-4+i)){
//                      alert('Incorrect image file!');
                        alert(hupgrade.wrimage);
			return false;
		}
	}

	F.submit_button.value = "Backup_Restore";
        F.submit();
	
}

function init()
{
	init_form_session_key(document.forms[0], "restore.cgi");
}
</SCRIPT>
</HEAD>
<BODY vLink=#b5b5e6 aLink=#ffffff link=#b5b5e6 onload=init()>
<DIV align=center>
<FORM name=restore method=post action=restore.cgi encType=multipart/form-data>
<input type=hidden name=submit_button>

<% web_include_file("Top.asp"); %>
<% web_include_file("Fun.asp"); %>

<TABLE height=5 cellSpacing=0 cellPadding=0 width=806 bgColor=black border=0>
  <TBODY>
  <TR bgColor=black>
    <TD 
    style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" 
    borderColor=#e7e7e7 width=163 bgColor=#e7e7e7 height=1><IMG height=15 
      src="image/UI_03.gif" width=164 border=0></TD>
    <TD 
    style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; COLOR: black; FONT-STYLE: normal; FONT-FAMILY: Arial, Helvetica, sans-serif; FONT-VARIANT: normal" 
    width=646 height=1><IMG height=15 src="image/UI_02.gif" width=645 border=0></TD></TR></TBODY></TABLE>
<TABLE id=AutoNumber9 style="BORDER-COLLAPSE: collapse" borderColor=#111111 
height=23 cellSpacing=0 cellPadding=0 width=809 border=0>
  <TBODY>
  <TR>
    <TD width=633>
      <TABLE height=100% cellSpacing=0 cellPadding=0 border=0 width="633">
        <TBODY>
        <TR>
          <TD width=156 bgColor=#5b5b5b height=height=25>
                <P align=right><b>
                <font face="Arial" color="#FFFFFF" style="font-size: 9pt">
                <script>Capture(bakres2.bakconf)</script></font></b></P>
          </TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width=454 height=25>&nbsp;</TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD>
        </TR>

        <TR>
	   <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=454 align=left>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<script>document.write("<INPUT onclick=window.location.href=do_href('/<% get_backup_name(); %>','<% nvram_get("session_key"); %>') type=button name=backup_b value=\"" + bakres2.bakbutton + "\">");</script>
          </TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD>
        </TR>                

        <TR>
          <TD width=156 bgColor=#e7e7e7 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD width="454">
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 height=1><HR color=#b5b5e6 SIZE=1></TD>
                <TD width=15>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD>
        </TR>

        <TR>
          <TD width=156 bgColor=#5b5b5b height=25>
            <P align=right><B><FONT style="FONT-SIZE: 9pt" color=#ffffff><span ><script>Capture(bakres2.resconf)</script></span></FONT></B></P></TD>
          <TD width=8 bgColor=#5b5b5b height=25>&nbsp;</TD>
          <TD width="454">
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=25>&nbsp;</TD>
                <TD width=12 height=25>&nbsp;</TD>
                <TD width=411 height=25>&nbsp;</TD>
                <TD width=15 height=25>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD>
        </TR>

        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=454 height=25 align=center><script>Capture(bakres2.file2res)</script>:&nbsp;<INPUT type=file name=restore size="20"></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD>
        </TR>             


        <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=454 height=25 align=left>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<script>document.write("<INPUT onclick=to_restore(this.form) type=button name=restore_b value=\"" + bakres2.resbutton + "\">");</script>
          </TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD>
         </TR> 

         <TR>
          <TD width=156 bgColor=#e7e7e7 height=25>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=25>&nbsp;</TD>
          <TD width=454 height=25></TD>
          <TD width=15 background=image/UI_05.gif height=25>&nbsp;</TD>
        </TR>              

        <TR>
          <TD width=156 bgColor=#e7e7e7 height=1>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif height=1>&nbsp;</TD>
          <TD width="454">
            <TABLE>
              <TBODY>
              <TR>
                <TD width=16 height=1>&nbsp;</TD>
                <TD width=13 height=1>&nbsp;</TD>
                <TD width=410 height=1>&nbsp;</TD>
                <TD width=15>&nbsp;</TD></TR></TBODY></TABLE></TD>
          <TD width=15 background=image/UI_05.gif height=1>&nbsp;</TD>
        </TR>

        <TR>
          <TD width=156 bgColor=#e7e7e7>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=454></TD>
          <TD width=15 background=image/UI_05.gif>&nbsp;</TD> 
        </TR></TBODY></TABLE></TD>

    <TD vAlign=top width=176 bgColor=#2971b9>
      <TABLE cellSpacing=0 cellPadding=0 width=176 border=0>
        <TBODY>
        <TR>
          <TD width=11 bgColor=#2971b9 height=25>&nbsp;</TD>
          <TD width=156 bgColor=#2971b9 height=25><font color="#FFFFFF">
          <span>
		  <br>
			<script>Capture(bakres2.right1)</script>
		  <br><br>
			<script>Capture(bakres2.right2)</script>
		  <br><br>
		        <script>Capture(bakres2.right3)</script> 
		  <br><br>
		        <script>Capture(bakres2.right4)</script>
			<!--   a target="_blank" href="HSetup.asp?session_id=<% nvram_get("session_key"); %>">More...</a   -->
	  </span></font></TD>
          <TD width=9 bgColor=#2971b9 height=25>&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD width=809 colSpan=2>
      <TABLE cellSpacing=0 cellPadding=0 border=0>
        <TBODY>
        <TR>
          <TD width=156 bgColor=#e7e7e7 height=30>&nbsp;</TD>
          <TD width=8 background=image/UI_04.gif>&nbsp;</TD>
          <TD width=16>&nbsp;</TD>
          <TD width=12>&nbsp;</TD>
          <TD width=411>&nbsp;</TD>
          <TD width=15>
	  <TD width="15" rowspan="2" background="image/UI_05.gif">&nbsp;</TD>
          <TD width="176" rowspan="2" align="right" bgcolor="#2971b9" border="0" height="64">&nbsp;</TD>
          </TR>
        <TR>
          <TD width=156 bgColor=#5b5b5b>&nbsp;</TD>
          <TD width=8 bgColor=#5b5b5b>&nbsp;</TD>
          <TD width=16 bgColor=#2971b9>&nbsp;</TD>
          <TD width=12 bgColor=#2971b9>&nbsp;</TD>
          <TD width=411 bgColor=#2971b9>&nbsp;</TD>
          <TD width=15 bgColor=#2971b9 height=33>&nbsp;</TD>
          </TR></TBODY></TABLE></TD></TR></TBODY></TABLE></FORM></DIV></BODY></HTML>
