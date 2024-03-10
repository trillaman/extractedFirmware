<? /* vi: set sw=4 ts=4: */
include "/htdocs/phplib/xnode.php";
include "/htdocs/phplib/trace.php";

if (query("/runtime/device/layout")!="router")
{
	$_GLOBALS["errorCode"]=501;
}
else
{
	anchor($_GLOBALS["ACTION_NODEBASE"]."/AddPinhole");
	$RemoteHost			= query("RemoteHost");
	$RemotePort			= query("RemotePort");
	$InternalClient		= query("InternalClient");
	$InternalPort		= query("InternalPort");
	$Protocol			= query("Protocol");
	$LeaseTime			= query("LeaseTime");
	$UniqueID			= query("UniqueID");
	
	/*
	TRACE_debug("  === [AddPinhole] RemoteHost: ".     $RemoteHost);
	TRACE_debug("  === [AddPinhole] RemotePort: ".     $RemotePort);
	TRACE_debug("  === [AddPinhole] InternalClient: ". $InternalClient);
	TRACE_debug("  === [AddPinhole] InternalPort: ".   $InternalPort);
	TRACE_debug("  === [AddPinhole] Protocol: ". 	   $Protocol);
	TRACE_debug("  === [AddPinhole] LeaseTime: ".      $LeaseTime);	
	*/
	
	if		($RemoteHost=="" || $RemotePort=="")			$_GLOBALS["errorCode"]=716;	
	else if ($Protocol  =="" || $InternalClient=="")		$_GLOBALS["errorCode"]=402;
	else
	{
		$done = 0;
		$_GLOBALS["errorCode"]=200;

		if ($Protocol=="6")		$proto = "TCP";
		if ($Protocol=="17")	$proto = "UDP";
		if ($InternalPort=="")	$InternalPort = $RemotePort;
		
		
		foreach ("/runtime/upnpigd/pinhole/entry")
		{
			/* If exist, update the description. */
			if ($RemoteHost == query("remotehost") && $RemotePort == query("remoteport") && 
				$proto == query("protocol"))
			{
				$_GLOBALS["errorCode"]=718;
				$done = 1;
			}
			
			/* XBOX test wish us to report OK, if the reule is existing. */
			if ($proto				== query("protocol") && 
				$RemoteHost			== query("remotehost") && 
				$RemotePort			== query("remoteport") &&
				$InternalClient		== query("internalclient") &&
				$InternalPort		== query("internalport"))	
			{
				if ($UniqueID != query("UniqueID"))
				{
					set("UniqueID", $UniqueID);
				}
				$_GLOBALS["errorCode"]=200;
				$done = 1;
			}
			if ($done == 1) break;
		}
				
		if ($LeaseTime != "" && $LeaseTime < 0)
		{
			$_GLOBALS["errorCode"] = 725;
			$done = 1;
		}		
		
		if ($done == 0)
		{
			$Enabled = 1;
			
			$newentry = XNODE_add_entry("/runtime/upnpigd/pinhole", "PINHOLE");
			anchor($newentry);
			
			$UniqueID = query("/runtime/upnpigd/pinhole/count");
			if ($UniqueID == "" || $UniqueID == "1")	$UniqueID = 1;
			else										$UniqueID = query("/runtime/upnpigd/pinhole/count");
			
			set("enable",			$Enabled);
			set("protocol",			$proto);
			set("remotehost",		$RemoteHost);
			set("remoteport",		$RemotePort);
			set("internalport",		$InternalPort);
			set("internalclient",	$InternalClient);
			set("leasetime",		$LeaseTime);
			set("UniqueID",			$UniqueID);			

			if ($RemoteHost != "")		$SourceIP = ' -s "'.$RemoteHost.'"';
			else						$SourceIP = '';
			
			if ($InternalClient != "")	$DestIP = ' -d "'.$InternalClient.'"';
			else						$DestIP = '';
			
			if ($proto == "TCP")		$proto = " -p tcp";
			else						$proto = " -p udp";
																	
			$cmd =	'ip6tables -t filter -A PINHOLES.UPNP'.$proto.' '.$SourceIP.' --sport '.$RemotePort.
					' '.$DestIP.' --dport '.$InternalPort.' -j ACCEPT';						
			
			TRACE_debug("  === [AddPinhole] ". $cmd);								

			SHELL_info("a", $_GLOBALS["SHELL_FILE"], "UPNP:".$cmd);
			fwrite("a", $_GLOBALS["SHELL_FILE"], $cmd."\n");			
			
			$_GLOBALS["SOAP_BODY"] = "ACTION.AddPinhole.php";	// return UniqueID.																	
		}
	}
}
?>