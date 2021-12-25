<?php


    $host="localhost";	// adresse/nom du serveur, localhost par défaut
	$port=3306;	// port de connexion au serveur
	$user="root";	// login utilisateur
	$pwd="";	// mot de passe utilisateur
	$db="lecoinphoto";	// base de données à utiliser

	$_SESSION['bddData']['host']=$host;
	$_SESSION['bddData']['port']=$port;
	$_SESSION['bddData']['user']=$user;
	$_SESSION['bddData']['pwd']=$pwd;
	$_SESSION['bddData']['db']=$db;
?>
