function init_form_session_key(F, cgi_action)
{
	if (close_session == "1")
	{
		F.action = cgi_action;
	}
	else
	{
		F.action = cgi_action + "?session_id=" + session_key;
	}
}

function do_open(ASP,name, param)
{
	if (close_session != "1")
	{
		ASP = ASP + "?session_id=" + session_key;
	}
	
	return window.open(ASP,name,param);
	//window.open(ASP,name,param).focus();
}

function do_replace(ASP)
{
	if (close_session != "1")
    	{			
		ASP = ASP + "?session_id=" + session_key;
	}

	window.location.replace(ASP);
}

function help_link(ASP)
{
	var num = ASP.indexOf("#");

	if (num > 0){
		page = ASP.substring(0, num);
		position = ASP.substring(num, ASP.length);
	}else {
		page = ASP;
		position = "";
	}
	document.write("<b><a target=_blank href=" + page + position + ">");
	/*
	if (close_session != "1") 
	{
		document.write("<b><a target=_blank href=" + page + "?session_id=" +session_key + position +">");
	
	}
	else
	{
		document.write("<b><a target=_blank href=" + page + position + ">");
	}
	*/
}

function do_href(url, ses_id)
{
	if ( close_session == "1" )
	{
 		return url;
	}
	else
	{
 		return url+"?session_id="+ses_id;
	}
}
