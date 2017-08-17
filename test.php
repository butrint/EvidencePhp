<?php
	include("config.php");
	$name = "Butrint";
	$surname = "Rashiti";
	if(isset($_GET["id"]))
	{
		$sql = "SELECT * FROM students WHERE `id_student`='13'";
		$result = mysqli_query($conn,$sql);
		$row = mysqli_fetch_array($result,MYSQLI_ASSOC);
		
		return $row;
	}
?>
