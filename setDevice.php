<?php
	include "./config.php";
	include "./funksionet.php";
	
	if(isset($_POST["submit"]))
	{
		$device = $_POST["device"];
		$hashi = $_POST["hash"];
		
		$table = "`students`";
		$select = "`student_id`";
		$additional = "WHERE `hash`='".$hashi."' LIMIT 1";
		$res = selectFromDbs($conn, $table, $select, $additional);

		if(is_array($res))
		{
			$stud_id = $res[0]["student_id"];
			
			$table = "`devicereg`";
			$select = "*";
			$additional = "WHERE `device1`='".$device."' OR `device2`='".$device."' OR `device3`='".$device."'";
			$res = selectFromDbs($conn, $table, $select, $additional);
			
			if($res == false)
			{
				// Shkak per kete eshte qe me dite nese jan te regjistruara 3 pajisjet e mundshme nga studentet
				// Kthen device me vler device1 ose device2 ose device3 nese naj njona o null perndryshe kthen device me vler null
				$table = "`students` s INNER JOIN `devicereg` d ON s.devicereg_id=d.devicereg_id";
				$select = "d.devicereg_id, IF(d.device1 IS NULL, 'device1', IF(d.device2 IS NULL, 'device2', IF(d.device3 IS NULL, 'device3', NULL))) AS device";
				$additional = "WHERE s.student_id='".$stud_id."'";
				$res = selectFromDbs($conn, $table, $select, $additional);
				if(is_array($res))
				{
					// Kthen devicen qe osht null ndatabaz(device1, device2, device3) per me shti qaty psh device2 nese 2shi o null
					$deviceNum = is_null($res[0]["device"]) ? "" : $res[0]["device"];
					$devicereg_id = $res[0]["devicereg_id"];
					if($deviceNum != "")
					{
						$table = "`devicereg`";
						$set = "`" . $deviceNum . "`='".$device."'";
						$additional = "WHERE `devicereg_id`='".$devicereg_id."'";
						$res = updateDbs($conn, $table, $set, $additional);
						if($res)
						{
							echo json_encode(["message"=>"Pajisja juaj u regjistrua me sukses!", "isTrue" => true]);
							return true;
						}
						else
						{
							echo json_encode(["message"=>"Problem me lidhje", "isTrue"=>false]);
							return false;
						}
					}
					else
					{
						echo json_encode(["message" => "Nuk ka vend ku te regjistrohet pajisja.", "Cause" => "3 pajisje eshte maksimumi per nje student.", "Soulution" => "Ju lutem kontaktoni administratorin.", "isTrue"=>false]);
						return false;
					}
				}
			}
			else
			{
				echo json_encode(["isTrue"=>false, "message"=>"Pajisja juaj eshte e regjistruar"]);
				return false;
			}
		}
		else
		{
			echo json_encode(["isTrue"=>false,"message" => "Error 404"]);
			return false;
		}
	}
?>
