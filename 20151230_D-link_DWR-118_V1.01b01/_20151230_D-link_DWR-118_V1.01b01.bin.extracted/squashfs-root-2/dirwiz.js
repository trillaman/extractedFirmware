Uy2              p       �  T 1�  pT� qT� 1�  pT� qT� 1�  0 2T1�  p rT�1          function swpage(ix,prefix)
{
if(arguments.length<3)prefix="step"
for(st=0;st<steps;st++)
{
swid(prefix+st,(st==ix))
}
if(ix==7){
document.getElementById('_pskey').value=" 1234567890 "
document.getElementById('KY0').value=" 1234567890 "
document.getElementById('KT0').value=" "
clear_valchk_for_undo()
}
if(ix==1){
wepkyylegth=document.forms[0].S00191800.value.length
if((wepkyylegth == 5)||(wepkyylegth == 10))document.getElementById('keybit').value=0
if((wepkyylegth == 13)||(wepkyylegth == 26))document.getElementById('keybit').value=1
}
}
var temwan=''
function swcont(ix,ary,prefix)
{
if(arguments.length<3)prefix="_0x"
for(st=0;st<ary.length;st++)
{
swid(prefix+String(ary[st]),(ary[st]==ix))
}
temwan=ix
}
function incifrm(fn)
{
dw("<iframe name='hid' id='hid' src='/"+fn+"' style='display:none'></iframe>")
}
function wiz_wan_type_change()   //check some file is not empty
{
var wantype=" ".substring(8)
var chk1,chk2,chk3,chk4,chk5;
var wit11 = ""
temwan=temwan.toString();
if(temwan == "") { wit11 = wantype }
else { wit11 = temwan }
var result = true ;
if(wit11 == "20")    //Static Ip Address
{
chk1 = document.getElementById("wiz_sip").value;
chk2 = document.getElementById("wiz_ssm").value;
chk3 = document.getElementById("wiz_sgw").value;
chk4 = document.getElementById("wiz_spd").value;
chk5 = document.getElementById("ssd").value;
result = (chk1 != '')&&(chk2 != '')&&(chk3 != '')&&((chk4 != '') || (chk5 != ''));
}
else if(wit11 == "40")   //PPP Over Ethemet
{
chk1 = document.getElementById("wiz_pppoe_acount").value;
result = (chk1 != '');
}
else if(wit11 == "60")     //PPTP
{
chk1 = document.getElementById("wiz_pptp_server_ip_address").value;
chk2 = document.getElementById("wiz_pptp_account").value;
result = (chk1 != '')&&(chk2 != '');
}
else if(wit11 == "80")     //L2TP
{
chk1 = document.getElementById("wiz_l2tp_server_ip_address").value;
chk2 = document.getElementById("wiz_l2tp_account").value;
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
 