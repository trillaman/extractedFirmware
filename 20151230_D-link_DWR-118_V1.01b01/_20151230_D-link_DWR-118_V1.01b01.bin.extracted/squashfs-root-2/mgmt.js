Uy2              0           T 1              function fieldStateSet (chkFldIdArr, unchkFldIdArr)
{
if (chkFldIdArr)
{
chkFldIdArr= chkFldIdArr.split (" ");
for (idx in chkFldIdArr)
document.getElementById(chkFldIdArr[idx]).checked = true;
}
if (unchkFldIdArr)
{
unchkFldIdArr= unchkFldIdArr.split (" ");
for (idx in unchkFldIdArr)
document.getElementById(unchkFldIdArr[idx]).checked = false;
}
}
function depFieldCheck (parent, state, disNrec, disRec, enNrec, enRec)
{
if (!parent)
return;
var obj = document.getElementById(parent);
if (obj.disable) return;
if (obj.checked != state)
return;
return (fieldStateChangeWr (disNrec, disRec, enNrec, enRec));
}
function fieldCssClassChange (fieldId, flag)
{
var DISABLE_STYLE_SUFFIX = "_dis";
if (fieldId.className == DISABLE_STYLE_SUFFIX)
{
alert ("'_dis' is a reserved style name.\n"+
"Please use a different style name");
return;
}
if ((fieldId.type == 'text') || (fieldId.type == 'password') ||
(fieldId.type == 'submit') || (fieldId.type == 'select-one') ||
(fieldId.type == 'button') || (fieldId.type == 'submit'))
{
var enabledStyle;
var disabledStyle;
var idx = fieldId.className.lastIndexOf (DISABLE_STYLE_SUFFIX);
if (idx == -1)
{
enabledStyle = fieldId.className;
disabledStyle = fieldId.className + DISABLE_STYLE_SUFFIX;
}
else
{
enabledStyle = fieldId.className.substring (0, idx);
disabledStyle = fieldId.className;
}
fieldId.className = flag ? disabledStyle : enabledStyle ;
}
else if (fieldId.type == 'image' || (!fieldId.type && fieldId.src))
{
var imgSrc = fieldId.src
var enableSrc = imgSrc;
var disableSrc = imgSrc;
var idx = imgSrc.lastIndexOf("Dis");
if (idx != -1)
{
enableSrc = imgSrc.substring (0, idx);
enableSrc += imgSrc.substring (idx + 3, imgSrc.length);
}
else
{
idx = imgSrc.lastIndexOf(".");
if (idx != -1)
{
disableSrc = imgSrc.substring (0, idx);
disableSrc += "Dis" + imgSrc.substring (idx, imgSrc.length);
}
}
fieldId.src = flag ? disableSrc : enableSrc;
}
}
function fieldArrStateChange (fieldsArr, state)
{
for (var idx = 0; idx < fieldsArr.length; idx++)
{
if (!fieldsArr[idx]) continue;
fieldsArr[idx].disabled = state;
fieldCssClassChange (fieldsArr[idx], state);
}
}
function fieldStateChangeWr (disNrec, disRec, enNrec, enRec)
{
if (disNrec)
fieldStateChange (disNrec, true, false);
if (disRec)
fieldStateChange (disRec, true, true);
if (enNrec)
fieldStateChange (enNrec, false, false);
if (enRec)
fieldStateChange (enRec, false, true);
}
function fieldStateChange (idStr, state, recurse)
{
var inputObjs;
var objIdArr = idStr.split (" ");
for (idx in objIdArr)
{
if (recurse)
{
inputObjs = (document.getElementById(objIdArr[idx])).getElementsByTagName("INPUT");
fieldArrStateChange (inputObjs, state);
inputObjs = (document.getElementById(objIdArr[idx])).getElementsByTagName("SELECT");
fieldArrStateChange (inputObjs, state);
inputObjs = (document.getElementById(objIdArr[idx])).getElementsByTagName("IMG");
fieldArrStateChange (inputObjs, state);
}
else
{
var inputObj = document.getElementById(objIdArr[idx]);
if (inputObj)
{
inputObj.disabled = state;
fieldCssClassChange (inputObj, state);
}
}
}
}
function radioCheckedValueGet (rdbName)
{
var rdbObjArr = document.getElementsByName (rdbName);
if (rdbObjArr.length < 1) return null;
var value = null;
for (var i = 0; i < rdbObjArr.length; ++i)
{
if ((!rdbObjArr[i].disabled) && rdbObjArr[i].checked)
{
value = rdbObjArr[i].value;
break;
}
}
return value;
}
function radioObjWithValueSelect (rbjObjName, valueToSelect)
{
var rdbObjArr = document.getElementsByName (rbjObjName);
if (rdbObjArr.length < 1) return;
var value = null;
for (var i = 0; i < rdbObjArr.length; ++i)
{
if (rdbObjArr[i].value == valueToSelect)
{
rdbObjArr[i].checked = true;
break;
}
}
return;
}
function radGroupFuncSet (radGrpName, funcName)
{
if (!radGrpName)
return;
var rdbObjArr = document.getElementsByName (radGrpName);
if (rdbObjArr.length < 1) return;
for (var i = 0; i < rdbObjArr.length; ++i)
{
if (funcName)
rdbObjArr[i].onclick = funcName;
else
rdbObjArr[i].onclick = function () {return;};
}
return;
}
function comboSelectedValueGet (selObjId)
{
var selObj = document.getElementById (selObjId);
if (!selObj || selObj.disabled) return null;
return selObj.options[selObj.selectedIndex].value;
}
function comboSelectedIndexGet (selObjId)
{
var selObj = document.getElementById (selObjId);
if (!selObj || selObj.disabled) return null;
return selObj.selectedIndex;
}
function comboValueSet (selObjId, selIdx)
{
if (!selObjId || (selIdx == null)) return;
var selObj = document.getElementById (selObjId);
if (!selObj) return;
selObj.selectedIndex = selIdx;
}
function optionValueSelect (selObjId, fldId)
{
if (!selObjId || !fldId) return;
var selObj = document.getElementById (selObjId);
if (!selObj) return;
var fldObj = document.getElementById (fldId);
if (!fldObj || !(fldObj.value.length)) return;
var valueToSelect = fldObj.value;
var idx = 0;
for (idx = 0; idx < selObj.options.length; ++idx)
{
if (selObj.options[idx].value == valueToSelect)
break;
}
if (idx != selObj.options.length)
selObj.selectedIndex = idx;
return;
}
function optionTextSelect (selObjId, fldId)
{
if (!selObjId || !fldId) return;
var selObj = document.getElementById (selObjId);
if (!selObj) return;
var fldObj = document.getElementById (fldId);
if (!fldObj || !(fldObj.value.length)) return;
var valueToSelect = fldObj.value;
var idx = 0;
for (idx = 0; idx < selObj.options.length; ++idx)
{
if (selObj.options[idx].text == valueToSelect)
break;
}
if (idx != selObj.options.length)
selObj.selectedIndex = idx;
return;
}
function umiActionIdChange (umiActionObjId, umiActionId)
{
var umiActionObj = document.getElementById(umiActionObjId);
var actionStr = umiActionObj.name;
var newStr = actionStr.substring (0, (actionStr.lastIndexOf (".") + 1));
umiActionObj.name = newStr + umiActionId;
return true;
}
function umiActionIdChangeSelWrapper (umiActionObjId, selObj)
{
if (!umiActionObjId || !selObj) return false;
return umiActionIdChange (umiActionObjId, selObj.options[selObj.selectedIndex].value);
}
/*
* isChkboxEnabled - This routine is used to check whether the given check box is enabled or not.
*
* Input args:
* idArr - check box id(s) list seperated by spaces.
* mode - checking mode
* 0 - all check box in the list should be enabled (default).
* 1 - any one of the check box in the list should be enabled.
* errMsg - Error message to display if the specified condition is not met.
*
* Returns:
* TRUE - if the specified condition met.
* FALSE - if the specified condition not met.
*/
function isChkboxEnabled (idArr, mode, errMsg)
{
if (idArr == null)
{
alert ('isChkboxEnabled : Invalid arguments');
return false;
}
/* set default */
if (mode == null)
mode = 0;
var returnValue = false;
var fldIdArray = idArr.split (" ");
for (idx in fldIdArray)
{
if (document.getElementById(fldIdArray[idx]).checked)
{
if (mode == 1) {
returnValue = true;
break;
}
}
else
{
if (mode == 0) {
returnValue = false;
if (errMsg) alert (errMsg);
break;
}
}
}
return returnValue;
}
/* display or hide field Start*/
function displayOrHideFields (hideFieldsLst,showFieldsLst)
{
if (hideFieldsLst && hideFieldsLst != "")
{
var fieldsArray = hideFieldsLst.split (" ");
if (!fieldsArray || fieldsArray.length == 0) return;
for (var idx = 0; idx < fieldsArray.length; idx++)
{
var trObj = document.getElementById("tr" + fieldsArray[idx]);
if (trObj) trObj.className = "hide";
}
}
if (showFieldsLst && showFieldsLst != "")
{
var fieldsArray = showFieldsLst.split (" ");
if (!fieldsArray || fieldsArray.length == 0) return;
for (var idx = 0; idx < fieldsArray.length; idx++)
{
var trObj = document.getElementById("tr" + fieldsArray[idx]);
if (trObj) trObj.className = "show";
}
}
}
/* display or hide field End*/
/********************************************************************
* accessLevelCheck - checks for access level of the user
*
* Checkes if user has administrative priviledges.
*
* RETURNS: true or false
*/
function accessLevelCheck ()
{
var accessLevel = document.getElementById ('hdUserPriv').value;
if (!accessLevel || isNaN (accessLevel)) return true;
if (parseInt (accessLevel, 10) != 0)
{
lblWarning.innerHTML = "Administrator privilages required"
return false;
}
return true;
}
 