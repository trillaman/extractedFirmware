<script>
var i , j,funw; 
//-----------------CHECK POSITION--------------------
var NOWPATH = document.location.pathname.substring(1,document.location.pathname.length);
var num =  NOWPATH.indexOf(";");
if (num > 0)
	NOWPATH =  NOWPATH.substring(0,num);

if ( NOWPATH == "apply.cgi" ) NOWPATH = "<% get_web_page_name(); %>" ; 
if(NOWPATH == "wps_connect_result.asp") NOWPATH = "Wireless_Basic.asp";
if(NOWPATH == "wps_search_device.asp") NOWPATH = "Wireless_Basic.asp";
getpos(NOWPATH);
//alert("SelectItemIdx="+SelectItemIdx+";SelectSubItem="+SelectSubItem);
//document.title=Menu[SelectItemIdx][SelectSubItem][DNAME];
var close_session = "<% get_session_status(); %>";

document.write("<TABLE class=menu_table>");
document.write("<TBODY><TR>");
//First TD
for (i=0; i<Menu.length; i++)
{
	if ( i == SelectItemIdx ) {
		document.write("<TD class=menu_td1>");
		document.write("<H3 id=bmenu_h3><FONT id=bmenu_font>");
		document.write(Menu[i][0][DMAIN]);
		document.write("</FONT></H3></TD>");
	}
}
//Second TD
document.write("<TD class=menu_td2>");
document.write("<TABLE class=main_menu_table><TBODY>");
document.write("<TR> <TD class=productname_td>");
productname();
document.write("&nbsp;&nbsp;");
document.write("</TD>");
document.write("<TD class=model_td rowSpan=2><SPAN><B><% get_model_name(); %></B>");
document.write("</SPAN></TD></TR>");
document.write("<TR><TD class=product_menu_separate1></TD></TR>");
document.write("<TR><TD class=main_menu_td colSpan=2>");
document.write("<TABLE class=main_menu_td_table id=AutoNumber1><TBODY>");
//separate 2
document.write("<TR class=product_menu_separate2>");
//funw = parseInt(646/Menu.length);
for (i=0; i<Menu.length; i++)
{
	funw =parseInt(Menu[i][0][DWIDTH]);
	document.write("<TD width="+funw+" class=");
	if ( i == SelectItemIdx )
	    document.write("pic_select_fun");
	else
     	    document.write("pic_option_fun");
	document.write("></TD>");
}
document.write("</TR>");
//Main menu
document.write("<TR>");
for (i=0; i<Menu.length; i++)
{
	document.write("<TD class=");
	if ( i == SelectItemIdx )
	    document.write("option_fun_sel>");
	else
     	    document.write("option_fun>");
	if ( close_session == "1" )
	{
		document.write("<A href="+Menu[i][0][DLINK] +">"+Menu[i][0][DMAIN]+"</A>");
	}
	else
	{
		document.write("<A href="+Menu[i][0][DLINK] + "?session_id=" + session_key +">"+Menu[i][0][DMAIN]+"</A>");
	}
	document.write("</TD>");
}
document.write("</TR>");
//sub menu
document.write("<TR>");
document.write("<TD class=sub_menu_td colSpan=7>");
document.write("<TABLE class=sub_menu_table><TBODY>");
document.write("<TR align=left>");
document.write("<TD>");
document.write("<TABLE><TBODY><TR>");
for(i=0; i<Menu[SelectItemIdx].length; i++)
{
	document.write("<TD class=blankspan>");
	if ( i != SelectSubItem ) 
	{
		document.write("<font class=small>");
		if ( close_session == "1" )
		{
			document.write("<A href="+Menu[SelectItemIdx][i][DLINK]+">");
		}
		else
		{
			document.write("<A href="+Menu[SelectItemIdx][i][DLINK]+ "?session_id=" + session_key +">");
		}
	}
	document.write(Menu[SelectItemIdx][i][DNAME]);
	if ( i != SelectSubItem ) document.write("</A></FONT>");
	document.write("</TD>");
	if ( i != Menu[SelectItemIdx].length -1 ) 
		document.write("<TD class=subfun_div>|</TD>");
}
document.write("</TR></TBODY></TABLE>");
document.write("</TD>");
document.write("</TR>");
document.write("</TBODY></TABLE>");
document.write("</TD></TR></TBODY></TABLE>");
document.write("</TD></TR></TBODY></TABLE>");
document.write("</TD></TR></TBODY></TABLE>");
</script>
