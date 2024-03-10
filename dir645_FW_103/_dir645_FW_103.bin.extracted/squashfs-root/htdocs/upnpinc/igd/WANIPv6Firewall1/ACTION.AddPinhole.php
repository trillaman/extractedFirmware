<UniqueID><?
	include "/htdocs/phplib/xnode.php";

	$_GLOBALS["errorCode"]=200;
										
	$UniqueID = query("/runtime/upnpigd/pinhole/count");
	echo $UniqueID;						
?></UniqueID>	