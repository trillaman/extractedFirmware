<% web_include_file("copyright.asp"); %>
<TR>
          <TD bgColor=#e7e7e7 height=25></TD>
          <TD background=image/UI_04.gif height=25></TD>
          <TD height=25></TD>
          <TD height=25>&nbsp;<script>Capture(wlansec.radiussrv)</script>:&nbsp;</TD>
          <TD height=25><INPUT type=hidden name=wl_radius_ipaddr value=4>&nbsp;<INPUT size=3 maxlength=3 name=wl_radius_ipaddr_0 value='<% get_single_ip("wl_radius_ipaddr","0"); %>' onBlur=valid_range(this,1,223,"IP") class=num> .
                  <INPUT size=3 maxlength=3 name=wl_radius_ipaddr_1 value='<% get_single_ip("wl_radius_ipaddr","1"); %>' onBlur=valid_range(this,0,255,"IP") class=num> .
                  <INPUT size=3 maxlength=3 name=wl_radius_ipaddr_2 value='<% get_single_ip("wl_radius_ipaddr","2"); %>' onBlur=valid_range(this,0,255,"IP") class=num> .
                  <INPUT size=3 maxlength=3 name=wl_radius_ipaddr_3 value='<% get_single_ip("wl_radius_ipaddr","3"); %>' onBlur=valid_range(this,1,254,"IP") class=num></TD>
          <TD height=25></TD>
          <TD background=image/UI_05.gif height=25></TD></TR>
        <TR>
          <TD bgColor=#e7e7e7 height=25></TD>
          <TD background=image/UI_04.gif height=25></TD>
          <TD height=25></TD>
          <TD height=25>&nbsp;<script>Capture(wlansec.radiusport)</script>:&nbsp;</TD>
          <TD height=25>&nbsp;<INPUT size=3 name=wl_radius_port value='<% nvram_get("wl_radius_port"); %>' maxlength=5 onBlur=valid_range(this,1,65535,"Port")></TD>
          <TD height=25></TD>
          <TD background=image/UI_05.gif height=25></TD></TR>
        <TR>
          <TD bgColor=#e7e7e7 height=25></TD>
          <TD background=image/UI_04.gif height=25></TD>
          <TD height=25></TD>
          <TD height=25>&nbsp;<script>Capture(wlansec.sharekey)</script>:&nbsp;</TD>
          <TD height=25>&nbsp;<INPUT size=20 name=wl_radius_key value='<% nvram_get("wl_radius_key"); %>' maxlength=79>
</TD>
          <TD height=25></TD>
          <TD background=image/UI_05.gif height=25></TD></TR>
