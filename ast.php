<?php
	include "./config.php";
	require_once 'Mail.php';
	
	if(isset($_GET["id"]))
	{
		$num_id = $_GET["id"];
                $sql = "SELECT * FROM `students` WHERE `num_id`='".$num_id."'";
                $result = $conn->query($sql);
                $row = mysqli_fetch_array($result, MYSQLI_ASSOC);

		$studPass = "1234567";
		$md5StudPass = md5($studPass);
		$host = "smtp.gmail.com";
        	$username = "evidencaproject@gmail.com";
	        $mailPassword = "Jimmy123";

	        $recipients = 'evidencaproject@gmail.com';


	        $from     = 'evidenca@noreply.com';
        	$to       = 'rashiti.butrint@gmail.com';
	        $subject  = 'Evidenca';

	        $body = 'Passwordi juaj eshte: '. $studPass;

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

	        if (PEAR::isError($mail)){
	                echo "error: {$mail->getMessage()}";
	        } else {
        	        echo "Message sent";
	        }

                return json_encode($row);
        }
	

?>

