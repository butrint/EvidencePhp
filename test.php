<?php
        $name = "Butrint";
        $surname = "Rashiti";
        if(isset($_GET["id"]))
        {
			  $to      = 'buti.5@hotmail.com';
			  $subject = 'the subject';
			  $message = 'hello';
			  $headers = 'From: webmaster@example.com' . "\r\n" .
				  'Reply-To: webmaster@example.com' . "\r\n" .
				  'X-Mailer: PHP/' . phpversion();
			  mail($to, $subject, $message, $headers);
			  
			  
			  $num_id = $_GET["id"];
                $sql = "SELECT * FROM students WHERE `num_id`='".$id."'";
                $result = mysqli_query($conn,$sql);
                $row = mysqli_fetch_array($result,MYSQLI_ASSOC);

                echo json_encode($row);
                return json_encode($row);

        }
?>