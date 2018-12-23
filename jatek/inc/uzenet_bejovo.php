<?php
	include "megtekintesvedelem.php";
	include "header.php";
	$en=$_SESSION["username"];
?>
<title>Uzenetek</title>
<link rel="stylesheet" href="../css/uzenet.css">
<table id="uzenettabla1">
	<tr>
		<td id="uzenettd1">
			<div id="uzenetdiv1"><form method="post" action="uzenet_uj.php"><input type="submit" value="Uj uzenet irasa"></form></div>
			<div id="uzenetdiv2"><form method="post" action="uzenet_bejovo.php"><input type="submit" value="Bejovo uzenetek"></form></div>
			<div id="uzenetdiv4"><form method="post" action=""><input type="submit" value="Rendszer uzenetek"></form></div>
			<div id="uzenetdiv3"><form method="post" action="uzenet_elkuldott.php"><input type="submit" value="Elkuldott uzenetek"></form></div>
		</td>
	</tr>
	<tr>
		<td id="uzenettd2">
			<?php
			$bejovouzeneteksql = "SELECT * from uzenetek WHERE cimzett='$en' ORDER BY ido desc";
			$bejovouzeneteklekeres = mysqli_query($conn , $bejovouzeneteksql);
			while($row = mysqli_fetch_object($bejovouzeneteklekeres))
			{
			echo "
			<table border='1 align='center' style='width: 1100px;' background='../img/tabla.jpg'>
			<tr>
				<td style='color:white; width: 20%;'>
					<div class=\"text\">Felado:$row->felado</div>
				</td>
				<td style='color:white; width: 20%;'>
					<div class=\"text\">Targy:$row->targy</div>
				</td>
				<td style='color:white; width: 20%;'>
					<div class=\"text\">Kuldes ideje:$row->ido</div>
				</td>
			</tr>
			</table>
			<table border='1 align='center' style='width: 1100px;' background='../img/tabla.jpg'>
			<tr>
				<td rowspan='2' style='color:white;'>
					<div id='uzenetdiv5' class=\"text\">$row->uzenet</div>
				</td>
			</tr>
			</table>
			<br><br>
			";
			}
			echo "</table>";
			?>
		</td>
	</tr>
</table>
