<?php
include "inc/connect.php";
session_start();
if( isset($_SESSION["userid"]) ){
	header("Location: inc/index.php");
}
if(!empty($_POST["username"]) && !empty($_POST["password"])):
	
	$nyilvantartas = $conn2->prepare("SELECT userid,username,password FROM users WHERE username = :username");
	$nyilvantartas->bindParam(":username", $_POST["username"]);
	$nyilvantartas->execute();
	$talalatok = $nyilvantartas->fetch(PDO::FETCH_ASSOC);

	$hiba = "";

	if(count($talalatok) > 0 && $_POST["password"] = $talalatok["password"]){
		$belepve="belepve";
		$_SESSION["userid"] = $talalatok["userid"];
		$_SESSION["userid.$belepve"] = 1;
		header("Location: inc/index.php");

	} else {
		$hiba = "Hibas belepesi adatok";
	}

endif;
if(!empty($hiba)){
	echo $hiba;
}
?>
<html>
<head>
	<title>Belépés/Regisztráció</title>
	<META charset='utf-8'>
	<link rel="stylesheet" href="css/index.css">
	<script src="js/regisztracio.js"></script>
</head>
<body background="img/hatter_body.png" style="background-color:transparent;">

<table id="fejlec" align="center">
	<tr>
		<td style="width:705px;">
			<a><img src="img/logo.png"></a>
		</td>
		<td style="width:705px;float:right;">
			<form method="post">
			<table id="belepes_tabla">
				<tr>
					<td style="color:white;"  align="center"><font size="1">Felhaszálónév:</font></td>
					<td style="color:white;"  align="center"><font size="1">Jelszó:</font></td>
				</tr>
				<tr>
					<td><input id="belepes_input" class="inp" type="text" name="username"></td>
					<td><input id="belepes_input" type="password" name="password"></td>
					<td rowspan="2" align="center"><input id="belepes_input" type="submit" name="login" value="Belépek" ></td>
				</tr>
			</table>
		</form>
		</td>
	</tr>
</table>
<table align="center">
	<tr>
		<td id="kozep_td1"><p>Egyes blok</p></td>
		<td id="kozep_td2">
				<h1>Regisztráció</h1>

				<p><input id="reg_felhasznalonev" name="username" placeholder="Felhasznalonev" class="inputs"></p>
				
				<p><input id="reg_emailcim" name="email" placeholder="Emailcim" class="inputs"></p>
				
				<p><input type="password" id="reg_jelszo1" placeholder="Jelszó" class="inputs"></p>
				
				<p><input type="password" id="reg_jelszo2" placeholder="Jelszó ujra" class="inputs"></p>
				
				<input type="radio" name="nem" id="ferfi" value="Ferfi">Ferfi
				<input type="radio" name="nem" id="no" value="No">No
				
				<p><button onclick='regisztracio()'>Regisztráció</button></p>
		</td>
		<td id="kozep_td1"><p>Harmas blok</p></td>
	</tr>
	<tr>
		<td id="alja" colspan="3">Negyes blok</td>
	</tr>
</table>

	<?php
		if(isset($_GET["kilep"]))
		include("inc/kilep.php");
	?>
</body>
</html>
<?php
if(isset($_SESSION["belepve"]))
{
header("Location: inc/index.php");
}
?>