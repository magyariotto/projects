<?php
include("megtekintesvedelem.php");
include("fomenu.php");
include("menu.php");

if(isset($_POST["submit"]))
{
	if(empty( $_POST["targy"])){
        $hiba[] = " Tárgy megadása kötelező ";
   }
   if(empty( $_POST["uzenet"])){
        $hiba[] = " Üzenet megadása kötelező ";
   }
   if( !isset( $hiba )){
	include("connect.php");
	$felado=$_SESSION["username"];
	$targy=$_POST["targy"];
	$uzenet=$_POST["uzenet"];
	$ido= date('Y-m-d H:i:s');
	$sql_support_send="INSERT `support`(`felado`, `targy`, `uzenet`, `ido`) VALUES ('$felado', '$targy', '$uzenet', '$ido')";
	mysqli_query($conn , $sql_support_send);
	include("tabla2.php");
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
<html>
<head>
	<title>Support</title>
</head>
<body background="../img/hatter.jpg">
</body>
<br>
<form method='post' action='support.php'>
<table align="center" style="background-image: url('../img/tabla.jpg'); color:white; width: auto;" border="1">
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
</html>