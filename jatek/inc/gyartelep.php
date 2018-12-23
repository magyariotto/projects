<?php
	include "connect.php";
	include "megtekintesvedelem.php";
	include "header.php";
?>
<link rel="stylesheet" href="../css/gyartelep.css">
<title>Gyártelep</title>
<body>
	<div id="kozepe">
		<table>
			<tr>
				<td id="td_menu">
					<table style="margin: -265px auto;">
						<tr>
							<td id="menu_lista_elem"><div class="gomb" onclick="tablazat(event, 'iranyitopult')" id="elsodleges">Irányitópult</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div class="gomb" onclick="tablazat(event, '1')" id="iridiumbanyak">Irídium bánya</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div class="gomb" onclick="tablazat(event, '2')" id="radonbanyak">Radon bánya</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div class="gomb" onclick="tablazat(event, '3')">Urán bánya</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div class="gomb" onclick="tablazat(event, '4')">Tantál finomitó</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div class="gomb" onclick="tablazat(event, '5')">Palládium finomitó</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div class="gomb" onclick="tablazat(event, 'laboratorium')">Laboratorium</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div class="gomb" onclick="tablazat(event, 'megrendelesek')">Megrendelések</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div class="gomb" onclick="tablazat(event, 'kereskedelem')">Kereskedelem</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div class="gomb" onclick="tablazat(event, '9')" id="munkahelyek">Munkahelyek</div></td>
						</tr>
					</table>
				</td>
				<td id="td_oldal">
					<table id="td_oldal_table">
						<tr>
							<td id="td_nyersi_kijelzo">Irídium(77/Ir)</td>
							<td id="td_nyersi_kijelzo">Radon(86/Pn)</td>
							<td id="td_nyersi_kijelzo">Urán(92/U)</td>
							<td id="td_nyersi_kijelzo">Tantál(73/Ta)</td>
							<td id="td_nyersi_kijelzo">Palládium</td>
						</tr>
						<tr>
							<td colspan="5" id="td_lap">
								<div id="iranyitopult" class="bloktartalom">
								Iranyitopult
								</div>
								<div id="1" class="bloktartalom">
									<table id="banya_fotabla">
										<tr>
											<td id="banya_lista">
												<div id="banya_lista_div">
													<table>
														<tr>
														<?php
															for($isz=1;$isz<=$iridium_banyak_szama;$isz++){
																$banya_id=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM banyak WHERE sorszam='$isz' and besorolas=1"))["id"];
																$szintkorlat=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM banyak WHERE id='$banya_id'"))["szintkorlat"];
																if($_SESSION["szint"] >= $szintkorlat){
																	if($_SESSION["iridium_banya_".$isz."_szint"] > 0){
																		?>
																		<td id="banya_modul">
																			<div onclick="iridium_banya_tablazat(event, '<?php echo "iridium_".$isz;?>')" id="ib_<?php echo $isz;?>" style="width: 198px;height: 134px;">
																				<div>Szint: <?php echo $_SESSION["iridium_banya_".$isz."_szint"]?></div>
																				<div style="float: right;position: relative;bottom: 20px;color: red;"><?php echo $isz;?></div>
																				<div style="position: relative;bottom: -95px;">Termeles: <?php echo $_SESSION["iridiumbanyaszam".$isz."termeles"];?> /ora</div>
																			</div>
																		</td>
																		<?php
																	}elseif($_SESSION["iridium_banya_".$isz."_szint"] == 0){
																		?>
																		<td id="banya_modul">
																			<div onclick="iridium_banya_tablazat(event, '<?php echo "iridium_".$isz;?>')" id="ib_<?php echo $isz;?>" style="width: 198px;height: 134px;">Szint: <?php echo $_SESSION["iridium_banya_".$isz."_szint"]; ?></div>
																		</td>
																		<?php
																	}
																}elseif($_SESSION["szint"] < $szintkorlat){
																	?>
																	<td id="banya_modul">
																		<div onclick="iridium_banya_tablazat(event , '<?php echo "iridium_".$isz;?>')" id="ib_<?php echo $isz;?>" style="width: 198px;height: 134px;background-color: rgba(0, 0, 0, 0.8);">Elerheto a(z) <?php echo $szintkorlat;?> szinttol.</div>
																	</td>
																	<?php
																}
																if($isz%3 == 0){
																	echo "</tr>";
																	if($isz != $iridium_banyak_szama){
																		echo "<tr>";
																	}
																}
															}
														?>
													</table>
												</div>
											</td>
											<td id="banya_navigacioslap">
