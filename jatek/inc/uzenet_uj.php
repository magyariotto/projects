<?php
	include "megtekintesvedelem.php";
	include "header.php";

if(isset($_POST["submit"]))
{
   if(empty( $_POST["cimzett"])){
	   $hiba[] = " Cimzett megadása kötelező ";
   }
   if(empty( $_POST["targy"])){
        $hiba[] = " Tárgy megadása kötelező ";
   }
	if(empty( $_POST["uzenet"])){
        $hiba[] = " Üzenet megadása kötelező ";
   }
   if( !isset( $hiba )){
	include("connect.php");
	$felado=$_SESSION["username"];
	$cimzett=$_POST["cimzett"];
	$targy=$_POST["targy"];
	$uzenet=$_POST["uzenet"];
	$ido= date('Y-m-d H:i:s');
	$sql001="INSERT `uzenetek`(`felado`, `cimzett`, `targy`, `uzenet`, `ido`) VALUES ('$felado', '$cimzett', '$targy', '$uzenet', '$ido')";
	mysqli_query($conn , $sql001);
	include("tabla2.php");
	echo "<table style='background-image: url('../img/tabla.jpg'); color:white; width: 100%;' border='1' align='center'>";
	echo ("
	<tr>
	<td align='center' >Az uzenetedet sikeresen elkuldted $cimzett-nak.</td>
	</tr>
	</table>
	");
}else{
        echo "A következö hibák fordultak elő<br />";
        echo implode( "<br />" , $hiba );
   }
}
?>
<title>Uzenetek</title>
<link rel="stylesheet" href="../css/uzenet.css">
<table id="uzenettabla1">
	<tr>
		<td id="uzenettd1">
			<div id="uzenetdiv1"><form method="post" action="uzenet_uj.php"><input type="submit" value="Uj uzenet irasa"></form></div>
			<div id="uzenetdiv2"><form method="post" action="uzenet_bejovo.php"><input type="submit" value="Bejovo uzenetek"></form></div>
			<div id="uzenetdiv4"><form method="post" action=""><input type="submit" value="Rendszer uzenetek"></form></div>
			<div id="uzenetdiv3"><form method="post" action="uzenet_elkuldott.php"><input type="submit" value="Elkuldott uzenetek"></form></div>
		</td>
	</tr>
	<tr>
		<td id="uzenettd2">
			<form method='post' action='uzenet_uj.php'>
			<table align="center" style="background-image: url('../img/tabla.jpg'); color:white; width: auto;" border="1">
			<tr>
				<td>Cimzett:</td>
				<td><input style="width: 100%; background-color:transparent; color:white;" type="text" name="cimzett" value=""></td>
			</tr>
			<tr>
				<td>Targy:</td>
				<td><input style="width: 100%; background-color:transparent; color:white;" type="text" name="targy" value=""></td>
			</tr>
			<tr>
				<td>Uzenet:</td>
				<td><textarea style=" background-color:transparent; color:white;" name="uzenet" rows="20" cols="100"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input style=" background-color:transparent; color:white;" type="submit" name="submit" value="Elkuld"></td>
			</tr>
			</table>
			</form>
		</td>
	</tr>
</table>
