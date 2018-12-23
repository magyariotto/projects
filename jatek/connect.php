<?php
$hoszt = "sql202.epizy.com";
$felhasznalonev = 'epiz_21805921';
$jelszo = "csibemaci20";
$adatbazis = "epiz_21805921_jatek";
$conn = mysqli_connect($hoszt , $felhasznalonev , $jelszo , $adatbazis);
try{
	$conn2 = new PDO("mysql:host=$hoszt;dbname=$adatbazis;", $felhasznalonev, $jelszo);
} catch(PDOException $e){
	die( "Sikertelen kapcsolodas: " . $e->getMessage());
}
?>
