Uy2              0       .  T 1              function GURL(x){location=x+'&csrftok='+get_token();}
function makesure(p,l){if (confirm(p)) GURL(l);}
function MGURL(x){parent.space.location=x+'&csrftok='+get_token();}
function Mmakesure(p,l){if (confirm(p)) MGURL(l);}
function dw(str){document.write(str+"\n")}
function TP()
{
f=document.forms[0];
if(f._IPmode.selectedIndex==0) var DynIP=true;//Dynamic IP
else var DynIP=false;
IPType(DynIP)
}
function IPType(c)
{
if(c)
{
document.forms[0].WI.value="0.0.0.0"
document.forms[0].WN.value="0.0.0.0"
document.forms[0].WG.value="0.0.0.0"
}
document.forms[0].WI.disabled=c
document.forms[0].WN.disabled=c
document.forms[0].WG.disabled=c
}
function clearField()
{
f=document.forms[0];
if(f._IPmode.selectedIndex==0)//Dynamic IP
{
f._1.name="WI"
f._2.name="WN"
f._3.name="WG"
}
}
function chkMTU(H)
{
f=document.forms[0]
if(arguments.length==0)return true
if((f.IM0.value<576)||(f.IM0.value>H))
{
alert(GetElmCont("valchk_0","MTU is invalid!")+" (576<=MTU<="+H+")");
return false;
}
else return true;
}
function SetCkBox(chkbox,ckv,nckv)
{
f=chkbox.form
for(cb=0;cb<f.length;cb++){if(f.elements[cb]==chkbox)break;}
if (!window.ActiveXObject)
{
f.elements[cb-1].style.display="none"
f.elements[cb-1].type="text"
}
f.elements[cb-1].value=(f.elements[cb].checked)?ckv:nckv
}
function SetCkBox_reverse(chkbox,ckv,nckv)
{
f=chkbox.form
for(cb=0;cb<f.length;cb++){if(f.elements[cb]==chkbox)break;}
if (!window.ActiveXObject)
{
f.elements[cb-1].style.display="none"
f.elements[cb-1].type="text"
}
f.elements[cb-1].value=(!f.elements[cb].checked)?ckv:nckv
}
function SetSelBox(selobj,selv)
{
f=selobj.form
for(sb=0;sb<f.length;sb++){if(f.elements[sb]==selobj)break;}
f.elements[sb-1].value=(f.elements[sb].value)
}
var d=new Array(
"Sunday",
"Monday",
"Tuesday",
"Wednesday",
"Thursday",
"Friday",
"Saturday"
)
var m=new Array(
"January",
"February",
"March",
"April",
"May",
"June",
"July",
"August",
"September",
"October",
"November",
"December"
)
var d2=new Array(
"Sun",
"Mon",
"Tue",
"Wed",
"Thu",
"Fri",
"Sat"
)
var m2=new Array(
"Jan",
"Feb",
"Mar",
"Apr",
"May",
"Jun",
"Jul",
"Aug",
"Sep",
"Oct",
"Nov",
"Dec"
)
function turnTime(c)
{
date=c.getDate()<10?"0"+c.getDate():c.getDate()
hour=c.getHours()<10?"0"+c.getHours():c.getHours()
min=c.getMinutes()<10?"0"+c.getMinutes():c.getMinutes()
sec=c.getSeconds()<10?"0"+c.getSeconds():c.getSeconds()
return d2[c.getDay()]+" "+m2[c.getMonth()]+" "+date+", "+c.getFullYear()+" "+hour+":"+min+":"+sec
}
function op(b,e,d)
{
var o=""
for(i=b;i<=e;i++)
{
o+="<OPTION value="+i+">"
if(i<10) o+="0"
o+=i
if(arguments.length==3)i=i+d-1
}
return o
}
weekval2=new Array(0x01,0x02,0x04,0x08,0x10,0x20,0x40)
weekcycle=weekval2.concat(weekval2)
daytimestart="00:00"
daytimeend="23:59"
timehiddenmark="thmark"
wdmark="weekdaymark"
weekdays=7
function locate(fm,dest)
{
for(var j=0;j<fm.length;j++)
{
if(fm.elements[j].name==dest) break;
}
return j;
}
/*******************************************************************/
/*   function pushsche(tp, fm, paraformat)                         */
/* tp=1 : D-Link style schedule                                    */
/* [parameter format] - time_s,time_e,weekday_s,weekday_e          */
/* tp=2 : BELKIN style schedule                                    */
/* [parameter format] - time_s,time_e,weekday_s,weekday_e          */
/* tp=3 : SMC style schedule                                       */
/* [parameter format] - time_s,time_e,weekday1,weekday2,weekday3...*/
/*******************************************************************/
function pushsche(tp, fm, paraformat)
{
sche_hs=new Array()
for(i=0;i<=7*3;i++)sche_hs[i]=""
if(tp==1) //D
{
time_s=paraformat[0]
time_e=paraformat[1]
weekday_s=paraformat[2]
weekday_e=paraformat[3]
if(weekday_s>weekday_e)weekday_e=parseInt(weekday_e)+7;
tix=0
for(ti=weekday_s;ti<=weekday_e;ti++)
{
sche_hs[tix]=weekcycle[ti]
sche_hs[tix+1]=time_s
sche_hs[tix+2]=time_e
tix+=3
}
}
if(tp==2) //B
{
time_s=paraformat[0]
time_e=paraformat[1]
weekday_s=paraformat[2]
weekday_e=paraformat[3]
if(weekday_s>weekday_e)weekday_e=parseInt(weekday_e)+7;
tix=0
for(ti=weekday_s;ti<=weekday_e;ti++)
{
if(ti==weekday_s)
{ //First day
sche_hs[tix]=weekcycle[weekday_s]
sche_hs[tix+1]=time_s
sche_hs[tix+2]=daytimeend
}
else if(ti==weekday_e)
{ //Last day
sche_hs[tix]=weekcycle[weekday_e]
sche_hs[tix+1]=daytimestart
sche_hs[tix+2]=time_e
}
else
{ //other days (set to all day)
sche_hs[tix]=weekcycle[ti]
sche_hs[tix+1]=daytimestart
sche_hs[tix+2]=daytimeend
}
tix+=3
}
}
if(tp==3) //S
{
time_s=paraformat[0]
time_e=paraformat[1]
shifted = paraformat.shift();
shifted = paraformat.shift();
tix=0
for(ti=0;ti<paraformat.length;ti++)
{
sche_hs[tix]=paraformat[ti]
sche_hs[tix+1]=time_s
sche_hs[tix+2]=time_e
tix+=3
}
}
for(hc=0;hc<sche_hs.length;hc++)
{
fm.elements[thmarkix+hc+1].value=sche_hs[hc]
}
fm.submit()
}
function popsche(tp,f)
{
sche_hl=new Array()
hc=0;
while(f.elements[thmarkix+hc+1].value!=0)
{
sche_hl[hc]=f.elements[thmarkix+hc+1].value
hc++
}
if(sche_hl.length==0)return sche_hl
if((tp==1)||(tp==2))
{
weekday_s=wday(sche_hl[0])
weekday_e=wday(sche_hl[sche_hl.length-3])
time_s=sche_hl[1]
time_e=sche_hl[sche_hl.length-1]
returnArray=new Array(time_s,time_e,weekday_s,weekday_e)
return returnArray
}
if(tp==3)
{
time_s=sche_hl[1]
time_e=sche_hl[sche_hl.length-1]
returnArray=new Array(time_s,time_e)
for(i=0;i<sche_hl.length/3;i++)
returnArray[returnArray.length]=sche_hl[i*3]
return returnArray
}
}
function wday(x)
{
for(i=0;i<weekval2.length;i++){if(weekval2[i]==x)return i}
}
function togglewd(f,ckitem)
{
c=0;
if(ckitem.name=='evdayck') // Everyday is clicked
{
for(j=0;j<weekdays;j++)
f.elements[wdmix+j+1].checked=ckitem.checked
}
else // One of weekday is clicked
{
for(j=0;j<weekdays;j++)
{
if(!f.elements[wdmix+j+1].checked){c=0;break;}
else c++
}
f.evdayck.checked=(c==weekdays)
}
}
function seldaytime()
{
document.forms[0].daytime[1].checked=true;
}
function saveResult(sc)
{
if(document.getElementById('_sr_')==null) dw("<div id='_sr_'></div>")
idsr=document.getElementById('_sr_')
if(arguments.length>0) {
msg = (sc == "0") ? GetElmCont("wary_71","No change!") : GetElmCont("wary_70","Saved!");
idsr.innerHTML="<font color=red>"+msg+"</font>";
}
else {
}
swid(idsr,(arguments.length>0))
}
function rebomsgs(scs)
{
if(arguments.length<=0)rmsg=""
else if(scs == 0) rmsg=GetElmCont("wary_71","No change!")
else rmsg=GetElmCont("wary_90","Saved! The change doesn't take effect until router is rebooted.")
SetElmCont("_sr_","<font color=red>"+rmsg+"</font>")
swid("_sr_",(arguments.length>0))
if(document.getElementById("_awary_38_")!=null)
document.getElementById("_awary_38_").style.display=((arguments.length>0)&&(scs != 0))?'inline':'none';
}
function hideAllDiv(aryss)
{
str_ary=aryss.toString()
arys=str_ary.split(",")
for(i=0;i<Math.floor(arys.length/2)*2;i++)
{
swDiv(arys[i],0)
}
}
function DisplayMenu(idd,fromAry)
{
ary=new Array();
ary=ary.concat((arguments.length>1)?fromAry:div_id);
hideAllDiv(ary)
hideAllDiv(div_ses)
if(ary[idd].indexOf(',')==-1)
{
dwt=ary[idd]
}
else
{
dis=ary[idd].split(',')
dwt=dis[0]
for(d1=1;d1<dis.length;d1++)
{
swDiv(dis[d1],1)
}
}
swDiv(dwt,1)
}
function swDiv(divID,divStyle)
{
for(p=0;p<arguments.length/2;p++)
{
if(arguments[p*2+1]==0)      dStyle='none';
else if(arguments[p*2+1]==1) dStyle='block';
else dStyle=arguments[p*2+1]
ww=document.getElementById(arguments[p*2])
if(ww!=null)  ww.style.display = dStyle;
}
return divID+" -> "+dStyle
}
function xDiv(divID,divx)
{
for(p=0;p<arguments.length/2;p++)
{
ww=document.getElementById(arguments[p*2])
if(ww!=null)  ww.disabled = !(arguments[p*2+1])
}
}
function createXHR()
{
var xhr = false;
if (window.XMLHttpRequest) {
xhr = new XMLHttpRequest();
if (xhr.overrideMimeType) {
xhr.overrideMimeType('text/xml');
}
} else if (window.ActiveXObject) {
try {
xhr = new ActiveXObject("Msxml2.XMLHTTP");
} catch (e) {
try {
xhr = new ActiveXObject("Microsoft.XMLHTTP");
} catch (e) {}
}
}
return xhr;
}
function displaymsg(msg,div)
{
if(document.all) eval("document.all."+div+".innerHTML='"+msg+"'")
else if (document.getElementById) document.getElementById(div).innerHTML=msg
}
function tt(i)
{
return i<10 ? "0"+i : i
}
function hhmmss(t)
{
ss=tt(t%60); t=(t-ss)/60
mm=tt(t%60); t=(t-mm)/60
hh=tt(t)
return hh+":"+mm+":"+ss
}
function SetElmCont2(idx,cont)
{
ddiv=document.getElementById(idx)
if(ddiv!=null) ddiv.innerHTML=cont
}
function GetElmCont2(idx,dcont)
{
ddiv=document.getElementById(idx)
if(ddiv!=null) return ddiv.innerHTML
else return dcont
}
function icl(fn){includejs(fn)}
function iclifm(iffn)
{
var t=new Date();ztv='rc='+t.getTime()
aa=(arguments.length<2)?"":(searchpath+"&")
srcv=iffn+".htm?"+aa+ztv
dw("<iframe src='"+srcv+"' style='display:none' name='"+iffn+"' frameborder=0 scrolling=no></iframe>")
}
function clrsel(b)
{
cfrom=(arguments.length==1)?0:arguments[1]
bl=b.length
for(j=0;j<bl-cfrom;j++)
{
b.options[cfrom].value=""
b.options[cfrom]=null
}
}
function pushselopt(sel,stext,sval)
{
sopt=new Option(stext,sval)
sellen=sel.length
sel.options[sellen]=sopt
}
function findInArr3(findkey,arr)
{
if(arr.length==0)return false
for (x in arr)
{
if(arr[x] == findkey)return x
}
return false
}
function strcut(strs,maxlen,strtail)
{
return (strs.length<=maxlen)?strs:(strs.substr(0,maxlen)+strtail)
}
function setck()
{
for(p=0;p<arguments.length/2;p++)
{
ww=document.getElementById(arguments[p*2])
if(ww!=null)  ww.checked = (arguments[p*2+1])
}
}
function incifrm(fn)
{
dw("<iframe name='hid' id='hid' src='/"+fn+"' style='display:none'></iframe>")
}
function iclifm2(iffn,urls)
{
var t=new Date();ztv='rc='+t.getTime()
aa=(arguments.length<2)?"":arguments[1]
srcv=urls+".htm?"+aa+ztv
if(arguments.length>2)
dw("<iframe style='display:none' id='"+iffn+"' name='"+iffn+"' frameborder=0 scrolling=no src='"+srcv+"'></iframe>")
else dw("<iframe style='display:none' id='"+iffn+"' name='"+iffn+"' frameborder=0 scrolling=no></iframe>")
}
function diid(divs,tf)
{
ddiv=document.getElementById(divs)
if(ddiv!=null)
{
ddiv.disabled=!tf;
ddiv.style.display=(tf)?'inline':'none';
}
}
function diids(divs,tf)
{
ddiv=document.getElementById(divs)
if(ddiv!=null)
{
ddiv.disabled=!tf;
}
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
function rlist(xmlurl,fr)
{
xmlDoc=null;
xmlDoc=loadXMLDocs(xmlurl);
if(xmlDoc==null)return;
z=xmlDoc.getElementsByTagName("item")
if(z==null)return;
if(z.length <= 0)return;
for(j=0;j<z.length;j++)
{
zn=z[j].childNodes[0]
nv=(zn!=null)?zn.nodeValue:"&nbsp;"
ddiv=document.getElementById(z[j].getAttribute("name"))
if(ddiv!=null){
ddiv.innerHTML=(nv=="")?"&nbsp;":nv //change value
}
}
if(fr=="status"){                 //from status.htm
}
else if(fr=="no_chglang") return; //第一次進入status.htm時,跑完sta_refresh.xml不要run chgLang(1),不然status.htm會重覆run chgLang(1)
/*
status在xml reload時有一些string可能被重新取代, ex. "enable" "disable" "connect" "disconnect"
這些string會變成英文
比較好的方法是應該只翻譯有變的string
做法是在xml裡的span id命名為 "_1~xml" 或 "_atbox_1~xml"
它會取代status.htm裡的span
然後run chgLang(1)...在lang.js翻譯字串時,就只翻譯id結尾是~xml的string
*/
chgLang(1) //部份翻譯only
}
function rlists(xmlurls,frs)
{
rlist(xmlurls,frs)
setTimeout("rlists('"+xmlurls+"','"+frs+"')",staret*1000)
}
 