<?php
include "../../inc/connect.php";
include "menu.php";
if(isset($_POST['vissza'])){
	header ("Location: felhasznalok_megtekintese.php");
}
if(isset($_POST['submit']))
{
if(is_numeric($_POST['userid']))
{
$userid = $_POST['userid'];
$username = mysql_real_escape_string(htmlspecialchars($_POST['username']));
$email = mysql_real_escape_string(htmlspecialchars($_POST['email']));
$tapasztalat = mysql_real_escape_string(htmlspecialchars($_POST['tapasztalat']));
$kredit = mysql_real_escape_string(htmlspecialchars($_POST['kredit']));
$terra = mysql_real_escape_string(htmlspecialchars($_POST['terra']));
$eletszint = mysql_real_escape_string(htmlspecialchars($_POST['eletszint']));
$pajzsszint = mysql_real_escape_string(htmlspecialchars($_POST['pajzsszint']));
$sebzesszint = mysql_real_escape_string(htmlspecialchars($_POST['sebzesszint']));
$sebessegszint = mysql_real_escape_string(htmlspecialchars($_POST['sebessegszint']));
$hiperhajtomuszint = mysql_real_escape_string(htmlspecialchars($_POST['hiperhajtomuszint']));
$megnyertp = mysql_real_escape_string(htmlspecialchars($_POST['megnyertp']));
$elvesztettp = mysql_real_escape_string(htmlspecialchars($_POST['elvesztettp']));
$faj = mysql_real_escape_string(htmlspecialchars($_POST['faj']));
mysqli_query($conn , "UPDATE users SET username='$username', email='$email', tapasztalat='$tapasztalat', kredit='$kredit', terra='$terra', eletszint='$eletszint',
pajzsszint='$pajzsszint', sebzesszint='$sebzesszint', sebessegszint='$sebessegszint', hiperhajtomuszint='$hiperhajtomuszint' WHERE userid='$userid'");
header("Location: felhasznalok_megtekintese.php");
}
}
else
{
$userid = $_GET['userid'];
$row = mysqli_fetch_array(mysqli_query($conn , "SELECT * FROM users WHERE userid=$userid"));
if($row)
{
$username = $row['username'];
$email = $row['email'];
$tapasztalat = $row['tapasztalat'];
$szint = $row['szint'];
$kredit = $row['kredit'];
$terra = $row['terra'];
$eletszint = $row['eletszint'];
$pajzsszint = $row['pajzsszint'];
$sebzesszint = $row['sebzesszint'];
$sebessegszint = $row['sebessegszint'];
$hiperhajtomuszint = $row['hiperhajtomuszint'];
$megnyertp = $row['megnyertp'];
$elvesztettp = $row['elvesztettp'];
$faj = $row['faj'];
renderForm($userid, $username, $email, $tapasztalat, $kredit, $terra, $eletszint, $pajzsszint, $sebzesszint, $sebessegszint, $hiperhajtomuszint, $megnyertp, $elvesztettp, $faj, '');
}
}
function renderForm($userid, $username, $email, $tapasztalat, $kredit, $terra, $eletszint, $pajzsszint, $sebzesszint, $sebessegszint, $hiperhajtomuszint, $megnyertp, $elvesztettp, $faj, $error)
{
?> 
<link rel="stylesheet" href="../../css/admin.css">
<body id="body">
<form action="" method="post">
<input type="hidden" name="userid" value="<?php echo $userid; ?>"/>
<div>
<table style="background-image: url('../img/tabla.jpg'); color:white; width: auto;" border="2" align="center">
	<tr align="center">
		<td>UserID:</td>
		<td><?php echo $userid; ?></td>
	</tr>
	<tr>
		<td>Felhasznalonev:</td>
		<td><input type="text" name="username" value="<?php echo $username; ?>"/></td>
	</tr>
	<tr>
		<td>Email:</td>
		<td><input type="text" name="email" value="<?php echo $email; ?>"></td>
	</tr>
	<tr>
		<td>Tapasztalat:</td>
		<td><input type="text" name="tapasztalat" value="<?php echo $tapasztalat; ?>"/></td>
	</tr>
	<tr>
		<td>Kredit:</td>
		<td><input type="text" name="kredit" value="<?php echo $kredit; ?>"></td>
	</tr>
	<tr>
		<td>Terra:</td>
		<td><input type="text" name="terra" value="<?php echo $terra; ?>"></td>
	</tr>
	<tr>
		<td>Elet szint:</td>
		<td><input type="text" name="eletszint" value="<?php echo $eletszint; ?>"></td>
	</tr>
	<tr>
		<td>Pajzs szint:</td>
		<td><input type="text" name="pajzsszint" value="<?php echo $pajzsszint; ?>"></td>
	</tr>
	<tr>
		<td>Sebzes szint:</td>
		<td><input type="text" name="sebzesszint" value="<?php echo $sebzesszint; ?>"></td>
	</tr>
	<tr>
		<td>Sebesseg szint:</td>
		<td><input type="text" name="sebessegszint" value="<?php echo $sebessegszint; ?>"></td>
	</tr>
	<tr>
		<td>Hiperhajtomu szint:</td>
		<td><input type="text" name="hiperhajtomuszint" value="<?php echo $hiperhajtomuszint; ?>"></td>
	</tr>
	<tr>
		<td>Megnyert párbajok:</td>
		<td><input type="text" name="megnyertp" value="<?php echo $megnyertp; ?>"></td>
	</tr>
	<tr>
		<td>Elvesztett párbajok:</td>
		<td><input type="text" name="elvesztettp" value="<?php echo $elvesztettp; ?>"></td>
	</tr>
	<tr>
		<td>Faj</td>
		<td><input type="text" name="faj" value="<?php echo $faj; ?>"></td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<input type="submit" name="vissza" value="Vissza">
			<input type="submit" name="submit" value="Mentes">
		</td>
	</tr>
</table>
</div>
</form> 
</body>
<?php } ?>