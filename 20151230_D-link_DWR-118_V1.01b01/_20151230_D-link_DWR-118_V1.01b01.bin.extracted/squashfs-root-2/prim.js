Uy2         0   �      p/   ENn3g        �� T 1 Mb��bP `�T Mb�  ��bQ�` �  � AT-1��T21��T91�T=1�  xc McT Mb�  �cbQ�` �  � AT.1P3 Ta1T Mc�  Mb� cbrT{1T Mc� C Mb� cbrT�1T�1T Mc�  Mb� cbrT�1T Mc�  Mb� cbrT#1�  xc McTc Mb�  �cbQA` �  �4 AT?1T Mc�  Mb� cbrTY1T Mc� C Mb� cbrT�1T�1T Mc�  Mb� cbrTa1T Mc�  Mb� cbrT�1T Mc�  Mb� cbrT�1�  xc McT Mb�  �cbQ�` �  � AT�1T�1�  0 2T�1��C Mb� �brTJ'1��C Mb� �brT^'1� C Mb� �brT�'1� Mb� �brT�'1� C Mb� �brT�'1� �Mb� C � b0 2T�'1� Mb� �brT&(1� Mb� �brT�(1� ! 0Tb)1ԐC Mb� �brT*1ԐC Mb� �brT)*1�C Mb� �brTG*1�C Mb� �brTS*1��! 0T 2T5+1�C Mb� �brT,1�C Mb� �brTu,1             div_id=new Array(
"_0x20,backup3g" //,mnatBtn" //Static IP Address
,"_0x00,backup3g" //,mnatBtn" //Dynamic IP Address
,"_0x40,ses0,backup3g,_0x40_dns"      //PPP over Ethernet/Multisession PPPoE
,"_0x60,backup3g"      //PPTP
,"_0x80,backup3g"      //L2TP
,"_0x10"      //3G
,"")
div_ses=new Array(
 "ses ,masel ",
 "ex"
)
function chkaddmode(p){
fp=document.forms[0]
if(p=="pptp"){
if((fp.N00050E00[1].checked)&&(fp.I00050300.value==""||fp.I00050400.value==""||fp.I00050500.value=="")){
alert(GetElmCont("prims_12","setting invalid!"))
return false;
}
}
if(p=="l2tp"){
if((fp.N00060E00[1].checked)&&(fp.I00060300.value==""||fp.I00060400.value==""||fp.I00060500.value=="")){
alert(GetElmCont("prims_12","setting invalid!"))
return false;
}
}
return true;
}
function setPW(ff)
{
selobj=ff.N00010003
pppoepw=ff.S00040200
pptppw=ff.S00050200
l2tppw=ff.S00060200
g3pw=ff.S001E2020
selobj=ff.N00010003
pppoeidle=ff.N00040B00
pptpidle=ff.N00050B00
l2tpidle=ff.N00060B00
g3idle=ff.N001E20C0
pwary=new Array(pppoepw,pptppw,l2tppw,g3pw)
var swobjs2 = function(ary,exobj){
for(i=0;i<ary.length;i++)swobjs(ary[i],(ary[i]==exobj))
};
var chkpw = function(pwobj) {
fm=pwobj.form
flags=true;
ix=locateObj(fm,pwobj)
if(pwobj.value!=fm.elements[ix+1].value)
{alert(GetElmCont("prims_11","New passwords are not identical!"));flags=false;}
if(flags)if(pwobj.value=="*****") {pwobj.name="ignorethis"}
swobjs2(pwary,pwobj)
return flags;
};
var chkstafd = function(){
staipfd=new Array("sip","ssm","sgw","spd","ssd")
staipfdname=new Array(
GetElmCont("prim_15","IP Address")
,GetElmCont("prim_16","Subnet Mask")
,GetElmCont("prim_17","Default Gateway")
,GetElmCont("prim_18","Primary DNS Server")
,GetElmCont("prim_19","Secondary DNS Server")
)
for(o=0;o<staipfd.length;o++)
{
if(document.getElementById(staipfd[o]).value=="")
{
alert(staipfdname[o]+GetElmCont("valchk_21"," is invalid!"))
document.getElementById(staipfd[o]).focus()
return false
}
}
return true
};
var chkIdle = function(idleobj) { //Maximum Idle Time
flags=true;
if(idleobj.value<65536&&idleobj.value>=0){flags=true;}
else{alert(GetElmCont("prim_0","Maximum Idle Time rang must between")+" 0~65535!!");flags=false;}
return flags;
};
flags=true;
if(selobj.value=="0x20") { for(i=0;i<pwary.length;i++){swobjs(pwary[i],false) } ; return chkstafd() }
else if(selobj.value=="0x00") { for(i=0;i<pwary.length;i++){swobjs(pwary[i],false) } ; }
else if(selobj.value=="0x40") {if(!chkpw(pppoepw)||!chkIdle(pppoeidle)){flags=false;}}
else if(selobj.value=="0x60") {if(!chkpw(pptppw)||!chkIdle(pptpidle)||!chkaddmode("pptp")){flags=false;}}
else if(selobj.value=="0x80") {if(!chkpw(l2tppw)||!chkIdle(l2tpidle)||!chkaddmode("l2tp")){flags=false;}}
else if(selobj.value=="0x10") {if(!chkpw(g3pw)||!chkIdle(g3idle)){flags=false;}}
return flags;
}
function setPW_prim(ff)
{
if(document.getElementById("_wt_").value == "0x10")
{
 document.getElementById("_wt_").name="ignorethis"
 ff.N00010083.value=0
ff.N .value=1
ff.N00010601.value=0
ff.N00430001.value=0
ff.N .value=0
 ff.N00010600.value=14
ff.N .value=16
if(ff.N001E2200.value==1){//must write
ff.N00010083.value=0
ff.N .value=1
}
}
else{ //ether
 ff.N00010083.value=1
ff.N .value=0
ff.N00010601.value=0
ff.N00430001.value=0
ff.N .value=0
 ff.N00010083.value=1
ff.N00010600.value=99
if(ff.N00010601.value==0){                   //failover/loadsharing disable
if(document.getElementById("_wt_").value == "0x10"){
ff.N00010083.value=0
ff.N .value=1
}else{
ff.N00010083.value=1
ff.N .value=0
}
}else{                                 // Failover and loadsharing
ff.N .value=1
}
}
selobj=ff.N00010003
pppoepw=ff.S00040200
pptppw=ff.S00050200
l2tppw=ff.S00060200
g3pw=ff.S001E2020
selobj=ff.N00010003
pppoeidle=ff.N00040B00
pptpidle=ff.N00050B00
l2tpidle=ff.N00060B00
g3idle=ff.N001E20C0
pwary=new Array(pppoepw,pptppw,l2tppw,g3pw)
var swobjs2 = function(ary,exobj){
for(i=0;i<ary.length;i++)swobjs(ary[i],(ary[i]==exobj))
};
var chkpw = function(pwobj) {
fm=pwobj.form
flags=true;
ix=locateObj(fm,pwobj)
if(pwobj.value!=fm.elements[ix+1].value)
{alert(GetElmCont("prims_11","New passwords are not identical!"));flags=false;}
if(flags)if(pwobj.value=="*****") {pwobj.name="ignorethis"}
swobjs2(pwary,pwobj)
return flags;
};
var chkstafd = function(){
staipfd=new Array("sip","ssm","sgw","spd","ssd")
staipfdname=new Array(
GetElmCont("prim_15","IP Address")
,GetElmCont("prim_16","Subnet Mask")
,GetElmCont("prim_17","Default Gateway")
,GetElmCont("prim_18","Primary DNS Server")
,GetElmCont("prim_19","Secondary DNS Server")
)
for(o=0;o<staipfd.length;o++)
{
if(document.getElementById(staipfd[o]).value=="")
{
alert(staipfdname[o]+GetElmCont("valchk_21"," is invalid!"))
document.getElementById(staipfd[o]).focus()
return false
}
}
return true
};
var chkIdle = function(idleobj) { //Maximum Idle Time
flags=true;
if(idleobj.value<65536&&idleobj.value>=0){flags=true;}
else{alert(GetElmCont("prim_0","Maximum Idle Time rang must between")+" 0~65535!!");flags=false;}
return flags;
};
flags=true;
if(selobj.value=="0x20") { for(i=0;i<pwary.length;i++){swobjs(pwary[i],false) } ; return chkstafd() }
else if(selobj.value=="0x00") { for(i=0;i<pwary.length;i++){swobjs(pwary[i],false) } ; }
else if(selobj.value=="0x40") {if(!chkpw(pppoepw)||!chkIdle(pppoeidle)){flags=false;}}
else if(selobj.value=="0x60") {if(!chkpw(pptppw)||!chkIdle(pptpidle)||!chkaddmode("pptp")){flags=false;}}
else if(selobj.value=="0x80") {if(!chkpw(l2tppw)||!chkIdle(l2tpidle)||!chkaddmode("l2tp")){flags=false;}}
else if(selobj.value=="0x10") {if(!chkpw(g3pw)||!chkIdle(g3idle)){flags=false;}}
return flags;
}
function swmac(selobj)
{
fm=selobj.form
for(s=0;s<3;s++)
{
ix=locateObj(fm,document.getElementById("mac_"+selobj.options[s].value))-1
for(s1=0;s1<5;s1++){fm.elements[ix+s1].disabled=(s!=selobj.selectedIndex);}
}
}
function chgwt(sel,op)
{
fm=sel.form
if(op == "show"){
 sel.selectedIndex=5                //for wan1=3G
 }
DisplayMenu(sel.selectedIndex)
swmac(sel)
}
function chk_back(ckobj){
ff=ckobj.form
for (i=0;i<ff.length;i++){if (ff.elements[i]==ckobj) break;}
ff.elements[i+1].disabled=!ckobj.checked
}
function copy_mac(act,mactextid,macs)
{
macs=macs.toUpperCase()
if(arguments.length>1)macobj=document.getElementById(mactextid)
if (act==0) {
macobj.value = ""
}
else if (act==1) {
macobj.value = macs
}
fm=macobj.form
ix=locateObj(fm,macobj)
swobji(fm.elements[ix+2],!(macs == "" || macs == macobj.value))
swobji(fm.elements[ix+3],!(macobj.value == ""))
chkB(macobj,'a')
}
function findSelectIndex(selobj,searchval)
{
for(o=0;o<selobj.length;o++)
{
if(selobj.options[o].value==searchval){return o}
}
return false;
}
function swip(tp,sw)
{
f=document.forms['main']
ip=(tp==0)?f.I00050300:f.I00060300
nm=(tp==0)?f.I00050400:f.I00060400
gw=(tp==0)?f.I00050500:f.I00060500
swobjs(ip,sw,nm,sw,gw,sw)
}
Max_idlt=new Array(
"N00040B00"
,"N00050B00"
,"N00060B00"
,"N001E20C0"
)
function swMax_idletime(tp,sw)
{
f1=document.forms['main']
//midletime=(tp==0)?f100050B00N?:f100060B00N?
midletime=eval("f1."+Max_idlt[tp])
midletime.disabled=sw
}
recon=new Array(
"_49"
,"N00050911"
,"_50"
,"_51"
,"_aprim_49_1"
,"N00060002"
,"_aprim_50_1"
,"_aprim_51_1"
,"_aprim_49_2"
,"N001E21D0"
,"_66"
,"_67"
,"_aprim_49_0"
,"N00040912"
,"_aprim_50_0"
,"_aprim_67_0"
)
function swReconnectMode()
{
if(reconnecttype)
{
document.forms[0].dhcpconnet.disabled=true
document.getElementById("_29").style.color="#666666";
for(j=0;j<recon.length; (j=j+4))
{
i=j
eval("document.forms[0]."+recon[i+1]+"[0].disabled=true")
eval("document.forms[0]."+recon[i+1]+"[1].disabled=true")
document.getElementById(recon[i+2]).style.color="#666666";
document.getElementById(recon[i+3]).style.color="#666666";
}
}
}
function wan_type_change()   //check some file is not empty
{
var chk1,chk2,chk3,chk4,chk5;
var wit11 = document.getElementById("_wt_").value;
var result = true ;
/*if(wit11 == "0x20")    //Static Ip Address
{
chk1 = document.getElementById("sip").value;
chk2 = document.getElementById("ssm").value;
chk3 = document.getElementById("sgw").value;
chk4 = document.getElementById("spd").value;
chk5 = document.getElementById("ssd").value;
result = (chk1 != '')&&(chk2 != '')&&(chk3 != '')&&((chk4 != '') || (chk5 != ''));
}
else*/
wit12=" "
document.getElementById("multisetalt").disabled=document.getElementById("multitypealt").disabled=document.getElementById("multiwanalt").disabled=(((wit12 == 16)||(wit11 == "0x10"))?false:true)
if(wit11 == "0x40")   //PPP Over Ethemet
{
chk1 = document.getElementById("pppoe_acount").value;
result = (chk1 != '');
}
else if(wit11 == "0x60")     //PPTP
{
chk1 = document.getElementById("pptp_server_ip_address").value;
chk2 = document.getElementById("pptp_account").value;
result = (chk1 != '')&&(chk2 != '');
}
else if(wit11 == "0x80")     //L2TP
{
chk1 = document.getElementById("l2tp_server_ip_address").value;
chk2 = document.getElementById("l2tp_account").value;
result = (chk1 != '')&&(chk2 != '');
}
if(result)
{
return result;
}
else
{
alert(GetElmCont("valchk_0","Please check the settings again!!"));
return result;
}
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
function submits()
{
wts=document.getElementById("_wt_")
ck_obj=document.getElementById("dhcpconnet")
ck_objpe=document.getElementById("pppoeconnet")
if((wts.value=="0x00")&&(!ck_obj.checked)) { document.forms['main'].N0003500E.value=2 }
if((wts.value=="0x40")&&(!ck_objpe.checked)) { document.forms['main'].N00040912.value=0 }
cdv=chk_del()
if(cdv==1) document.forms['main'].action="internet_prim.htm" //need to delete failover, and user agree ,do nrr=99 then reboot
else if(cdv==2)return false; //need to delete failover, but user dont agree, no reboot
else document.forms['main'].action="internet_prim.htm" //chk_del()==3, no failover need to delete,go reboot after saved
return chkForm()&&setPW_prim(document.forms['main'])
}
function chk3gkeepalive(chk)
{
ff=document.forms['main'];
fovr_mti_chk1=ff.N 
fovr_mti_chk2=ff.N 
fovr_chk_mod=ff.N0043000C
fovr_mti_chk_mod=ff.N 
fovr_chk1=ff.N004301D7
fovr_chk2=ff.N004301D8
if(ff.keep_live[0].checked){
ff.N .value=0
ff.N .value= 
chkv=0
}else if(ff.keep_live[1].checked){
ff.N .value=1
fovr_mti_chk_mod.value=fovr_chk_mod.value=0
fovr_mti_chk1.value=fovr_chk1.value=1
fovr_mti_chk2.value=fovr_chk2.value=4
chkv=1
}else{
ff.N .value=1
fovr_mti_chk_mod.value=fovr_chk_mod.value=1
fovr_mti_chk1.value=fovr_chk1.value=4
fovr_mti_chk2.value=fovr_chk2.value=1
chkv=1
}
//if(arguments.length==0)chkv "?";
swids("lcp0",(chkv=="2"),"lcp11",(chkv=="2"),"lcp1",(chkv=="2"),"lcp22",(chkv=="2"))
swids("ping0",(chkv=="1"),"ping11",(chkv=="1"),"ping1",(chkv=="1"),"ping22",(chkv=="1"))
if(ff.N !=null)ff.N .disabled=(chkv!="1")
if(ff.S !=null)ff.S .disabled=(chkv!="1")
if(ff.N001E2130!=null)ff.N001E2130.disabled=(chkv!="2")
if(ff.N001E2140!=null)ff.N001E2140.disabled=(chkv!="2")
}
function chk3gAutoConnect(chk)
{
ff=document.forms['main'];
if(arguments.length==0)chkv=" ";
else chkv=chk.value;
//   ff001E20C0W3.disabled=(chkv!="2")
}
function disabfailover(wtobj)
{
}
function chkdnsq(){
if(document.getElementById('keepaliv1').checked){    //Use Ping :Use Ping
chkS(document.forms[0].S ,'i')
}else{                                           //Use Ping :DNS Query
chkS(document.forms[0].S ,'b')
}
}
 