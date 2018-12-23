<body background="../../img/hatter.jpg" style="background-color:transparent;">
<?php
if(isset($_SESSION["adminbelepve"]))
{
echo "Kedves " . $_SESSION["username"].",be vagy lepve!";
echo "<a href='?kilepes'>Kilepes</a>";


}
else{


if( isset($_POST["adminlogin"])){
    if(empty($_POST["username"]) OR empty( $_POST["password"]))
       echo "Felhasználónév és jelszó kötelező";
    else {
		$username=$_POST["username"];
		$sql="select * from admin WHERE username='$username'";
		$lekeres=mysqli_query($conn , $sql) or die(mysqli_error());
		if ( mysqli_num_rows( $lekeres ) == 1 ) {
			echo "Létezik a felhasználó.";
			$user = mysqli_fetch_assoc( $lekeres);
			if($_POST["password"] == $user["password"])
        {
        	echo "Helyes a jelszó.";
                $_SESSION["adminbelepve"] = 1;
                $_SESSION["username"]=$user["username"];
                $_SESSION["email"]=$user["email"];
				$_SESSION["password"]=$user["password"];
				
					header("Location: inc/kezdolap.php");
                die();
        }
        else
        {
        echo "A jelszó helytelen.";
        }
    } else {
    	echo "Nem letezik ilyen felhasznalo";
    }
  }
}  }

?>
<form method="post" action="index.php?belepes">
	<table border="1" align="center">
	<tr>
		<td style="color:white;"  align="center"><font size="1">Felhaszálónév:</font></td>
		<td style="color:white;"  align="center"><font size="1">Jelszó:</font></td>
	</tr>
	<tr>
		<td><input type="text" name="username" style="background-color:transparent;color:white;"></td>
		<td><input type="password" name="password" style="background-color:transparent;color:white;"></td>
		<td rowspan="2" align="center"><input type="submit" name="adminlogin" value="Belépek" style="background-color:transparent;color:white;"></td>
	</tr>
	</table>
</form>
</body>

