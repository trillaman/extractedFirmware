//_LM_=0;
debugmode=false;
//debugmode=true;
debugmark="@@@@@@@@@@@@@@";
var langnames1=new Array(
 "English"
,"Portuguese"
,"French"
,"German"
,"Spanish"
,"Italian"
//,"Polski"
)
var langmodes1=new Array("us","us","pt","fr","de","sp","it");//,"pl"

var langnames_wizard=new Array(
//"English"
 "English"
,"Portuguese"
,"French"
,"German"
,"Spanish"
//5
,"Italian"
,"Dutch"
,"Polish"
,"Czech"
//10
,"Hungarian"
,"Nynorsk"
,"Danish"
,"Finnish"
,"Swedish"
//15
,"Greek"
,"Croatian"
,"Romanian"
,"Slovenian"
);

var langmodes_wizard=new Array(
 "us"
,"us"
,"pt"
,"fr"
,"de"
//5
,"sp"
,"it"
,"nl"
,"po"
,"cs"
//10
,"hu"
,"no"
,"da"
,"fi"
,"sv"
//15
,"el"
,"hr"
,"ro"
,"sl"
);

var langfiles=new Array("setup","help")

if((location.pathname.indexOf('wanwiznew.htm')!=-1)&&(wizlang == '1')){ //wizard have 18 language
  langnames=langnames_wizard
  langmodes=langmodes_wizard
}else{
  langnames=langnames1
  langmodes=langmodes1
}

function dw(str){document.write(str+'\n')}
function xloadjs(jsfn)
{
   var headID = document.getElementsByTagName("head")[0];
   for (i=0; i<arguments .length; i++)
   {
      var newJs = document.createElement('script');
      newJs.type = 'text/javascript';
      newJs.src= arguments[i]+".js";
      headID.appendChild(newJs);
   }
}
function includejs(jsfn,searchpath)
{
   	var jst=new Date();ztv='rc='+jst.getTime()
    aa=(arguments.length<2)?"":(searchpath+"&")
	  srcv=jsfn+".js?"+aa+ztv
	  dw("<script type='text/javascript' src='/"+srcv+"'></script>")
}
function loadjs(lm)
{
   if(langmodes[lm] !="us"){
//English的js must load..toshi
	   includejs("ssetup_us")
	   //includejs("ssetup_us2")
	   includejs("shelp_us")
     includejs("ssetupwiz_us")
//other language
   	 includejs("ssetup_"+langmodes[lm])
   	 //includejs("ssetup_"+langmodes[lm]+"2")
   	 includejs("shelp_"+langmodes[lm])
     includejs("ssetupwiz_"+langmodes[lm])
   }
}
loadjs(_LM_)
function countchar(str,schar)
{
   cc=0;
   for(s=0;s<str.length;s++)
   {
      if(str.substr(s,1)==schar)cc++; //只取one word
   }
   return cc;
}

