Uy2          P   �       5  0 EShenv Suobj Ngennewpin Nrebo                T 1�`  �xc Mc Mb�  �cbQ�` �  Q�T)1T41� 0 2T�+1� C 0 2T�+1     function GURL(x){var t=new Date();location=x+'&ZT='+t.getTime()+'&csrftok='+get_token();}
function makesure(p,l){if (confirm(p)) GURL(l);}
function MGURL(x){var t=new Date(); parent.space.location=x+'&ZT='+t.getTime()+'&csrftok='+get_token();}
function Mmakesure(p,l){if (confirm(p)) MGURL(l);}
function tGURL(x){var t=new Date(); top.location=x+'&ZT='+t.getTime();}
function tmakesure(p,l){if (confirm(p)) tGURL(l);}
function dw(str){document.write(str+"\n")}
function clk(link)
{
var links=link;
if((link.indexOf(':')==-1)&&(link.indexOf('.')==-1)&&(link.indexOf('=')==-1))
{
c0=(link=='fwug')?"&N8002F001=0&N8002F002=0":""
links="/"+link+".htm?rc="+c0
}
return links
return links
}
function xSetElmCont(idx,cont)
{
ddiv=document.getElementById(idx)
if(ddiv!=null) ddiv.innerHTML=cont
}
function xGetElmCont(idx,dcont)
{
ddiv=document.getElementById(idx)
if(ddiv!=null) return ddiv.innerHTML
else return dcont
}
function showTopMenu(topID,leftID,bn)
{
pageName=leftID;
if(arguments.length==3)formbuts_display=false;
dw("<div id=topmenuDIV>")
dw("<table cellspacing=1 cellpadding=2 width=838 align=center bgcolor=#ffffff border=0><tr id=TopmenuTR>")
dw("<td background=/"+MN_img+" id=modelno><span>"+MN+"</span></td>")
for(i=0;i<TopMenuID.length;i++)
{  //Create Top Menu Link Array
if(LeftMenuID[i][0].indexOf("~")==-1)
tlk=new Array(LeftMenuID[i][0])
else tlk=LeftMenuID[i][0].split("~")
TopMenulk[i]=(tlk.length>1)?tlk[1]:tlk[0]
}
for(i=0;i<TopMenuID.length;i++)
{
if(TopMenuID[i]==topID)
{
tmid=i;
break;
}
}
for(j=0;j<LeftMenuID[tmid].length;j++)
{
if(LeftMenuID[tmid][j].indexOf("~")==-1)
lms=new Array(LeftMenuID[tmid][j])
else lms=LeftMenuID[tmid][j].split("~")
LeftMenulk[j]=(lms.length>1)?lms[1]:lms[0]
}
for(j=0;j<LeftMenuID[tmid].length;j++)
{
if(LeftMenuID[tmid][j].indexOf("~")==-1)
lms=new Array(LeftMenuID[tmid][j])
else lms=LeftMenuID[tmid][j].split("~")
if(lms[0]==leftID)
{
lmid=j;
lmlk=(lms.length>1)?lms[1]:lms[0];
break;
}
}
for(k=0;k<TopMenuNames.length;k++)
{
sty=(k==tmid)?"id=TopmenuSel":"class=Topmenuhover";
dw("<td "+sty+"><a href='"+clk(TopMenulk[k])+"'>"+TopMenuNames[k]+"</a></td>")
}
dw("</tr></table></div>")
return
}
function showLeftMenu()
{//LeftMenuID[tmid]
for(l=0;l<LeftMenulk.length;l++)
{
sty=(l==lmid)?" id=active":"";
dw("<li "+sty+" class=upcase><a href='"+clk(LeftMenulk[l])+"'>"+LeftMenuNames[tmid][l]+"</a></li>")
}
}
function splits(strs,splitby)
{
if(strs.indexOf(splitby)==-1)
ary=new Array(strs)
else ary=strs.split(splitby)
return ary
}
function submitFuncs()
{
if(document.forms['main'])mfm=document.forms['main']
else mfm=document.forms[0]
if(submitFunc!="")
{
if(eval(submitFunc))mfm.submit()
}
else mfm.submit()
}
function resetFuncs()
{
if(document.forms['main'])mfm=document.forms['main']
else mfm=document.forms[0]
if(resetFunc!="")
{
mfm.reset()
eval(resetFunc)
}
else mfm.reset()
mfm.reset() //this.form.reset();
clear_valchk_for_undo()
}
function formButs(x)
{
xflag=(AP_Mode&&!inArr(APModeFuncAry,pageName))?" disabled":""
buts="<input type=button id=_others_0 value=\"Save Settings\" onclick=\"submitFuncs()\" "+xflag+">"
buts+="&nbsp;"
buts+="<input type=button id=_others_0 value=\"Don't Save Settings\" onclick=\"resetFuncs()\""+xflag+">"
buts1="<input type=button id=_others_0 value=\"Save Settings\" onclick=\"submitFuncs()\" "+xflag+">"
buts1+="&nbsp;"
buts1+="<input type=button id=_others_0 value=\"Don't Save Settings\" onclick=\"resetFuncs()\""+xflag+">"
rebootbut="&nbsp;<input type=button id=_rebo_0 value=\"Reboot Now\" onclick=\"GURL('/uir/rebo.htm?Nrd=0')\" "+xflag+">"
headerbuts=document.getElementById("headerbut")
topbuts="<br><br>"+buts +rebootbut 
bottombuts="<br>"+buts1
if((headerbuts!=null)&&formbuts_display)
headerbuts.innerHTML=topbuts
formbutss=document.getElementById("FormButns")
if((formbutss!=null)&&formbuts_display) formbutss.innerHTML=bottombuts
return (arguments.length==0)?buts:""
}
FormDesctmp=""
function showFormHeader()
{  //tmid,lmid
desc2=splits(FormHeader[tmid][lmid],"~")
desc=splits(desc2[0+pageExtend],"|")
descstr="<h1>"+desc[0]+"</h1>"
descstr+=desc[1]+"<span id=headerbut></span>"
SetElmCont('FormDesc',descstr)
FormDesctmp=GetElmCont('FormDesc','') //descstr
rebomsgstr=new Array("Restart Router","<div id='cmsg'><span id=_8>The device is rebooting...</span><br><br>Please <font color=red><b>DO NOT POWER OFF</b></font> the device.<br><br>And please wait for <span id='clock' style='color:#FF3030;'>30</span> seconds...<br><br></div>","<div style='display:none' id='recon'>Please reconnect manually.<br><br>Note! Your LAN IP might change, Please reconnect.<br><br><input type=button id=_rebo_0 value='Click here to reconnect' onclick='gohome()'><br><br></div>")
msgstr=new Array("","","");
_gorelopage = true ;
keepvalue_arry = keepvalue.split("|")
_keepvalue=(keepvalue_arry[0]=="1")?keepvalue_arry[1]:""
relopage=location.pathname+"?RC=@"+_keepvalue
if(Ngennewpin==1) { chgsaved='' }
if(chgsaved=="0") { msgstr=new Array(GetElmCont("others_0","No change!"),GetElmCont("others_0","No change!"),"<input type=button id=_others_0 value='Continue' onclick=\"swids('topmenuDIV',true,'MainContent',true,'savealt',false)\">") }
else if(((location.pathname=="/internet_prim.htm")&&(chgsaved!=""))||
((location.pathname=="/wpa.htm")&&(chgsaved!=""))||
((location.pathname=="/atbox.htm")&&(Nrebo==1)&&(chgsaved!=""))||
((location.pathname=="/lanst.htm")&&(Nrebo==1)&&(chgsaved!=""))
)
{
_gorelopage = false ;
msgstr=new Array("REBOOT NEEDED...."
,"Your changes have been saved. The router must be rebooted for the changes to take effect.<br>You can reboot now, or you can continue to make other changes and reboot later.<br>"
,"<input type=button id=_rebo_0 value='Reboot Now' onclick=\"GURL('/uir/rebo.htm?Nrd=0')\">&nbsp;&nbsp;&nbsp;"
+"<input type=button id=_rebo_0 value='Reboot Later' onclick=\"GURL(relopage+'&N80200060=1')\">"
)
}
else if(chgsaved!="") { msgstr=new Array(GetElmCont("others_17","Settings Saved!"),GetElmCont("others_0","The change takes effective immediately!"),GetElmCont("others_0","System is processing, please wait a few seconds ...")) }
saveresultstr="<table class=box3 align=center border=0><tr><td><br><table width=80% align=center><tr><td id='box_header'><h1>"+msgstr[0]+"</h1><br><center><br>"+msgstr[1]+"<br><br>"+msgstr[2]+"<br></center></td></tr></table><br></td></tr></table>"
addrebobun_page="<table width=98%><tr><td id='box_header'><h1>"+msgstr[0]+"</h1>"+msgstr[1]+"<br>"+msgstr[2]+"</td></tr></table>"
if(!_gorelopage&&(chgsaved!="0"))  // with menu show save stutas
{
SetElmCont('rebosavealt',addrebobun_page);
swids('mainformsp',false,'FormDesc',false,'rebosavealt',true);
}
else if((chgsaved!="")||(chgsaved=="0"))   // all page show save stutas(No menu)
{
SetElmCont('savealt',saveresultstr);
swids('topmenuDIV',false,'MainContent',false,'savealt',true)
}
if(_gorelopage&&(chgsaved!="")&&(chgsaved!="0"))
{
retid=setTimeout("swids('topmenuDIV',true,'MainContent',true,'savealt',false)",4000);
}
}
function showHints()
{  //tmid,lmid
hints2=splits(Hints[tmid][lmid],"~")
hints=splits(hints2[0+pageExtend],"|")
hintstr="<strong>"+GetElmCont('others_10','Helpful Hints..')+"</strong><br><br>"
for(h=0;h<hints.length;h++)
{
if(hints[h]!="-")
hintstr+="&nbsp;&#149;&nbsp; "+hints[h]+"<BR><BR>"
if(hints[0]=="")swelm("hint",false)
}
hintstr+="<a href='/h-"+helps[tmid]+".htm#"+TopMenulk[lmid]+"'>"+GetElmCont('others_11','More...')+"</a>"
hintarea=document.getElementById("HintTD")
if(hintarea!=null)hintarea.innerHTML=hintstr
}
function showsta(xml,xmlDoc)
{
var t=new Date()
if(arguments.length==1)xmlDoc=loadXMLDocs(xml+"?ZT="+t.getTime());
if(xmlDoc==null)return;
z=xmlDoc.getElementsByTagName("cnt_status")[0].childNodes[0]
t=xmlDoc.getElementsByTagName("telephone_status")[0].childNodes[0]
if(z==null)return
if(z.length <= 0)return
if(t==null)return
if(t.length <= 0)return
cntv=z.nodeValue
SetElmCont("wanctstat",cntv)
swid("wan_online",(cntv==2),"wan_offline",(cntv!=2))
swid("telephone_online",(t.nodeValue==1),"telephone_offline",(t.nodeValue!=1))
}
function timeoutCount()
{
GURL("/log/out?rd=/loginpage.htm&Nrd=3")
}
function setIndexTitle()
{
toptl=GetElmCont("others_20","ROUTER")+" : "+TopMenuNames[tmid]+" / "+LeftMenuNames[tmid][lmid];
toptlx=GetElmCont("others_20","ROUTER")
self.title=(login)?toptl:toptlx;
top.document.title=(login)?toptl:toptlx;
}
var timerID = null;
function init()
{
nowt=new Date();
if(admintout>10)setTimeout("timeoutCount()",admintout*1000);
}
EmptyEntry=new Array()
function FindEmptyEntry(ary,no,cp,ci)
{
if(arguments.length>=3)ii=cp
else ii=0
if(arguments.length==4)cc=ci
else cc=""
EmptyCount=0
for(EmpID=0;EmpID<ary.length/no;EmpID++)
{
if(ary[EmpID*no+ii]==cc)
{
EmptyEntry[EmptyEntry.length]=EmpID
EmptyCount++;
}
}
return EmptyCount;
}
function op(b,e,d)
{
var o=""
for(i=b;i<=e;i++)
{
o+="<OPTION>"
if(i<10) o+="0"
o+=i
if(arguments.length==3)i=i+d-1
}
return o
}
function sbn(bnt,bnv,act,style)//show button
{
if(arguments.length==1)bnv=""
if(bnt==3){dw("<INPUT TYPE=BUTTON VALUE=\"Reboot\" OnClick=\"makesure('Reboot right now?','/cgi-bin/rebo?D=')\"><BR>");return}
else if(bnt==5){dw("<FORM><INPUT TYPE=BUTTON VALUE=\"Back\" OnClick=\"history.go(-1)\"></FORM>");return}
else if(bnt==0){bt="SUBMIT";if(bnv=="")bnv="Save Settings"}
else if(bnt==1){bt="RESET";if(bnv=="")bnv="Don't Save Settings"}
else if(bnt==4){bt="BUTTON";if(bnv=="")bnv="Help"}
else bt="BUTTON"
bnv=bnv
str="<INPUT TYPE="+bt+" class=submit VALUE=\""+bnv+"\""//str="<INPUT TYPE="+bt+" VALUE=\""+bnv+"\" class=submit onmouseout=\""+this.className+"\" = 'submit' onmouseover=\""+this.className+"\" = 'submitHover'"
if(arguments.length>=3) str=str+" ONCLICK=\""+act+"\""
if(arguments.length>=4) str=str+" "+style
dw(str+"> \n")
}
function lMAC(j,mac)
{
a=mac.split("-")
for(i=0;i<6;i++) document.forms['main'].elements[i+j+1].value=a[i]
}
function sMAC(j)
{
var MAC=""
for(s=0;s<6;s++){
var mac_str=document.forms['main'].elements[s+j+1].value;
mac_str=mac_str.toUpperCase();
if(mac_str.length==1) mac_str="0"+mac_str;
if(check_hex(mac_str))
{
MAC+=mac_str;
if(s!=5) MAC+="-"
}
}
return (MAC.length==17)?MAC:""
}
function swelm(div,sw)
{
ddiv=document.getElementById(div)
if(ddiv!=null)ddiv.style.display=(sw)?'block':'none';
}
function locate(dest,starts)
{
fm=document.forms['main']
if(arguments.length==1)loci=0
else
{
for(var loci=0;loci<fm.length;loci++)
{
if(fm.elements[loci].name==starts) break;
}
}
for(var locj=loci;locj<fm.length;locj++)
{
if(fm.elements[locj].name==dest) break;
}
return locj;
}
function setSubmitButns(butnary, msg)
{
strs="";
for(fb=0;fb<barys.length/2;fb++)
{
strs+="<INPUT TYPE=button VALUE='"+butnary[2*fb]+"' "
strs+=" onclick=\""+butnary[2*fb+1]+"\">"
strs+="&nbsp;"
}
if(arguments.length>1) strs+=" &nbsp; "+msg
SetElmCont("FormButns","<p>"+strs)
SetElmCont("headerbut","<BR><BR>"+strs)
}
function locates(fm,dest)
{
for(var j=0;j<fm.length;j++)
{
if(fm.elements[j].name==dest) break;
}
return j;
}
function reborouter()
{
tmakesure(GetElmCont("others_3","Reboot Router?"),'/uir/rebo.htm?Nrd=0')
}
function tempchglang(lgsel)
{
fm=lgsel.form
if(location.pathname == "/internet_primf.htm") localpath="/internet_failover.htm"
else localpath=location.pathname
if(" " == 0) { failovsh="&Nlf=0" }
else  if(" " == 0)failovsh="&Nlf=1"
else failovsh="&Nlf=2"
loc=String(localpath+"?N0002000F="+lgsel.value+"&_sck=httpd&Nlang="+lgsel.value+failovsh)
GURL(loc)
}
function disableNoUseElm(ee)
{
f=document.forms['main']
fs=locate("_eny_start")
fe=locate("_eny_end")
if((location.pathname=="/prim.htm")||(location.pathname=="/uir/prim.htm")||(location.pathname=="/wanwiz.htm")) { elms=splits(wispDivItm[ee],"|") }
else { elms=splits(DivItm[ee],"|") }
for(e=fs;e<fe;e++) {  f.elements[e].disabled=!inArr(elms,f.elements[e].name) }
}
function loadwpajs(n){
dw("<script type='text/javascript' src='wpa.js?rc=&Nrule="+n+"'></script>")
}
function showlangsel(nlg)
{
if(login&&langselection){
langsel="&nbsp; <select id='langoption' style=\"background:#F1F1F1\" class=toptitle onchange='tempchglang(this)'>"
for(s=0;s<langnames.length;s++){
langsel+="<option value="+(s+1)+" id='_alangnames_"+s+"_' "+((nlg == s+1) ? " selected" : "")+">"+langnames[s]
}
langsel+="</select>"
} else {langsel="&nbsp;" }
if(arguments.length==1)dw(langsel+"&nbsp;")
else return langsel;
}
function savechgmsg(){
dw("<div class=statusMsg style='display:none' id=statusmsg><span id=_others_0>Setting completed</span></div>")
if((chgsaved != "")&&(chgsaved != "0"))document.getElementById('statusmsg').style.display=""
}
function waitchgmsg(){
dw("<div class=statusMsg style='display:none' id=statusmsg><span id=_others_0>Please wait a few seconds ...</span></div>")
if((chgsaved != "")&&(chgsaved != "0"))document.getElementById('statusmsg').style.display=""
}
function waitchgmsg2(){
if((chgsaved != "")&&(chgsaved != "0")){
document.getElementById('statusmsg').innerHTML="<span id=_others_0>Setting completed</span>"
}
}
function submitbtn(um,up){
document.getElementById(um).disabled=((up == false)?true:false)
document.getElementById(um).className=((up == false)?'submitdisabled':'submit')
}
function disfield(sw)
{
f=document.forms['main']
wlans=locate("_eny_start")
wlane=locate("_eny_end")
for(w=wlans;w<wlane;w++)
{
f.elements[w].disabled=!sw
}
}
function get_token(){
xmlDoc=loadXMLDocs("/csrf.xml");
if(xmlDoc.getElementsByTagName("token")[0].childNodes[0]!=null){
rv=xmlDoc.getElementsByTagName("token")[0].childNodes[0].nodeValue;
return rv;
}
}
 