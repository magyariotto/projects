<META charset='utf-8'>
<script src="fizeteselozmenyek.js"></script>
<link rel="stylesheet" href="fizeteselozmenyek.css">
<?php
include "connect.php";
if(isset($_POST["hozzaad"])){
	$uj_datum=$_POST["uj_datum"];
	$uj_hetkoznap=$_POST["uj_hetkoznap"];
	$uj_hetvegeinap=$_POST["uj_hetvege"];
	$uj_nettohonap=$_POST["uj_nettohonap"];
	$uj_bruttohonap=$_POST["uj_bruttohonap"];
	$sql_hozzaad="INSERT INTO `fizeteselozmenyek_otto` (`datum`,`hetkoznap`,`hetvegeinap`,`nettohonap`,`bruttohonap`) VALUES ('$uj_datum','$uj_hetkoznap','$uj_hetvege','$uj_nettohonap','$uj_bruttohonap')";
	mysqli_query($conn , $sql_hozzaad);
	header("Location: fizeteselozmenyek.php");
}
$fizetesek=mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM fizeteselozmenyek_otto WHERE id = (select max(id) from fizeteselozmenyek_otto)"))["id"];
$sql = "SELECT * from fizeteselozmenyek_otto";
$lekeres = mysqli_query($conn , $sql);

if(isset($_POST["letrehozas"])){
	
}

?>
	<table border='2' align='center' style='background-color:lightgreen;'>
		<tr>
			<td>
				<a>Menu:</a>
				<button id="ujfizeteshozzaadasa_gomb">Uj fizetes hozzaadasa</button>
				<div id='myModal' class='konzol'>
					<div class='modal-content'>
						<span class='close'>&times;</span>
						<form method="post" action="fizeteselozmenyek.php">
							<table>
								<tr>
									<td>Datum</td>
									<td><input class="beviteli_mezo" name="datum" type="text"></td>
								</tr>
								<tr>
									<td>Munkanap</td>
									<td><input class="beviteli_mezo" name="munkanap" type="text"></td>
								</tr>
								<tr>
									<td>Szabadnap</td>
									<td><input class="beviteli_mezo" name="szabadnap" type="text"></td>
								</tr>
								<tr>
									<td>Betegszabadnap</td>
									<td><input class="beviteli_mezo" name="betegszabadnap" type="text"></td>
								</tr>
								<tr>
									<td>Tuloranap</td>
									<td><input class="beviteli_mezo" name="tuloranap" type="text"></td>
								</tr>
								<tr>
									<td>Ora 100%</td>
									<td><input class="beviteli_mezo" name="ora100" type="text"></td>
								</tr>
								<tr>
									<td>Ora 200%</td>
									<td><input class="beviteli_mezo" name="ora200" type="text"></td>
								</tr>
								<tr>
									<td>Egyebb +%</td>
									<td><input class="beviteli_mezo" name="egyebbplusz" type="text"></td>
								</tr>
								<tr>
									<td>Egyebb -%</td>
									<td><input class="beviteli_mezo" name="egyebbminusz" type="text"></td>
								</tr>
								<tr>
									<td>Honap hetkoznapjainak szama</td>
									<td><input class="beviteli_mezo" name="honapnapjainakszama" type="text"></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" name="letrehozas" value="Letrehozas"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<script>
				var konzol = document.getElementById('myModal');
				var ujfizeteshozzaadasa_gomb = document.getElementById("ujfizeteshozzaadasa_gomb");
				var bezaras = document.getElementsByClassName("close")[0];
				konzol.style.display = "none";
				ujfizeteshozzaadasa_gomb.onclick = function() {
					konzol.style.display = "block";
				}
				bezaras.onclick = function() {
					konzol.style.display = "none";
				}
				window.onclick = function(event) {
					if (event.target == konzol) {
						konzol.style.display = "none";
					}
				}
				</script>
			</td>
		</tr>
		<tr>
			<td>
				<?php
				$munkanap=0;
				$szabadnap=0;
				$betegszabadnap=0;
				$tuloranap=0;
				$ora100=0;
				$ora200=0;
				$netto=0;
				$brutto=0;
				$tiketekszama=0;
				$tiketekerteke=0;
				$bevetel=0;
				while($row = mysqli_fetch_object($lekeres)){
					$munkanap=$munkanap+$row->munkanap;
					$szabadnap=$szabadnap+$row->szabadnap;
					$betegszabadnap=$betegszabadnap+$row->betegszabadnap;
					$tuloranap=$tuloranap+$row->tuloranap;
					$ora100=$ora100+$row->ora100;
					$ora200=$ora200+$row->ora200;
					$netto=$netto+ceil($row->nettohonap);
					$tiketekszama=$tiketekszama+ceil($row->tiketekszama);
					$tiketekerteke=$tiketekerteke+ceil($row->tiketekerteke);
					$bevetel=$bevetel+ceil($row->bevetel);
					$id=$row->id;
					echo "
					<table border='1' style='background-color:lightblue;cursor:pointer;'>
						<tr>
							<td>ID:</td>
							<td>Dátum:</td>
							<td>Munkanap:</td>
							<td>Szabadnap</td>
							<td>Betegsz.nap</td>
							<td>Tulóra nap</td>
							<td>100%óra:</td>
							<td>200%óra:</td>
							<td style='width:80px;'>+</td>
							<td style='width:80px;'>-</td>
							<td>Netto/nap</td>
							<td>Netto/honap</td>
							<td>Tiket sz.</td>
							<td>Tiketek é.</td>
							<td>BEVÉTEL</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>$row->id</td>
							<td>$row->datum</td>
							<td>$row->munkanap</td>
							<td>$row->szabadnap</td>
							<td>$row->betegszabadnap</td>
							<td>$row->tuloranap</td>
							<td>$row->ora100</td>
							<td>$row->ora200</td>
							<td>$row->egyebbplusz</td>
							<td>$row->egyebbminusz</td>
							<td>$row->nettonap lej</td>
							<td>$row->nettohonap lej</td>
							<td>$row->tiketekszama db</td>
							<td>$row->tiketekerteke lej</td>
							<td>$row->bevetel lej</td>
							<td><button id='id$id' type='submit' value='$id' onclick='return szerkesztes($id);'>Szerkesztés</button></td>
							<td><button onclick='torles($row->id)'>Torles</button></td>
						</tr>
					</table>
					<br>
					";
				}
				?>
<body style="background-color: black;">
<table border='1' align='center' style='background-color:lightblue;cursor:pointer;'>
	<tr>
		<td colspan='11' align='center'>Összegzés:</td>
	</tr>
	<tr>
		<td>Fizetések:</td>
		<td>Munkanap:</td>
		<td>Szabadnap</td>
		<td>Betegsz.nap</td>
		<td>Tulóra nap</td>
		<td>100%óra:</td>
		<td>200%óra:</td>
		<td>Netto/honap</td>
		<td>Tiket sz.</td>
		<td>Tiketek é.</td>
		<td>BEVETÉL</td>
	</tr>
	<tr>
		<td><?php echo $fizetesek;?></td>
		<td><?php echo $munkanap;?></td>
		<td><?php echo $szabadnap;?></td>
		<td><?php echo $betegszabadnap;?></td>
		<td><?php echo $tuloranap;?></td>
		<td><?php echo $ora100;?></td>
		<td><?php echo $ora200;?></td>
		<td><?php echo $netto;?></td>
		<td><?php echo $tiketekszama;?></td>
		<td><?php echo $tiketekerteke;?></td>
		<td><?php echo $bevetel;?></td>
	</tr>
</table>
</body>
<?php
echo "</td></tr></table><br><br>";
?>