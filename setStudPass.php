<?php
	include "./config.php";
	include "./funksionet.php";
	
	if(isset($_GET["id"]) && isset($_GET["email"]))
	{
		$num_id = $_GET["id"];
		$email = $_GET["email"];
		
		$sql = "SELECT * FROM `students` WHERE `num_id`='".$num_id."' AND `email`='".$email."' LIMIT 1";
		$result = $conn->query($sql);
		// Kontrollon nese ka t'dhena ndatabaze per at student
		if(($result) && mysqli_num_rows($result))
		{
			// Dergon imellen dhe regjistron passwordin me ate student
			$row = mysqli_fetch_array($result, MYSQLI_ASSOC);
			
			mysqli_free_result($result);
			
			if($row["devicereg_id"] === NULL)
			{
				$studPass = "1234567";
				$md5StudPass = md5($studPass);
				$from     = 'evidenca@noreply.com';
				$to       = $email;
				$subject  = 'Evidenca';

				$body = 'Passwordi juaj eshte: '. $studPass;

				$table = "devicereg(password)";
				$values = "'".$md5StudPass."'";
				$lastDevId = insertIntoDbs($conn, $table, $values);
				if(is_numeric($lastDevId))
				{
					if(sendMail($from, $to, $subject, $body))
					{
						$table = "students";
						$set = "devicereg_id='".$lastDevId."'";
						$additional = "WHERE num_id='".$num_id."'";
						updateDbs($conn, $table, $set, $additional);
					}

					// nese du me qu si JSON
					// return json_encode($row);
				}
			}
			else
			{
				echo "Studenti/ja eshte regjistruar tashme deshironi te dergojme nje fjalekalim te ri?";
				return "Studenti/ja eshte regjistruar tashme deshironi te dergojme nje fjalekalim te ri?";
			}
			
		}
		else
		{
			// Can be a problem with connection to database or doesn't have data
			echo "Lidhja nuk mund te behet ose nuk ka te dhena";
		}
  	}
	

?>

