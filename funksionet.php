<?php
	require_once 'Mail.php';
	
	//returns the id of the inserted row
	function insertIntoDbs($conn, $table, $values)
	{
		$id="";
		$sql = "INSERT INTO ".$table." VALUES(".$values.");";
		$result = $conn->query($sql);
		if($result == true)
		{
			$id = mysqli_insert_id($conn);
			return $id;
		}
		else
		{
			return "Error: " . $sql . "<br>" . $conn->error;
		}
	}

	function updateDbs($conn, $table, $set, $additional="")
	{
		$sql = "";
		if($additional != "")
			$sql = "UPDATE ".$table." SET ".$set." ".$additional."";
		else
			$sql = "UPDATE ".$table." SET ".$set."";
		
		$result = $conn->query($sql);
		if(($result == true) && (mysqli_affected_rows($conn) > 0))
		{
			return true;	
		}
		else
		{
			return false;
			//return "Error: " . $sql . "<br>" . $conn->error;
		}
	}

	// Kthen array te dyfisht ($res[0]['name']) nese listarray false esle ($res[0][0]) sepse rezultatet mund te ken me shum se 1 rresht
	function selectFromDbs($conn, $table, $select, $additional="", $listArray=false)
	{
		$sql = "";
		if($additional != "")
			$sql = "SELECT ".$select." FROM ".$table." ".$additional."";
		else
			$sql = "SELECT ".$select." FROM ".$table."";

		$result = $conn->query($sql);
		if(($result == true) && (mysqli_num_rows($result) > 0))
		{
			$res = array();
			
			if(!$listArray)
				while($row = mysqli_fetch_assoc($result))
					$res[] = $row;
			else
				while($row = mysqli_fetch_array($result))
					$res[] = $row;
			
			mysqli_free_result($result);
			return $res;
		}
		else
		{
			// Kthen false nese nuk ka affected rows
			if((mysqli_num_rows($result) == 0))
				return false;
			// Kthen error nese nuk u konektu mire
			return "Error: " . $sql . "<br>" . mysqli_error($conn);
		}
	}
	
	function sendMail($from, $to, $subject, $body)
	{
		$host = "smtp.gmail.com";
		$username = "evidencaproject@gmail.com";
		$mailPassword = "Jimmy123";

		$recipients = 'evidencaproject@gmail.com';
		
		$params['sendmail_path'] = '/usr/lib/sendmail';
		
		
		$headers = array ('From' => $from,
				 'To' => $to,
				 'Subject' => $subject);
		
		$smtp = Mail::factory('smtp',
						array ('host' => $host,
							'port' => 587,
							'auth' => true,
							'username' => $username,
							'password' => $mailPassword));

		$mail = $smtp->send($to, $headers, $body);

		if (PEAR::isError($mail))
		{
			//echo "error: {$mail->getMessage()}"; 
			return false;
		}
		else 
		{
			return true;
			echo "Message sent";
		}
	}

?>
