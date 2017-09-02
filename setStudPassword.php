<?php
	include "./config.php";
	include "./funksionet.php";
	
	echo "fillim";
	
	if(isset($_GET["id"]) && isset($_GET["email"]))
	{
		echo "isset";
		$num_id = $_GET["id"];
		$email = $_GET["email"];
		
		$sql = "SELECT * FROM `students` WHERE `num_id`='".$num_id."' AND `email`='".$email."' LIMIT 1";
		$result = $conn->query($sql);
		echo "result";
		// Kontrollon nese ka t'dhena ndatabaze per at student
		if(($result) && mysqli_num_rows($result))
		{
			echo "mas result";
			// Dergon imellen dhe regjistron passwordin me ate student
			$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
			
			mysqli_free_result($result);
			
			$studPass = "1234567";
			$md5StudPass = md5($studPass);
			$from     = 'evidenca@noreply.com';
			$to       = $email;
			$subject  = 'Evidenca';

			$body = 'Passwordi juaj eshte: '. $studPass;
			
			$table = "devicereg(password)";
			$values = "'".$md5StudPass."'";
			$lastDevId = insertIntoDbs($conn, $table, $values);
			echo $lastDevId;
			if(is_numeric($lastDevId))
			{
				if(sendMail($from, $to, $subject, $body))
				{
					$table = "students";
					$set = "devicereg_id='".$lastDevId."'";
					$additional = "WHERE num_id='".$num_id."'";
					updateDbs($conn, $table, $set, $additional);
				}

				return json_encode($row);
			}
		}
		else
		{
			// Can be a problem with connection to database or doesn't have data
			echo "Nuk mundi te behej lidhja ose nuk ka te dhena";
		}
  	}
	

?>

