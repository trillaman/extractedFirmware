Uy2              �       f  T 1� xc Mc Mb�  �cbQ�` �  � ATY 1P2 � C xc Mc Mb�  �cbQ�` �  � AT� 1P T� 1T� 1                var Internet_pages=new Array(
"WAN Service|internet_prim.htm"
,"Wizard|wanwiznew.htm"
 ,"Failover|internet_failover.htm?rc=&Nlf=0"
 ,"Failover|internet_failover.htm?rc=&Nlf=1"
 ,"Failover|internet_failover.htm?rc=&Nlf=2"
 ,"IPv6|internet_ipv6.htm"
)
var wifi_pages=new Array(
"Device List|wifi_devlist.htm"
,"Wi-Fi Settings|wifi_setting.htm"
,"WPS|wifi_wps.htm"
,"Wi-Fi Advanced|wifi_wlpfe.htm"
)
var lan_pages=new Array(
"Device List|lan_devlist.htm"
,"LAN Settings|lan_setting.htm"
,"DHCP|lan_dhcp.htm|sublan"
)
var adv_pages=new Array(
"DNS|adv_dns.htm"
,"Applications|adv_application.htm"
,"DMZ|adv_dmz.htm"
,"Virtual Server|adv_smap.htm"
,"URL Filter|adv_uctl.htm"
,"Routing|adv_rtab.htm"
,"QoS|adv_qos.htm"
,"MAC Address Filter|adv_pmac.htm"
,"Outbound Filter|adv_iopf.htm"
,"Inbound Filter|adv_iopf.htm?Ndir=1"
,"SNMP|adv_snmp.htm"
,"Advanced Network|adv_fmisc.htm"
)
var sys_pages=new Array(
"Time Settings|sys_sntp.htm"
,"Administration|sys_atbox.htm"
,"Reboot & Reset|sys_reboot_reset.htm"
,"Firmware Upgrade|sys_fwug.htm"
,"System Logs|sys_log.htm"
,"Schedules|sys_sche.htm"
)
var subsms=new Array(
"SMS Inbox|sys_smsinbox.htm"
,"Create Message|sys_smsmsg.htm"
)
var subvoice=new Array(
"Call Forwarding|sys_voice_forwd.htm"
,"Call Waiting|sys_voice_callwait.htm"
)
function dw(str){document.write(str+"\n")}
function func_Dir(sw_pageN,pages,_F2)
{
dw("<table width=230 border=0 cellspacing=0 cellpadding=0 name=tab_funcdir>")
dw("<tr><td width=230 valign=top>	")
dw("<div width=230 style=\"height: 20px;border:solid #E29861 0px\">&nbsp;</div>")
for(i=0;i<pages.length;i++)
{
ary = pages[i].split("|")
if((sw_pageN == ary[0])&&(arguments.length==3))
{
sw_img = "pic_left_submenu_Index.jpg";
sw_cla = "Left_2Menu";
sw_href = ary[1];
dw("<table width=230 border=0 cellpadding=0 cellspacing=0 id=>")
dw("<tr><td width=25 height=20></td>")
dw("<td width=9 align=left valign=middle><img src="+sw_img+" width=9 height=9></td>")
dw("<td class=Left_2Menu><a href='"+sw_href+"' class="+sw_cla+">"+GetElmCont("dirary0_0",ary[0])+"</a></td>")
dw("</tr>")
dw("</table>")
dw("<div width=230 style=\"height: 10px;border:solid #E29861 0px\">&nbsp;</div>")
ary1 = eval(ary[2])
for(a=0;a<ary1.length;a++)
{
sw_img_f2 = "sp.jpg";
sw_cla_f2 = "Left_3Menu";
ary_f2 = ary1[a].split("|")
sw_href_f2 = ary_f2[1];
if(_F2 == ary_f2[0])
{
sw_cla_f2 = "Left_3Menu3";
}
dw("<table width=100% border=0 cellpadding=0 cellspacing=0>")
dw("<tr><td width=25></td>")
dw("<td width=9 height=9></td>")
dw("<td class=Left_2Menu><a href='"+sw_href_f2+"' class="+sw_cla_f2+">-"+GetElmCont("dirary0_0",ary_f2[0])+"</a></td>")
dw("</tr>")
dw("</table>")
dw("<div width=230 style=\"height: 10px;border:solid #E29861 0px\">&nbsp;</div>")
}
}
else
{
sw_img = "pic_left_submenu_Index.jpg"
sw_cla = "Left_2Menu"
sw_href = ary[1]
if(sw_pageN == ary[0])
{
sw_img = "pic_left_submenu_index_highlight.jpg";
sw_href = sw_href;
sw_cla = "Left_2Menu2";
}
dw("<table width=230 border=0 cellpadding=0 cellspacing=0 id=>")
dw("<tr><td width=25 height=20></td>")
dw("<td width=9 align=left valign=middle><img src="+sw_img+" width=9 height=9></td>")
dw("<td class=Left_2Menu><a href='"+sw_href+"' class="+sw_cla+">"+GetElmCont("dirary0_0",ary[0])+"</a></td>")
dw("</tr>")
dw("</table>")
dw("<div width=230 style=\"height: 10px;border:solid #E29861 0px\">&nbsp;</div>")
}
}
dw("</td></tr>")
dw("</table><!-- /tab_funcdir-->")
dw("<!-- function dir end -->")
}
function swimg(sw1,pp)
{
f=document.forms['main']
document.getElementById(sw1).src = pp
}
var switnet = 1
var swwifi = 1
var swlan = 1
var swadv = 1
var swsysm = 1
TopMenuEle=new Array(
"dwrhome.htm|topm_home|pic_top_menu_home_mouseover.jpg|pic_top_menu_home.jpg|Home"
)
if(switnet=='1')
{ xxccxx = TopMenuEle.splice(TopMenuEle.length,0, "internet_prim.htm|topm_itnet|pic_top_menu_internet_mouseover.jpg|pic_top_menu_internet.jpg|Internet"); }
if(swwifi=='1')
{ xxccxx = TopMenuEle.splice(TopMenuEle.length,0, "wifi_devlist.htm|topm_wifi|pic_top_menu_wifi_mouseover.jpg|pic_top_menu_wifi.jpg|Wi-Fi");}
if(swlan=='1')
{ xxccxx = TopMenuEle.splice(TopMenuEle.length,0, "lan_devlist.htm|topm_lan|pic_top_menu_lan_mouseover.jpg|pic_top_menu_lan.jpg|LAN");}
if(swadv=='1')
{ xxccxx = TopMenuEle.splice(TopMenuEle.length,0, "adv_dns.htm|topm_adv|pic_top_menu_advanced_mouseover.jpg|pic_top_menu_advanced.jpg|Advanced");}
if(swsysm=='1')
{ xxccxx = TopMenuEle.splice(TopMenuEle.length,0, "sys_sntp.htm|topm_sys|pic_top_menu_system_mouseover.jpg|pic_top_menu_system.jpg|System");}
function TopMenu_Dir(sw_img)
{
dw("<table width='1000' border='0' cellspacing='0px' cellpadding='0px' name=tab_top>")
dw("<tr valign =top>")
dw("<td width='230' height='130'><img src='pic_top_logo_home.jpg' width='230' height='130' border='0' /></td>")
dw("<td width='42' height='130' xbgcolor='#FFFFFF'><img src='pic_top_menu_left.jpg' width='42' height='130' border='0' /></td>")
dw("<td height='130' background='pic_top_companylogo.jpg'>")
dw("<table width='100%' border='0' cellspacing='0' cellpadding='0'><tr valign =top>")
for(i=0;i<TopMenuEle.length;i++)
{//"dwrhome.htm|topm_home|pic_top_menu_home_mouseover.jpg|pic_top_menu_home.jpg"
ary1 = TopMenuEle[i].split("|")
sw_href = ary1[0]
sw_src = ary1[1]
sw_imgov  = ary1[2]
sw_imgout= ary1[3]
sw_name= ary1[4]
dw("<td width='62' height='130' background='pic_top_menu_1pix.jpg' align=center>")
if(sw_img == ary1[1])
{ dw("<a href='"+sw_href+"' class=top_Menu2><img src='"+sw_imgov+"' width='62' height='68' align=center border='0' />"+GetElmCont('dirary0_0',sw_name)+"</a></td>")}
else
{
dw("<a href='"+sw_href+"' class=top_Menu><img src="+sw_imgout+" name="+sw_src+" width='62' height='68' border='0' align=center id='"+sw_src+"' onmouseout=\"swimg('"+sw_src+"','"+sw_imgout+"')\" onmouseover=\"swimg('"+sw_src+"','"+sw_imgov+"')\" />"+GetElmCont('dirary0_0',sw_name)+"</a></td>")
}
if(i != (TopMenuEle.length-1))dw("<td width='27' height='110' background='pic_top_menu_1pix.jpg'></td>")
}
dw("<td width='50'><img src='pic_top_menu_right1.jpg' alt='' width='50' height='130' border='0' /></td>")
dw("<td align=center>")
showlangsel(_LM_)
dw("&nbsp;&nbsp;&nbsp;&nbsp;</td>")
dw("<td width='27' height='110' xbackground='pic_top_menu_1pix.jpg'></td>")
dw("<td width='79' height='130' align='right'><table width='79' border='0' cellspacing='0' cellpadding='0'>")
dw("<tr>")
dw("<td width='79' height='130' align='left' valign='top' background='pic_top_right_bg.jpg'>")
dw("<!-- right blue list :'help,logout,refresh' start  -->")
dw("<table width='79' border='0' cellspacing='0' cellpadding='0'>")
dw("<tr>")
dw("<td height='10'></td>")
dw("</tr>")
/*dw("<tr>")
dw("<td><a href='#' class='Top_TopBar'><span id=_common_0 style='white-space: nowrap;'>Help</span></a></td><td>&nbsp;&nbsp;</td>")
dw("</tr>")*/
dw("<tr>")
dw("<td><a href='/log/out?rd=/loginpage.htm&Nrd=3' class='Top_TopBar'><span id=_common_0 style='white-space: nowrap;'>Logout</span></a></td><td>&nbsp;&nbsp;</td>")
dw("</tr>")
dw("<tr>")
dw("<td><a href='javascript:location=location.pathname;' class='Top_TopBar'><span id=_common_0 style='white-space: nowrap;'>Refresh</span></a></td><td>&nbsp;&nbsp;</td>")
dw("</tr>")
dw("<tr>")
dw("<td>&nbsp;</td><td>&nbsp;&nbsp;</td>")
dw("</tr>")
dw("</table>")
dw("<!-- right blue list :'help,logout,refresh' end  -->")
dw("</td></tr>")
dw("</table></td>")
dw("</tr>")
dw("</table></td>")
dw("</tr>")
dw("</table><!--tab_top -->")
}
 