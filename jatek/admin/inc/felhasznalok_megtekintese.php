<?php
include "menu.php";
include "../../inc/connect.php";
include "vedelem.php";
$start=0;
$laponkent=10;
$osszes=ceil(mysqli_num_rows(mysqli_query($conn,"select * from users"))/$laponkent);
if(isset($_GET['oldal']))
{
	$oldal=$_GET['oldal'];
	$start=($oldal-1)*$laponkent;
}
else{
	$oldal=1;
}
$sql = "SELECT * FROM users LIMIT $start, $laponkent";
$lekeres = mysqli_query($conn , $sql);
?>
<html>
<head>
<title>ADMIN</title>
</head>
<link rel="stylesheet" href="../../css/admin.css">
<body id="body">

<table id="felhasznalok_tabla" style="color:white;"border='2' align="center">
	<tr> 
		<th id="th_userid">User id:</th>
		<th id="th_username">Felhasználónév:</th>
		<th id="th_email">Email cím:</th>
		<th id="th_szintek_oszlop">Szint:</th>
		<th id="th_szamok">Tapasztalatpont:</th>
		<th id="th_szamok">Kredit:</th>
		<th id="th_szamok">Terra:</th>
		<th id="th_szintek_oszlop">HP</th>
		<th id="th_szintek_oszlop">SHD</th>
		<th id="th_szintek_oszlop">DMG</th>
		<th id="th_szintek_oszlop">SPD</th>
		<th id="th_szintek_oszlop">GEN</th>
		<th>Szerkesztés:</th>
		<th>Törlés:</th>
	</tr>
	
<?php
	while($row = mysqli_fetch_object($lekeres)) {
		echo "<tr>";
		echo '<th id="th_userid">' . $row->userid . '</th>';
		echo '<th id="th_username">' . $row->username . '</th>';
		echo '<th id="th_email">' . $row->email . '</th>';
		echo '<th id="th_szintek">' . $row->szint . '</th>';
		echo '<th id="th_szamok">' . number_format($row->tapasztalat) . '</th>';
		echo '<th id="th_szamok">' . number_format($row->kredit) . '</th>';
		echo '<th id="th_szamok">' . number_format($row->terra) . '</th>';
		echo '<th id="th_szintek">' . $row->eletszint . '</th>';
		echo '<th id="th_szintek">' . $row->pajzsszint . '</th>';
		echo '<th id="th_szintek">' . $row->sebzesszint . '</th>';
		echo '<th id="th_szintek">' . $row->sebessegszint . '</th>';
		echo '<th id="th_szintek">' . $row->generatorszint . '</th>';
		echo '<th id="th_szerkesztes"><div id="menu_table"><li><div class="gomb"><a href="felhasznalok_szerkesztese.php?userid=' . $row->userid . '">Szerkesztés</a></div></li></div></th>';
		echo '<th id="th_torles"><div id="menu_table"><li><div class="gomb"><a href="felhasznalok_torlese.php?userid=' . $row->userid . '" style="color: red;">Törlés</a></div></li></div></th>';

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
<div style="text-align: center;">
<ul id="menu_table">
	<li>
		<div class="gomb">
			<a href="felhasznalok_hozzaadasa.php">Új felhasználó hozzáadása</a>
		</div>
	</li>
</ul>
</div>
</body>
</html>