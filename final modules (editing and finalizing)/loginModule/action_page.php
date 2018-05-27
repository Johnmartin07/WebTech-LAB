<?php

include 'connection.php';

	if(isset($_POST["signin"])){

		$username=$_POST["username"];
		$password=$_POST["password"];

		$sql = "SELECT username FROM customer WHERE username='$username' AND password ='$password'";
		$result = $conn->query($sql);
		 
		if(!$row = $result->fetch_assoc()){
		 echo "Username or password is incorrect!";
		}else {
			echo "musify.com";

		}



	}
?>