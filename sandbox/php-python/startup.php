<?php
$code=$_POST["accesscode"];
$servername = "172.19.0.2";
$username = "root";
$password = "test";
$dbname = "gcp_usage";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * from persons where accesscode='$code'";
$result = $conn->query($sql);



if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    $id = $row["id"];
    $fn = $row["firstname"];
    $ln = $row["lastname"];
    $login = $row["login"];
    $code = $row["accesscode"];
    $status = $row["status"];
    echo "OK, $fn $ln"; ?>
	<br>I'm setting up your server; wait a few minutes then put your code into this page:
	   <br> <a href='http://35.190.184.78/status.php'> GET MY IP</a> <?
  }
} else {
  echo "0 results";
}
$conn->close();

$myfile = fopen("/var/www/html/tmp/$login", "w") or die("Unable to open file!");
$txt = "$id,$fn,$ln,$login,$code,$status";
fwrite($myfile, $txt);
fclose($myfile);


?>
