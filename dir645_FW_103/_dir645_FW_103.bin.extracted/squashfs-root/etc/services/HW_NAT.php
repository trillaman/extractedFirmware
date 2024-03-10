<?
include "/htdocs/phplib/xnode.php";

function startcmd($cmd)	{fwrite(a,$_GLOBALS["START"], $cmd."\n");}
function stopcmd($cmd)	{fwrite(a,$_GLOBALS["STOP"], $cmd."\n");}

/**************************************************************************/

fwrite("w",$START, "#!/bin/sh\n");
fwrite("w", $STOP, "#!/bin/sh\n");
/* In router mode, restart ralink hw_nat */
if (query("/device/layout")=="router")
{
	$bwcp = XNODE_getpathbytarget("/bwc", "entry", "uid", $bwc_profile_name, 0);
	
/*	$active_hw_nat=1;*/
	$active_hw_nat=query("/device/hw_nat");
	/* If have WFQ or SPQ enable, then doesn't run hw_nat */
	foreach ("/bwc/entry")
	{
		if (query("enable") == 1 && query("uid") != "" )
		{
			if (query("flag") == "TC_WFQ" || query("flag") == "TC_SPQ" )
			{
				$active_hw_nat =0;
			}
		}
	}

	/* Enable hw_nat */
	if ($active_hw_nat == 1 )
	{
     	startcmd("echo insmod hw_nat\n");
   		startcmd("insmod /lib/modules/hw_nat.ko\n");
    	stopcmd("echo \"rmmod hw_nat\"\n");
    	stopcmd("rmmod hw_nat\n");
	}
	else 
	{
		/* Try to disable hw_nat */
    	startcmd("echo \"rmmod hw_nat\"\n");
    	startcmd("rmmod hw_nat\n");
   	}
}

?>
