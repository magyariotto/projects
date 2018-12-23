<?php
	/* 
	0 = sikeres a regisztracio.
	1 = felhasznalonev foglalt.
	2 = email cim foglalt.
	3 = felhasznalonev es email cim is foglalt.
	11 = A felhasznalonev 5 es 15 karakter kozotti lehet.Felhasznalonev es email szabad.
	12 = A felhasznalonev 5 es 15 karakter kozotti lehet.Felhasznalonev szabad.Email foglalt.
	13 = A felhasznalonev szabad.Az email helytelen.
	14 = A felhasznalonev foglalt.Az email cim hejtelen.
	15 = Felhanszalonev es email cim szabad es hejes.Jelszo hianyzik.
	16 = A felhasznalonev 5 es 15 karakter kozotti lehet.Felhasznalonev szabad.Email foglalt.Jelszo hianyzik.
	17 = A felhasznalonev 5 es 15 karakter kozotti lehet.Felhasznalonev es email szabad.Jelszo hianyzik.
	18 = A felhasznalonev 5 es 15 karakter kozotti lehet.Felhasznalonev szabad.Email foglalt.Jelszo es jelszo2 hianyzik.
	19 = Felhasznalonev,email cim es jelszo hianyzik.
	20 = Emial cim szaad.Felhasznalonev es jelszo hianyzik.
	21 = Felhasznalonev es email cim szabad es hejes.Jelszo1 megvan,jelszo2 hianyzik.
	22 = Minden szabad es hejes,csak a 2 jelszo nem egyezik.
	23 = A jelszo 4 es 15 karakter kozotti kell legyen.
	24 = Felhasznalonev van es jo,email es jelszo hianyzik.
	*/
    include "../inc/connect.php";
    $username = $_REQUEST["username"];
	$email = $_REQUEST["email"];
	$password1 = $_REQUEST["password1"];
	$password2 = $_REQUEST["password2"];;
    $userleker = mysqli_query($conn, "SELECT username FROM users WHERE username='$username'");
	$userleker2 = mysqli_query($conn, "SELECT email FROM users WHERE email='$email'");
	
    if(mysqli_num_rows($userleker) && mysqli_num_rows($userleker2)){
		echo 3;
    }elseif(mysqli_num_rows($userleker)){
		if(!filter_var($email, FILTER_VALIDATE_EMAIL)) {
			echo 14;
		}else{
			echo 1;
		}
    }elseif(mysqli_num_rows($userleker2)){
		
		if(strlen($username) < 5 or strlen($username) > 15){
			if($password1 == ""){
				echo 16;
			}elseif($password1 == "" and $password2 == ""){
				echo 18;
			}else{
				echo 12;
			}
		}else{
			echo 2;
		}
	}else{
		if(strlen($username) < 5 or strlen($username) > 15){
			if($username == "" && $email == "" && $password1 == ""){
				echo 19;
			}elseif($password1 == ""){
				echo 17;
			}else{
				echo 11;
			}
		}elseif(!filter_var($email, FILTER_VALIDATE_EMAIL)){
			if($username == "" and $password1 == ""){
				echo 20;
			}else{
				echo 13;
			}
		}elseif($password1 == ""){
			echo 15;
		}elseif($password2 == ""){
			echo 21;
		}elseif($password1 != $password2){
			echo 22;
		}elseif($email == "" and $password == ""){
			echo 24;
			
		}else{
			mysqli_query($conn , "INSERT INTO `users` (`username`, `password`, `email`) VALUES ('$username', '$password1', '$email')");
			mysqli_query($conn , "INSERT INTO `felszerelesem` () VALUES ()");
			mysqli_query($conn , "INSERT INTO `munka` () VALUES ()");
			mysqli_query($conn , "INSERT INTO `targyaim` () VALUES ()");
			mysqli_query($conn , "INSERT INTO `nyersanyagtermeles` () VALUES ()");
			mysqli_query($conn , "INSERT INTO `epuleteim` () VALUES ()");
			$nyilvantartas = $conn2->prepare("SELECT userid,username,password FROM users WHERE username = :username");
			$nyilvantartas->bindParam(":username", $username);
			$nyilvantartas->execute();
			$talalatok = $nyilvantartas->fetch(PDO::FETCH_ASSOC);
			if(count($talalatok) > 0 && $password1 = $talalatok["password"]){
				$belepve="belepve";
				$_SESSION["userid"] = $talalatok["userid"];
				$_SESSION["userid.$belepve"] = 1;
			}
			echo 0;
		}
	}
?>