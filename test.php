<?php

	require "./PHPMailer/PHPMailerAutoload.php";

echo !extension_loaded('openssl')?"Not Available":"Available";
$mail = new PHPMailer();

//$mail->SMTPDebug = 3;                               // Enable verbose debug output
$mail->isSMTP();                                      // Set mailer to use SMTP
$mail->Host = "ssl://smtp.gmail.com";   // Specify main and backup SMTP servers
$mail->SMTPAuth = true;                               // Enable SMTP authentication
$mail->Username = "robertinjodemi@gmail.com";                 // SMTP username
$mail->Password = "Robbert123";                           // SMTP password
$mail->SMTPSecure = "tls";                            // Enable TLS encryption, `ssl` also accepted
$mail->Port = 587;                                    // TCP port to connect to
$mail->SMTPDebug = 4;
$mail->SMTPOptions = array(
    'ssl' => array(
        'verify_peer' => false,
        'verify_peer_name' => false,
        'allow_self_signed' => true
    )
);

$mail->setFrom("robertinjodemi@gmail.com", "Mailer");
$mail->addAddress("rashiti.butrint@gmail.com", "Joe User");     // Add a recipient               // Name is optional
$mail->addReplyTo("info@example.com", "Information");

$mail->isHTML(true);                                  // Set email format to HTML

$mail->Subject = "Here is the subject";
$mail->Body    = 'This is the HTML message body <b>in bold!</b>';
$mail->AltBody = "This is the body in plain text for non-HTML mail clients";

if(!$mail->send()) {
    echo 'Message could not be sent.';
    echo 'Mailer Error: ' . $mail->ErrorInfo;
} else {
    echo 'Message has been sent';
}

//	include "./config.php";

        $name = "Butrint";
        $surname = "Rashiti";
        if(isset($_GET["id"]))
        {
		$to = "rashiti.butrint@gmail.com";
//		$to = 'buti.5@hotmail.com';
//		$to = 'l367305@mvrht.net';
		$subject = 'the subject';
		$message = 'hello';
		$headers = 'From: robertinjodemi@gmail.com' . "\r\n" .
			  'Reply-To: robertinjodemi@gmail.com' . "\r\n" .
			  'X-Mailer: PHP/' . phpversion();
		$success = mail($to, $subject, $message, $headers);

		if (!$success) {
		    $errorMessage = error_get_last()['message'];
		    echo "Email Error: ".$errorMessage;
		}
		else {
		   echo "<p>Email delivery has been sent</p>\n";
		   echo "\n PHP INFO: " . phpinfo();
		}

		$num_id = $_GET["id"];
                $sql = "SELECT * FROM `students` WHERE `num_id`='".$num_id."'";
                $result = $conn->query($sql);
                $row = mysqli_fetch_array($result, MYSQLI_ASSOC);

                echo json_encode($row);
                return json_encode($row);
        }
?>
