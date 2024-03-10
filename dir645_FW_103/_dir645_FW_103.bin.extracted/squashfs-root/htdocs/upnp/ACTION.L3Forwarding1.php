<? /* vi: set sw=4 ts=4: */
include "/htdocs/phplib/upnp.php";
include "/htdocs/upnpinc/gvar.php";
include "/htdocs/upnpinc/soap.php";

fwrite("w", $SHELL_FILE, "#!/bin/sh\n");

$dev_nodebase=UPNP_getdevpathbytype($INF_UID, $G_IGD);
if ($dev_nodebase == "")
{
	SHELL_debug($SHELL_FILE, "Can not to get the runtime node path of IGD!");
	exit;
}

$act_name	= query($ACTION_NODEBASE."/action_name");
$svc_type	= query($dev_nodebase."/devdesc/device/serviceList/service:2/serviceType");

if ($ACTION_NAME == $act_name)
{
	if		($act_name == "GetDefaultConnectionService")
	{
		SOAP_act_resp_200(query($dev_nodebase."/server"), $svc_type, $act_name, "ACTION.".$act_name.".php");
	}
	else if ($act_name == "SetDefaultConnectionService")
	{
		SOAP_act_resp_500("501", "Action Failed");
	}
}
else
{
	SOAP_act_resp_500("401", "Invalid Action");
}
?>
