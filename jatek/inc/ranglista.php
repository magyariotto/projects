<?php
include "megtekintesvedelem.php";
include "header.php";
$start=0;
$laponkent=15;
$osszes=ceil(mysqli_num_rows(mysqli_query($conn,"select * from users"))/$laponkent);
if(isset($_GET['oldal']))
{
	$oldal=$_GET['oldal'];
	$start=($oldal-1)*$laponkent;
}
else{
	$oldal=1;
}

if(isset($_GET['miszerint'])==1){
	$sql = "SELECT * FROM users ORDER BY ".$_GET['miszerint']." desc LIMIT $start, $laponkent";
}else{
	$sql = "SELECT * FROM users ORDER BY tapasztalat desc LIMIT $start, $laponkent";
}
$lekeres = mysqli_query($conn , $sql);
?>
<html>
<head>
<title>Ranglista</title>
<link rel="stylesheet" href="../../css/admin.css">
</head>
<body id="body">
<br>
<table id="felhasznalok_tabla" style="color:white;"border='2' align="center">
	<tr> 
		<th id="th_szamok">Helyezes</th>
		<th id="th_username">Felhasználónév:</th>
		<th id="th_szamok"><?php echo "<a href='ranglista.php?oldal=".$_GET["oldal"]."&miszerint=szint' style='color:white;'>Szint:</a>";?></th>
		<th id="th_szamok"><?php echo "<a href='ranglista.php?oldal=".$_GET["oldal"]."&miszerint=tapasztalat' style='color:white;'>Tapasztalatpont:</a>";?></th>
		<th id="th_szamok"><?php echo "<a href='ranglista.php?oldal=".$_GET["oldal"]."&miszerint=megnyertp' style='color:white;'>Megnyert parbajok:</a>";?></th>
		<th id="th_szamok"><?php echo "<a href='ranglista.php?oldal=".$_GET["oldal"]."&miszerint=elvesztettp' style='color:white;'>Elvesztett parbajok:</a>";?></th>
	</tr>
	
<?php
$i=($oldal*$laponkent)-$laponkent;
while($row = mysqli_fetch_object($lekeres)) {
	$i++;
	echo "<tr>";
	echo '<th id="th_szamok">'.$i.'</th>';
	echo '<th id="th_username">' . $row->username . '</th>';
	echo '<th id="th_szamok">' . $row->szint . '</th>';
	echo '<th id="th_szamok">' . number_format($row->tapasztalat) . '</th>';
	echo '<th id="th_szamok">' . $row->megnyertp . '</th>';
	echo '<th id="th_szamok">' . $row->elvesztettp . '</th>';
}
?>
</tr>
</table>
<div id="oldalak">
<?php
if($oldal>1)
{
	echo "<th><div id='menu_table'><li><div class='gomb'><a href='?oldal=".($oldal-1)."'>Elöző</a></div></li></div></th>";
}
for($i=1;$i<=$osszes;$i++){
	if($i==$oldal) { echo "<th><div id='menu_table'><li><div class='gomb'><a style='color: red;'>".$i."</a></div></li></div></th>"; 
	}else{ echo "<th><div id='menu_table'><li><div class='gomb'><a href='?oldal=".$i."'>".$i."</a></div></li></div></th>"; }
	}
if($oldal!=$osszes)
{
	echo "<th><div id='menu_table'><li><div class='gomb'><a href='?oldal=".($oldal+1)."'>Kovetkező</a></div></li></div></th>";
}
?>
</div>
</body>
</html>