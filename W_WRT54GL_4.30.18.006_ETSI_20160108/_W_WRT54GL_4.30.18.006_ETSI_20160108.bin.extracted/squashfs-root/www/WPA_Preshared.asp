<% web_include_file("copyright.asp"); %>
<TR>
          <TD bgColor=#e7e7e7 height=25></TD>
          <TD background=image/UI_04.gif height=25></TD>
          <TD></TD>
          <TD height=25>&nbsp;<script>Capture(wlansec.wpaalg)</script>:&nbsp;</TD>
          <TD height=25>&nbsp;<SELECT name=wl_crypto>
		<script>
		     var enc = '<% nvram_get("wl_crypto"); %>';
		     var now_security_mode2 = document.wpa.security_mode2.options[document.wpa.security_mode2.selectedIndex].value;

			if(now_security_mode2 == "wpa_personal") {
				if (enc == "tkip") {
					document.write("<OPTION value=tkip selected>"+wlansec.tkip+"</OPTION>");
					document.write("<OPTION value=aes>"+wlansec.aes+"</OPTION>");
				}
				else {
					document.write("<OPTION value=tkip>"+wlansec.tkip+"</OPTION>");
					document.write("<OPTION value=aes selected>"+wlansec.aes+"</OPTION>");
				}
			}else{	// wpa2_enterprise
				if (enc == "aes") {
					document.write("<OPTION value=aes selected>"+wlansec.aes+"</OPTION>");
					document.write("<OPTION value=tkip+aes>"+wlansec.tkip+"+"+wlansec.aes+"</OPTION>");
				}
				else {
					document.write("<OPTION value=aes>"+wlansec.aes+"</OPTION>");
					document.write("<OPTION value=tkip+aes selected>"+wlansec.tkip+"+"+wlansec.aes+"</OPTION>");
				}
			}
		</script>
                  </SELECT></TD>
          <TD height=25></TD>
          <TD background=image/UI_05.gif height=25></TD></TR>
        <TR>
          <TD bgColor=#e7e7e7 height=25></TD>
          <TD background=image/UI_04.gif height=25></TD>
          <TD ></TD>
          <TD height=25>&nbsp;<script>Capture(wlansec.wpaskey)</script>:&nbsp;</TD>
          <TD height=25>&nbsp;<INPUT size=32 name=wl_wpa_psk value='<% nvram_get("wl_wpa_psk"); %>' maxlength=64></TD>
          <TD height=25></TD>
          <TD background=image/UI_05.gif height=25></TD></TR>
        <TR>
          <TD bgColor=#e7e7e7 height=25></TD>
          <TD background=image/UI_04.gif height=25></TD>
          <TD></TD>
          <TD height=25>&nbsp;<script>Capture(wlansec.groupkey)</script>:&nbsp;</TD>
          <TD height=25>&nbsp;<INPUT maxLength=5 name=wl_wpa_gtk_rekey size=10 value='<% nvram_get("wl_wpa_gtk_rekey"); %>' onBlur=valid_range(this,600,7200,"rekey%20interval")> <script>Capture(wlansec.seconds)</script></TD>
          <TD height=25></TD>
          <TD background=image/UI_05.gif height=25></TD></TR>
