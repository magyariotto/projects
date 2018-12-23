<?php
	include "connect.php";
	$sql1 = "SELECT * from horgaszatelozmenyek ORDER BY id desc";
	$lekeres1 = mysqli_query($conn , $sql1);
	if(isset($_POST["hozzaad"])){
		$datum=$_POST["datum"];
		$idotartam=$_POST["idotartam"];
		$horgaszto=$_POST["horgaszto"];
		$ara=$_POST["ara"];
		$ponty=$_POST["ponty"];
		$amur=$_POST["amur"];
		$karasz=$_POST["karasz"];
		$afrikaiharcsa=$_POST["afrikaiharcsa"];
		$torpeharcsa=$_POST["torpeharcsa"];
		$csuka=$_POST["csuka"];
		$keszeg=$_POST["keszeg"];
		$kardhal=$_POST["kardhal"];
		$naphal=$_POST["naphal"];
		mysqli_query($conn , "INSERT INTO `horgaszatelozmenyek` (`datum`,`idotartam`,`horgaszto`,`ara`,`ponty`,`amur`,`karasz`,`afrikaiharcsa`,`torpeharcsa`,`csuka`,`keszeg`,`kardhal`,`naphal`) 
														VALUES ('$datum','$idotartam','$horgaszto','$ara','$ponty','$amur','$karasz','$afrikaiharcsa','$torpeharcsa','$csuka','$keszeg','$kardhal','$naphal')");
		Header("Location: horgaszatok.php");
	}
?>
<link rel="stylesheet" href="horgaszatok.css">
<body style="background-color: #808B91;">
	<div id="fodiv">
		<table border="solid" style="width: 1390px;">
			<tr>
				<td>Id:</td>
				<td>Datum:</td>
				<td>Idotartam:</td>
				<td>Horgaszto:</td>
				<td>Ara:</td>
				<td>Ponty:</td>
				<td>Amur:</td>
				<td>Karasz</td>
				<td>Afrikai harcsa:</td>
				<td>Torpe harcsa:</td>
				<td>Csuka</td>
				<td>Keszeg:</td>
				<td>Kardhal:</td>
				<td>Naphal:</td>
			</tr>
			<?php
			$idotartam=0;
			$ara=0;
			$pontyok=0;
			$amurok=0;
			$karaszok=0;
			$afrikaiharcsa=0;
			$torpeharcsa=0;
			$csuka=0;
			$keszeg=0;
			$kardhal=0;
			$naphal=0;
			while($row = mysqli_fetch_object($lekeres1))
			{
				$idotartam=$idotartam+$row->idotartam;
				$ara=$ara+$row->ara;
				$pontyok=$pontyok+$row->ponty;
				$amurok=$amurok+$row->amur;
				$karaszok=$karaszok+$row->karasz;
				$afrikaiharcsa=$afrikaiharcsa+$row->afrikaiharcsa;
				$torpeharcsa=$torpeharcsa+$row->torpeharcsa;
				$csuka=$csuka+$row->csuka;
				$kardhal=$kardhal+$row->kardhal;
				$naphal=$naphal+$row->naphal;
				echo "
				<tr>
				<td>$row->id</td>
				<td>$row->datum</td>
				<td>$row->idotartam ora</td>
				<td>$row->horgaszto</td>
				<td>$row->ara lej</td>
				<td>$row->ponty</td>
				<td>$row->amur</td>
				<td>$row->karasz</td>
				<td>$row->afrikaiharcsa</td>
				<td>$row->torpeharcsa</td>
				<td>$row->csuka</td>
				<td>$row->keszeg</td>
				<td>$row->kardhal</td>
				<td>$row->naphal</td>
				</tr>
				";
			}
			?>
			<tr>
				<td></td>
				<td></td>
				<td><?php echo $idotartam;?> ora</td>
				<td></td>
				<td><?php echo $ara;?> lej</td>
				<td><?php echo $pontyok;?> ponty</td>
				<td><?php echo $amurok;?> amur</td>
				<td><?php echo $karaszok;?> karasz</td>
				<td><?php echo $afrikaiharcsa;?> afrikaiharcsa</td>
				<td><?php echo $torpeharcsa;?> torpeharcsa</td>
				<td><?php echo $csuka;?> csuka</td>
				<td><?php echo $keszeg;?> keszeg</td>
				<td><?php echo $kardhal;?> kardhal</td>
				<td><?php echo $naphal;?> naphal</td>
			</tr>
		</table>
	</div>
	<div id="hozzaaddiv">
		<form method='post' action='horgaszatok.php'>
			<table>
				<tr>
					<td>Datum: <input type="text" name="datum" value=""></td>
					<td>Idotartam: <input type="text" name="idotartam" value=""></td>
					<td>Horgaszto:
					<select name="horgaszto">
						<option value="Endred">Endred</option>
						<option value="Terem">Terem</option>
						<option value="Ianculest">Ianculest</option>
						<option value="Chereusa">Chereusa</option>
						<option value="Gencs">Gencs</option>
						<option value="Csillag">Csillag</option>
						<option value="Olasz">Olasz</option>
						<option value="Borvelyi kanalis">Borvelyi kanalis</option>
					</select>
					</td>
					<td>Ara: <input type="number" name="ara" value=""></td>
				</tr>
				<tr>
					<td>Ponty: <input type="number" name="ponty" value="0"></td>
					<td>Amur: <input type="number" name="amur" value="0"></td>
					<td>Karasz: <input type="number" name="karasz" value="0"></td>
					<td>Keszeg: <input type="number" name="keszeg" value="0"></td>
				</tr>
				<tr>
					<td>Afrikai harcsa: <input type="number" name="afrikaiharcsa" value="0"></td>
					<td>Torpe harcsa: <input type="number" name="torpeharcsa" value="0"></td>
					<td>Csuka: <input type="number" name="csuka" value="0"></td>
					<td>Kardhal: <input type="number" name="kardhal" value="0"></td>
				</tr>
				<tr>
					<td colspan="4">Naphal: <input type="number" name="naphal" value="0"></td>
				</tr>
				<tr>
					<td><input type="submit" name="hozzaad" value="Hozzaadas"></td>
				</tr>
			</table>
		</form>
	</div>
</body>