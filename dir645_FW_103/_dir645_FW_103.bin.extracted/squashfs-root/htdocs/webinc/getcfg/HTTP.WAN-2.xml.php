<module><?
include "/htdocs/phplib/xnode.php";
$infp = XNODE_getpathbytarget("", "inf", "uid", "WAN-2", 0);
?>
	<service><?=$GETCFG_SVC?></service>
	<inf>
		<active><?echo query($infp."/active");?></active>
		<nat><?echo query($infp."/nat");?></nat>
		<web><?echo query($infp."/web");?></web>
		<weballow>
<?			echo dump(3, $infp."/weballow");
?>		</weballow>
	</inf>
	<ACTIVATE>ignore</ACTIVATE>
</module>
