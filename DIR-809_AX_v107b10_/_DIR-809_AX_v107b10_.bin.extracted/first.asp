<html>
<head>
<script type="text/javascript" src="ubicom.js"></script>
<% getLangInfo("LangPath");%>
<script type="text/javascript" src="utility.js"></script>
</head>
<script>
/*
 * trim_string
 *	Remove leading and trailing blank spaces from a string.
 */
function trim_string(str)
{
	var trim = str + "";
	trim = trim.replace(/^\s*/, "");
	return trim.replace(/\s*$/, "");
}
<% getInfo("auto_login_start_js");%>
function init()
{
    /*var isMobile = false;
    if(navigator.userAgent.match(/Android|webOS|iPhone|iPod|BlackBerry/i))
    {
        isMobile = true;
    }
    var ecflag = <% getIndexInfo("RestoreDefault") %>;

    if(isMobile)
    {
        if(ecflag == 0)
        {
            self.location.href = "MobileWiFi.asp?t="+new Date().getTime();
        }
        else
        {
            self.location.href = "MobileIndex.asp";
        }
    }
    else
    */
    {
        var ecflag = <% getIndexInfo("RestoreDefault") %>;
        //var ecflag = 1;//it seem that we not use enableecflag.
        if(ecflag == 0&&LangCode == "SC")
        {
        var ajaxObj = GetAjaxObj("request_key");
		ajaxObj.createRequest();
		ajaxObj.onCallback = function(text)
		{
			ajaxObj.release();
			send_auto_login(text);
		}
		//ajaxObj.returnXml=false;
		ajaxObj.setHeader("Content-Type", "application/x-www-form-urlencoded");
		ajaxObj.sendRequest("formRequestKey.htm" , "act=getaplist");
        }
        else
        {
            self.location.href="index.asp?t="+new Date().getTime();
        }
    }
}
</script>
<body onLoad="init();">
</html>
