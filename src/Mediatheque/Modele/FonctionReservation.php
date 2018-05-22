<?php
function Reservation($idR){
	include('../Constante/ConnexionBDD.php');
	$idM = $_SESSION['identifiant'];
	$req = "SELECT ID_RESERV FROM reservation WHERE ID_MEMBRE='".$idM."'";
	$resultatEM = $mysqli->query($req);
	$nbrEmprunts = $resultatEM->num_rows;
	if($nbrEmprunts < 5){
		$req = "SELECT NBR_EXEMP FROM ressource WHERE ID_RESSOURCE=".$idR;
		$resultatEX = $mysqli->query($req);
		$nbrExemp = mysqli_fetch_array($resultatEX);
		if($nbrExemp['NBR_EXEMP'] > 0){
			$req = "INSERT INTO reservation VALUES (DEFAULT,'".$idM."',".$idR.",'".date('Y-m-d')."',NULL)";
			$mysqli->query($req);
			return 1;
		}
		else{
			return 2;
		}
	}
	else{
		return 3;
	}
}
?>