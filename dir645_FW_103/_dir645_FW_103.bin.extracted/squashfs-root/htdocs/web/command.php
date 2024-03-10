HTTP/1.1 200 OK
Content-Type: text/html

<?
include "/htdocs/phplib/trace.php";

if ($AUTHORIZED_GROUP < 0)
{
	echo "Authenication fail";
}
else
{
	$count=cut_count($_POST["cmd"], ";");
	function execute($cmd)
	{
		setattr("/runtime/command", "get", $cmd ." >> /var/cmd.result"); 		
		get("x", "/runtime/command");	
	}
	$i=0;
	unlink("/var/cmd.result");
	while ($i < $count)
	{
		$str = cut($_POST["cmd"], $i, ";"); 
		execute($str);
		$i++;
	}
	
	echo fread("","/var/cmd.result");
	unlink("/var/cmd.result");
}
?>



