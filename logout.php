<?php 
	include "./config.php";
	include "./funksionet.php";

	if(isset($_POST['id']))
	{
		$id = $_POST['id'];
		
		$table = "`students`";
		$set = "hash='null'";
		$additional = "WHERE num_id='".$id."'";
		$res = updateDbs($conn, $table, $set, $additional);
		if(is_bool($res))
		{
			echo json_encode(["isTrue"=>true, "message"=>"Sukses!"]);
			return true;
		}
		else
		{
			echo json_encode(["isTrue"=>true, "message"=>"Nuk ka mundur te behet ckycja"]);
			return false;
		}
	}
?>