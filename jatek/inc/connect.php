<?php
$hoszt = "localhost";
$felhasznalonev = 'root';
$jelszo = "";
$adatbazis = "u451973341_jatek";
$conn = mysqli_connect($hoszt , $felhasznalonev , $jelszo , $adatbazis);
try{
	$conn2 = new PDO("mysql:host=$hoszt;dbname=$adatbazis;", $felhasznalonev, $jelszo);
} catch(PDOException $e){
	die( "Sikertelen kapcsolodas: " . $e->getMessage());
}
?>