//chaglang的詳細說明在2012/11/01的UI會議報告裡..toshi
function chgLang(fr)
{
   func=lang
   if((typeof func) != "string"){return}
/*
注意,因為英文時不載入任何字串Array
所以英文時"以下"一定會catch error而return, 因為Array不存在
代表英文字串會顯示HTML裡的, 而不是陣列裡的字, 可節省HTML loading
*/
   try {eval("langa="+func)}catch(e){return}
   qSetCont('span',fr)
   qSetCont('input',fr)
   qSetCont('option',fr)
}
function qSetCont(tags,fr)
{
   tagary=document.getElementsByTagName(tags);
   for(t=0;t<tagary.length;t++)
   {
     tid=tagary[t].id
//若item id不是"_"開頭,就skip
     if(tid.substring(0,1)!="_") continue;
//若最後一個字不是數字,也不是"~xml",就skip
     if(isNaN(tid.substring(tid.length-1,tid.length))&&tid.substring(tid.length-4,tid.length)!="~xml") continue;
//fr=1代表只需部份翻譯,像status.htm在refresh rlist()的時候,若span id後面不是~xml的就不翻, see HELP in "ui.js"
     if(fr==1 && tid.indexOf('~xml')==-1) continue;

//翻譯start....
     
	   if(countchar(tid,'_')==1){      //ex. "_1", or "_ind1" or "_1~xml"
       langa_eng=eval(lang+"_en")
       eval("langa="+lang)           //langa=這頁的Array
     }
	   else if(countchar(tid,'_')==2){ //ex. "_atbox_1" or "_atbox_ind1" or "_atbox_1~xml"
	   	 tids=tid.split("_")
	   	 lang2=tids[1] //從"_atbox_1" 取出 "atbox"
	     try {eval("langa_eng="+lang2+"_en")}catch(e){continue}
       eval("langa="+lang2)          //langa=atbox Array
	   }
	   else continue;
//===================== compare by string =====================
     if(tid.indexOf("ind")==-1){
       for(l=0;l<langa_eng.length;l++){ //在atbox_en Array中search this string
         if(tags=="span"){ //for <span>
         	 if(tagary[t].innerHTML.indexOf("&")!=-1){
         	 	 /*innerHTML裡若有&會讀成&amp;, ex. a & b -> a &amp; b
         	 	   必需變成a & b才能跟Array進行compare
         	 	   innerHTML若改成用textContent可solve "&" 的issue, but IE8 not support textContent*/
         	   if(tagary[t].innerHTML.replace(/&amp;/g, '&')==langa_eng[l]){
         	 	   tagary[t].innerHTML=langa[l]
       	   	   break;
       	     }
         	 }
         	 else{ //正常case
         	   if(tagary[t].innerHTML==langa_eng[l]){
         	 	   tagary[t].innerHTML=langa[l]
       	   	   break;
       	     }
       	   }
         }
         if(tags=="input"){ //for button
           if((tagary[t].type=="button")||(tagary[t].type=="submit")||(tagary[t].type=="reset")) //button
           {
             if(tagary[t].value==langa_eng[l]){ 
           	   tagary[t].value=langa[l]
           	   break;
             }
           }
         }
         if(tags=="option"){ //for selectbox
         	 //特殊case, for Group 1, Group 2, Group 3, Group 4......in vpndynip.htm
         	 if(tagary[t].text.substring(0,5)=="Group" && langa_eng[l]=="Group"){
         	 	 gnum=tagary[t].text.substring(6,tagary[t].text.length)
       	 	   tagary[t].text=langa[l]+gnum
       	 	   break;
         	 }
         	 //正常case
       	   if(tagary[t].text==langa_eng[l]){ 
       	 	   tagary[t].text=langa[l]
       	 	   break;
       	   }
         }
       }
     }
//===================== compare by index =====================
     else{
     	 if(fr==1){
     	 	 tido=tid.substring(tid.indexOf("ind")+3,tid.length-4) //_ind9~xml => 9 or _wary_ind9~xml => 9
     	 }
     	 else{
         tido=tid.substring(tid.indexOf("ind")+3,tid.length) //_ind9 => 9 or _wary_ind9 => 9
       }
       if(tido>=langa.length) continue; //the index is over arrary`s length
       
       if(tags=="span"){	 
         tagary[t].innerHTML=langa[tido]
       }
       if(tags=="input"){
         if((tagary[t].type=="button")||(tagary[t].type=="submit")||(tagary[t].type=="reset"))
         {
       	   tagary[t].value=langa[tido]
         }
       }
       if(tags=="option"){
   	 	   tagary[t].text=langa[tido]
       }
     }
   }
}

function SetElmCont(idx,cont)
{
   ddiv=document.getElementById(idx)
   if(cont=="ddiv.innerHTML")return false
   if(ddiv!=null)
   {
      if(debugmode&&(idx.substr(0,1)=="_"))ddiv.style.color="#ff0000";
      if((ddiv.type=="button")||(ddiv.type=="submit")||(ddiv.type=="reset"))
      {
          contv=(debugmode&&cont.indexOf("'>")!=-1)?(cont.substring(cont.indexOf("'>")+2,cont.lastIndexOf("</span>"))):cont;
          ddiv.value=contv
      }
      else if(ddiv.text!=null) ddiv.text=cont
      else ddiv.innerHTML=cont
      if(debugmode)ddiv.style.color='red'
      return true
   }
   else return false
}
function GetElmCont(idx,dcont)
{
/*
1.新的GetElmCont()的id命名規則為"atbox_1" or "atbox_ind1"
  沒有ind時結尾流水號數字不重要,通常寫0即可,但必須有數字
  只能有一個"_"
2."_1" or "_ind1"這種id可接受
3.有些id不符合以上規則,因為它不是為了翻譯
  只是為了得出<span id>內的字串
  所以它的arguments.length只會=1
*/
   retv=dcont;
   if(arguments.length<2) return document.getElementById(idx).innerHTML;
   if(isNaN(idx.substring(idx.length-1,idx.length))) return retv;
   if(idx.indexOf("_")!=-1)
   {
     idxs=idx.split("_")          //idxs[0]="atbox"
     if(idxs[0]=="") idxs[0]=lang //ex. _1 or "_ind1"
	   try {eval("langa_eng="+idxs[0]+"_en")}catch(e){return retv}
     //langa=atbox Array,若language為English時這裡就會因為找不到Array而return
	   try {eval("langa="+idxs[0])}catch(e){return retv}

//===================== compare by string =====================
	   if(idx.indexOf("ind")==-1){
       for(l=0;l<langa_eng.length;l++){ //在atbox_en Array中search this string
     	   if(dcont==langa_eng[l]){ 
           retv=langa[l]
           break;
     	   }
     	 }
     }
//===================== compare by index (old language way) =====================
     else{
       idxo=idx.substring(idx.indexOf("ind")+3,idx.length)
       if(idxo>=langa.length) return retv;
       retv=langa[idxo]
     }
   }
   else retv=dcont

   return retv;
}
