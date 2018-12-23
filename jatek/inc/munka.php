<?php
include "megtekintesvedelem.php";
include "header.php";
?>
<title>Munkahely:</title>
<link rel="stylesheet" href="../css/munka.css">
<body>
<?php
$userid=$_SESSION["userid"];
$munka_01_szintkorlat_sql="select * from munkahelyek where id=1";
$munka_01_szintkorlat_lekeres=mysqli_query($conn , "select * from munkahelyek where id=1");
if ( mysqli_num_rows( $munka_01_szintkorlat_lekeres ) == 1 ) {
	$user = mysqli_fetch_assoc( $munka_01_szintkorlat_lekeres);
	{
	$munka_01_szintkorlatja=$user["szintkorlat"];
	}
}
$munka_02_szintkorlat_sql="select * from munkahelyek where id=1";
$munka_02_szintkorlat_lekeres=mysqli_query($conn , "select * from munkahelyek where id=2");
if ( mysqli_num_rows( $munka_02_szintkorlat_lekeres ) == 1 ) {
	$user = mysqli_fetch_assoc( $munka_02_szintkorlat_lekeres);
	{
	$munka_02_szintkorlatja=$user["szintkorlat"];
	}
}
$munka_03_szintkorlat_sql="select * from munkahelyek where id=1";
$munka_03_szintkorlat_lekeres=mysqli_query($conn , "select * from munkahelyek where id=3");
if ( mysqli_num_rows( $munka_03_szintkorlat_lekeres ) == 1 ) {
	$user = mysqli_fetch_assoc( $munka_03_szintkorlat_lekeres);
	{
	$munka_03_szintkorlatja=$user["szintkorlat"];
	}
}
$munka_04_szintkorlat_sql="select * from munkahelyek where id=1";
$munka_04_szintkorlat_lekeres=mysqli_query($conn , "select * from munkahelyek where id=4");
if ( mysqli_num_rows( $munka_04_szintkorlat_lekeres ) == 1 ) {
	$user = mysqli_fetch_assoc( $munka_04_szintkorlat_lekeres);
	{
	$munka_04_szintkorlatja=$user["szintkorlat"];
	}
}
if( isset($_POST["kuld01"])){
	$ido= time();
	$munkaido=$_POST["munka"];
	$egyora_sec=3600;
	$munkahely_01_sql="UPDATE munka SET kezdes=$ido,munkaido='$munkaido',munkaido_sec=$munkaido*$egyora_sec,munkahely_id=1,dolgozik=1 WHERE id='$userid'";
	mysqli_query($conn , $munkahely_01_sql);
	header("Location: munka.php");
}
if( isset($_POST["kuld02"])){
	$ido= time();
	$munkaido=$_POST["munka"];
	$egyora_sec=3600;
	$munkahely_02_sql="UPDATE munka SET kezdes=$ido,munkaido='$munkaido',munkaido_sec=$munkaido*$egyora_sec,munkahely_id=2,dolgozik=1 WHERE id='$userid'";
	mysqli_query($conn , $munkahely_02_sql);
	header("Location: munka.php");
}
if( isset($_POST["kuld03"])){
	$ido= time();
	$munkaido=$_POST["munka"];
	$egyora_sec=3600;
	$munkahely_03_sql="UPDATE munka SET kezdes=$ido,munkaido='$munkaido',munkaido_sec=$munkaido*$egyora_sec,munkahely_id=3,dolgozik=1 WHERE id='$userid'";
	mysqli_query($conn , $munkahely_03_sql);
	header("Location: munka.php");
}
if( isset($_POST["kuld04"])){
	$ido= time();
	$munkaido=$_POST["munka"];
	$egyora_sec=3600;
	$munkahely_04_sql="UPDATE munka SET kezdes=$ido,munkaido='$munkaido',munkaido_sec=$munkaido*$egyora_sec,munkahely_id=4,dolgozik=1 WHERE id='$userid'";
	mysqli_query($conn , $munkahely_04_sql);
	header("Location: munka.php");
}
if( isset($_POST["vissza"])){
	$vissza="UPDATE munka SET kezdes=0,munkahely_id=0,munkaido=0,munkaido_sec=0,dolgozik=0 WHERE id='$userid'";
	mysqli_query($conn , $vissza);
	header("Location: munka.php");
}
if($_SESSION["dolgozik"] == 1){
	echo "<table id='munkatabla1'><tr><td>Mar dolgozol.</td></tr>";
	echo "<tr><td><form method='post' action='munka.php'><input type='submit' name='vissza' value='Munka befejezese'></form></td></tr>";
	echo "<tr><td>".floor($munkaido)." perc</td></tr></table>";
}else{
echo "<table id='munkatabla2'>
		<tr>
			<td id='munkatd'>
				<p>Munkahely 1:</p>
			";
			if($_SESSION["szint"] > $munka_01_szintkorlatja){
			echo "
				<form method='post' action='munka.php'>
				<select name='munka'>
					<option value='1'>1</option>
					<option value='2'>2</option>
					<option value='3'>3</option>
					<option value='4'>4</option>
					<option value='5'>5</option>
					<option value='6'>6</option>
					<option value='7'>7</option>
					<option value='8'>8</option>
				</select>
				<input type='submit' name='kuld01' value='Elküld'>
				</form>
			";
			}else{
				echo "Ez a munkahely a ".$munka_01_szintkorlatja." szinttol erheto el";
			}
			echo "
			</td>
			<td id='munkatd'>
				<p>Munkahely 2:</p>
			";
			if($_SESSION["szint"] > $munka_02_szintkorlatja){
			echo "
				<form method='post' action='munka.php'>
				<select name='munka'>
					<option value='1'>1</option>
					<option value='2'>2</option>
					<option value='3'>3</option>
					<option value='4'>4</option>
					<option value='5'>5</option>
					<option value='6'>6</option>
					<option value='7'>7</option>
					<option value='8'>8</option>
				</select>
				<input type='submit' name='kuld02' value='Elküld'>
				</form>
			";
			}else{
				echo "Ez a munkahely a ".$munka_02_szintkorlatja." szinttol erheto el";
			}
			echo "
			</td>
		</tr>
		<tr>
			<td id='munkatd'>
				<p>Munkahely 3:</p>
			";
			if($_SESSION["szint"] > $munka_03_szintkorlatja){
			echo "
				<form method='post' action='munka.php'>
				<select name='munka'>
					<option value='1'>1</option>
					<option value='2'>2</option>
					<option value='3'>3</option>
					<option value='4'>4</option>
					<option value='5'>5</option>
					<option value='6'>6</option>
					<option value='7'>7</option>
					<option value='8'>8</option>
				</select>
				<input type='submit' name='kuld03' value='Elküld'>
				</form>
			";
			}else{
				echo "Ez a munkahely a ".$munka_03_szintkorlatja." szinttol erheto el";
			}
			echo "
			</td>
			<td id='munkatd'>
				<p>Munkahely 4:</p>
			";
			if($_SESSION["szint"] > $munka_04_szintkorlatja){
			echo "
				<form method='post' action='munka.php'>
				<select name='munka'>
					<option value='1'>1</option>
					<option value='2'>2</option>
					<option value='3'>3</option>
					<option value='4'>4</option>
					<option value='5'>5</option>
					<option value='6'>6</option>
					<option value='7'>7</option>
					<option value='8'>8</option>
				</select>
				<input type='submit' name='kuld04' value='Elküld'>
				</form>
			";
			}else{
				echo "Ez a munkahely a ".$munka_04_szintkorlatja." szinttol erheto el";
			}
			echo "
			</td>
		</tr>
";
}
?>
</body>