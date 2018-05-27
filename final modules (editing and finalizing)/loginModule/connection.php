<?php

$conn = mysql_connect("musify.com", "root", "root", "musify" );

if (!$conn){
	die("connection failed: ".mysqli_connect_error());
}

?>