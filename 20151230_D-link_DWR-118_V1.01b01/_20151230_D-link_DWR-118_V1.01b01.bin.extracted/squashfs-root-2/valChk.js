Uy2              @       �L  T 1�  p!	���{�r!T�1          spanary=new Array()
inArrix=0
pn=new pattern()
cmsg=""
dw("<div id=_debug></div>")
function locateObj(fm,fobj,offset)
{
for(var j=0;j<fm.length;j++)
{
if(fm.elements[j]==fobj)break;
}
return (arguments.length<3)?j:eval("fm.elements[j"+offset+"]");
}
function chkundo()
{
f=document.forms['main']
f.reset();
for(i=0;i<f.length;i++) showmsg(f.elements[i],true)
}
function pattern()
{
ips="(25[0-5]|2[0-4][0-9]|[1]?[0-9][0-9]?)"
ips_0="(25[0-5]|2[0-4][0-9]|[1][0-9][0-9]|[1-9][0-9]|[1-9])"
ipss=ips+"\\."+ips+"\\."+ips+"\\."+ips
n0_32="(3[0-2]|2[0-9]|1[0-9]|[0-9])"
ipssn=ipss+"\/"+n0_32
ipssn2="^"+ipss+"$|"+ipss+"\/"+n0_32
ipssnm="^"+ipssn+"$|"+ipssn+"(\\;"+ipssn+")+"
hexs="([0-9a-fA-F]+)"
hex2="([0-9a-fA-F]{2})"
egstrs="([0-9a-zA-Z]+)"
ports="([0-9]{1,5})"
numbers="([0-9]+)"
hours="(2[0-3]|1[0-9]|[0-9]|0[0-9])"
minutes="([1-5][0-9]|[0-9]|0[0-9])"
smasks="(1+0+|1{8}|0{8})"
ccsmasks="(1{8})"
strs="([^\r|^\n]+)"
strsns="([^\x20]+)"
strspmark="([^:*?\"<>\\\\/|]+)"//不能輸入 : * < > ? \ / " | 等字元
emails="([a-zA-Z0-9_\\-\\.]+\\@[a-zA-Z0-9_\\-\\.]+\\.[a-zA-Z]{2,5})"
emails2="^"+emails+"$|"+emails+"(\\;"+emails+")+|"+emails+"(\\,"+emails+")+"
this.strspmark1=strspmark
this.ip1=ips
this.ip=ipss
this.iprange=ipss+"-"+ipss
this.subnetmask=smasks+"\\."+smasks+"\\."+smasks+"\\."+smasks
this.ccsubnetmask=ccsmasks+"\\."+ccsmasks+"\\."+ccsmasks+"\\."+smasks
this.port=ports
this.portrange=ports+"-"+ports
this.hex=hexs
this.mac=hex2+"-"+hex2+"-"+hex2+"-"+hex2+"-"+hex2+"-"+hex2
this.bmac=hex2+":"+hex2+":"+hex2+":"+hex2+":"+hex2+":"+hex2
this.egstr=egstrs
this.number=numbers
this.time=hours+":"+minutes
this.hour=hours
this.minute=minutes
this.ctime=hours+":"+minutes+":"+minutes
this.str=strs
this.strn=strsns
this.email=emails
this.emailm=emails2
this.ipnms=ipssnm
this.n0_32=n0_32
this.ipnms2=ipssn2
}
function showmsg(cobj,Result,msg)
{
sobjia=inArr(spanary,cobj)
if(!Result){if(!sobjia)spanary[spanary.length]=cobj}
else if(sobjia)spanary.splice(inArrix,1)
cobj.title=(Result)?"":cmsg;
cobj.style.color=(Result)?"":"#FF0000"
}
function chkForm()
{
if(spanary.length!=0)
{
alert(GetElmCont("valchk_0","Please check the settings again!!"))
spanary[0].focus()
return false;
}
else return true
}
function clear_valchk_for_undo(){
if(spanary.length!=0){
for(s=0;s<spanary.length;s++){
spanary[s].style.color="#000000"
}
spanary.length=0 //set to no error!!
}
}
function cvr(chkval,rs,re)
{
renumber=new RegExp("^"+pn.number+"$")
chkvalo=chkval
chkval=parseInt(chkval)
if(arguments.length<3)
{
if(rs.indexOf("-")!=-1){
v=rs.split("-");
rs=v[0];
re=v[1];
}
else {
re=rs;
rs=0;
}
}
return (renumber.test(chkvalo)&&rs<=chkval&&chkval<=re)
}
function clen(chklen,rs,re)
{
restr=new RegExp("^"+pn.str+"$")
chkleno=chklen
chklen=chklen.length
if(arguments.length<3)
{
if(String(rs).indexOf("-")!=-1){
v=rs.split("-");
rs=v[0];
re=v[1];
}
else {
re=rs;
}
}
return (restr.test(chkleno)&&rs<=chklen&&chklen<=re)
}
function inArr(arr,itm)
{
inArrix=0
for(aa=0;aa<arr.length;aa++)
{
if(arr[aa]==itm){inArrix=aa;return true;}
}
return false;
}
function add0(k1)
{
k1l=k1.length
for(kk=0;kk<(8-k1l);kk++){k1='0'+k1}
return k1
}
function turnbinary(v)
{  //ip address 轉為 binary, for subnet mask checking.
ipa=v.split(".")
ipa2=""
for(i=0;i<4;i++)
{
k=parseInt(ipa[i]).toString(2)
if(k.length<8)k=add0(k)
ipa2+=k+((i<3)?".":"")
}
return ipa2
}
/* check IP - chkI(this,'a')
1. 'a' => 合法 IP及 0.0.0.0
1. 'b' => 合法 IP，不可以是 0.0.0.0
1. 'c' => 合法 IP，且為 mask 型式
1. 'd' => 合法 IP，必須和 LAN IP 同一 subnet
1. 'r' => 合法 IP range
1. 'l' => 合法 LAN IP，不可以是 0.0.0.0 or 空白
*/
function chkI(obj,type)
{
objval=obj.value
reip=new RegExp("^"+pn.ip+"$")
resm=new RegExp("^"+pn.subnetmask+"$")
resmcc=new RegExp("^"+pn.ccsubnetmask+"$")
reipr=new RegExp("^"+pn.iprange+"$")
ipc=reip.test(objval)
if(type=='a') //合法 IP，包含 0.0.0.0
{
cmsg=GetElmCont("valchk_1","IP address is invalid.")
chkResult=ipc
}
if(type=='b') //合法 IP，不包含 0.0.0.0
{
cmsg=GetElmCont("valchk_1","IP address is invalid.")
chkResult=ipc&&(objval!="0.0.0.0")
}
if(type=='c') //一般 subnet mask
{
cmsg=GetElmCont("valchk_2","Subnet mask is invalid.")
chkResult=reip.test(objval)?(resm.test(turnbinary(objval))):false
}
if(type=='d') //合法 IP，必須和 LAN IP 同一 subnet
{
lanip=" "
cmsg="The subnet of IP address should be equal to LAN IP address("+lanip+")."
lips=lanip.lastIndexOf(".")
ipls=new RegExp("^"+lanip.substring(0,lips+1)+pn.ip1+"$")
chkResult=ipc&&ipls.test(objval)
}
if(type=='e') //subnet mask for class C
{
cmsg=GetElmCont("valchk_2","Subnet mask is invalid.(Class C only, 255.255.255.XXX)")
chkResult=reip.test(objval)?(resmcc.test(turnbinary(objval))):false
}
if(type=='r') //一般 IP range(單一合法 IP 也成立)
{
cmsg=GetElmCont("valchk_3","IP address range is invalid.")
chkResult=reip.test(objval)||reipr.test(objval)
}
if(type=='i') // 合法 IP，不可以是 空白
{
cmsg=GetElmCont("valchk_1","IP address is invalid.")
chkResult=ipc&&(objval!="")
}
if(type=='l') // 合法 LAN IP，不可以是 0.0.0.0 or 空白
{
cmsg=GetElmCont("valchk_4","LAN IP address is invalid.")
chkResult=ipc&&(objval!="")
}
if(type=='p') // |Xak LAN IP!A?￡￥i￥H?O 0.0.0.0 or aA￥O
{
cmsg=GetElmCont("valchk_1","IP address is invalid.")
err=false;
for(l=0;l<5;l++)
{
pipobj=document.getElementById("peerip"+l);
if(obj==pipobj)continue;
pipv=pipobj.value;
if(objval==pipv){err=true;cmsg="Peer IP is in User Account List.";break;}
}
if(!err)
{
lnsip=document.getElementById("l2tplnsip").value;
if(objval==lnsip){err=true;cmsg="Peer IP is duplicate with L2TP Server IP Address!"}
}
chkResult=ipc&&(!err)||(objval=="")
}
else chkResult=chkResult||(objval=="")
showmsg(obj,chkResult,cmsg)
return chkResult
}
/* check Number - chkN(this,'a')
1. 'i' => 最後一位 ip，1~255，0 也接受，代表沒有設定
1. 'p' => tcp/udp 的 port 1~65535， 0 也接受，代表沒有設定
1. 'q' => tcp/udp 的 port 1~65535，"" 也接受，代表沒有設定
1. 'r' => tcp/udp 的 port range，接受單一 port 或單一 port range
1. 'n' => tcp/udp 的 port range，接受單一 port 或多個 port(以 ","" 隔開)及 port range 混合輸入 (eg.Special AP 的 incoming port)
1. 'j' => static/Dynamic MTU (?)
1. 'm' => PPPoE MTU (?)
1. 'l' => PPTP MTU (?)
1. 'l' => L2TP MTU (?)
1. 't' => wan type idle timeout
1. 'x' => admin idle timeout
1. 'd' => 一般合法數字，可以包含 0，如 MTU, idle time (秒)
1. 'u' => User defined
*/
function chkN(obj,type,range,itemname)
{
objval=obj.value
report =new RegExp("^"+pn.port+"$")
reportr=new RegExp("^"+pn.portrange+"$")
renumber=new RegExp("^"+pn.number+"$")
if(arguments.length<3)
{
range=""
itemname=""
if((obj.id.length>0)&&(obj.id.indexOf("format : ")!=-1))
{
otls=splits(obj.id,"format : ")
itemname=otls[0]
range=(otls.length>1)?otls[1]:""
}
if(itemname=="")itemname="Value"
}
if(type=='i') //最後一位 ip，1~255，0 也接受，代表沒有設定
{
cmsg=GetElmCont("valchk_5","Value is invalid.")
chkResult=(report.test(objval)&&cvr(objval,0,255))
}
if(type=='k') //最後一位 ip，1~255，不接受 0
{
cmsg=GetElmCont("valchk_5","Value is invalid.")
chkResult=((objval=="")||report.test(objval)&&cvr(objval,1,255))
}
if(type=='o') //Number 0~65536， 0 也接受，代表沒有設定
{
cmsg=GetElmCont("valchk_5","Value is invalid.")
chkResult=((objval=="")||renumber.test(objval)&&cvr(objval,0,65536))
}
if(type=='p') //tcp/udp 的 port 1~65535， 0 也接受，代表沒有設定
{
cmsg=GetElmCont("valchk_6","Port is invalid.")
chkResult=(report.test(objval)&&cvr(objval,1,65535))
}
if(type=='q') //tcp/udp 的 port 1~65535， "" 也接受，代表沒有設定
{
cmsg=GetElmCont("valchk_6","Port is invalid.")
chkResult=((objval=="")||cvr(objval,1,65535))
}
if(type=='r') //tcp/udp 的 port range，接受單一 port 或單一 port range
{
reportr.exec(objval)
cmsg=GetElmCont("valchk_8","Port range is invalid.")+" (Format eg. 1-65535)"
portrary=splits(objval,"-")
chkResult=((objval.indexOf("-")!=-1)?(cvr(portrary[0],"1-65535")&&cvr(portrary[1],"1-65535")&&(parseInt(portrary[0])<parseInt(portrary[1]))):(report.test(objval)&&cvr(objval,1,65535)))
}
if(type=='n') // tcp/udp 的 port range，接受單一 port 或多個 port(以 "," 隔開)及 port range 混合輸入 (eg.Special AP 的 incoming port)
{
cmsg=GetElmCont("valchk_6","Port is invalid.")+" (Format eg. 1-65535,777)"
portrsary=splits(objval,",")
cflag=0
for(p=0;p<portrsary.length;p++)
{
portrary=splits(portrsary[p],"-")
chkResult=((portrsary[p].indexOf("-")!=-1)?(cvr(portrary[0],"1-65535")&&cvr(portrary[1],"1-65535")&&(parseInt(portrary[0])<parseInt(portrary[1]))):(report.test(portrsary[p])&&cvr(portrsary[p],1,65535)))
if(!chkResult)cflag++
}
chkResult=(cflag==0)
}
/*
1. 'j' => static/Dynamic MTU  (range?)
1. 'k' => PPPoE MTU (range?)
1. 'l' => PPTP MTU  (range?)
1. 'm' => L2TP MTU  (range?)
1. 't' => wan type idle timeout  (range?)
1. 'x' => admin idle timeout (range?)
*/
if(type=='j') //static/Dynamic MTU  (range?)
{
cmsg=GetElmCont("valchk_5","Value is invalid.")
chkResult=(renumber.test(objval)&&cvr(objval,1400,1500)&&(objval!="0"))
}
if(type=='m') //PPPoE MTU (range?)
{
cmsg=GetElmCont("valchk_9","MTU is invalid!")+" (576<=MTU<=1492 or 0(Auto))"
chkResult=(renumber.test(objval)&&(cvr(objval,512,1492)||(objval=="0")))
}
if(type=='l') //PPTP MTU (range?)
{
cmsg=GetElmCont("valchk_9","MTU is invalid!")+" (576<=MTU<=1460 or 0(Auto))"
chkResult=(renumber.test(objval)&&(cvr(objval,512,1460)||(objval=="0")))
}
/*
if(type=='m') //L2TP MTU (range?)
{
cmsg="MTU is invalid! (576<=MTU<=1460)"
chkResult=(renumber.test(objval)&&cvr(objval,576,1460)&&(objval!="0"))
}
*/
if(type=='t') //wan type idle timeout  (range?)
{
cmsg=GetElmCont("valchk_5","Value is invalid.")
chkResult=(renumber.test(objval)&&cvr(objval,30,300)&&(objval!="0"))
}
if(type=='x') //admin idle timeout (range?)
{
cmsg=GetElmCont("valchk_5","Value is invalid.")
chkResult=(renumber.test(objval)&&cvr(objval,30,300)&&(objval!="0"))
}
if(type=='c') //一般合法數字，不能包含 0(?)
{
cmsg=GetElmCont("valchk_5","Value is invalid.")
chkResult=(renumber.test(objval)&&cvr(objval,range)&&(objval!="0"))
}
if(type=='d') //一般合法數字，可以包含 0，如 MTU, idle time (秒)
{
cmsg=GetElmCont("valchk_5","Value is invalid.")
chkResult=(renumber.test(objval)&&cvr(objval,range))
}
if(type=='u') //User defined
{
cmsg=GetElmCont("valchk_5","Value is invalid.")
chkResult=(renumber.test(objval)&&cvr(objval,range))
}
if(type=='f') //other function check
{//execute function (range)
func=range
}
if(type=='u') //User defined
{
cmsg="Value is invalid."
chkResult=(renumber.test(objval)&&cvr(objval,range))
if(range!=""&&range.indexOf("(")==-1)range="("+range
if(range!=""&&range.indexOf(")")==-1)range+=")"
if(itemname!="") cmsg=GetElmCont("valchk_20","")+itemname+GetElmCont("valchk_21"," is invalid.")+range
}
chkResult=chkResult||(objval=="")
showmsg(obj,chkResult,cmsg)
return chkResult
}
/* check Time - chkT(this,'a')
1. 'h' => 一般合法小時，(0-23)
1. 'm' => 一般合法分鐘/秒，(0-59)
1. 's' => 一般合法時:分，(12:34)
1. 'c' => 一般合法小時:分鐘:秒，(1:23:45)
*/
function chkT(obj,type)
{
objval=obj.value
rehour = new RegExp("^"+pn.hour+"$")
reminute = new RegExp("^"+pn.minute+"$")
retime = new RegExp("^"+pn.time+"$")
rectime = new RegExp("^"+pn.ctime+"$")
if(type=='h') //合法小時，(0-23)
{
cmsg=GetElmCont("valchk_10","Hour is invalid.")
chkResult=rehour.test(objval)
}
if(type=='m') //合法分鐘/秒，(0-59)
{
cmsg=GetElmCont("valchk_11","Time is invalid.")
chkResult=reminute.test(objval)
}
if(type=='s') //合法時:分，(12:34)
{
cmsg=GetElmCont("valchk_11","Time is invalid.")
chkResult=retime.test(objval)
}
if(type=='c') //合法小時:分鐘:秒，(1:23:45)
{
cmsg=GetElmCont("valchk_11","Time is invalid.")
chkResult=rectime.test(objval)
}
chkResult=chkResult||(objval=="")
showmsg(obj,chkResult,cmsg)
return chkResult
}
/* check Hex - chkH(this,'a')
1. 'm' => 合法 MAC
1. 'w' => 合法 Hex (WEP key)
1. 'p' => 合法 Hex (Preshare key)
*/
function chkH(obj,type)
{
objval=obj.value
rehex = new RegExp("^"+pn.hex+"$")
remac = new RegExp("^"+pn.mac+"$")
if(type=='m') //一般合法 MAC
{
cmsg=GetElmCont("valchk_12","MAC address is invalid.")
chkResult=remac.test(objval)
}
if(type=='w') //合法 Hex (WEP key)
{
cmsg=GetElmCont("valchk_13","WEP key is invalid.")
chkResult=rehex.test(objval)
}
if(type=='p') //一般合法 Port range
{
cmsg=GetElmCont("valchk_14","Preshare key is invalid.")
chkResult=rehex.test(objval)
}
chkResult=chkResult||(objval=="")
showmsg(obj,chkResult,cmsg)
return chkResult
}
function chkB(obj,type)
{
objval=obj.value
rebmac = new RegExp("^"+pn.bmac+"$")
remac = new RegExp("^"+pn.mac+"$")
if(type=='a') //一般合法 MAC
{
cmsg=GetElmCont("valchk_12","MAC address is invalid.")
chkResult=rebmac.test(objval)
}
if(type=='b') //一般合法 MAC , ":"
{
cmsg=GetElmCont("valchk_12","MAC address is invalid.")
chkResult=remac.test(objval)
}
chkResult=chkResult||(objval=="")
showmsg(obj,chkResult,cmsg)
return chkResult
}
/* check String - chkS(this,'a')
1. 'a' => 字串，不能包含空白
1. 'b' => 字串，可以包含空白
1. 'e' => email 字串
1. 'm' => 多個 email 字串 , ';' 隔開
1. 'r' => tcp/udp 的 port range，接受單一 port 或單一 port range
1. 'n' => tcp/udp 的 port range，接受單一 port 或多個 port(以 "," 隔開)及 port range 混合輸入 (eg .Special AP 的 incoming port)
*/
function chkS(obj,type)
{
objval=obj.value
restr = new RegExp("^"+pn.str+"$")
restrn = new RegExp("^"+pn.strn+"$")
reemail = new RegExp("^"+pn.email+"$")
reemails =new RegExp("^"+pn.emailm+"$")
report =new RegExp("^"+pn.port+"$")
reportr=new RegExp("^"+pn.portrange+"$")
rehex = new RegExp("^"+pn.hex+"$")
reip=new RegExp("^"+pn.ip+"$")
reipr=new RegExp("^"+pn.iprange+"$")
reipssnm=new RegExp("^"+pn.ipnms+"$")
reipssnm2=new RegExp("^"+pn.ipnms2+"$")
restrspmark1 = new RegExp("^"+pn.strspmark1+"$")
reegstr=new RegExp("^"+pn.egstr+"$")
if(type=='a') //字串，不能包含空白
{
cmsg=GetElmCont("valchk_5","Value is invalid.")
chkResult=restrn.test(objval)
}
if(type=='b') //字串，可以包含空白
{
cmsg=GetElmCont("valchk_5","Value is invalid.")
chkResult=restr.test(objval)
}
if(type=='c') // PPPOE SERVICE NAME 不可內含 : * < > ? \ / " | 等字元
{
cmsg=GetElmCont("valchk_5","Value is invalid.")
chkResult=restrspmark1.test(objval)
}
if(type=='e') //一般合法 email 字串
{
cmsg=GetElmCont("valchk_15","Email is invalid.")
chkResult=reemail.test(objval)
}
if(type=='i') //一般 IP range(單一合法 IP 也成立)
{
cmsg=GetElmCont("valchk_3","IP address range is invalid.")
chkResult=reip.test(objval)||reipr.test(objval)
}
if(type=='s') //多個 subnet , ';' 隔開
{
cmsg=GetElmCont("valchk_2","Subnet is invalid. (Format eg. Subnet-A;Subnet-B;Subnet-C.....)")
chkResult=reipssnm.test(objval)
}
if(type=='t') //IP or IP/Subnet
{
cmsg=GetElmCont("valchk_2","Setting is invalid. (Format eg. Normal IP or IP/netmask.)")
chkResult=reipssnm2.test(objval)
}
if(type=='m') //多個 email 字串 , ';' 隔開
{
cmsg=GetElmCont("valchk_15","Email is invalid. (Format eg. Email-A;Email-B;Email-C.....)")
chkResult=reemails.test(objval)
}
if(type=='r') //tcp/udp 的 port range，接受單一 port 或單一 port range
{
reportr.exec(objval)
cmsg=GetElmCont("valchk_6","Port is invalid.")+" (Format eg. 1-65535)"
portrary=splits(objval,"-")
chkResult=((objval.indexOf("-")!=-1)?(cvr(portrary[0],"1-65535")&&cvr(portrary[1],"1-65535")&&(parseInt(portrary[0])<parseInt(portrary[1]))):(report.test(objval)&&cvr(objval,1,65535)))
}
if(type=='n') // tcp/udp 的 port range，接受單一 port 或多個 port(以 "," 隔開)及 port range 混合輸入 (eg.Special AP 的 incoming port)
{
cmsg=GetElmCont("valchk_6","Port is invalid.")+" (Format eg. 1-65535,777)"
portrsary=splits(objval,",")
cflag=0
for(p=0;p<portrsary.length;p++)
{
portrary=splits(portrsary[p],"-")
chkResult=((portrsary[p].indexOf("-")!=-1)?(cvr(portrary[0],"1-65535")&&cvr(portrary[1],"1-65535")&&(parseInt(portrary[0])<parseInt(portrary[1]))):(report.test(portrsary[p])&&cvr(portrsary[p],1,65535)))
if(!chkResult)cflag++
}
chkResult=(cflag==0)
}
if(type=='v') //IP/Subnet
{
cmsg=GetElmCont("valChk_2","Setting is invalid. (Format eg. IP/netmask.)")
chkResult=reipssnm1.test(objval)
}
if(type=='w') //合法 Hex (WEP key)
{
kbit=document.getElementById("keybit").value //0:64bit 1:128bit
kto=document.getElementById("KT0").value     //0:Hex   1:ASCII
ktype=obj.form.elements[locateObj(obj.form,obj)-1].value
cmsg="WEP key is invalid.\nPlease input "+((ktype==0)?"10 or 26 hexadecimal digits":"5 or 13 ASCII characters")+" in WEP Key field!!"
wkeylen=obj.value.length
chkResult=(
(((kbit==0)&&clen(objval,10)||(kbit==1)&&clen(objval,26))&&(kto==0)&&rehex.test(objval)) //Hex (64 bit / 128 bit)
||
(((kbit==0)&&clen(objval, 5)||(kbit==1)&&clen(objval,13))&&(kto==1)&&restr.test(objval)) //ASCII (64 bit / 128 bit)
)
}
if(type=='z') //合法 Hex (WEP key) for wizard
{
kbit=document.getElementById("keybit").value //0:64bit 1:128bit
kto=document.getElementById("KT0").value     //0:Hex   1:ASCII
ktype=obj.form.elements[locateObj(obj.form,obj)-1].value
cmsg="WEP key is invalid.\nPlease input "+((ktype==0)?"10 or 26 hexadecimal digits":"5 or 13 ASCII characters")+" in WEP Key field!!"
wkeylen=obj.value.length
chkResult=(
((ktype==0)&&(clen(objval,10)||clen(objval,26))&&rehex.test(objval)) //Hex (64 bit / 128 bit)
||
((ktype==1)&&(clen(objval, 5)||clen(objval,13))&&restr.test(objval)) //ASCII (64 bit / 128 bit)
)
}
if(type=='k') //合法 Hex (WEP key) for 5G
{
kbit=document.getElementById("keybit_5g").value //0:64bit 1:128bit
kto=document.getElementById("_5g_KT0").value     //0:Hex   1:ASCII
ktype=obj.form.elements[locateObj(obj.form,obj)-1].value
cmsg="WEP key is invalid.\nPlease input "+((ktype==0)?"10 or 26 hexadecimal digits":"5 or 13 ASCII characters")+" in WEP Key field!!"
wkeylen=obj.value.length
chkResult=(
(((kbit==0)&&clen(objval,10)||(kbit==1)&&clen(objval,26))&&(kto==0)&&rehex.test(objval)) //Hex (64 bit / 128 bit)
||
(((kbit==0)&&clen(objval, 5)||(kbit==1)&&clen(objval,13))&&(kto==1)&&restr.test(objval)) //ASCII (64 bit / 128 bit)
)
}
if(type=='x') //合法 Hex (WEP key),因D-Link wizard而新增,要自動幫user save成64 or 128 bit
{
kbita=document.getElementById("keybit")
ktype=obj.form.elements[locateObj(obj.form,obj)-1].value
wkeylen=obj.value.length
chkResult=(((ktype=="0")&&(clen(objval,10)||clen(objval,26))&&rehex.test(objval))
||((ktype=="1")&&(clen(objval, 5)||clen(objval,13))&&restr.test(objval)))
if(wkeylen==5||wkeylen==10) kbita.selectedIndex=0 //64 bit
else if(wkeylen==13||wkeylen==26) kbita.selectedIndex=1 //128 bit
}
if(type=='p') //合法 Hex (Preshare key)
{
cmsg="Preshare key is invalid."
pkeylen=obj.value.length
if((pkeylen>64)||(pkeylen<8))
{
cmsg="Please input 64 hexadecimal digits or 8~63 ASCII character in Preshare Key field!!"
chkResult=false
}
else if(pkeylen==64)
{
cmsg="Please input 64 hexadecimal digits in Preshare Key field!!"
chkResult=rehex.test(objval)
}
else  //ASCII
{
chkResult=true
}
}
if(type=='g') //SMS
{
cc=0;
cnt=0
cmsg=GetElmCont("valChk_20","The length of Text message is too long.")
for(p=0;p<objval.length;p++)
{
strc = objval.charCodeAt(p);
if (!(strc>=32&&strc<=125)){cc=160; cnt+=2;}
else {cc=160; cnt++; }
}
SetElmCont("inputtextnum",cnt+"&nbsp;")
chkResult=(cnt<=cc)
}
chkResult=chkResult||(objval=="")
showmsg(obj,chkResult,cmsg)
return chkResult
}
function splits(strs,splitby)
{
if(strs.indexOf(splitby)==-1)
ary=new Array(strs)
else ary=strs.split(splitby)
return ary
}
 