<?php //************************************************************IRIDIUM***OSSZESITO***DIV************************************************************?>
												<div style="display: none;" id="iridium_osszesito" class="elerheto_banya_modul_div" onclick="iridium_banya_tablazat(event, 'iridium0')"></div>
												<div id="iridium0" class="bloktartalom_iridium_banya">
													<table style="color: white;text-align: center;">
														<tr>
															<td>Iridium Banyaszat</td>
														</tr>
														<tr>
															<td>
																<table style="margin: 0 auto;text-align:center;width:390px;height:400px;color:white;">
																	<tr>
																		<td></td>
																		<td>Szint</td>
																		<td>Termeles</td>
																	</tr>
																	<?php
																	$osztermeles=0;
																	for($isz=1;$isz<=$iridium_banyak_szama;$isz++){
																		$banya_id=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM banyak WHERE sorszam='$isz' and besorolas=1"))["id"];
																		$szintkorlat=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM banyak WHERE id='$banya_id'"))["szintkorlat"];
																		if($_SESSION["iridium_banya_".$isz."_szint"] > 0){
																			$osztermeles+=$_SESSION["iridiumbanyaszam".$isz."termeles"];
																			?>
																			<tr>
																				<td>Iridium banya: <?php echo $isz;?></td>
																				<td><?php echo $_SESSION["iridium_banya_".$isz."_szint"]; ?></td>
																				<td><?php echo $_SESSION["iridiumbanyaszam".$isz."termeles"];?> /ora</td>
																			</tr>
																			<?php
																		}else{
																			?>
																			<tr>
																				<td>Iridium banya: <?php echo $isz;?></td>
																				<td colspan="2" style="color: red;">Elerheto a(z) <?php echo $szintkorlat;?> -dik szinttol.</td>
																			</tr>
																			<?php
																		}
																	}
																	?>
																	<tr>
																		<td>Ossztermeles: </td>
																		<td colspan="2"><?php echo $osztermeles; ?> /ora.</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</div>
												<?php
