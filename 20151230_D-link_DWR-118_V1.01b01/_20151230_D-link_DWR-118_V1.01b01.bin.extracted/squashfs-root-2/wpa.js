Uy2         `         Y=  @ EShenv Suobj Nrule Napnum Ssc Nchgwmode Nwmode               T 1 Mc�   Mb� cbrT�1T Mc�   Mb� cbrT1 Mc�   Mb� cbrT�1�  Mb� �brT1 Mb�   � b0 2TA1� � 0 2T
1�  Mb� �brT+
1�  Mb� �brT8
1� �D 0 2T�
1� D Mb� �brT�
1� D Mb� �brT�
1� � 0 2T{1ԇ  0 2T1� �D 0 2TE1�  Mb� �brT=1�  Mb� �brTH1�  Mb� �brT21� D Mb� �brT�1� D Mb� �brT�1�  Mb� �brT1�  Mb� �brT|1� D Mb� �brT�1 Mc�   Mb� cbrTo1�  Mb� �brTr1�  Mb� �brT�1T Mc�   Mb� cbrT% 1� D Mb� �brT( 1� D Mb� �brTt 1�  Mb� �brT�!1� D Mb� �brT�!1� B �pT�%1�  Mb� �brT�/1�" Mb� �brT�/1� �Mb�  � b0 2T01� D Mb� �brT�41�"D Mb� �brT
51� �Mb� D � b0 2To51� D 0T 2T,81� D 0T 2T91  var KYlen=new Array()
var KTlen=new Array()
function disableNoUseElm_5g(ee)
{
f=document.forms['main']
fs=locate("_eny_start_5g")
fe=locate("_eny_end_5g")
elms=splits(DivItm_5g[ee],"|")
for(e=fs;e<fe;e++) {  f.elements[e].disabled=!inArr(elms,f.elements[e].name) }
}
function chgKYlen(_wbx)
{
f=document.forms['main']
var WK=new Array(10,26,58);
var strid0="keyid";
var strid1="KT";
var strid2="KY";
i=f.N .selectedIndex;
if((_wbx!=null)&&(_wbx== "_5g"))
{
var strid0="keyid_5g";
var strid1="_5g_KT";
var strid2="KY_5g";
i=f.N .selectedIndex;
}
j=document.getElementById(strid0).value-1
KYlen[j]=WK[i]
if(document.getElementById(strid1+j).selectedIndex==1)KYlen[j]/=2;
setMaxLen(strid2+j,KYlen[j])
}
function setMaxLen(item,len)
{
document.getElementById(item).maxLength=len
}
function checkWEP()
{
ff=document.forms['main']
var tmp = "Please input ";
var elmlen=0, i1=0,f=0, j=0;
var WK=new Array(10,26,58);
for(j=0;j<4; j++)KYlen[j]=WK[ff.N .value]
for(i1=0; i1<4; i1++)
{
elmlen = document.getElementById("KY"+i1).value.length
if(ff.N .value==i1)
{
if(document.getElementById("KT"+i1).value==1)klen= KYlen[i1]/2;
else klen = KYlen[i1];
tmp += klen
if(elmlen != klen)
{
alert(tmp+" "+GetElmCont("wpa999_0","digits in WEP key")+" "+(i1+1)+"!");
f++;
return false;
}
}
}
if(f==0) return true;
else return false;
}
function chk_keyempty(_wbx){
fk=document.forms[0];
fg=0;
objZO0 = document.getElementById('ZO0')
objKY0 = document.getElementById('KY0')  //WEP Key 1
objkeybit=document.getElementById("keybit").value  //WEP Key Lenght
objpskey = document.getElementById('_pskey')       //Pre-Shared Key
objWA = fk._WA                                     //Security Mode
if((_wbx!=null)&&(_wbx== "_5g"))
{
objZO0 = document.getElementById('ZO_5g0')
objKY0 = document.getElementById('KY_5g0')  //WEP Key 1
objkeybit=document.getElementById("keybit_5g").value  //WEP Key Lenght
objpskey = document.getElementById('_pskey_5g')       //Pre-Shared Key
objWA = fk._WA_5g   //Security Mode
}
if(objZO0.style.display==''&&objKY0.value=='') { fg=1; }
else if((objZO0.style.display==''&&objKY0.value=='*****')&&(objkeybit==" "))
{ objKY0.name="ignorethis"}
else { chkS(objKY0,'w') }
if(objWA.value==3&&objpskey.value=="") { fg=1; }
else if(objWA.value==3&&objpskey.value=='*****') { objpskey.name="ignorethis"}
if(fg==1) return false;
else return true;
/*  if(fk._WA.value==3&&fk.S00191F00.value=="") { fg=1; }
else if(fk._WA.value==3&&fk.S00191F00.value=='*****') { fk.S00191F00.name="ignorethis"}
if(fg==1) return false;
else return true;*/
}
function setwps20(_wbx){
ff=document.forms[0]
_wps_en =  
ENCRYw=ff.N 
ENssid=ff.N [1].checked
wps_en=ff.N0019A000
if((_wbx!=null)&&(_wbx== "_5g"))
{
_wps_en =  
ENCRYw=ff.N 
ENssid=ff.N [1].checked
wps_en=ff.N0044A000
}
wps_en_v = ((ENCRYw.value==1)||(ENCRYw.value==2)||(ENssid))?0:_wps_en
return wps_en_v
}
function beforeSubmit()
{
waa=document.getElementById('wa').value
if((waa == 2)||((waa == 1)&&(" " == 1))){
if(waa == 2)alts=GetElmCont("wpa_0","Warning! Setting the security mode of 2.4GHz band as \"NONE\" will cause security risks. Are you still going to configure it?")
if(waa == 1)alts=GetElmCont("wpa_0","It needs to stop WPS feature to enable WEP setting for 2.4GHz band. Are you still going to configure it?")
if (!(confirm(alts))){ return false; }
}
waa_5g=document.getElementById('wa_5g').value
if(" " == 1){
if((waa_5g == 2)||((waa_5g == 1)&&(" " == 1))){
if(waa_5g == 2)alts=GetElmCont("wpa_0","Warning! Setting the security mode of 5GHz band as \"NONE\" will cause security risks. Are you still going to configure it?")
if(waa_5g == 1)alts=GetElmCont("wpa_0","It needs to stop WPS feature to enable WEP setting for 5GHz band. Are you still going to configure it?")
if (!(confirm(alts))){ return false; }
}
}
if(!chk_keyempty()){alert(GetElmCont("valchk_0","Please check the settings again!!"));return false;}
/*
if(!chkForm())return false
alts=GetElmCont("wpa_56","The settings will take effective after rebooting.")+"\n\n"+GetElmCont("wpa_57","Are you sure to change?")
if (confirm(alts))
{
fm.action="/uir/rebo.htm"
}
else return false;
*/
f=document.forms['main']
cs=0
setZC(f._ZCa.checked)
auth=f.N 
encry=f.N 
mode11n=(document.getElementById("wmodess").value==6)
ssv=document.getElementById(mode11n?"wa11n":"wa").value
if(ssv=="2"){  //None
auth.value="0"
encry.value="0";
}
else if(ssv=="1"){  //WEP
auth.value=document.getElementById("auth").value
encry.value="1";
f.N0019A000.value=0
}
else {
auth.value=parseInt(ssv)+parseInt(f._WP.value)
encry.value=(mode11n?3:f.WP.value)
}
//    f0019A000N?.value=(ssv=="1")?0:1  // WEP wps must disabled
swwps = setwps20()  // WEP wps must disabled
//    f 1x.value=(ssv<2)?"1":"0";
if(!chk_keyempty("_5g")){alert(GetElmCont("valchk_0","Please check the settings again!!"));return false;}
setZC(f._ZCa_5g.checked,'_5g')
auth_5g=f.N 
encry_5g=f.N 
mode11n_5g=(document.getElementById("wmodess_5g").value==6)
ssv_5g=document.getElementById(mode11n_5g?"wa11n_5g":"wa_5g").value
if(ssv_5g=="2"){  //None
auth_5g.value="0"
encry_5g.value="0";
}
else if(ssv_5g=="1"){  //WEP
auth_5g.value=document.getElementById("auth_5g").value
encry_5g.value="1";
f.N0044A000.value=0
}
else {
auth_5g.value=parseInt(ssv_5g)+parseInt(f._WP_5g.value)
encry_5g.value=(mode11n_5g?3:f.WP_5g.value)
}
//    f0019A000N?.value=(ssv_5g=="1")?0:1  // WEP wps must disabled
swwps_5g = setwps20("_5g")  // WEP wps must disabled
//    f 1x.value=(ssv_5g<2)?"1":"0";
if(swwps_5g != null )
{
//f0044A000N?.value=((swwps_5g == 0))?0:1
}
else {
// fm0019A000N?.value = setwps20() ;
}
if(f.N00010010.value == 0) {
//f0019A000N?.value=0
}
disableNoUseElm(ssv)        // ------for 2.4g -
disableNoUseElm_5g(ssv_5g)  // ------for 5g -
return true
}
function swdivary(showdiv,divary)
{
for(d=0;d<divary.length;d++)
{
swelm(divary[d],(divary[d]==showdiv))
}
}
function clearoptions(selectobj)
{
sl=selectobj.length
for(j=0;j<sl;j++)
selectobj.options[0]=null
}
Secur_=new Array(
"_none","_wep","_wpa","_psk","_eap"
)
Secur_5g=new Array(
"_none_5g","_wep_5g","_wpa_5g","_psk_5g","_eap_5g"
)
Secur_11n=new Array(
"_none","_wpa","_psk"
)
Secur_11n_5g=new Array(
"_none_5g","_wpa_5g","_psk_5g"
)
wpadescstr=""
wpadescs=new Array(
"WPA","WPA2","WPA/WPA2"
)
wpamodeary=new Array(
"_psk", "_eap"
)
wpamodeary_5g=new Array(
"_psk_5g", "_eap_5g"
)
function chgCS(val,wlan11n)
{
f=document.forms['main']
Secur=wlan11n?Secur_11n:Secur_
if(val>2)div=Secur[2]
else
{
if(val==2)div=Secur[0]
else div=Secur[1]
}
if(wlan11n)swid('_wep',false)
swdivary(div,Secur) //Display Security Options DIV
c_sec=document.getElementById(wlan11n?"wa11n":"wa")
h_sec=document.getElementById(!wlan11n?"wa11n":"wa")
h_sec.selectedIndex=findSelectIndex(h_sec,c_sec.value)
if(val>2) //WPA
{
wpav=0
swelm("_wpa",true)
if(val==3)     wpav=0 //WPA-PSK
else if(val==4)wpav=1 //WPA
swdivary(wpamodeary[wpav],wpamodeary)
/*      clearoptions(f._Cipher)
addary=wpa_Cipher[wpav]
for(aa=0;aa<addary.length;aa++)
f._Cipher.options[f._Cipher.length]=addary[aa]
if(val==5)f._Cipher.selectedIndex=(($CS<5)?2:(7-$CS))
*/
}
f.N .value=c_sec.value
vals=val
disableNoUseElm(vals)
}
function chgCS_5g(val,wlan11n)
{
f=document.forms['main']
Secur=wlan11n?Secur_11n_5g:Secur_5g
if(val>2)div=Secur[2]
else
{
if(val==2)div=Secur[0]
else div=Secur[1]
}
if(wlan11n)swid('_wep_5g',false)
swdivary(div,Secur) //Display Security Options DIV
c_sec=document.getElementById(wlan11n?"wa11n_5g":"wa_5g")
h_sec=document.getElementById(!wlan11n?"wa11n_5g":"wa_5g")
h_sec.selectedIndex=findSelectIndex(h_sec,c_sec.value)
if(val>2) //WPA
{
wpav=0
swelm("_wpa_5g",true)
if(val==3)     wpav=0 //WPA-PSK
else if(val==4)wpav=1 //WPA
swdivary(wpamodeary_5g[wpav],wpamodeary_5g)
/*      clearoptions(f._Cipher)
addary=wpa_Cipher[wpav]
for(aa=0;aa<addary.length;aa++)
f._Cipher.options[f._Cipher.length]=addary[aa]
if(val==5)f._Cipher.selectedIndex=(($CS<5)?2:(7-$CS))
*/
}
f.N .value=c_sec.value
vals=val
disableNoUseElm_5g(vals)
}
function swPSKEAP(val)
{
swdivary(wpamodeary[((val=="o")?1:0)],wpamodeary)
disableNoUseElm((val=="o")?3:2)
}
DivItm=new Array("",
"N |N |"
+"N00191700|_auth|S00191800"
,""
,"_WP|WP|N00192401|N00192000|S "
,"_WP|WP|N00192401|N00192000||N00194200|I00193000|N00193800|S00194000|N00194100"
)
DivItm_5g=new Array("",
"N |N |"
+"N00441700|_auth_5g|S00441800"
,""
,"_WP_5g|WP_5g|N00442401|N00442000|S "
,"_WP_5g|WP_5g|N00442401|N00442000||N00444200|I00443000|N00443800|S00444000|N00444100"
)
function swbut(sw)
{
f=document.forms['main']
f.GenNewPIN.disabled=!sw
f.AddDevice.disabled=!sw
f.ResetPIN.disabled=!sw
}
function swwlan(sw,_wbx)
{
f=document.forms['main']
wlans=locate("S ")
wlane=locate("_formend")
if((_wbx!=null)&&(_wbx == "_5g"))
{
wlans_5g=locate("S ")
wlane_5g=locate("_formend_5g")
for(w=wlans_5g;w<wlane_5g;w++)
{
if(f.elements[w].name=="N_CHm_5g")
f.elements[w].disabled=!sw||f._ZCa_5g.checked
else f.elements[w].disabled=!sw
}
c_sec=document.getElementById(sw?"wa11n_5g":"wa_5g")
if(document.getElementById('wmodess_5g').value==0) { document.getElementById("h_bw").disabled= true ;  }
}
else
{
for(w=wlans;w<wlane;w++)
{
if(f.elements[w].name=="N_CHm")
f.elements[w].disabled=!sw||f._ZCa.checked
else f.elements[w].disabled=!sw
}
c_sec=document.getElementById(sw?"wa11n":"wa")
if(document.getElementById('wmodess').value==0) { document.getElementById("_channelwidth").disabled= true ;  }
}
}
function setZC(sw,_wbx)
{
f=document.forms['main']
if((_wbx!=null)&&(_wbx == "_5g"))
{
f.N_CHm_5g.disabled=sw
f.N00440200.value=(sw)?0:f.N_CHm_5g.value
f.N00443400.value=(sw)?2:0
}
else
{
f.N_CHm.disabled=sw
f.N00190200.value=(sw)?0:f.N_CHm.value
f.N00193400.value=(sw)?2:0
if((!sw)&&(" " == "DIR-840L")&&((f.N_CHm.value == 12)||(f.N_CHm.value == 13))){ f.N00190200.value = 11 }
else if(!sw) { f.N00190200.value= f.N_CHm.value }
f.N00201800.value = f.N_CHm.value
}
}
function setTextSize(div,sizes,maxlens)
{
divs=document.getElementById(div)
divs.maxLength=maxlens
divs.size=sizes
}
function swZOfield(vv,gmode)
{//vv==1 is for 64 bit
wkeyalt=(vv=="1")?GetElmCont("wpa_54","(13 ASCII or 26 HEX)"):GetElmCont("wpa_55","(5 ASCII or 10 HEX)")
maxlen=(vv=="1")?26:10
size=(vv=="1")?36:32
wkeyalt_g=(gmode!=null)?"_wkeyalt_5g":"_wkeyalt"
KY0_g=(gmode!=null)?"KY_5g0":"KY0"
SetElmCont(wkeyalt_g,wkeyalt);
setTextSize(KY0_g,size,maxlen)
/*   setTextSize("ZO0",size,maxlen)
setTextSize("ZO1",size,maxlen)
setTextSize("ZO2",size,maxlen)
setTextSize("ZO3",size,maxlen)*/
if(gmode!=null) { chgKYlen(gmode) }
else { chgKYlen() }
}
function chgWepKey(vv)
{//THIS !!!  Disable Hide elements
f=document.forms['main']
for(p=0;p<4;p++)
{
tf=((vv-1)==p)
swelm("ZO"+p,tf)
document.getElementById("KT"+p).disabled=!tf
document.getElementById("KY"+p).disabled=!tf
}
spanary=new Array()
/*   swelm("ZO1",(vv==1))
f.KT1.disabled=(vv==1)
f.KY1.disabled=(vv==1)
*/
}
function wifichg0(swcipherTp)
{
fp=document.forms['main']
_dfWP = (swcipherTp.name.indexOf('_5g')==-1)?fp.WP:fp.WP_5g
for(p=0;p<_dfWP.length;p++)
{
if(swcipherTp.value == 2 )
{
_dfWP.options[p].disabled = (_dfWP.options[p].value == "3")?false:true;
_dfWP.options[p].selected = (_dfWP.options[p].value == "3")?true:false;
}
else if(swcipherTp.value == 4 )
{
_dfWP.options[p].disabled = (_dfWP.options[p].value != "2")?false:true;
if((_dfWP.value == 2)&&(_dfWP.options[p].value == 2)){_dfWP.options[p+1].selected = true }
}
else { _dfWP.options[p].disabled = false }
}
}
function setBW()
{
bw = document.getElementById('s_bw');
/*
C_WLANAP2_HT_BW  C_WLANAP2_VHT_BW  C_WLANAP2_HT_BSSCOEXISTENCE
bw=0 HT20                 0                  0                  0
bw=1 HT40                 1                  0                  0
bw=2 Auto                 1                  0                  1
bw=3 HT80                 1                  1                  0
bw=4 Auto(ac mode)        1                  1                  1
*/
if(bw.value>=3){
document.getElementById('h_vbw').value=1;
document.getElementById('h_bw').value=1;
document.getElementById('h_bscoexits').value=(bw.value==4)?1:0;
}else{
document.getElementById('h_vbw').value=0;
document.getElementById('h_bw').value=(bw.value==2)?1:bw.value;
document.getElementById('h_bscoexits').value=(bw.value==2)?1:0;
}
}
function chgWmode(wmode)
{
f=wmode.form
f.N .value=brate(wmode.value)
//   f DE.value=txmode(wmode.value)
wmodev=wmode.options[wmode.selectedIndex].value
//   swbyAry(wmodev=="6 ,?)
swwm(wmode.value==6)
chgDataRate(wmode.value)
/*================================================================================
Rule a.
802.11b only                           ->20MHz
802.11g only                           ->20MHz
802.11n only                           ->20MHz , 20/40MHz (Auto)
Mixed 802.11g and 802.11b              ->20MHz +disable
Mixed 802.11n and 802.11g              ->20MHz , 20/40MHz (Auto)
Mixed 802.11n, 802.11g and 802.11b     ->20MHz , 20/40MHz (Auto)
Rule
if ch==12 or ch==13           ->20 MHz
================================================================================*/
document.getElementById("_channelwidth").disabled=(wmode.value==0);
chmv24g=document.forms[0].N_CHm.value
if(((chmv24g==12)||(chmv24g==13))&&(!document.forms['main']._ZCa.checked)){
document.getElementById('_channelwidth').value=0
document.getElementById('_channelwidth').options[1].style.display="none"
}else{
if((wmode.value==1)||(wmode.value==4)||(wmode.value==0))
{
document.getElementById('_channelwidth').value=0
document.getElementById('_channelwidth').options[1].style.display="none"
}
else{ document.getElementById('_channelwidth').options[1].style.display="" }
}
}
function chgWmode_5g(wmode)
{
f=wmode.form
f.N .value=brate(wmode.value)
//   f DE.value=txmode(wmode.value)
wmodev=wmode.options[wmode.selectedIndex].value
//   swbyAry(wmodev=="6 ,?)
swwm_5g(wmode.value==11) // 5G n only
document.getElementById("h_bw").disabled=(wmode.value==0);
chmv5g=document.forms[0].N_CHm_5g.value
m80211_5gt=document.getElementById('wmodess_5g').value
s_bwt=document.getElementById('s_bw')
/*================================================================================
Rule a.
802.11a only:2                ->20MHz
802.11n only:11               ->20MHz , 20/40MHz (Auto)
Mixed 802.11a and 802.11n:8   ->20MHz , 20/40MHz (Auto)
802.11 a/n/ac Mixed:14        ->20MHz , 20/40MHz (Auto) , 20/40/80MHz (Auto)
Rule b.
if ch==140 or ch==165 or (index=22+ch==56)  ->20 MHz
================================================================================*/
if(" " != document.getElementById('wmodess_5g').value) s_bwt.value=0
s_bwt.options[0].style.display=""
s_bwt.options[1].style.display="none"
s_bwt.options[2].style.display="none"
if(((chmv5g==140)||(chmv5g==165)||((chmv5g==56)&&(" "==22)))&&(!document.forms['main']._ZCa_5g.checked)){
s_bwt.value=0
s_bwt.options[3].style.display=s_bwt.options[4].style.display="none"
}else{
s_bwt.options[3].style.display=(((m80211_5gt == 11)||(m80211_5gt == 8)||(m80211_5gt == 14))?"":"none")
s_bwt.options[4].style.display=((m80211_5gt ==  14)?"":"none")
}
}
 