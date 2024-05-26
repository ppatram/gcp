<?php
$login=$_POST["login"];

$filename = "/var/www/html/tmp/$login";

$myfile = fopen($filename, "r") or die("<H1>Did you start your server?</H1><a href=/index.php>click here</a>");
$txt = fread($myfile,filesize($filename));
fclose($myfile);
$parts = explode(",", $txt);

$ip = $parts[6];
$login = $parts[3];

if ($ip == "") {
	echo "<h1>Your server is not started or not provisioned yet<br>Refresh after a minute</h1>";
}
else {
	echo "Your server ip is $ip; Login name is $login";
	unlink($filename);
}




?>
