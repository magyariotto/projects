<?php
include "megtekintesvedelem.php";
include "header.php";
$start=0;
$laponkent=15;
$osszes=ceil(mysqli_num_rows(mysqli_query($conn,"select * from szovetseg"))/$laponkent);
if(isset($_GET['oldal']))
{
	$oldal=$_GET['oldal'];
	$start=($oldal-1)*$laponkent;
}
else{
	$oldal=1;
}
$sql = "SELECT * FROM szovetseg LIMIT $start, $laponkent";
$lekeres = mysqli_query($conn , $sql);
?>
<link rel="stylesheet" href="../css/szovetseg.css">
<body>
	<div id="kozepe">
		<?php
		if($aktualis_szovetseg == 0 or $aktualis_szovetseg < 0){ ?>
		<table style="color:white;">
			<tr>
				<td id="szovetsegek">
					<?php if($aktualis_szovetseg == 0){ ?>
					<table>
						<tr style="height:480px;">
							<td>
								<table style="width:940px;color:white;text-align:center;margin: -240 auto;" border="2">
									<tr style="height: 20px;cursor: default;">
										<td>Helyezes</td>
										<td>Pontszam</td>
										<td>Rovidites</td>
										<td>Szovetseg neve</td>
										<td>Letszam</td>
										<td>Szoveseg vezere</td>
										<td></td>
									</tr>
									<?php
									$i=($oldal*$laponkent)-$laponkent;
									while($row = mysqli_fetch_object($lekeres)) {
										if(isset($_POST["jelentkezes".$row->id])){
											$regi_jelentkezok=unserialize($row->jelentkezok);
											$idm=array($userid);
											$uj_jelentkezok= array_merge_recursive($regi_jelentkezok , $idm);
											$jelentkezok= serialize($uj_jelentkezok);
											mysqli_query($conn , "UPDATE szovetseg SET jelentkezok='$jelentkezok' WHERE id='$row->id'");
											$szovetsegem[0]=(-1)*$row->id;
											$up_szovetseg=serialize($szovetsegem);
											mysqli_query($conn , "UPDATE users SET szovetseg='$up_szovetseg' WHERE userid='$userid'");
											Header("Location: szovetseg.php");
										}
										$i++;
										$vezerid=$row->szovetsegvezere;
										$vezer_neve=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid=$vezerid"))["username"];
										echo "<tr id='sorok' style='height:20px;'>";
										echo '<td id="helyezes">'.$i.'</td>';
										echo '<td id="pontszam">' . number_format($row->pontszam) . '</td>';
										echo '<td id="rovidites">' . $row->rovidites . '</td>';
										echo '<td id="szovetsegneve">' . $row->szovetsegneve . '</td>';
										echo '<td id="letszam">' . $row->letszam . "/" .  $row->maxletszam . '</td>';
										echo '<td id="szovetsegvezere">' . $vezer_neve . '</td>';
										echo '<td style="width:90px;">
											<form style="display:inline;" method="post" action="">
												<input id="jelentkezes" name="jelentkezes' . $row->id . '" style="outline: none;cursor: pointer;" type="submit" value="Jelentkezem">
											</form>
										</td>';
										echo '</tr>';
									}
									?>
								</table>
							</td>
						</tr>
						<tr style="height: 20px;">
							<td>
								<div id="oldalak" style="display:inline;">
									<?php
									if($oldal>1)
									{
										echo "<div style='display:table-cell;'><li><div class='gomb'><a href='?oldal=".($oldal-1)."'>Elöző</a></div></li></div>";
									}
									for($i=1;$i<=$osszes;$i++){
										if($i==$oldal) { echo "<div style='display:table-cell;'><li><div class='gomb'><a style='color: red;'>".$i."</a></div></li></div>"; 
										}else{ echo "<div style='display:table-cell;'><li><div class='gomb'><a href='?oldal=".$i."'>".$i."</a></div></li></div>"; }
										}
									if($oldal!=$osszes)
									{
										echo "<div style='display:table-cell;'><li><div class='gomb'><a href='?oldal=".($oldal+1)."'>Kovetkező</a></div></li></div>";
									}
									?>
								</div>
							</td>
						</tr>
					</table>
					<?php }elseif($aktualis_szovetseg < 0){?>
					<table style="color:white;">
						<tr>
							<td>Jelentkeztel a <?php echo $aktualis_szovetseg*(-1); ?>-idju szovetsegbe.</td>
						</tr>
					</table>
					<?php } ?>
				</td>
				<td id="szovetseg_alapitasa">
				<?php
				if(isset($_POST["szovetsegletrehozasa"])){
					$rovidites= $_POST["szovetsegroviditese"];
					$szovetsegneve= $_POST["szovetsegneve"];
					$pontszam=$_SESSION["pontszam"];
					$tagok="a:1:{i:0;i:".$userid.";}";
					mysqli_query($conn , "INSERT INTO `szovetseg` (pontszam,rovidites,szovetsegneve,szovetsegvezere,szovetsegtagok) VALUES 
					('$pontszam','$rovidites','$szovetsegneve','$userid','$tagok')");
					$id=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM szovetseg WHERE szovetsegvezere=$userid"))["id"];
					$szovetsegem[0]=$id;
					$szovetsegem[1]=1;
					$up=serialize($szovetsegem);
					mysqli_query($conn , "UPDATE users SET szovetseg='$up',kredit=kredit-500000 WHERE userid='$userid'");
				}
				?>
					<table style="color:white;">
						<form method="post" action="">
							<tr>
								<td>Szovetseg roviditese:</td>
								<td><input type="text" name="szovetsegroviditese" value=""></td>
							</tr>
							<tr>
								<td>Szovetseg neve:</td>
								<td><input type="text" name="szovetsegneve" value=""></td>
							</tr>
							<tr>
								<td>Szovetseg leirasa:</td>
								<td><input type="text" name="szovetsegleirasa" value=""></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<input type="submit" name="szovetsegletrehozasa" value="szovetseg letrehoasa">
								</td>
							</tr>
						</form>
					</table>
				</td>
			</tr>
		</table>
		<?php }elseif($aktualis_szovetseg > 0){ ?>
		<table style="color:white;width:1405px;height:555px;">
			<tr border="1">
				<td colspan="3" style="height:25px;border-width:3px;border-style:inset;border-color: rgb(38, 38, 38);border-radius 10px 10px 10px 10px;">
					<a>Informacios sav</a>
					<?php if(isset($_GET["bonuszok"])){?>
					<div style="display:inline;float:right;">Szovetseg kassza: <?php echo number_format($_SESSION["szovetseg_kredite"]);?> kredit.</div>
					<?php }?>
				</td>
			</tr>
			<tr>
				<td style="width:279px;border-width:3px;border-style:inset;border-color: rgb(38, 38, 38);border-radius 10px 10px 10px 10px;">
					<table style="margin: -250px auto;color:orange;">
						<tr>
							<td id="menu_lista_elem"><div id="gomb" onclick="location.href='szovetseg.php'">Kezdolap</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div id="gomb" onclick="location.href='szovetseg.php?tagok'">Tagok</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div id="gomb" onclick="location.href='szovetseg.php?kassza'">Kassza</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div id="gomb" onclick="location.href='szovetseg.php?kuldetesek'">Kuldetesek</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div id="gomb" onclick="location.href='szovetseg.php?bonuszok'">Bonuszok</div></td>
						</tr>
						<tr>
							<td id="menu_lista_elem"><div id="gomb" onclick="location.href='szovetseg.php?diplomacia'">Diplomacia</div></td>
						</tr>
					</table>
				</td>
				<td style="max-width:600px;border-width:3px;border-style:inset;border-color: rgb(38, 38, 38);border-radius 10px 10px 10px 10px;">
					<?php
					if(empty($_GET)){
						echo "kezdolap";
					}elseif(isset($_GET["tagok"])){
						$tagok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["szovetsegtagok"]);
						$letszam=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["letszam"];
						?>
						<table id="szovetseg_tagok_tabla">
							<tr>
								<td id="szovetseg_tagok_lista">
									<table style="margin:-175px auto;">
										<tr>
											<td>
												<?php
												if(isset($_POST["kilepes"])){
													unset($tagok[array_search($userid, $tagok)]);
													$uj_tag_lista= serialize(array_values($tagok));
													mysqli_query($conn , "UPDATE szovetseg SET szovetsegtagok='$uj_tag_lista',letszam=letszam-1 WHERE id='$aktualis_szovetseg'");
													$up2=serialize(array(0,0));
													$burkolat_osszertek=0;
													for($i=1;$i<=5;$i++){
														$burkolat_szam="b".$i;
														$burkolat_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$burkolat_szam"];
														if($burkolat_slotszam_erteke != 0){
															$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$burkolat_slotszam_erteke"))["burkolatertek"];
															$burkolat_osszertek=$burkolat_osszertek+$item_ertek;
														}
														$stattok[1]=$stattok[0]+$burkolat_osszertek+$_SESSION["burkolatertek"];
													}
													$pajzs_osszertek=0;
													for($i=1;$i<=5;$i++){
														$pajzs_szam="p".$i;
														$pajzs_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$pajzs_szam"];
														if($pajzs_slotszam_erteke != 0){
															$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$pajzs_slotszam_erteke"))["pajzsertek"];
															$pajzs_osszertek=$pajzs_osszertek+$item_ertek;
														}
														$stattok[3]=$stattok[2]+$pajzs_osszertek+$_SESSION["pajzsertek"];
													}
													$lezer_osszertek=0;
													for($i=1;$i<=5;$i++){
														$lezer_szam="l".$i;
														$lezer_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$lezer_szam"];
														if($lezer_slotszam_erteke != 0){
															$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$lezer_slotszam_erteke"))["lezerertek"];
															$lezer_osszertek=$lezer_osszertek+$item_ertek;
														}
														$stattok[5]=$stattok[4]+$lezer_osszertek+$_SESSION["lezerertek"];
													}
													$meghajto_osszertek=0;
													for($i=1;$i<=5;$i++){
														$meghajto_szam="m".$i;
														$meghajto_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$meghajto_szam"];
														if($meghajto_slotszam_erteke != 0){
															$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$meghajto_slotszam_erteke"))["meghajtoertek"];
															$meghajto_osszertek=$meghajto_osszertek+$item_ertek;
														}
														$stattok[7]=$stattok[6]+$meghajto_osszertek+$_SESSION["meghajtoertek"];
													}
													$generator_osszertek=0;
													for($i=1;$i<=5;$i++){
														$generator_szam="g".$i;
														$generator_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$generator_szam"];
														if($generator_slotszam_erteke != 0){
															$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$generator_slotszam_erteke"))["generatorertek"];
															$generator_osszertek=$generator_osszertek+$item_ertek;
														}
														$stattok[9]=$stattok[8]+$generator_osszertek+$_SESSION["generatorertek"];
													}
													$up1=serialize($stattok);
													mysqli_query($conn , "UPDATE users SET stattok='$up1' , szovetseg='$up2' WHERE userid='$userid'");
													Header("Location: szovetseg.php");
												}
												for($i=0;$i<$letszam;$i++){
													if($tagok[$i] != 0){
														$rang=unserialize(mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM users WHERE userid=$tagok[$i]"))["szovetseg"])[1];
														if(isset($_POST[$tagok[$i]])){
															$eltavolitando_tag=$tagok[$i];
															unset($tagok[array_search($eltavolitando_tag, $tagok)]);
															$uj_tag_lista= serialize(array_values($tagok));
															mysqli_query($conn , "UPDATE szovetseg SET szovetsegtagok='$uj_tag_lista',letszam=letszam-1 WHERE id='$aktualis_szovetseg'");
															$up2=serialize(array(0,0));
															
															
															
															$eltavolitandotag_hajo_id=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$eltavolitando_tag'"))["aktivhajo"];
															$eltavolitandotag_hajo_burkolatertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$eltavolitandotag_hajo_id"))["burkolatertek"];
															$eltavolitandotag_hajo_pajzsertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$eltavolitandotag_hajo_id"))["pajzsertek"];
															$eltavolitandotag_hajo_lezerertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$eltavolitandotag_hajo_id"))["lezerertek"];
															$eltavolitandotag_hajo_meghajtoertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$eltavolitandotag_hajo_id"))["meghajtoertek"];
															$eltavolitandotag_hajo_generatorertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$eltavolitandotag_hajo_id"))["generatorertek"];
															$eltavolitandotag_stattok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$eltavolitando_tag'"))["stattok"]);
//************************************************************************ELTAVOLITANDO***TAG***BURKOLAT***ERTEK**************************************************************
															$eltavolitandotag_burkolat_osszertek=0;
															for($i=1;$i<=5;$i++){
																$burkolat_szam="b".$i;
																$burkolat_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$eltavolitando_tag'"))["$burkolat_szam"];
																if($burkolat_slotszam_erteke != 0){
																	$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$burkolat_slotszam_erteke"))["burkolatertek"];
																	$eltavolitandotag_burkolat_osszertek=$eltavolitandotag_burkolat_osszertek+$item_ertek;
																}
																$eltavolitandotag_stattok[1]=$eltavolitandotag_stattok[0]+$eltavolitandotag_burkolat_osszertek+$eltavolitandotag_hajo_burkolatertek;
															}
//************************************************************************ELTAVOLITANDO***TAG***PAJZS***ERTEK****************************************************************
															$eltavolitandotag_pajzs_osszertek=0;
															for($i=1;$i<=5;$i++){
																$pajzs_szam="p".$i;
																$pajzs_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$eltavolitando_tag'"))["$pajzs_szam"];
																if($pajzs_slotszam_erteke != 0){
																	$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$pajzs_slotszam_erteke"))["pajzsertek"];
																	$eltavolitandotag_pajzs_osszertek=$eltavolitandotag_pajzs_osszertek+$item_ertek;
																}
																$eltavolitandotag_stattok[3]=$eltavolitandotag_stattok[2]+$eltavolitandotag_pajzs_osszertek+$eltavolitandotag_hajo_pajzsertek;
															}
//************************************************************************ELTAVOLITANDO***TAG***LEZER***ERTEK****************************************************************
															$eltavolitandotag_lezer_osszertek=0;
															for($i=1;$i<=5;$i++){
																$lezer_szam="l".$i;
																$lezer_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$eltavolitando_tag'"))["$lezer_szam"];
																if($lezer_slotszam_erteke != 0){
																	$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$lezer_slotszam_erteke"))["lezerertek"];
																	$eltavolitandotag_lezer_osszertek=$eltavolitandotag_lezer_osszertek+$item_ertek;
																}
																$eltavolitandotag_stattok[5]=$eltavolitandotag_stattok[4]+$eltavolitandotag_lezer_osszertek+$eltavolitandotag_hajo_lezerertek;
															}
//************************************************************************ELTAVOLITANDO***TAG***MEGHAJTO***ERTEK**************************************************************
															$eltavolitandotag_meghajto_osszertek=0;
															for($i=1;$i<=5;$i++){
																$meghajto_szam="m".$i;
																$meghajto_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$eltavolitando_tag'"))["$meghajto_szam"];
																if($meghajto_slotszam_erteke != 0){
																	$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$meghajto_slotszam_erteke"))["meghajtoertek"];
																	$eltavolitandotag_meghajto_osszertek=$eltavolitandotag_meghajto_osszertek+$item_ertek;
																}
																$eltavolitandotag_stattok[7]=$eltavolitandotag_stattok[6]+$eltavolitandotag_meghajto_osszertek+$eltavolitandotag_hajo_meghajtoertek;
															}
//************************************************************************ELTAVOLITANDO***TAG***GENERATOR***ERTEK*************************************************************
															$eltavolitandotag_generator_osszertek=0;
															for($i=1;$i<=5;$i++){
																$generator_szam="g".$i;
																$generator_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$eltavolitando_tag'"))["$generator_szam"];
																if($generator_slotszam_erteke != 0){
																	$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$generator_slotszam_erteke"))["generatorertek"];
																	$eltavolitandotag_generator_osszertek=$eltavolitandotag_generator_osszertek+$item_ertek;
																}
																$eltavolitandotag_stattok[9]=$eltavolitandotag_stattok[8]+$eltavolitandotag_generator_osszertek+$eltavolitandotag_hajo_generatorertek;
															}
															$up1=serialize($eltavolitandotag_stattok);
															mysqli_query($conn , "UPDATE users SET stattok='$up1' , szovetseg='$up2' WHERE userid='$eltavolitando_tag'");
															Header("Location: szovetseg.php?tagok");
														}
												?>
												<table id="szovi_tagok_tabla">
														<tr style="height:20px;" border="1">
															<td style="width: 250px;">Nev: <?php echo mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid=$tagok[$i]"))["username"];?></td>
															<td>Szint: <?php echo mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid=$tagok[$i]"))["szint"];?></td>
															<td style="width: 130px;float:right;">Rang: <?php echo mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM szovetsegrangok WHERE id=$rang"))["megnevezes"];?></td>
														</tr>
														<tr style="height:20px;">
															<td>Tapasztalat: <?php echo number_format(unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid=$tagok[$i]"))["tp"])[1]);?></td>
															<td>Szerkeszt</td>
															<td style="width: 80px;float:right;cursor:pointer;"><?php
															if($rangom_szovetseg == 1){
																if($tagok[$i] == $userid){
																	echo "<a style='color:red;'>Kilepes</a>";
																}else{
																	echo "<form style='display: inline;' method='post' action=''><input style='cursor: pointer;' type='submit' name='$tagok[$i]' value='Eltavolitas'></form>";
																}
															}else{
																if($tagok[$i] == $userid){
																	echo "<form style='display: inline;' method='post' action=''><input style='cursor: pointer;' type='submit' name='kilepes' value='Kilepes'></form>";
																}
															}
															?></td>
														</tr>
													</table>
												<?php }
													} ?>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td id="szovetseg_jelentkezok_lista">
									<?php
									if($rangom_szovetseg == 1){
										$jelentkezok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["jelentkezok"]);
										$szovetsegtagok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["szovetsegtagok"]);
										?>
										<div style="width:788px; height:130px; overflow: auto;">
										<?php
											for($i=0;$i<count($jelentkezok);$i++){
												if(isset($_POST["elutasit".$jelentkezok[$i]])){
													$torlendo_jelentkezo=$jelentkezok[$i];
													unset($jelentkezok[array_search($jelentkezok[$i], $jelentkezok)]);
													$uj_jelentkezo_lista= serialize(array_values($jelentkezok));
													mysqli_query($conn , "UPDATE szovetseg SET jelentkezok='$uj_jelentkezo_lista' WHERE id='$aktualis_szovetseg'");
													$torolt_jelentkezes=serialize(array(0,0));
													mysqli_query($conn , "UPDATE users SET szovetseg='$torolt_jelentkezes' WHERE userid='$torlendo_jelentkezo'");
													Header("Location: szovetseg.php?tagok");
												}
												if(isset($_POST["felvesz".$jelentkezok[$i]])){
													$felveendo_jelentkezo=$jelentkezok[$i];
													$felveve_szovetseg_tomb=serialize(array($aktualis_szovetseg,6));
													mysqli_query($conn , "UPDATE users SET szovetseg='$felveve_szovetseg_tomb' WHERE userid='$felveendo_jelentkezo'");
													$uj_szovetsegtagok_lista=serialize(array_merge_recursive($szovetsegtagok , array($jelentkezok[$i])));
													if(($index = array_search($jelentkezok[$i], $jelentkezok)) !== false) {
													unset($jelentkezok[$index]);
													}
													$uj_jelentkezo_lista= serialize(array_values($jelentkezok));
													mysqli_query($conn , "UPDATE szovetseg SET szovetsegtagok='$uj_szovetsegtagok_lista',jelentkezok='$uj_jelentkezo_lista',letszam=letszam+1 WHERE id='$aktualis_szovetseg'");
													$ujtag_hajo_id=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$felveendo_jelentkezo'"))["aktivhajo"];
													$ujtag_hajo_burkolatertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$ujtag_hajo_id"))["burkolatertek"];
													$ujtag_hajo_pajzsertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$ujtag_hajo_id"))["pajzsertek"];
													$ujtag_hajo_lezerertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$ujtag_hajo_id"))["lezerertek"];
													$ujtag_hajo_meghajtoertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$ujtag_hajo_id"))["meghajtoertek"];
													$ujtag_hajo_generatorertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$ujtag_hajo_id"))["generatorertek"];
													$ujtag_stattok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$felveendo_jelentkezo'"))["stattok"]);
													$ujtag_burkolat_osszertek=0;
													for($i=1;$i<=5;$i++){
														$burkolat_szam="b".$i;
														$burkolat_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$felveendo_jelentkezo'"))["$burkolat_szam"];
														if($burkolat_slotszam_erteke != 0){
															$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$burkolat_slotszam_erteke"))["burkolatertek"];
															$ujtag_burkolat_osszertek=$ujtag_burkolat_osszertek+$item_ertek;
														}
														$ujtag_stattok[1]=ceil($ujtag_stattok[0]+$ujtag_burkolat_osszertek+$ujtag_hajo_burkolatertek+($ujtag_stattok[0]+$ujtag_burkolat_osszertek+$ujtag_hajo_burkolatertek)*($_SESSION["eletbonusz"]/100));
													}
													$ujtag_pajzs_osszertek=0;
													for($i=1;$i<=5;$i++){
														$pajzs_szam="p".$i;
														$pajzs_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$felveendo_jelentkezo'"))["$pajzs_szam"];
														if($pajzs_slotszam_erteke != 0){
															$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$pajzs_slotszam_erteke"))["pajzsertek"];
														$ujtag_pajzs_osszertek=$ujtag_pajzs_osszertek+$item_ertek;
														}
														$ujtag_stattok[3]=ceil($ujtag_stattok[2]+$ujtag_pajzs_osszertek+$ujtag_hajo_pajzsertek+($ujtag_stattok[2]+$ujtag_pajzs_osszertek+$ujtag_hajo_pajzsertek)*($_SESSION["pajzsbonusz"]/100));
													}
													$ujtag_lezer_osszertek=0;
													for($i=1;$i<=5;$i++){
														$lezer_szam="l".$i;
														$lezer_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$felveendo_jelentkezo'"))["$lezer_szam"];
														if($lezer_slotszam_erteke != 0){
															$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$lezer_slotszam_erteke"))["lezerertek"];
														$ujtag_lezer_osszertek=$ujtag_lezer_osszertek+$item_ertek;
														}
														$ujtag_stattok[5]=ceil($ujtag_stattok[4]+$ujtag_lezer_osszertek+$ujtag_hajo_lezerertek+($ujtag_stattok[4]+$ujtag_lezer_osszertek+$ujtag_hajo_lezerertek)*($_SESSION["sebzesbonusz"]/100));
													}
													$ujtag_meghajto_osszertek=0;
													for($i=1;$i<=5;$i++){
														$meghajto_szam="m".$i;
														$meghajto_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$felveendo_jelentkezo'"))["$meghajto_szam"];
														if($meghajto_slotszam_erteke != 0){
															$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$meghajto_slotszam_erteke"))["meghajtoertek"];
														$ujtag_meghajto_osszertek=$ujtag_meghajto_osszertek+$item_ertek;
														}
														$ujtag_stattok[7]=ceil($ujtag_stattok[6]+$ujtag_meghajto_osszertek+$ujtag_hajo_meghajtoertek+($ujtag_stattok[6]+$ujtag_meghajto_osszertek+$ujtag_hajo_meghajtoertek)*($_SESSION["sebessegbonusz"]/100));
													}
													$ujtag_generator_osszertek=0;
													for($i=1;$i<=5;$i++){
														$generator_szam="g".$i;
														$generator_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$felveendo_jelentkezo'"))["$generator_szam"];
														if($generator_slotszam_erteke != 0){
															$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$generator_slotszam_erteke"))["generatorertek"];
														$ujtag_generator_osszertek=$ujtag_generator_osszertek+$item_ertek;
														}
														$ujtag_stattok[9]=ceil($ujtag_stattok[8]+$ujtag_generator_osszertek+$ujtag_hajo_generatorertek+($ujtag_stattok[8]+$ujtag_generator_osszertek+$ujtag_hajo_generatorertek)*($_SESSION["generatorbonusz"]/100));
													}
													$up=serialize($ujtag_stattok);
													mysqli_query($conn , "UPDATE users SET stattok='$up' WHERE userid='$felveendo_jelentkezo'");
													Header("Location: szovetseg.php?tagok");
												}
												?>
												<table id="szovi_jelentkezok_tabla">
													<tr style="height:20px;" border="1">
														<td style="width: 200px;">Nev: <?php echo mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid=$jelentkezok[$i]"))["username"];?></td>
														<td style="width: 200px;">Tapasztalat: <?php echo number_format(unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid=$jelentkezok[$i]"))["tp"])[1]);?></td>
														<td style="width: 50px;">Szint: <?php echo mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid=$jelentkezok[$i]"))["szint"];?></td>
														<td style="float: right;">
															<form method="post" action="" style="display: inline;">
																<input style="cursor: pointer;" type="submit" name="felvesz<?php echo $jelentkezok[$i];?>" value="Elfogadas">
																<input style="cursor: pointer;" type="submit" name="elutasit<?php echo $jelentkezok[$i];?>" value="Elutasitas">
															</form>
														</td>
													</tr>
												</table>
									<?php } ?>
										</div>
										<?php
									}else{
										
									}
									?>
								</td>
							</tr>
						</table>
						<?php
					}elseif(isset($_GET["kassza"])){
						?>
						<div id="1" class='bloktartalom'>
							<table id="kassza_adakozas_table1">
								<tr>
									<td id="kassza_adakozas_td1">
										<table style="margin: 0px auto;">
											<tr>
												<td id="kassz_adakozas_td2a">Kredit: </td>
												<td id="kassza_adakozas_td2b">
													<?php echo number_format($szovetsegkassza[0]);?>
												</td>
											</tr>
											<tr>
												<td id="kassz_adakozas_td2c">Terra: </td>
												<td id="kassz_adakozas_td2d">
													<?php echo number_format($szovetsegkassza[1]);?>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="text-align:center;">
													<br>
													<div onclick="tablazat(event, '2')">
														<input style="cursor:pointer;"type="submit" name="kifizetes" value="Kifizetes">
													</div>
												</td>
											</tr>
										</table>
									</td>
									<td id="kassz_adakozas_td3">
										<form method="post" action="">
											<table style="margin: 0px auto;">
												<?php
												if(isset($_POST["adakozas"])){
													if(empty($_POST["adakozott_kredit"]) and empty($_POST["adakozott_terra"])){
														$hiba[] = "Add meg,hogy mit szeretnel adakozni!";
													}
													if(!empty($_POST["adakozott_kredit"]) and $_POST["adakozott_kredit"]>$_SESSION["kredit"]){
														$hiba[] = "Nem rendelkezel ennyi kredittel!";
													}
													if(!empty($_POST["adakozott_terra"]) and $_POST["adakozott_terra"]>$_SESSION["terra"]){
														$hiba[] = "Nem rendelkezel ennyi terraval!";
													}
													$muvelet="Adakozott";
													if(empty($hiba)){
														if(!empty($_POST["adakozott_kredit"]) and empty($_POST["adakozott_terra"])){
															$adakozott_kredit = $_POST["adakozott_kredit"];
															$szovetsegkassza[0]=$szovetsegkassza[0]+$adakozott_kredit;
															$up=serialize($szovetsegkassza);
															$ido=date('F j, Y H:i:s');
															$regi_kasszalog=unserialize(mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["kasszalog"]);
															$regi_log_bejegzesek_szama=count($regi_kasszalog);
															if($regi_log_bejegzesek_szama >= 20){
																unset($regi_kasszalog[0]);
															}
															$bejegyzes=array(array($ido , $userid , $muvelet , $adakozott_kredit , 0));
															$osszevont= array_merge_recursive($regi_kasszalog , $bejegyzes);
															$uj_kasszalog= serialize($osszevont);
															mysqli_query ($conn , "UPDATE users SET kredit=kredit-$adakozott_kredit WHERE userid ='$userid' ");
															mysqli_query ($conn , "UPDATE szovetseg SET kassza='$up' , kasszalog='$uj_kasszalog' WHERE id ='$aktualis_szovetseg' ");
															Header("Location: szovetseg.php?kassza");
														}elseif(empty($_POST["adakozott_kredit"]) and !empty($_POST["adakozott_terra"])){
															$adakozott_terra = $_POST["adakozott_terra"];
															$szovetsegkassza[1]=$szovetsegkassza[1]+$adakozott_terra;
															$up=serialize($szovetsegkassza);
															$ido=date('F j, Y H:i:s');
															$regi_kasszalog=unserialize(mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["kasszalog"]);
															$regi_log_bejegzesek_szama=count($regi_kasszalog);
															if($regi_log_bejegzesek_szama >= 20){
																unset($regi_kasszalog[0]);
															}
															$bejegyzes=array(array($ido , $userid , $muvelet , 0 , $adakozott_terra));
															$osszevont= array_merge_recursive($regi_kasszalog , $bejegyzes);
															$uj_kasszalog= serialize($osszevont);
															mysqli_query ($conn , "UPDATE users SET terra=terra-$adakozott_terra WHERE userid ='$userid' ");
															mysqli_query ($conn , "UPDATE szovetseg SET kassza='$up' , kasszalog='$uj_kasszalog' WHERE id ='$aktualis_szovetseg' ");
															Header("Location: szovetseg.php?kassza");
														}elseif(!empty($_POST["adakozott_kredit"]) and !empty($_POST["adakozott_terra"])){
															$adakozott_kredit = $_POST["adakozott_kredit"];
															$adakozott_terra = $_POST["adakozott_terra"];
															$szovetsegkassza[0]=$szovetsegkassza[0]+$adakozott_kredit;
															$szovetsegkassza[1]=$szovetsegkassza[1]+$adakozott_terra;
															$up=serialize($szovetsegkassza);
															$ido=date('F j, Y H:i:s');
															$regi_kasszalog=unserialize(mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["kasszalog"]);
															$regi_log_bejegzesek_szama=count($regi_kasszalog);
															if($regi_log_bejegzesek_szama >= 20){
																unset($regi_kasszalog[0]);
															}
															$bejegyzes=array(array($ido , $userid , $muvelet , $adakozott_kredit , $adakozott_terra));
															$osszevont= array_merge_recursive($regi_kasszalog , $bejegyzes);
															$uj_kasszalog= serialize($osszevont);
															mysqli_query ($conn , "UPDATE users SET kredit=kredit-$adakozott_kredit ,terra=terra-$adakozott_terra WHERE userid ='$userid' ");
															mysqli_query ($conn , "UPDATE szovetseg SET kassza='$up' , kasszalog='$uj_kasszalog' WHERE id ='$aktualis_szovetseg' ");
															Header("Location: szovetseg.php?kassza");
														}
													}elseif(!empty($hiba)){
														echo implode( "<br />" , $hiba );
													}
												}
												?>
												<tr>
													<td id="kassz_adakozas_td2a">Kredit: </td>
													<td id="kassza_adakozas_td3b">
														<input id="adakozas_input" type="number" name="adakozott_kredit" value="">
													</td>
												</tr>
												<tr>
													<td id="kassz_adakozas_td2c">Terra: </td>
													<td id="kassza_adakozas_td3b">
														<input id="adakozas_input" type="number" name="adakozott_terra" value="">
													</td>
												</tr>
												<tr>
													<td colspan="2" style="text-align:center;">
														<input style="cursor:pointer;"type="submit" name="adakozas" value="Adakozas">
													</td>
												</tr>
											</table>
										</form>
									</td>
								</tr>
							</table>
						</div>
						<div id="2" class='bloktartalom'>
							<table id="kassza_adakozas_table1">
								<tr>
									<td id="kassza_adakozas_td1">
										<table style="margin: 0px auto;">
											<tr>
												<td id="kassz_adakozas_td2a">Kredit: </td>
												<td id="kassza_adakozas_td2b">
													<?php echo number_format($szovetsegkassza[0]);?>
												</td>
											</tr>
											<tr>
												<td id="kassz_adakozas_td2c">Terra: </td>
												<td id="kassz_adakozas_td2d">
													<?php echo number_format($szovetsegkassza[1]);?>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="text-align:center;">
													<br>
													<div onclick="tablazat(event, '1')" id="elsodleges">
														<input style="cursor:pointer;"type="submit" name="kifizetes" value="Adakozas">
													</div>
												</td>
											</tr>
										</table>
									</td>
									<td id="kassz_adakozas_td3">
										<form method="post" action="">
											<table style="margin: 0px auto;">
												<?php
												if(isset($_POST["kifizetes"])){
													if(empty($_POST["kifizetett_kredit"]) and empty($_POST["kifizetett_terra"])){
														$hiba[] = "Add meg,hogy mit szeretnel adakozni!";
													}
													if(!empty($_POST["kifizetett_kredit"]) and $_POST["kifizetett_kredit"]>$szovetsegkassza[0]){
														$hiba[] = "Nem rendelkezel ennyi kredittel!";
													}
													if(!empty($_POST["kifizetett_terra"]) and $_POST["kifizetett_terra"]>$szovetsegkassza[1]){
														$hiba[] = "Nem rendelkezel ennyi terraval!";
													}
													$szovetseg_rang_jogosultsag=mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM szovetsegrangok WHERE id='$rangom_szovetseg'"))["kifizetes"];
													if($szovetseg_rang_jogosultsag != 1){
														$hiba[] = "Nincs jogosultsagod a kifizeteshez!";
													}
													$muvelet="Kifizetett";
													if(empty($hiba)){
														$kifizetett_tag_id=$_POST["kifizetett_tag"];
														if(!empty($_POST["kifizetett_kredit"]) and empty($_POST["kifizetett_terra"])){
															$kifizetett_kredit = $_POST["kifizetett_kredit"];
															$szovetsegkassza[0]=$szovetsegkassza[0]-$kifizetett_kredit;
															$up=serialize($szovetsegkassza);
															$ido=date('F j, Y H:i:s');
															$regi_kasszalog=unserialize(mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["kasszalog"]);
															$regi_log_bejegzesek_szama=count($regi_kasszalog);
															if($regi_log_bejegzesek_szama >= 20){
																unset($regi_kasszalog[0]);
															}
															$bejegyzes=array(array($ido , $kifizetett_tag_id , $muvelet , $kifizetett_kredit , 0 , $userid));
															$osszevont= array_merge_recursive($regi_kasszalog , $bejegyzes);
															$uj_kasszalog= serialize($osszevont);
															mysqli_query ($conn , "UPDATE users SET kredit=kredit+$kifizetett_kredit WHERE userid ='$kifizetett_tag_id' ");
															mysqli_query ($conn , "UPDATE szovetseg SET kassza='$up' , kasszalog='$uj_kasszalog' WHERE id ='$aktualis_szovetseg' ");
															Header("Location: szovetseg.php?kassza");
														}elseif(empty($_POST["kifizetett_kredit"]) and !empty($_POST["kifizetett_terra"])){
															$kifizetett_terra = $_POST["kifizetett_terra"];
															$szovetsegkassza[1]=$szovetsegkassza[1]-$kifizetett_terra;
															$up=serialize($szovetsegkassza);
															$ido=date('F j, Y H:i:s');
															$regi_kasszalog=unserialize(mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["kasszalog"]);
															$regi_log_bejegzesek_szama=count($regi_kasszalog);
															if($regi_log_bejegzesek_szama >= 20){
																unset($regi_kasszalog[0]);
															}
															$bejegyzes=array(array($ido , $kifizetett_tag_id , $muvelet , 0 , $kifizetett_terra , $userid));
															$osszevont= array_merge_recursive($regi_kasszalog , $bejegyzes);
															$uj_kasszalog= serialize($osszevont);
															mysqli_query ($conn , "UPDATE users SET terra=terra+$kifizetett_terra WHERE userid ='$kifizetett_tag_id' ");
															mysqli_query ($conn , "UPDATE szovetseg SET kassza='$up' , kasszalog='$uj_kasszalog' WHERE id ='$aktualis_szovetseg' ");
															Header("Location: szovetseg.php?kassza");
														}elseif(!empty($_POST["kifizetett_kredit"]) and !empty($_POST["kifizetett_terra"])){
															$kifizetett_kredit = $_POST["kifizetett_kredit"];
															$kifizetett_terra = $_POST["kifizetett_terra"];
															$szovetsegkassza[0]=$szovetsegkassza[0]-$kifizetett_kredit;
															$szovetsegkassza[1]=$szovetsegkassza[1]-$kifizetett_terra;
															$up=serialize($szovetsegkassza);
															$ido=date('F j, Y H:i:s');
															$regi_kasszalog=unserialize(mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["kasszalog"]);
															$regi_log_bejegzesek_szama=count($regi_kasszalog);
															if($regi_log_bejegzesek_szama >= 20){
																unset($regi_kasszalog[0]);
															}
															$bejegyzes=array(array($ido , $kifizetett_tag_id , $muvelet , $kifizetett_kredit , $kifizetett_terra , $userid));
															$osszevont= array_merge_recursive($regi_kasszalog , $bejegyzes);
															$uj_kasszalog= serialize($osszevont);
															mysqli_query ($conn , "UPDATE users SET kredit=kredit+$kifizetett_kredit ,terra=terra+$kifizetett_terra WHERE userid ='$kifizetett_tag_id' ");
															mysqli_query ($conn , "UPDATE szovetseg SET kassza='$up' , kasszalog='$uj_kasszalog' WHERE id ='$aktualis_szovetseg' ");
															Header("Location: szovetseg.php?kassza");
														}
													}elseif(!empty($hiba)){
														echo implode( "<br />" , $hiba );
													}
												}
												?>
												<tr>
													<td id="td_tag">Tag: </td>
													<td id="kassza_adakozas_td3b">
														<select id="tag_select_option" name="kifizetett_tag">
															<?php
															$tagok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["szovetsegtagok"]);
															$letszam=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["letszam"];
															for($sorszam=0;$sorszam<=$letszam;$sorszam++){
																$id=$tagok[$sorszam];
																$szovetsegtag_neve=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$id'"))["username"];
																echo "<option value='$id'>".$szovetsegtag_neve."</option>";
															}
															?>
														</select>
													</td>
												</tr>
												<tr>
													<td id="td_kredit">Kredit: </td>
													<td id="kassza_adakozas_td3b">
														<input id="adakozas_input" type="number" name="kifizetett_kredit" value="">
													</td>
												</tr>
												<tr>
													<td id="td_terra">Terra: </td>
													<td id="kassza_adakozas_td3b">
														<input id="adakozas_input" type="number" name="kifizetett_terra" value="">
													</td>
												</tr>
												<tr>
													<td colspan="2" style="text-align:center;">
														<input style="cursor:pointer;"type="submit" name="kifizetes" value="Kifizetes">
													</td>
												</tr>
											</table>
										</form>
									</td>
								</tr>
							</table>
						</div>
						<div style="width:770px;height:288px;color:white;border-style:inset;border-width:3px;border-radius: 10px 10px 10px 10px;border-color: rgb(38, 38, 38);margin:10px auto;">
							<table style="margin: 0px auto;">
								<tr>
									<td style='height: 25px;'>
										<table style='width:100%;border-style:outset;border-width:3px;border-radius: 10px 10px 10px 10px;border-color: rgb(38, 38, 38);color:white;'>
											<tr>
												<td style='width: 190px;'>Datum</td>
												<td style='width: 190px;'>Tag</td>
												<td style='width: 90px;'>Muvelet</td>
												<td style='width: 140px;'>Kredit</td>
												<td style='width: 140px;'>Terra</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
							<div style=" width:770px;height:250px;overflow: auto;">
							<table>
								<?php
									$kasszalog=unserialize(mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["kasszalog"]);
									$logbejegyzesek_szama=count($kasszalog);
									for($n=$logbejegyzesek_szama;$n>=1;$n--){
										$szam=$n-1;
										$kibontott_log=$kasszalog[$szam];
										$tag_neve=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$kibontott_log[1]'"))["username"];
										echo "<tr>
												<td>
													<table style='width:100%;border-style:outset;border-width:3px;border-radius: 10px 10px 10px 10px;border-color: rgb(38, 38, 38);color:white;'>
														<tr>
															<td style='width: 190px;height: 25px;'>".$kibontott_log[0]."</td>";
															if($kibontott_log[2] == "Adakozott"){
																echo "<td style='width: 190px;height: 25px;'>".$tag_neve."</td>";
															}elseif($kibontott_log[2] == "Kifizetett"){
																$kifizeto_neve=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$kibontott_log[5]'"))["username"];
																echo "<td style='width: 190px;height: 25px;'>".$kifizeto_neve." -> ".$tag_neve."</td>";
															}
													echo "<td style='width: 90px;height: 25px;'>".$kibontott_log[2]."</td>
														<td style='width: 140px;height: 25px;'>".number_format($kibontott_log[3])."</td>
														<td style='width: 140px;height: 25px;'>".number_format($kibontott_log[4])."</td>
														</tr>
													</table>
												</td>
										</tr>";
									}
								?>
							</table>
							</div>
						</div>
						<?php
					}elseif(isset($_GET["kuldetesek"])){
						echo "kuldetesek";
					}elseif(isset($_GET["bonuszok"])){
//*******************************************************************ELET***BONUSZ***FEJLESZTES*****************************************************
						if(isset($_POST["eletbonuszfejelsztes"])){
							if($_SESSION["szovetseg_kredite"] >= $_SESSION["eletbonuszar"]){
								for($szam=1;$szam<=$_SESSION["szovetsegletszam"];$szam++){
									$id=$szovetsegtagok[($szam-1)];
									$tag_stattok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$id'"))["stattok"]);
									$tag_hajoid=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$id'"))["aktivhajo"];
									$tag_burkolatertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$tag_hajoid'"))["burkolatertek"];
									$osszertek=0;
									for($i=1;$i<=5;$i++){
										$burkolat_szam="b".$i;
										$burkolat_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$id'"))["$burkolat_szam"];
										if($burkolat_slotszam_erteke != 0){
											$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$burkolat_slotszam_erteke'"))["burkolatertek"];
											$osszertek=$osszertek+$item_ertek;
										}
										$tag_stattok[1]=ceil($tag_stattok[0]+$osszertek+$tag_burkolatertek+($tag_stattok[0]+$osszertek+$tag_burkolatertek)*($_SESSION["eletbonusz"]/100));
									}
									$up=serialize($tag_stattok);
									mysqli_query($conn , "UPDATE users SET stattok='$up' WHERE userid='$id'");
								}
								$szovetsegkassza[0]=$szovetsegkassza[0]-$_SESSION["eletbonuszar"];
								$szovetsegbonuszok[0]++;
								$up1=serialize($szovetsegbonuszok);
								$up2=serialize($szovetsegkassza);
								mysqli_query ($conn , "UPDATE szovetseg SET bonuszok='$up1' , kassza='$up2' WHERE id='$aktualis_szovetseg'");
								Header ("Location: szovetseg.php?bonuszok");
							}else{
								echo "A fejleszteshez nem rendelkezik a szovetseg eleg kredittel.";
							}
						}
//*******************************************************************PAJZS***BONUSZ***FEJLESZTES*****************************************************
						if(isset($_POST["pajzsbonuszfejelsztes"])){
							if($_SESSION["szovetseg_kredite"] >= $_SESSION["pajzsbonuszar"]){
								for($szam=1;$szam<=$_SESSION["szovetsegletszam"];$szam++){
									$id=$szovetsegtagok[($szam-1)];
									$tag_stattok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$id'"))["stattok"]);
									$tag_hajoid=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$id'"))["aktivhajo"];
									$tag_pajzsertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$tag_hajoid'"))["pajzsertek"];
									$osszertek=0;
									for($i=1;$i<=5;$i++){
										$pajzs_szam="p".$i;
										$pajzs_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$id'"))["$pajzs_szam"];
										if($pajzs_slotszam_erteke != 0){
											$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$pajzs_slotszam_erteke'"))["pajzsertek"];
											$osszertek=$osszertek+$item_ertek;
										}
										$tag_stattok[3]=ceil($tag_stattok[2]+$osszertek+$tag_pajzsertek+($tag_stattok[2]+$osszertek+$tag_pajzsertek)*($_SESSION["pajzsbonusz"]/100));
									}
									$up=serialize($tag_stattok);
									mysqli_query($conn , "UPDATE users SET stattok='$up' WHERE userid='$id'");
								}
								$szovetsegkassza[0]=$szovetsegkassza[0]-$_SESSION["pajzsbonuszar"];
								$szovetsegbonuszok[1]++;
								$up1=serialize($szovetsegbonuszok);
								$up2=serialize($szovetsegkassza);
								mysqli_query ($conn , "UPDATE szovetseg SET bonuszok='$up1' , kassza='$up2' WHERE id='$aktualis_szovetseg'");
								Header ("Location: szovetseg.php?bonuszok");
							}else{
								echo "A fejleszteshez nem rendelkezik a szovetseg eleg kredittel.";
							}
						}
//*******************************************************************SEBZES***BONUSZ***FEJLESZTES***************************************************
						if(isset($_POST["sebzesbonuszfejelsztes"])){
							if($_SESSION["szovetseg_kredite"] >= $_SESSION["sebzesbonuszar"]){
								for($szam=1;$szam<=$_SESSION["szovetsegletszam"];$szam++){
									$id=$szovetsegtagok[($szam-1)];
									$tag_stattok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$id'"))["stattok"]);
									$tag_hajoid=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$id'"))["aktivhajo"];
									$tag_lezerertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$tag_hajoid'"))["lezerertek"];
									$osszertek=0;
									for($i=1;$i<=5;$i++){
										$lezer_szam="l".$i;
										$lezer_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$id'"))["$lezer_szam"];
										if($lezer_slotszam_erteke != 0){
											$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$lezer_slotszam_erteke'"))["lezerertek"];
											$osszertek=$osszertek+$item_ertek;
										}
										$tag_stattok[5]=ceil($tag_stattok[4]+$osszertek+$tag_lezerertek+($tag_stattok[4]+$osszertek+$tag_lezerertek)*($_SESSION["sebzesbonusz"]/100));
									}
									$up=serialize($tag_stattok);
									mysqli_query($conn , "UPDATE users SET stattok='$up' WHERE userid='$id'");
								}
								$szovetsegkassza[0]=$szovetsegkassza[0]-$_SESSION["sebzesbonuszar"];
								$szovetsegbonuszok[2]++;
								$up1=serialize($szovetsegbonuszok);
								$up2=serialize($szovetsegkassza);
								mysqli_query ($conn , "UPDATE szovetseg SET bonuszok='$up1' , kassza='$up2' WHERE id='$aktualis_szovetseg'");
								Header ("Location: szovetseg.php?bonuszok");
							}else{
								echo "A fejleszteshez nem rendelkezik a szovetseg eleg kredittel.";
							}
						}
//*******************************************************************SEBESSEG***BONUSZ***FEJLESZTES**************************************************
						if(isset($_POST["sebessegbonuszfejelsztes"])){
							if($_SESSION["szovetseg_kredite"] >= $_SESSION["sebessegbonuszar"]){
								for($szam=1;$szam<=$_SESSION["szovetsegletszam"];$szam++){
									$id=$szovetsegtagok[($szam-1)];
									$tag_stattok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$id'"))["stattok"]);
									$tag_hajoid=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$id'"))["aktivhajo"];
									$tag_meghajtoertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$tag_hajoid'"))["meghajtoertek"];
									$osszertek=0;
									for($i=1;$i<=5;$i++){
										$meghajto_szam="m".$i;
										$meghajto_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$id'"))["$meghajto_szam"];
										if($meghajto_slotszam_erteke != 0){
											$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$meghajto_slotszam_erteke'"))["meghajtoertek"];
											$osszertek=$osszertek+$item_ertek;
										}
										$tag_stattok[7]=ceil($tag_stattok[6]+$osszertek+$tag_meghajtoertek+($tag_stattok[6]+$osszertek+$tag_meghajtoertek)*($_SESSION["sebessegbonusz"]/100));
									}
									$up=serialize($tag_stattok);
									mysqli_query($conn , "UPDATE users SET stattok='$up' WHERE userid='$id'");
								}
								$szovetsegkassza[0]=$szovetsegkassza[0]-$_SESSION["sebessegbonuszar"];
								$szovetsegbonuszok[3]++;
								$up1=serialize($szovetsegbonuszok);
								$up2=serialize($szovetsegkassza);
								mysqli_query ($conn , "UPDATE szovetseg SET bonuszok='$up1' , kassza='$up2' WHERE id='$aktualis_szovetseg'");
								Header ("Location: szovetseg.php?bonuszok");
							}else{
								echo "A fejleszteshez nem rendelkezik a szovetseg eleg kredittel.";
							}
						}
//*******************************************************************GENERATOR***BONUSZ***FEJLESZTES************************************************
						if(isset($_POST["generatorbonuszfejelsztes"])){
							if($_SESSION["szovetseg_kredite"] >= $_SESSION["generatorbonuszar"]){
								for($szam=1;$szam<=$_SESSION["szovetsegletszam"];$szam++){
									$id=$szovetsegtagok[($szam-1)];
									$tag_stattok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$id'"))["stattok"]);
									$tag_hajoid=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$id'"))["aktivhajo"];
									$tag_generatorertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$tag_hajoid'"))["generatorertek"];
									$osszertek=0;
									for($i=1;$i<=5;$i++){
										$generator_szam="g".$i;
										$generator_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid='$id'"))["$generator_szam"];
										if($generator_slotszam_erteke != 0){
											$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$generator_slotszam_erteke'"))["generatorertek"];
											$osszertek=$osszertek+$item_ertek;
										}
										$tag_stattok[9]=ceil($tag_stattok[8]+$osszertek+$tag_generatorertek+($tag_stattok[8]+$osszertek+$tag_generatorertek)*($_SESSION["generatorbonusz"]/100));
									}
									$up=serialize($tag_stattok);
									mysqli_query($conn , "UPDATE users SET stattok='$up' WHERE userid='$id'");
								}
								$szovetsegkassza[0]=$szovetsegkassza[0]-$_SESSION["generatorbonuszar"];
								$szovetsegbonuszok[4]++;
								$up1=serialize($szovetsegbonuszok);
								$up2=serialize($szovetsegkassza);
								mysqli_query ($conn , "UPDATE szovetseg SET bonuszok='$up1' , kassza='$up2' WHERE id='$aktualis_szovetseg'");
								Header ("Location: szovetseg.php?bonuszok");
							}else{
								echo "A fejleszteshez nem rendelkezik a szovetseg eleg kredittel.";
							}
						}
						if(isset($_POST["letszambonuszfejelsztes"])){
							if($_SESSION["szovetseg_kredite"] >= $_SESSION["letszambonuszar"]){
								$fejlesztes_ara=$_SESSION["letszambonuszar"];
								$szovetsegbonuszok[5]++;
								$up=serialize($szovetsegbonuszok);
								mysqli_query ($conn , "UPDATE users SET kredit=kredit-$fejlesztes_ara  WHERE userid='$userid'");
								mysqli_query ($conn , "UPDATE szovetseg SET maxletszam=maxletszam+1,bonuszok='$up' WHERE id='$aktualis_szovetseg'");
								Header ("Location: szovetseg.php?bonuszok");
							}else{
								echo "A fejleszteshez nem rendelkezik a szovetseg eleg kredittel.";
							}
						}
						?>
						<table style="border-width: 6px;width:760px;height:506px;margin:0 auto;">
							<tr>
								<td>
									<table id="bonuszdoboz">
										<tr>
											<td>
												<table id="bonuszdoboztable">
													<tr>
														<td style="height: 30px;border-style: inset;border-width:1px;border-color:white;text-align:center;color:green;background-color:white;">ELETERO</td>
													</tr>
													<tr>
														<td>Szint: <?php echo $_SESSION["eletbonuszszint"]; ?>. bonusz: <?php echo $_SESSION["eletbonuszszint"]*0.2 ."%"; ?></td>
													</tr>
													<tr>
														<td>Szint <?php echo $_SESSION["eletbonuszszint"]+1; ?>. bonusz: <?php echo ($_SESSION["eletbonuszszint"]+1)*0.2 . "%"; ?></td>
													</tr>
													<tr>
														<td>Fejlesztes ara: <?php echo number_format($_SESSION["eletbonuszar"]); ?> kredit.</td>
													</tr>
													<tr>
														<td>
															<form method="post" action="">
																<input style="cursor:pointer;" type="submit" name="eletbonuszfejelsztes" value="Fejlesztes">
															</form>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td>
									<table id="bonuszdoboz">
										<tr>
											<td>
												<table id="bonuszdoboztable">
													<tr>
														<td style="height: 30px;border-style: inset;border-width:1px;border-color:white;text-align:center;color:#5EA6CF;background-color:white;">PAJZS</td>
													</tr>
													<tr>
														<td>Szint: <?php echo $_SESSION["pajzsbonuszszint"]; ?>. bonusz: <?php echo $_SESSION["pajzsbonuszszint"]*0.2 ."%"; ?></td>
													</tr>
													<tr>
														<td>Szint <?php echo $_SESSION["pajzsbonuszszint"]+1; ?>. bonusz: <?php echo ($_SESSION["pajzsbonuszszint"]+1)*0.2 . "%"; ?></td>
													</tr>
													<tr>
														<td>Fejlesztes ara: <?php echo number_format($_SESSION["pajzsbonuszar"]); ?> kredit.</td>
													</tr>
													<tr>
														<td>
															<form method="post" action="">
																<input style="cursor:pointer;" type="submit" name="pajzsbonuszfejelsztes" value="Fejlesztes">
															</form>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td>
									<table id="bonuszdoboz">
										<tr>
											<td>
												<table id="bonuszdoboztable">
													<tr>
														<td style="height: 30px;border-style: inset;border-width:1px;border-color:white;text-align:center;color:#F52731;background-color:white;">SEBZES</td>
													</tr>
													<tr>
														<td>Szint: <?php echo $_SESSION["sebzesbonuszszint"]; ?>. bonusz: <?php echo $_SESSION["sebzesbonuszszint"]*0.2 ."%"; ?></td>
													</tr>
													<tr>
														<td>Szint <?php echo $_SESSION["sebzesbonuszszint"]+1; ?>. bonusz: <?php echo ($_SESSION["sebzesbonuszszint"]+1)*0.2 . "%"; ?></td>
													</tr>
													<tr>
														<td>Fejlesztes ara: <?php echo number_format($_SESSION["sebzesbonuszar"]); ?> kredit.</td>
													</tr>
													<tr>
														<td>
															<form method="post" action="">
																<input style="cursor:pointer;" type="submit" name="sebzesbonuszfejelsztes" value="Fejlesztes">
															</form>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table id="bonuszdoboz">
										<tr>
											<td>
												<table id="bonuszdoboztable">
													<tr>
														<td style="height: 30px;border-style: inset;border-width:1px;border-color:white;text-align:center;color:#923005;background-color:white;">SEBESSEG</td>
													</tr>
													<tr>
														<td>Szint: <?php echo $_SESSION["sebessegbonuszszint"]; ?>. bonusz: <?php echo $_SESSION["sebessegbonuszszint"]*0.2 ."%"; ?></td>
													</tr>
													<tr>
														<td>Szint <?php echo $_SESSION["sebessegbonuszszint"]+1; ?>. bonusz: <?php echo ($_SESSION["sebessegbonuszszint"]+1)*0.2 . "%"; ?></td>
													</tr>
													<tr>
														<td>Fejlesztes ara: <?php echo number_format($_SESSION["sebessegbonuszar"]); ?> kredit.</td>
													</tr>
													<tr>
														<td>
															<form method="post" action="">
																<input style="cursor:pointer;" type="submit" name="sebessegbonuszfejelsztes" value="Fejlesztes">
															</form>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td>
									<table id="bonuszdoboz">
										<tr>
											<td>
												<table id="bonuszdoboztable">
													<tr>
														<td style="height: 30px;border-style: inset;border-width:1px;border-color:white;text-align:center;color:darkorange;background-color:white;">ENERGIA</td>
													</tr>
													<tr>
														<td>Szint: <?php echo $_SESSION["generatorbonuszszint"]; ?>. bonusz: <?php echo $_SESSION["generatorbonuszszint"]*0.2 ."%"; ?></td>
													</tr>
													<tr>
														<td>Szint <?php echo $_SESSION["generatorbonuszszint"]+1; ?>. bonusz: <?php echo ($_SESSION["generatorbonuszszint"]+1)*0.2 . "%"; ?></td>
													</tr>
													<tr>
														<td>Fejlesztes ara: <?php echo number_format($_SESSION["generatorbonuszar"]); ?> kredit.</td>
													</tr>
													<tr>
														<td>
															<form method="post" action="">
																<input style="cursor:pointer;" type="submit" name="generatorbonuszfejelsztes" value="Fejlesztes">
															<form>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td>
									<table id="bonuszdoboz">
										<tr>
											<td>
												<table id="bonuszdoboztable">
													<tr>
														<td style="height: 30px;border-style: inset;border-width:1px;border-color:white;text-align:center;color:black;background-color:white;">LETSZAM</td>
													</tr>
													<tr>
														<td>Szint: <?php echo $_SESSION["letszambonuszszint"]; ?>. bonusz: <?php echo $_SESSION["letszambonuszszint"]+10 ." tag"; ?></td>
													</tr>
													<tr>
														<td>Szint <?php echo $_SESSION["letszambonuszszint"]+1; ?>. bonusz: <?php echo ($_SESSION["letszambonuszszint"]+1)+10 . " tag"; ?></td>
													</tr>
													<tr>
														<td>Fejlesztes ara: <?php echo number_format($_SESSION["letszambonuszar"]); ?> kredit.</td>
													</tr>
													<tr>
														<td>
															<form method="post" action="">
																<input style="cursor:pointer;" type="submit" name="letszambonuszfejelsztes" value="Fejlesztes">
															<form>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<?php
					}elseif(isset($_GET["diplomacia"])){
						echo "diplomacia";
					}
					?>
				</td>
				<td style="width:315px;border-width:3px;border-style:inset;border-color: rgb(38, 38, 38);border-radius 10px 10px 10px 10px;">
					<a>Aktualis kuldetesek</a>
				</td>
			</tr>
		</table>
		<?php } ?>
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
document.getElementById("elsodleges").click();
</script>
</body>