Uy2              �       $  T 1� xc McT Mb�  �cbQ�` �  Q
ATL1P TQ1TW1�  xc McT Mb�  �cbQ�` �  Q
ATZ1P T_1Te1        var http_request,staret;
var mesg=new Array("&nbsp;","&nbsp;")
var elem=new Array()
function makeRequest(url,elem) {
http_request = false;
var t=new Date()
if (window.XMLHttpRequest) { // Mozilla, Safari,...
http_request = new XMLHttpRequest();
} else if (window.ActiveXObject) { // IE
try {
http_request = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
try {
http_request = new ActiveXObject("Microsoft.XMLHTTP");
} catch (e) {}
}
}
if (!http_request) {
alert('Giving up :( Cannot create an XMLHTTP instance');
return false;
}
http_request.open('GET', url+t.getTime(), true);
if(arguments.length > 1)
http_request.onreadystatechange = stateChangedXML;
else
http_request.onreadystatechange = stateChangedText;
http_request.send(null);
}
function stateChangedXML() {
if (http_request.readyState == 4) {
if (http_request.status == 200) {
var xmldoc = http_request.responseXML//.documentElement;
for(aj=0;aj<elem.length;aj++)
{
mesg[aj]=xmldoc.getElementsByTagName(elem[aj])[0].childNodes[0].nodeValue;
}
} else {
}
}
}
function stateChangedText() {
if (http_request.readyState == 4) {
if (http_request.status == 200) {
mesg = http_request.responseText;
} else {
}
}
}
var xmlDoc;
function loadXMLDoc(dname)
{
var t=new Date()
try //Internet Explorer
{
xmlDoc=new ActiveXObject("Microsoft.XMLDOM");
}
catch(e)
{
try //Firefox, Mozilla, Opera, etc.
{
xmlDoc=document.implementation.createDocument("",null,null);
}
catch(e) {//alert(e.message)
}
}
try
{
xmlDoc.async=false;
xmlDoc.load(dname);
return(xmlDoc);
}
catch(e) {//alert(e.message)
}
return(null);
}
function loadXMLDocs(dname)
{
try
{
if (window.ActiveXObject)
{
var errormsg = "Check Browser and security settings";
xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
xmlDoc.async=false;
xmlDoc.load(dname);
}
else if(window.XMLHttpRequest)
{
var errormsg = "Error handling XMLHttpRequest request";
var d = new XMLHttpRequest();
d.open("GET", dname, false);
d.send(null);
xmlDoc=d.responseXML.documentElement;
} else {
var errormsg = "Error.";
xmlDoc = document.implementation.createDocument("","",null);
xmlDoc.async=false;
xmlDoc.load(dname);
}
return xmlDoc;
}
catch(e)
{
return null;
}
}
function rlist(xmlurl)
{
var t=new Date()
xmlDoc=null;
if(xmlurl.indexOf("?")==-1)xmlDoc=loadXMLDocs(xmlurl+"?ZT="+t.getTime()+'&csrftok='+get_token());
else xmlDoc=loadXMLDocs(xmlurl+"&ZT="+t.getTime()+'&csrftok='+get_token());
if(xmlDoc==null)return;
z=xmlDoc.getElementsByTagName("item")
if(z==null)return
if(z.length <= 0)return
logins=xmlDoc.getElementsByTagName("login")[0].getAttribute("auth")
loginsb=(logins!=0)
if(loginsb!=login){
login=loginsb
butn=xmlDoc.getElementsByTagName("butns")[0].childNodes[0]
ddiv=document.getElementById("butns")
if(ddiv!=null) ddiv.innerHTML=(butn!=null)?butn.nodeValue:"&nbsp;"
}
for (j=0;j<z.length;j++)
{
zn=z[j].childNodes[0]
nv=(zn!=null)?zn.nodeValue:"&nbsp;"
ddiv=document.getElementById(z[j].getAttribute("name"))
if(z[j].getAttribute("name")=="ssid")
{_swE=''
for(j0=0;j0<nv.length;j0++) { _swE+=(nv.substring(j0,j0+1)=="&")?"&amp;":nv.substring(j0,j0+1) }
nv=_swE
}
if(ddiv!=null){if((nv!="&nbsp;")&&(nv!=""))ddiv.innerHTML=nv}
}
wanstat(xmlDoc)
show3g(xmlDoc)
if(timerID!=null)clearInterval(timerID)
showsta(xmlurl,xmlDoc);
chgLang()
}
function show3g(xd)
{
x=xd.getElementsByTagName("support3g")[0].childNodes[0]
if((x!=null)&&(x.nodeValue==1))
{
contsta3g=(xd.getElementsByTagName("contsta3g")[0].childNodes[0].nodeValue=="1")
wantype3g=(xd.getElementsByTagName("wantype3g")[0].childNodes[0].nodeValue=="1")
signals3g=(xd.getElementsByTagName("signals3g")[0].childNodes[0].nodeValue=="1")
swid('wans',true)
swid('wan3g',wantype3g||contsta3g)
swid('card3g', true false || true false ||signals3g)
failoverenable=(xd.getElementsByTagName("failoverenable")[0].childNodes[0].nodeValue=="1")
failoversta=(xd.getElementsByTagName("failoversta")[0].childNodes[0].nodeValue!="0")
favcntabs=(xd.getElementsByTagName("favcntab")[0].childNodes[0].nodeValue!="4")
favlosharingenable=(xd.getElementsByTagName("favlosharingenable")[0].childNodes[0].nodeValue!="0")
if((failoverenable)||(favlosharingenable)){ document.getElementById("butns").style.display="none"; }
else { document.getElementById("butns").style.display="block"; }
if(favlosharingenable) { swid('failovere',favlosharingenable) }
else  { swid('failovere',failoverenable&&failoversta) }
swid('favcntab',favcntabs)
}
}
function wanstat(xd)
{
wantp=xd.getElementsByTagName("wan")[0].getAttribute("currtype")
tabobj=document.getElementById('wan')
x=xd.getElementsByTagName("col0")
if((wantypenow!=wantp)&&!wantype3g)adjtabrows(tabobj,x.length)
wantypenow=wantp;
for (j=0;j<x.length;j++)
{
xx=tabobj.rows[j]
for (k=0;k<2;k++)
{
kk=(k%2==0)?" : ":""
attr=xd.getElementsByTagName("col"+k)[j].getAttribute("id")
xdn=xd.getElementsByTagName("col"+k)[j].childNodes[0]
if(xdn==null){return} //{xx.cells[k].innerHTML="&nbsp;"}
xdnv=xdn.nodeValue
if((j==2)&&(k==1))xdnv=turnT(xdnv)
xx.cells[k].innerHTML=((attr!=null)?GetElmCont(attr,xdnv):xdnv)+kk;//xdn.nodeValue
if(debugmode)xx.cells[k].style.color="#ff0000";
}
}
}
function turnT(strs)
{//<span id=uptimes></span><span id=uptime style="display:none">
strs1=strs.lastIndexOf(":")
uptms=new Array(strs.substring(strs1-5,strs1-3)
,strs.substring(strs1-2,strs1)
,strs.substring(strs1+1,strs1+3))
usec=parseInt(uptms[0],10)*60*60+parseInt(uptms[1],10)*60+parseInt(uptms[2],10)
strs2=strs.indexOf("</span>")
strss=strs.substring(0,strs2)+TurnTimes(usec)+strs.substring(strs2,strs.length)
return strss
}
function adjtabrows(tab,currow)
{
orgrow=tab.rows.length;
rcel=tab.rows[0].cells.length;
if(orgrow<currow) //InsertRow
{
for(i=0;i<currow-orgrow;i++)
{
y=tab.insertRow(tab.rows.length)
for(j=0;j<rcel;j++)
{
z=y.insertCell(j);
}
}
}
else if(orgrow>currow) { //DeleteRow
for(j=0;j<tab.rows[0].cells.length;j++)
tab.rows[tab.rows.length-2].cells[j].style.borderBottom="0px"
for(i=0;i<orgrow-currow;i++)tab.deleteRow(tab.rows.length-1)
}
}
function drawtab(tab,xd)
{
rowlen=tab.rows.length;
for(i=0;i<rowlen-1;i++)tab.deleteRow(1)
c0=xd.getElementsByTagName("cl0")
rcel=3;
for(i=0;i<c0.length;i++)
{
y=tab.insertRow(tab.rows.length)
for(j=0;j<rcel;j++)
{
z=y.insertCell(j);
xdn=xd.getElementsByTagName("cl"+j)[i].childNodes[0]
z.innerHTML=(xdn)?((xdn.nodeValue=="-")?"N/A":xdn.nodeValue):"&nbsp;";
}
}
}
 