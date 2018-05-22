<?php
if($Confirmation == 1){
	echo "Votre réservation a bien été enregistrée.";
}
else if($Confirmation == 2){
	echo "Il n'y a plus d'exemplaires disponibles de cette ressource.";
}
else{
	echo "Vous avez déjà réserver 5 ressources.";
}
?>
<a href="../Controleur/Home.php"><button>Retour à l'accueil</button></a>