Uy2              0       "  T 1              function DT2min(DT0,ix){
os=locate("_DT","_start_"+ix)
eval("document.forms['main'].elements["+os+"].value="+DT0+"/60")
}
function hideSSID()
{
f=document.forms['main']
f.ES0.value=(f._ES.checked)?"o":""
f.ES1.value=(f._ES.checked)?"o":""
}
function setKM5(fm)
{
var PKvl=fm.PK.value.length
if(PKvl==64)                  fm.KM5.value="o"
else if((PKvl>=8)&&(PKvl<=63))fm.KM5.value="x"
else
{
alert("Minimum length of Preshare Key is 8. Please input again!")
return false
}
return true
}
function checkSIP(fm)
{
if(fm.RI.value=="0.0.0.0")
{
alert("RADIUS Server IP is invalid!")
return false
}
/*  if(fm.XK0.value=="")
{
alert("Please input RADIUS Shared Key!")
return false
}*/
return true;
}
function inArr(arr,itm)
{
for(aa=0;aa<arr.length;aa++)
{
if(arr[aa]==itm)return true;
}
return false;
}
function turn_ASC(str)
{
var ASC_no = new Array("%2B","%2D","%2A","%2F","%40","%5F","%2E")
var ASC_str= new Array("+",  "-",  "*",  "/",  "@",  "_",  ".")
var ss="";
for(i=0;i<str.length;i++)
{
for(j=0;j<ASC_str.length;j++)
{
if(str.substring(i,i+1)==ASC_str[j])
{
ss+=ASC_no[j]
break;
}
}
if(j==ASC_str.length) ss+=escape(str.substring(i,i+1))
}
return ss
}
function check_hex(str)
{
var c=0;
if(str.length>1)
{
for(k=0;k<str.length;k++)
{
if(str.charAt(k)!=0)
{
if(isNaN(parseInt('0x'+str.charAt(k))))c++
}
}
return (c==0)?true:false;
}
else
return !isNaN(parseInt('0x'+str))
}
function FindEmpty(ary,no,cp,ci)
{
if(arguments.length>=3)i=cp
else i=0
if(arguments.length==4)c=ci
else c=""
for(EmpID=0;EmpID<eval(ary+".length/no");EmpID++)
{
if(eval(ary+"["+(EmpID*no+i)+"]==c")) break;
}
return EmpID;
}
function Ttype(op,len)
{
s=(arguments.length==2)?len:2
/*   if(op>0) op--;
else op=s;
return op;
*/
return (op>0)?op-1:s
}
function cv(val,err,t)
{
val=parseInt(val)
if(arguments.length==2)t="i";
if(t=="i") var ary=new Array(0,255);
if(t=="p") var ary=new Array(0,65535);
if(val>ary[1]||t<ary[0]){alert(err+" is invalid!");return false}
else return true
}
var SelRow
function SelectRow(row){
if(SelRow!=row){
var bar=document.getElementById('tab1')
if(bar==null)bar=document.getElementById('ltab0')
if(SelRow>=0)bar.rows[SelRow].style.backgroundColor=SelRowBC
if(row>=0){
SelRowBC=bar.rows[row].style.backgroundColor
bar.rows[row].style.backgroundColor="yellow"
}
SelRow=row
}
}
function sStar(str)
{
return (str=="")?"*":str
}
var week=new Array("Sun","Mon","Tue","Wed","Thu","Fri","Sat")
function pre_schd_input(){
s1=op(0,12)
s2=op(0,23)
s3=op(0,55,5)+"</SELECT>";
var w="";
for(i=0;i<7;i++) w=w+"<OPTION VALUE="+i+">"+week[i];
document.write(
"<TABLE WIDTH=99% >"+
"<TR><TD WIDTH=15%>Schedule</TD>"+
"<TD WIDTH=15%><INPUT TYPE=RADIO NAME=zsvt VALUE='1'> Always</TD>"+
"<TD WIDTH=65%>&nbsp;</TD>"+
"</TR>"+
"<TR><TD>&nbsp;</TD>"+
"<TD><INPUT TYPE=RADIO NAME=zsvt VALUE='0'> From</TD>"+
"<TD>Time <SELECT NAME=zsvh>"+s2+"</SELECT> : "+
"<SELECT NAME=zsvm>"+s3+" to <SELECT NAME=zsvhh>"+s2+"</SELECT> : "+
"<SELECT NAME=zsvmm>"+s3+"</TD>"+
"</TR>"+
"<TR><TD>&nbsp;</TD><TD>&nbsp;</TD>"+
"<TD>Day &nbsp;<SELECT NAME=zsvd>"+w+"</SELECT>"+
" to <SELECT NAME=zsvdd>"+w+"</SELECT>"+
"</TD>"+
"</TR></TABLE>")
}
function validate_schd(f,ix){
var fd,td,fh,fm,th,tm,xx
if(f.zsvt[1].checked!=true){
f.elements[ix].value="99";
}
else {
var val=new String;
fd=f.zsvd.selectedIndex
fh=f.zsvh.selectedIndex
fm=f.zsvm.selectedIndex*5
if(fm<10) ffm="0"+fm
else ffm=fm
td=f.zsvdd.selectedIndex
th=f.zsvhh.selectedIndex
tm=f.zsvmm.selectedIndex*5
if(tm<10) ttm="0"+tm
else ttm=tm
val =String(fd)+f.zsvh.options[fh].text+ffm
val+="-"+String(td)+f.zsvhh.options[th].text+ttm
f.elements[ix].value=val;
}
return true
}
function disp_schd(f,schd,ix){
if(schd[ix]=="1") { // not always
f.zsvt[1].checked=true;
f.zsvd.selectedIndex =schd[ix+1]
f.zsvdd.selectedIndex=schd[ix+2]
f.zsvh.selectedIndex =schd[ix+3]
f.zsvhh.selectedIndex=schd[ix+4]
f.zsvm.selectedIndex =schd[ix+5]/5
f.zsvmm.selectedIndex=schd[ix+6]/5
}
else f.zsvt[0].checked=true;
}
function MergeR(ii1,ii2)
{
if((ii1=="")&&(ii2=="")) return "";
else if((ii1=="*")||(ii2=="*")) return "";
else if(ii1=="") return ii2;
else if(ii2=="") return ii1;
a1=ii1.split(".")
a2=ii2.split(".")
if(a1.length!=1)
{
for(p=0;p<a1.length;p++)
{
if(parseInt(a2[p])>parseInt(a1[p]))return ii1+"-"+ii2
}
if(ii1==ii2) return ii1
else return ii2+"-"+ii1
}
else
{
i1=parseInt(ii1)
i2=parseInt(ii2)
if(i1==i2) return ii1
else if(i1>i2) return ii2+"-"+ii1
else return ii1+"-"+ii2
}
}
var ary=new Array("","")
function SorR(str)
{
p=str.indexOf("-")
ary=str.split("-")
if((str=="")||(ary[0]==ary[1])&&(ary[0]==""))
{
ary[0]="*"
ary[1]=""
}
else if(p==-1) ary[1]="";
}
function pr_2_schd(id,schd){
j1=id*7
var sch="";
if(schd[j1]==0) sch="always";
else sch=schd[j1+3]+":"+schd[j1+5]+" - "+schd[j1+4]+":"+schd[j1+6]+", "+week[parseInt(schd[j1+1])]+" - "+week[parseInt(schd[j1+2])];
return sch;
}
act=new Array(2);
function newID(){
SelectRow(-1);
act[0]=EmpID;
document.forms['main'].reset()
document.forms['main']._ID.value=EmpID+1
}
function xmainform()
{
ffc=document.forms['main']
for(fc=0;fc<ffc.length;fc++)
ffc.elements[fc].disabled=true;
}
function TurnTimes(x)
{
dayx = parseInt(x/(60*60*24));
hourx= parseInt(x/(60*60))%24;
minx = parseInt(x/60)%60;
secx = x % 60;
str = (dayx >0 ?(dayx +" day(s) "): "")+
(hourx>0 ?(hourx+" hr(s)  "): "")+
(minx >0 ?(minx +" min(s) "): "")+
(secx >0 ?(secx +" sec(s) "): "");
return str
}
function swid(div,sw)
{
for(d=0;d<arguments.length;d++)
{
ddiv=document.getElementById(arguments[d*2])
if(ddiv!=null)ddiv.style.display=(arguments[d*2+1])?'block':'none';
}
}
function swids(div,sw)
{
for(d=0;d<arguments.length;d++)
{
ddiv=document.getElementById(arguments[d*2])
if(ddiv!=null)ddiv.style.display=(arguments[d*2+1])?'inline':'none';
}
}
function swobji(obj,sw)
{
for(d=0;d<arguments.length;d++)
{
if(arguments[d*2])arguments[d*2].style.display=(arguments[d*2+1])?'inline':'none';
}
}
function swobj(obj,sw)
{
for(d=0;d<arguments.length;d++)
{
if(arguments[d*2])arguments[d*2].style.display=(arguments[d*2+1])?'block':'none';
}
}
function swobjs(obj,sw)
{
for(d=0;d<arguments.length;d++)
{
if(arguments[d*2])arguments[d*2].disabled=!(arguments[d*2+1])
}
}
function swobjids(obj,sw)
{
for(d=0;d<arguments.length;d++)
{
ddiv=document.getElementById(arguments[d*2])
if(ddiv!=null)ddiv.disabled=!(arguments[d*2+1])
}
}
function swWLAN(sw,tabsw)
{
if(arguments.length==1)
tabs2=new Array("tab1","tab3","tab2","tab4","tab5","tab6","stab")
else tabs2=tabsw
for(tt=0;tt<tabs2.length;tt++)
{
swdivrcs(tabs2[tt],sw)
}
f2=document.forms['main']
s=false;
for(r=0;r<f2.length;r++)
{
f2elm=f2.elements[r].name
if((f2elm=="_eny_start")||(f2elm=="_eny_start2")||(f2elm=="_eny_start3"))
{s=true;}
else if((f2elm=="_eny_end")||(f2elm=="_eny_end2")||(f2elm=="_eny_end3"))
{s=false;}
if(s) f2.elements[r].disabled=!sw
else continue;
}
}
function swdivrcs(tab,sh,row,col)
{
allflag=(arguments.length<3)
disableColor="#999999"
enableColor="#333333"
wtable=document.getElementById(tab)
if(wtable!=null)
{
wrowl=wtable.rows
trows=(allflag)?wrowl:splits(row,'-')
for(i=0;i<trows.length;i++)
{
wrcl=wtable.rows[i].cells
tcols=(allflag)?wrcl:splits(col,'-')
for(j=0;j<tcols.length;j++)
{
rowi=(allflag)?i:trows[i]
colj=(allflag)?j:tcols[j]
wij=wtable.rows[rowi].cells[colj]
wij.style.color =(sh?enableColor:disableColor)
}
}
}
}
function swids(div,sw)
{
for(d=0;d<arguments.length;d++)
{
ddiv=document.getElementById(arguments[d*2])
if(ddiv!=null)ddiv.style.display=(arguments[d*2+1])?'inline':'none';
}
}
function swid(div,sw)
{
for(d=0;d<arguments.length;d++)
{
ddiv=document.getElementById(arguments[d*2])
if(ddiv!=null)ddiv.style.display=(arguments[d*2+1])?'block':'none';
}
}
function swidi(div,sw)
{
for(d=0;d<arguments.length;d++)
{
ddiv=document.getElementById(arguments[d*2])
if(ddiv!=null)ddiv.style.display=(arguments[d*2+1])?'inline':'none';
}
}
function emptyform()
{
fm=document.forms['main']
for(s=0;s<fm.length;s++)
{
fmobj=fm.elements[s]
if(fmobj.type=="select-one")fmobj.selectedIndex=0
if(fmobj.type=="text")fmobj.value=""
if(fmobj.type=="checkbox")fmobj.checked=false
if(fmobj.type=="radio"){fmobj.checked=true;s=s+2;}
}
}
function checkrulename()
{
if(document.getElementById("rulename").value=="")
{
alert("Name is invalid!");
document.getElementById("rulename").focus();
return false;
}
else return true;
}
function findSelectIndex(selobj,searchval)
{
for(o=0;o<selobj.length;o++)
{
if(selobj.options[o].value==searchval){return o}
}
return false;
}
function checkrulename2()
{
for(i=1;i<=5;i++)
{
if(document.getElementById("tleid"+i).checked)
{
if(document.getElementById("tlid"+i).value=="")
{
alert("Name of tunnel "+i+" is invalid!");
document.getElementById("tlid"+i).focus();
return false;
}
else return true;
}
}
}
 