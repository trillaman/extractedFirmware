Uy2              0       c  T 1              function menuChange(menuItemId)
{
var identity = document.getElementById(menuItemId);
var menuItemId_href = menuItemId + '_href';
if (menuItemId == 'mm1') {
document.getElementById('mm1_img').src='../images/Top_Menu_Home_Down.png';
} else if (menuItemId == 'mm2') {
document.getElementById('mm2_img').src='../images/Top_Menu_Internet_Down.png';
} else if (menuItemId == 'mm3') {
document.getElementById('mm3_img').src='../images/Top_Menu_Wifi_Down.png';
} else if (menuItemId == 'mm4') {
document.getElementById('mm4_img').src='../images/Top_Menu_Lan_Down.png';
} else if (menuItemId == 'mm5') {
document.getElementById('mm5_img').src='../images/Top_Menu_Advanced_Down.png';
} else if (menuItemId == 'mm6') {
document.getElementById('mm6_img').src='../images/Top_Menu_System_Down.png';
}
document.getElementById(menuItemId_href).style.color='#000000';
/*
var identity=document.getElementById(menuItemId);
identity.className="topMenuTdHover";
*/
identity = null
menuItemId_href = null
}
function leftMenuChange(menuItemId)
{
if (menuItemId != '')
{
var identity = document.getElementById(menuItemId);
var menuItemId_img = menuItemId + '_img';
if(identity.className == "leftMenuLink") {
identity.className = "leftMenuLinkH";
document.getElementById(menuItemId_img).src='../images/Left_Menu_Index_Down.png';
} else {
identity.className = "submenuH";
}
identity = null
menuItemId_img = null
}
}
function onAdvancedShow(item) {
var firewall_id = document.getElementById('firewall_display');
var ipv6_id = document.getElementById('ipv6_display');
var nat_id = document.getElementById('nat_display');
var usb_id = document.getElementById('usb_display');
if (firewall_id) {
firewall_id.style.display = (item == "firewall" ? "block" : "none");
}
if (ipv6_id) {
ipv6_id.style.display = (item == "ipv6" ? "block" : "none");
}
if (nat_id) {
nat_id.style.display = (item == "nat" ? "block" : "none");
}
if (usb_id) {
usb_id.style.display = (item == "usb" ? "block" : "none");
}
firewall_id = null
ipv6_id = null
nat_id = null
usb_id = null
}
function onLanShow(item) {
var dhcp_id = document.getElementById('dhcp_display');
if (dhcp_id) {
dhcp_id.style.display = (item == "dhcp" ? "block" : "none");
}
dhcp_id = null
}
function onHomeShow(item) {
var voice_id = document.getElementById('voice_display')
if (voice_id) {
voice_id.style.display = (item == "voice" ? "block" : "none");
}
}
var popwindow;
function pop(url)
{ popwindow=window.open(url,'name','height=400,width=500,left=100,top=100,resizable=no,scrollbars=yes,toolbar=no,status=no');
if (window.focus) {popwindow.focus()}
}
function showProgressing()
{
var i18n_inProgressing = 'In Progressing...';
var i18n_invalidIPObj = document.getElementById('i18n_inProgressing');
if(i18n_invalidIPObj)
document.getElementById('errmsg').innerHTML = i18n_invalidIPObj.value;
else
document.getElementById('errmsg').innerHTML = i18n_inProgressing;
i18n_inProgressing = null
i18n_invalidIPObj = null
}
function getHomeStatus()
{
var i18n_browserNotSuppAjax = "";
var i18n_browserNotSuppAjaxObj = document.getElementById('i18n_browserNotSuppAjax');
if(i18n_browserNotSuppAjaxObj) i18n_browserNotSuppAjax = i18n_browserNotSuppAjaxObj.value;
var request;
try
{  // Firefox, Opera 8.0+, Safari
request=new XMLHttpRequest();
}
catch (e)
{	// Internet Explorer
try
{
request=new ActiveXObject("Msxml2.XMLHTTP");
}
catch (e)
{
try
{
request=new ActiveXObject("Microsoft.XMLHTTP");
}
catch (e)
{
window.status = i18n_browserNotSuppAjax;
return false;
}
}
}
request.open("GET","?page=homeStatus.htm",false);
request.send(null);
}
function onHomeRefresh(page)
{
if (page == "home.htm") {
getHomeStatus();
}
}
 