//************************************************************IRIDIUM***BANYAK***DIV************************************************************												
											for($isz=1;$isz<=$iridium_banyak_szama;$isz++){
												$banya_alaptermelese=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM banyak WHERE (besorolas=1) and (sorszam=$isz)"))["alaptermeles"];
												$kovetkezo_szint_termelese=$banya_alaptermelese*pow(($_SESSION["iridium_banya_".$isz."_szint"]+1) , 2);
												?>
												<div id="iridium_<?php echo $isz; ?>" class="bloktartalom_iridium_banya" style="margin: 0px auto; width:380px;height:430px;border-width: 2px;border-style: inset;border-color: rgb(38, 38, 38);border-radius: 10px 10px 10px 10px;">
													<?php
													if($_SESSION["iridium_banya_".($isz)."_szint"] != 0){
														if(isset($_POST["fejlesztes_kreditert_$isz"])){
															Header("Location: gyartelep.php?iridiumbanyak=$isz");
														}
													?>
														<br>
														<table id="termeles_table_001">
															<tr>
																<td>Iridium Banya <?php echo $isz; ?></td>
															</tr>
														</table>
														<table id="termeles_table_001">
															<tr>
																<td id="termeles_td_001">Jelenlegi szint:</td>
																<td id="termeles_td_001">Termeles:</td>
															</tr>
															<tr>
																<td id="termeles_td_002"><?php echo $_SESSION["iridium_banya_".$isz."_szint"];?></td>
																<td id="termeles_td_002"><?php echo number_format($_SESSION["iridiumbanyaszam".$isz."termeles"]);?>/ora</td>
															</tr>
														</table>
														<table id="termeles_table_001">
															<tr>
																<td id="termeles_td_001">Kovetkezo szint: </td>
																<td id="termeles_td_001">Termeles: </td>
															</tr>
															<tr>
																<td id="termeles_td_002"><?php echo $_SESSION["iridium_banya_".$isz."_szint"]+1;?></td>
																<td id="termeles_td_002"><?php echo number_format($kovetkezo_szint_termelese);?>/ora</td>
															</tr>
														</table>
														<table id="termeles_table_001">
															<tr>
																<td id="termeles_td_001">Fejlesztes ara kreditben</td>
																<td id="termeles_td_001">Fejlesztes ara terraban</td>
															</tr>
															<tr>
																<td id="termeles_td_002">x</td>
																<td id="termeles_td_002">y</td>
															</tr>
															<tr>
																<form method="post" action="">
																	<td id="termeles_td_001"><input type="submit" name="fejlesztes_kreditert_<?php echo $isz;?>" value="Fejlesztes"></td>
																	<td id="termeles_td_001"><input type="submit" name="fejlesztes_terraert_<?php echo $isz;?>" value="Fejlesztes"></td>
																</form>
															</tr>
														</table>
													<?php
													}
											echo "</div>";
											}
											?>
											</td>
										</tr>
									</table>
								</div>
								<div id="2" class="bloktartalom">
								Radon bánya
								</div>
								<div id="3" class="bloktartalom">
								Urán bánya
								</div>
								<div id="4" class="bloktartalom">
								Tantál finomitó
								</div>
								<div id="5" class="bloktartalom">
								Palládium finomitó
								</div>
								<div id="laboratorium" class="bloktartalom">
								Laboratorium
								</div>
								<div id="megrendelesek" class="bloktartalom">
								Megrendelesek
								</div>
								<div id="kereskedelem" class="bloktartalom">
								Kereskedelem
								</div>
								<div id="9" class="bloktartalom">
									<?php
									for($gszam=1;$gszam<=$munkahelyek_szama;$gszam++){
										if( isset($_POST["kuld$gszam"])){
											$ido= time();
											$munkaido=$_POST["munka"];
											$egyora_sec=3600;
											mysqli_query($conn , "UPDATE munka SET kezdes=$ido,munkaido='$munkaido',munkaido_sec=$munkaido*$egyora_sec,munkahely_id='$gszam',dolgozik=1 WHERE id='$userid'");
											header("Location: gyartelep.php?munkahelyek");
										}
									}
									if( isset($_POST["vissza"])){
										$vissza="UPDATE munka SET kezdes=0,munkahely_id=0,munkaido=0,munkaido_sec=0,dolgozik=0 WHERE id='$userid'";
										mysqli_query($conn , $vissza);
										header("Location: gyartelep.php?munkahelyek");
									}
									if($_SESSION["dolgozik"] == 1){
										echo "<table id='munkatabla1'><tr><td>Mar dolgozol.</td></tr>";
										echo "<tr><td><form method='post' action=''><input type='submit' name='vissza' value='Munka befejezese'></form></td></tr>";
										echo "<tr><td>".floor($munkaido)." perc</td></tr></table>";
									}else{
										for($mszam=1;$mszam<=$munkahelyek_szama;$mszam++){
											$munkahely_szintkorlatja=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM munkahelyek WHERE id='$mszam'"))["szintkorlat"];
											if($_SESSION["szint"] > $munkahely_szintkorlatja){
										?>
										<form method="post" action="">
											<table>
												<tr>
													<td>Munkahely <?php echo $mszam;?></td>
												</tr>
												<tr>
													<td>
														<select name="munka">
														<?php
														for($ora=1;$ora<=8;$ora++){
															echo "<option value='".$ora."'>".$ora."</option>";
														}
														?>
														</select>
														<input type="submit" name="kuld<?php echo $mszam;?>" value="Elküld">
													</td>
												</tr>
											</table>
										</form>
										<?php
											}else{
												echo "Ez a munkahely a ".$munkahely_szintkorlatja." szinttol erheto el";
											}
										}
									}
									?>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<div id="alja">
		<a>Keszitette: Magyari Otto</a>
	</div>
	<script>
	function tablazat(event, blokszam) {
		var i, bloktartalom, gomb;
		bloktartalom = document.getElementsByClassName("bloktartalom");
		for (i = 0; i < bloktartalom.length; i++) {
			bloktartalom[i].style.display = "none";
		}
		gomb = document.getElementsByClassName("gomb");
		for (i = 0; i < gomb.length; i++) {
			gomb[i].className = gomb[i].className.replace(" aktiv", "");
		}
		document.getElementById(blokszam).style.display = "block";
		event.currentTarget.className += " aktiv";
	}
	<?php
	if(isset($_GET["iridiumbanyak"])){
		echo "document.getElementById('iridiumbanyak').click();";
	}elseif(isset($_GET["radonbanyak"])){
		echo "document.getElementById('radonbanyak').click();";
	}elseif(isset($_GET["munkahelyek"])){
		echo "document.getElementById('munkahelyek').click();";
	}else{
		echo "document.getElementById('elsodleges').click();";
	}
	?>
	function iridium_banya_tablazat(event, blokszam2) {
		var sz, bloktartalom_iridium_banya, elerheto_banya_modul_div, szintkorlatozot_banya_modul;
		bloktartalom_iridium_banya = document.getElementsByClassName("bloktartalom_iridium_banya");
		for (sz = 0; sz < bloktartalom_iridium_banya.length; sz++) {
			bloktartalom_iridium_banya[sz].style.display = "none";
		}
		elerheto_banya_modul_div = document.getElementsByClassName("elerheto_banya_modul_div");
		for (sz = 0; sz < elerheto_banya_modul_div.length; sz++) {
			elerheto_banya_modul_div[sz].className = elerheto_banya_modul_div[sz].className.replace("aktiv_iridium_banya", "");
		}
		szintkorlatozot_banya_modul = document.getElementsByClassName("szintkorlatozot_banya_modul");
		for (sz = 0; sz < szintkorlatozot_banya_modul.length; sz++) {
			szintkorlatozot_banya_modul[sz].className = szintkorlatozot_banya_modul[sz].className.replace("aktiv_iridium_banya", "");
		}
		document.getElementById(blokszam2).style.display = "block";
		event.currentTarget.className += "aktiv_iridium_banya";
	}
	<?php
	if(isset($_GET["iridiumbanyak"])){
		if($_GET["iridiumbanyak"] <= $iridium_banyak_szama and $_GET["iridiumbanyak"] != ""){
			echo "document.getElementById('ib_".$_GET["iridiumbanyak"]."').click();";
		}
	}else{
		echo "document.getElementById('iridium_osszesito').click();";
	}
	?>
	</script>
</body>