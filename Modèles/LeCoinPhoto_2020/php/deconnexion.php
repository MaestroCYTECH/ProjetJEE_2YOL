<?php
	session_start();
	session_destroy(); //Ferme la session, detruit les vars associées
	header('Location:/ING1GI1-AGOUSSAL-CLIPET/LeCoinPhoto/index.php');
?>