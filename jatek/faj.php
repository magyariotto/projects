<?php
include("inc/megtekintesvedelem.php");
include("inc/frissites.php");
include("inc/connect.php");
$faj=$_SESSION["faj"];
$ember=1;
$fantom=2;
if($faj != 0){
	header("Location: inc/index.php");
	}else{
if (isset( $_POST["submit1"])){
	   $kivalaszt="UPDATE users SET faj='$ember' WHERE userid='$userid'";
	   mysqli_query($conn , $kivalaszt);
	   header("Location: inc/index.php");
	}
if (isset( $_POST["submit2"])){
	   $kivalaszt="UPDATE users SET faj='$fantom' WHERE userid='$userid'";
	   mysqli_query($conn , $kivalaszt);
	   header("Location: inc/index.php");
	}
}
?>
<html>
<head>
	<title>Faj kivalasztasa</title>
</head>
<body background="img/hatter.jpg">
<form method="post" action="faj.php">
<table align="center" style="background-image: url('../img/tabla.jpg'); color:white;">
<tr>
	<td><input type="submit" name="submit1" value="Ember" style="background-color:transparent;color:white;"></td>
	<td><input type="submit" name="submit2" value="Fantom" style="background-color:transparent;color:white;"></td>
</tr>
</table>
</form>
</body>
</html>