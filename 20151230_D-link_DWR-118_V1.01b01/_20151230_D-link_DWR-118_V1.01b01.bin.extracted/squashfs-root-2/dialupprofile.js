Uy2              `       \  T 1T Mc�   Mb� cbrTC1T Mc�   Mb� cbrT�1�`! 0T 2T�1  dprofiles=new Array()
country=new Array()
telecom=new Array()
nettype=new Array(
"*99#" //WCDMA/HSPA
,"#777" //CDMA2000/EV-DO
)
telc=new Array()
manuals=new Array(
"cou"
,"tel"
,"auth"
,"dns1"
,"dns2"
)
manuals2=new Array(
"apn"
,"din"
,"psw_user"
,"psw_3g"
,"psw_3g_ver"
)
fm=document.forms[0]
//fillfields=new Array(fm N?,fm001E0005S?,fm001E0003S?,fm001E0001S?,fm001E0002S?,fm001E0008I?,fm001E0009I?)
fillfields=new Array("N ","S001E2050","S001E2030","S001E2010","S001E2020","I001E2080","I001E2090")
function rmimisi()
{
var t=new Date();
parent.space.location='/space.htm?Nrmimisi=999&ZT='+t.getTime();
}
function chgprof(objv)
{
for(p=0;p<manuals.length;p++)
{
diid(manuals[p],objv==1)
diids(manuals2[p],objv==1)
}
swids('swprofile',true)
}
ct=new Array()
function chg3gcnttype(cntype)
{
fm=cntype.form
fm.N001E000C.disabled=(cntype.value=="1")
diid('maxitime',(cntype.value!="1"))
}
function chgsche(sobj)
{
swids('newschebut',sobj.selectedIndex==sobj.length-1)
}
function setrule(scheno, Nfrom,Nfromrule)
{
openwin("rule.htm?Nrule="+getemptyid()+"&Nfrom=5",595,465)
}
function getemptyid()
{
xmlDoc=loadXMLDocs("schelist.xml");
x=xmlDoc.getElementsByTagName("rule")
ruleno=x.length
z=xmlDoc.getElementsByTagName("emptyrule")
return z[0].getAttribute("id")
}
function showcsel(tp)
{
cselobj=document.getElementById('countrysel')
cselc=0;
for(i=0;i<dprofiles.length;i++)
{
if(dprofiles[i]=="")continue;
pary=dprofiles[i].split(",")
if(pary.length<fillfields.length+2){for(p=pary.length;p<fillfields.length+2;p++)xx=pary.push("");}
if(!findInArr3(pary[0],country))
{
country[country.length]=pary[0]
pushselopt(cselobj,pary[0],cselc) //i+"0")
cselc++;
}
}
if(arguments.length==0)showtsel(0)
}
function showtsel(ix)
{
cselobj=document.getElementById('countrysel')
tselobj=document.getElementById('telecomsel')
clrsel(tselobj)
tselc=0;
for(i=0;i<dprofiles.length;i++)
{
if(dprofiles[i]=="")continue;
pary=dprofiles[i].split(",")
if(pary.length<fillfields.length+2){for(p=pary.length;p<fillfields.length+2;p++)xx=pary.push("");}
if(pary[0]==country[ix])
{
pushselopt(tselobj,pary[1],tselc)
telc[tselc]=""
for(ii=0;ii<fillfields.length;ii++)
{
telc[tselc]+=pary[ii+2]
if(ii!=fillfields.length-1)telc[tselc]+=","
}
tselc++;
}
}
if(ix<country.length-1)
{
pushselopt(tselobj,"Others",tselc)
telc[tselc]=""
for(ii=0;ii<fillfields.length;ii++)telc[tselc]+=","
tselc++;
}
tselobj.selectedIndex=0;
if(arguments.length>1)fillinfo(tselobj,telc)
if(document.forms[0]._S001E2020!=null)
{
document.forms[0]._S001E2020.value=document.forms[0].S001E2020.value
}
else if(document.forms[0]._pw0x10!=null)
{
document.forms[0]._pw0x10.value=document.forms[0].S001E2020.value
}
}
function fillinfo(obj)
{
fm=obj.form
pary=telc[obj.selectedIndex].split(",")
for(i=0;i<fillfields.length;i++)
{
eval("fillfieldsi=fm."+fillfields[i])
if(i==0)
{
fillfieldsi.selectedIndex=(pary[i]=="CDMA")?1:0
}
else if((fm.wiz_loc==null)&&((i==5)||(i==6)))// clear DNS,and do this must from prim.htm,not wizard`s prim
{
fillfieldsi.value=""
}
else if(fillfieldsi!=null) fillfieldsi.value=pary[i]
}
if(document.forms[0]._S001E2020!=null)
{
document.forms[0]._S001E2020.value=document.forms[0].S001E2020.value
}
else if(document.forms[0]._pw0x10!=null)
{
document.forms[0]._pw0x10.value=document.forms[0].S001E2020.value
}
}
function netype(sobj)
{
sobj.form.S001E0005.value=nettype[sobj.selectedIndex]
}
function readdif(dprofiles)
{
aryxx = dprofiles.splice(0, 0, "");
aryxx = dprofiles.push("Others,Others,,,");
showcsel()
setTimeout("chgprof( )",300);
div=document.getElementById('countrysel')
if(div!=null)div.selectedIndex=cseled
showtsel(cseled)
div=document.getElementById('telecomsel')
if(div!=null)div.selectedIndex=tseled
div=document.getElementById('networksel')
if(div!=null)div.selectedIndex=nseled
swids('loadmsg',false,'coutel',true)
}
acc=0
function doss()
{
var tss=new Date()
if(dprofiles.length==0)
{
if(acc==0)
{
document.getElementById(dlprfn).src=dlprfn+".htm?ZT="+tss.getTime()
setTimeout("doss()",500);
acc++
}
else
{
setTimeout("doss()",500);
acc++;
}
}
else readdif(dprofiles)
}
setTimeout("doss()",500);
 