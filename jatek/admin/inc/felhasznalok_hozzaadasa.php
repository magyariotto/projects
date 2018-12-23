<?php
include "../../inc/connect.php";
include "menu.php";
 function renderForm($username, $email, $error)
 {
 ?>
<html>
<link rel="stylesheet" href="../../css/admin.css">
<body id="body">
<?php 
if ($error != '')
{
echo '<div style="padding:4px; border:1px solid red; color:red;">'.$error.'</div>';
}
?>
<form action="" method="post">
<div>
<table style="background-image: url('../img/tabla.jpg'); color:white; width: auto;" border="2">
	<tr>
		<td>Felhasznalonev:</td>
		<td>Jelszo</td>
		<td>E-mail:</td>
	</tr>
	<tr>
		<td><input type="text" name="username" value="<?php echo $username; ?>" /></td>
		<td><input type="password" name="password" value=""/></td>
		<td><input type="text" name="email" value=""/></td>
	</tr>
</table>
<input type="submit" name="submit" value="Hozzáad">
</div>
</form> 
</body>
</html>
<?php 
}
if (isset($_POST['submit']))
{
$username = mysql_real_escape_string(htmlspecialchars($_POST['username']));
$password = mysql_real_escape_string(htmlspecialchars($_POST['password']));
$email = mysql_real_escape_string(htmlspecialchars($_POST['email']));
mysqli_query($conn , "INSERT users SET username='$username', password='$password' , email='$email'");
header("Location: felhasznalok_megtekintese.php"); 
}
renderForm('','','');
?>