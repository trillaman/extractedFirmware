<FirewallEnabled><?
	include "/htdocs/phplib/xnode.php";

	$_GLOBALS["errorCode"]=200;
		
	if (query("/acl6/firewall/policy")== "DISABLE") 
		echo "0";
	else 
		echo "1";		
?></FirewallEnabled>
<InboundPinholeAllowed><? echo "1"; ?></InboundPinholeAllowed>