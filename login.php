<?php
	include "./config.php";
	include "./funksionet.php";

	if(isset($_POST['id']) && isset($_POST['password']))
	{
		$id = $_POST['id'];
		$password = $_POST['password'];
		$md5Pass = md5($password);
		
		$table = "`students` s INNER JOIN devicereg d ON d.devicereg_id=s.devicereg_id";
		$select = "s.*";
		$additional = "WHERE s.num_id='".$id."' AND d.pasword='".$md5Pass."' LIMIT 1";
		$res = selectFromDbs($conn, $table, $select, $additional);
		if(is_array($res))
		{
			$studName = $res[0]['name'];
			$hash = $studName.$id;
			$md5hash = md5($hash);
			$table = "`students`";
			$set = "hash='".$md5hash."'";
			$additional = "WHERE num_id='".$id."'";
			$res = updateDbs($conn, $table, $set, $additional);
			if(is_array($res))
			{
				echo json_encode(["isTrue"=>true, "hash"=>$md5hash, "message"=>"Jeni kyqur me sukses"]);
				return true;
			}
			else
			{
				echo json_encode(["isTrue"=>false, "message"=>"Gabim ne server"]);
				return false;
			}
		}
		else
		{
			echo json_encode(["isTrue"=>false, "message"=>"Gabim ne te dhena"]);
			return false;
		}
	}
?>