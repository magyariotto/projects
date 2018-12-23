<?php
include "megtekintesvedelem.php";
include "header.php";
?>
<link rel="stylesheet" href="../css/flotta.css">
<title>Flotta</title>
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
							<td id="menu_lista_elem"><div class="gomb" onclick="tablazat(event, '1')" id="hadihajok">Hadihajok</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div class="gomb" onclick="tablazat(event, '2')" id="civilhajok">Civil hajok</div></td>
						</tr>
					</table>
				</td>
				<td id="td_oldal">
					<table id="td_oldal_table">
						<tr>
							<td id="td_nyersi_kijelzo">Irídium: <?php echo number_format($raktaron_iridium); ?></td>
							<td id="td_nyersi_kijelzo">Radon: <?php echo number_format($raktaron_radon); ?></td>
							<td id="td_nyersi_kijelzo">Urán: <?php echo number_format($raktaron_uran); ?></td>
							<td id="td_nyersi_kijelzo">Tantál: <?php echo number_format($raktaron_tantal); ?></td>
							<td id="td_nyersi_kijelzo">Palládium: <?php echo number_format($raktaron_palladium); ?></td>
						</tr>
						<tr>
							<td colspan="5" id="td_lap">
								<div id="iranyitopult" class="bloktartalom">
									<table id="banya_fotabla">
										<tr>
											<td id="banya_lista">
												<div id="banya_lista_div">
													<table>
														<tr>
														<?php
															for($esz=1;$esz<=$epuletek_szama;$esz++){
																$epulet_azonosito=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM epuletek WHERE azonosito='$esz'"))["azonosito"];
																$szintkorlat=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM epuletek WHERE azonosito='$epulet_azonosito'"))["szintkorlat"];
																if($_SESSION["szint"] >= $szintkorlat){
																		?>
																		<td id="banya_modul">
																			<div onclick="epuletek_tablazat(event, '<?php echo "epulet_".$esz;?>')" id="epuletgombid_<?php echo $esz;?>" class="epulet_elerheto">
																				<div><?php echo $_SESSION["epulet_".$esz."_nev"].".<br>Elerheto"; ?></div>
																			</div>
																		</td>
																<?php
																}else{
																	?>
																	<td id="banya_modul">
																		<div onclick="epuletek_tablazat(event , '<?php echo "epulet_".$esz;?>')" id="epuletgombid_<?php echo $esz;?>" class="epulet_nemelerheto"><?php echo $_SESSION["epulet_".$esz."_nev"]."<br>Elerheto a(z) ".$_SESSION["epulet_".$esz."_szintkorlat"].". szinttol"; ?></div>
																	</td>
																	<?php
																}
																if($esz%4 == 0){
																	echo "</tr>";
																	if($esz != $iridium_banyak_szama){
																		echo "<tr>";
																	}
																}
															}
														?>
													</table>
												</div>
											</td>
											<td id="banya_navigacioslap">
<?php //************************************************************Epuletek***OSSZESITO***DIV************************************************************?>
												<div style="display: none;" id="epulet_osszesito" class="epulet_elerheto" onclick="epuletek_tablazat(event, 'epuletosszesito')"></div>
												<div id="epuletosszesito" class="bloktartalom_epuletek">
													<?php
														echo "alap szoveg a konzolon";
													?>
												</div>
												
												<?php
												for($esz=1;$esz<=$epuletek_szama;$esz++){
													echo "<div id='epulet_$esz' class='bloktartalom_epuletek'>".$_SESSION["epulet_".$esz."_nev"]."</div>";
												}
												?>
<?php //************************************************************Epuletek***OSSZESITO***DIV**VEGE******************************************************?>
											</td>
										</tr>
									</table>
								</div>
								<div id="1" class="bloktartalom">
									<table id="banya_fotabla">
										<tr>
											<td id="banya_lista">
												<div id="banya_lista_div">
													<table>
														<tr>
														<?php
															for($usz=1;$usz<=$urhajo_tipusok_szama;$usz++){
																$urhajo_azonosito=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM urhajok WHERE azonosito='$usz'"))["azonosito"];
																$szintkorlat=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM urhajok WHERE azonosito='$urhajo_azonosito'"))["szintkorlat"];
																if($_SESSION["szint"] >= $szintkorlat){
																		?>
																		<td id="banya_modul" style="background-image: url(<?php echo $_SESSION["urhajo_".$urhajo_azonosito."_kep"]; ?>);">
																			<div onclick="epuletek_tablazat(event, '<?php echo "iridium_".$usz;?>')" id="ib_<?php echo $usz;?>" class="banya_modul_elerheto">
																				<div><?php echo $_SESSION["urhajo_".$usz."_nev"]; ?></div>
																			</div>
																		</td>
																<?php
																}elseif($_SESSION["szint"] < $szintkorlat){
																	?>
																	<td id="banya_modul" style="background-image: url(<?php echo $_SESSION["urhajo_".$urhajo_azonosito."_kep"]; ?>);">
																		<div onclick="epuletek_tablazat(event , '<?php echo "iridium_".$usz;?>')" id="ib_<?php echo $usz;?>" class="banya_modul_nemelerheto">Elerheto a(z) <?php echo $szintkorlat;?> szinttol.</div>
																	</td>
																	<?php
																}
																if($usz%4 == 0){
																	echo "</tr>";
																	if($usz != $iridium_banyak_szama){
																		echo "<tr>";
																	}
																}
															}
														?>
													</table>
												</div>
											</td>
											<td id="banya_navigacioslap">
<?php //************************************************************Csatahajo***OSSZESITO***DIV************************************************************?>
												<div style="display: none;" id="iridium_osszesito" class="elerheto_banya_modul_div" onclick="epuletek_tablazat(event, 'iridium0')"></div>
												<div id="iridium0" class="bloktartalom_iridium_banya">
													<?php
														echo "alap szoveg a konzolon";
													?>
												</div>
												<?php
													echo "konzol";
												?>
												</div>
<?php //************************************************************Csatahajo***OSSZESITO***DIV**VEGE******************************************************?>
											</td>
										</tr>
									</table>
								</div>
								<div id="2" class="bloktartalom">
								
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
	document.getElementById('elsodleges').click();

	
	/* EPULETEK KONZOL MEGJELENITOJE */
	function epuletek_tablazat(event, blokszam2) {
		var sz, bloktartalom_epuletek, epulet_elerheto, epulet_nemelerheto;
		bloktartalom_epuletek = document.getElementsByClassName("bloktartalom_epuletek");
		for (sz = 0; sz < bloktartalom_epuletek.length; sz++) {
			bloktartalom_epuletek[sz].style.display = "none";
		}
		epulet_elerheto = document.getElementsByClassName("epulet_elerheto");
		for (sz = 0; sz < epulet_elerheto.length; sz++) {
			epulet_elerheto[sz].className = epulet_elerheto[sz].className.replace(" aktiv_epulet", "");
		}
		epulet_nemelerheto = document.getElementsByClassName("epulet_nemelerheto");
		for (sz = 0; sz < epulet_nemelerheto.length; sz++) {
			epulet_nemelerheto[sz].className = epulet_nemelerheto[sz].className.replace(" aktiv_epulet", "");
		}
		document.getElementById(blokszam2).style.display = "block";
		event.currentTarget.className += " aktiv_epulet";
	}
	document.getElementById('epulet_osszesito').click();
	
	</script>
</body>