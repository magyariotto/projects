<?php
include "megtekintesvedelem.php";
include "header.php";
if(isset($_POST["felhasznalonev_modositasa"])){
	if(empty($_POST["ujnev"]) OR empty( $_POST["password"])){
		$error = "Felhasználónév és jelszó megadása kötelező";
	}else{
		if($_POST["password"] == $_SESSION["password"]){
			$ujnev=$_POST["ujnev"];
			$modosit="UPDATE users SET username='$ujnev' WHERE userid=$userid";
			mysqli_query($conn , $modosit);
			header("Location: adataimmegvaltoztatasa.php");
		}else{
			$error = "A jelszo helytelen.";
		}
	}
}
if(isset($_POST["jelszo_modositasa"])){
    if(empty($_POST["regijelszo"]) OR empty( $_POST["ujjelszo"])){
		$error2 = "Regi és uj jelszó megadása kötelező"; 
	}else{
		if($_POST["regijelszo"] == $_SESSION["password"]){
			$ujjelszo=$_POST["ujjelszo"];
			$modosit="UPDATE users SET password='$ujjelszo' WHERE userid='$userid'";
			mysqli_query($conn , $modosit);
			header("Location: adataimmegvaltoztatasa.php");
		}else{
			$error2 = "A jelszo helytelen.";
		}
	}
}
if(isset($_POST["email_modositasa"])){
    if(empty($_POST["ujemail"]) OR empty( $_POST["jelszo"])){
		$error3 = "E-mail es jelszó megadása kötelező"; 
	}else{
		if($_POST["jelszo"] == $_SESSION["password"]){
			$ujemail=$_POST["ujemail"];
			$modosit="UPDATE users SET email='$ujemail' WHERE userid='$userid'";
			mysqli_query($conn , $modosit);
			header("Location: adataimmegvaltoztatasa.php");
		}else{
			$error3 = "A jelszo helytelen.";
		}
	}
}
?>
<title>Adataim megváltoztatása</title>
<link rel="stylesheet" href="../css/jquery.css">
<script src="../js/jquery1.js"></script>
<script src="../js/jquery2.js"></script>
<script>
$(function() {
$( "#accordion" ).accordion({
heightStyle: "content"
});
});
</script>
<body>
<div id="accordion" align="center">
	<h3>Felhasználónév megváltoztatása:</h3>
		<div style="background-color:transparent;">
		<?php if(isset($error)){echo $error;}?>
		<form method="post" action="adataimmegvaltoztatasa.php">
			<table border="5" align="center" style="color:white;">
			<tr>
				<td align="center">Új felhasználónév:</td>
				<td><input type="text" name="ujnev" style="background-color:transparent;color:white;"></td>
			</tr>
			<tr>
				<td align="center">Jelszó:</td>
				<td><input type="password" name="password" style="background-color:transparent;color:white;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" name="felhasznalonev_modositasa" value="Megváltoztat" style="background-color:transparent;color:white;"></td>
			</tr>
			</table>
		</form>
		</div>
	<h3>Jelszó megváltoztatása:</h3>
		<?php if(isset($error2)){echo $error2;}?>
		<div style="background-color:transparent;">
		<form method="post" action="adataimmegvaltoztatasa.php">
			<table border="5" align="center" style="color:white;">
			<tr>
				<td align="center">Regi jelszó:</td>
				<td><input type="password" name="regijelszo" style="background-color:transparent;color:white;"></td>
			</tr>
			<tr>
				<td align="center">Új jelszó</td>
				<td><input type="password" name="ujjelszo" style="background-color:transparent;color:white;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" name="jelszo_modositasa" value="Megváltoztat" style="background-color:transparent;color:white;"></td>
			</tr>
			</table>
		</form>
		</div>
	<h3>E-mail cím megváltoztatása:</h3>
		<div style="background-color:transparent;">
		<?php if(isset($error3)){echo $error3;}?>
		<form method="post" action="adataimmegvaltoztatasa.php">
			<table border="5" align="center" style="color:white;">
			<tr>
				<td align="center">Új e-mail cim:</td>
				<td><input type="text" name="ujemail" style="background-color:transparent;color:white;"></td>
			</tr>
			<tr>
				<td align="center">Jelszó:</td>
				<td><input type="password" name="jelszo" style="background-color:transparent;color:white;"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" name="email_modositasa" value="Megváltoztat" style="background-color:transparent;color:white;"></td>
			</tr>
			</table>
		</form>
		</div>
</div>
</body>
</html>