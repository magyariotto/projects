<?php
include "megtekintesvedelem.php";
include "header.php";
include "frissites.php";
$csik_stattok=array($_SESSION["elet"],$_SESSION["pajzs"],$_SESSION["sebzes"],$_SESSION["sebesseg"],$_SESSION["generator"]);
$burkolatfejlesztesara = pow($_SESSION["eletszint"] , 2);
$pajzsfejlesztesara = pow($_SESSION["pajzsszint"] , 2);
$sebzesfejlesztesara = pow($_SESSION["sebzesszint"] , 2);
$sebessegfejlesztesara = pow($_SESSION["sebessegszint"] , 2);
$generatorfejlesztesara = pow($_SESSION["generatorszint"] , 2);
if (isset($_POST["eletfejlesztes"])){
	if($_SESSION["kredit"] >= $burkolatfejlesztesara){
		$stattok[0]++;
		$osszertek=0;
		for($i=1;$i<=5;$i++){
			$burkolat_szam="b".$i;
			$burkolat_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$burkolat_szam"];
			if($burkolat_slotszam_erteke != 0){
				$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$burkolat_slotszam_erteke"))["burkolatertek"];
				$osszertek=$osszertek+$item_ertek;
			}
			$stattok[1]=ceil($stattok[0]+$osszertek+$_SESSION["burkolatertek"]+($stattok[0]+$osszertek+$_SESSION["burkolatertek"])*($_SESSION["eletbonusz"]/100));
		}
		$up=serialize($stattok);
		mysqli_query ($conn , "UPDATE users SET stattok='$up' , kredit=kredit-$burkolatfejlesztesara , fejlesztesszint=fejlesztesszint+1 WHERE userid ='$userid' ");
		header("Location: index.php");
	}else{
		echo "<h3 align='center' style='color: white;'>"."Nincs elég kredited!"."</h3>";
	}
}
if (isset($_POST["pajzsfejlesztes"])){
	if($_SESSION["kredit"] >= $pajzsfejlesztesara){
		$stattok[2]++;
		$osszertek=0;
		for($i=1;$i<=5;$i++){
			$pajzs_szam="p".$i;
			$pajzs_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$pajzs_szam"];
			if($pajzs_slotszam_erteke != 0){
				$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$pajzs_slotszam_erteke"))["pajzsertek"];
				$osszertek=$osszertek+$item_ertek;
			}
			$stattok[3]=ceil($stattok[2]+$osszertek+$_SESSION["pajzsertek"]+($stattok[2]+$osszertek+$_SESSION["pajzsertek"])*($_SESSION["pajzsbonusz"]/100));
		}
		$up=serialize($stattok);
		mysqli_query ($conn , "UPDATE users SET stattok='$up' , kredit=kredit-$pajzsfejlesztesara , fejlesztesszint=fejlesztesszint+1 WHERE userid ='$userid' ");
		header("Location: index.php");
	}else{
		echo "<h3 align='center' style='color: white;'>"."Nincs elég kredited!"."</h3>";
	}
}
if (isset($_POST["sebzesfejlesztes"])){
	if($_SESSION["kredit"] >= $sebzesfejlesztesara){
		$stattok[4]++;
		$osszertek=0;
		for($i=1;$i<=5;$i++){
			$lezer_szam="l".$i;
			$lezer_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$lezer_szam"];
			if($lezer_slotszam_erteke != 0){
				$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$lezer_slotszam_erteke"))["lezerertek"];
				$osszertek=$osszertek+$item_ertek;
			}
			$stattok[5]=ceil($stattok[4]+$osszertek+$_SESSION["lezerertek"]+($stattok[4]+$osszertek+$_SESSION["lezerertek"])*($_SESSION["sebzesbonusz"]/100));
		}
		$up=serialize($stattok);
		mysqli_query ($conn , "UPDATE users SET stattok='$up' , kredit=kredit-$sebzesfejlesztesara , fejlesztesszint=fejlesztesszint+1 WHERE userid ='$userid' ");
		header("Location: index.php");
	}else{
		echo "<h3 align='center' style='color: white;'>"."Nincs elég kredited!"."</h3>";
	}
}
if (isset($_POST["sebessegfejlesztes"])){
	if($_SESSION["kredit"] >= $sebessegfejlesztesara){
		$stattok[6]++;
		$osszertek=0;
		for($i=1;$i<=5;$i++){
			$meghajto_szam="m".$i;
			$meghajto_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$meghajto_szam"];
			if($meghajto_slotszam_erteke != 0){
				$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$meghajto_slotszam_erteke"))["meghajtoertek"];
				$osszertek=$osszertek+$item_ertek;
			}
			$stattok[7]=ceil($stattok[6]+$osszertek+$_SESSION["meghajtoertek"]+($stattok[6]+$osszertek+$_SESSION["meghajtoertek"])*($_SESSION["sebessegbonusz"]/100));
		}
		$up=serialize($stattok);
		mysqli_query ($conn , "UPDATE users SET stattok='$up' , kredit=kredit-$sebessegfejlesztesara , fejlesztesszint=fejlesztesszint+1 WHERE userid ='$userid' ");
		header("Location: index.php");
	}else{
		echo "<h3 align='center' style='color: white;'>"."Nincs elég kredited!"."</h3>";
	}
}
if (isset($_POST["generatorfejlesztes"])){
	if($_SESSION["kredit"] >= $generatorfejlesztesara){
		$stattok[8]++;
		$osszertek=0;
		for($i=1;$i<=5;$i++){
			$generator_szam="g".$i;
			$generator_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$generator_szam"];
			if($generator_slotszam_erteke != 0){
				$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$generator_slotszam_erteke"))["generatorertek"];
				$osszertek=$osszertek+$item_ertek;
			}
			$stattok[9]=ceil($stattok[8]+$osszertek+$_SESSION["generatorertek"]+($stattok[8]+$osszertek+$_SESSION["generatorertek"])*($_SESSION["generatorbonusz"]/100));
		}
		$up=serialize($stattok);
		mysqli_query ($conn , "UPDATE users SET stattok='$up' , kredit=kredit-$generatorfejlesztesara , fejlesztesszint=fejlesztesszint+1 WHERE userid ='$userid' ");
		header("Location: index.php");
	}else{
		echo "<h3 align='center' style='color: white;'>"."Nincs elég kredited!"."</h3>";
	}
}
for($szam=1; $szam <=5; $szam++){
	if(isset($_POST["submit_lezer$szam"])){
		mysqli_query($conn , "UPDATE felszereles SET slot_lezer='a$szam' WHERE id='$userid'");
		$ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM uzlet_lezerek WHERE id=$szam"))["ertek"];
		mysqli_query($conn , "UPDATE users SET sebzes=sebzesszint+$ertek WHERE userid='$userid'");
		header("Location: index.php");
	}
}
for($szam=1; $szam <=5; $szam++){
	if(isset($_POST["submit_pajzs$szam"])){
		mysqli_query($conn , "UPDATE felszereles SET slot_pajzs='b$szam' WHERE id='$userid'");
		$ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM uzlet_pajzsok WHERE id=$szam"))["ertek"];
		mysqli_query($conn , "UPDATE users SET pajzs=pajzsszint+$ertek WHERE userid='$userid'");
		header("Location: index.php");
	}
}
for($szam=1; $szam <=5; $szam++){
	if(isset($_POST["submit_meghajto$szam"])){
		mysqli_query($conn , "UPDATE felszereles SET slot_meghajto='c$szam' WHERE id='$userid'");
		$ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM uzlet_meghajtok WHERE id=$szam"))["ertek"];
		mysqli_query($conn , "UPDATE users SET sebesseg=sebessegszint+$ertek WHERE userid='$userid'");
		header("Location: index.php");
	}
}
for($szam=1; $szam <=5; $szam++){
	if(isset($_POST["submit_generator$szam"])){
		mysqli_query($conn , "UPDATE felszereles SET slot_generator='d$szam' WHERE id='$userid'");
		$ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM uzlet_generatorok WHERE id=$szam"))["ertek"];
		mysqli_query($conn , "UPDATE users SET generator=generatorszint+$ertek WHERE userid='$userid'");
		header("Location: index.php");
	}
}
for($szam=1; $szam <=5; $szam++){
	if(isset($_POST["submit_burkolat$szam"])){
		mysqli_query($conn , "UPDATE felszereles SET slot_burkolat='e$szam' WHERE id='$userid'");
		$ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM uzlet_burkolatok WHERE id=$szam"))["ertek"];
		mysqli_query($conn , "UPDATE users SET elet=eletszint+$ertek WHERE userid='$userid'");
		header("Location: index.php");
	}
}
?>
<title>Kezdolap</title>
<link rel="stylesheet" href="../css/kezdolap.css">
<style>
.aktualis_elet{
	height:10px;
	width:<?php echo round(($_SESSION["elet"]/max($csik_stattok)) * 100,1);?>%;
	border-right:solid 1px;
	background-color:rgb(153, 204, 255);
}
.aktualis_pajzs{
	height:10px;
	width:<?php echo round(($_SESSION["pajzs"]/max($csik_stattok)) * 100,1);?>%;
	border-right:solid 1px;
	background-color:rgb(153, 204, 255);
}
.aktualis_sebzes{
	height:10px;
	width:<?php echo round(($_SESSION["sebzes"]/max($csik_stattok)) * 100,1);?>%;
	border-right:solid 1px;
	background-color:rgb(153, 204, 255);
}
.aktualis_sebesseg{
	height:10px;
	width:<?php echo round(($_SESSION["sebesseg"]/max($csik_stattok)) * 100,1);?>%;
	border-right:solid 1px;
	background-color:rgb(153, 204, 255);
}
.aktualis_generator{
	height:10px;
	width:<?php echo round(($_SESSION["generator"]/max($csik_stattok)) * 100,1);?>%;
	border-right:solid 1px;
	background-color:rgb(153, 204, 255);
}
</style>
<body>
<div id="kozep_div1">
	<table id="home_tabla1">
		<tr>
			<td id="home_td">
				<table id="home_tabla2">
					<tr style="height:15px;">
						<td>Szint</td>
						<td colspan="2" align="center"><?php echo $_SESSION["szint"];?></td>
					</tr>
					<tr style="height:15px;">
						<td>Eletero</td>
						<td>
							<table>
								<tr>
									<td>
										<div class="szallag">
											<div class="aktualis_elet"></div>
										</div>
									</td>
									<td>
										<a style='color:white;'><?php echo $_SESSION["elet"]; ?></a>
									</td>
								</tr>
							</table>
						</td>
						<td>
						<form method='post' style="display:inline">
							<a><?php echo $burkolatfejlesztesara;?><input type="submit" name="eletfejlesztes" value="" style="background-image: url('../img/plus.png'); background-color: transparent;width:22px;margin: 0 0 0 5px;" title="Fejlesztes"></a>
						</form>
						</td>
					</tr>
					<tr style="height:15px;">
						<td>Pajzs</td>
						<td>
							<table>
								<tr>
									<td>
										<div class="szallag">
											<div class="aktualis_pajzs"></div>
										</div>
									</td>
									<td>
										<a style='color:white;'><?php echo $_SESSION["pajzs"]; ?></a>
									</td>
								</tr>
							</table>
						</td>
						<td>
						<form method='post' style="display:inline">
							<a><?php echo $pajzsfejlesztesara;?><input type="submit" name="pajzsfejlesztes" value="" style="background-image: url('../img/plus.png'); background-color: transparent;width:22px;margin: 0 0 0 5px;" title="Fejlesztes"></a>
						</form>
						</td>
					</tr>
					<tr style="height:15px;">
						<td>Sebzes</td>
						<td>
							<table>
								<tr>
									<td>
										<div class="szallag">
											<div class="aktualis_sebzes"></div>
										</div>
									</td>
									<td>
										<a style='color:white;'><?php echo $_SESSION["sebzes"]; ?></a>
									</td>
								</tr>
							</table>
						</td>
						<td>
						<form method='post' style="display:inline">
							<a><?php echo $sebzesfejlesztesara;?><input type="submit" name="sebzesfejlesztes" value="" style="background-image: url('../img/plus.png'); background-color: transparent;width:22px;margin: 0 0 0 5px;" title="Fejlesztes"></a>
						</form>
						</td>
					</tr>
					<tr style="height:15px;">
						<td>Sebesseg</td>
						<td>
							<table>
								<tr>
									<td>
										<div class="szallag">
											<div class="aktualis_sebesseg"></div>
										</div>
									</td>
									<td>
										<a style='color:white;'><?php echo $_SESSION["sebesseg"]; ?></a>
									</td>
								</tr>
							</table>
						</td>
						<td>
						<form method='post' style="display:inline">
							<a><?php echo $sebessegfejlesztesara;?><input type="submit" name="sebessegfejlesztes" value="" style="background-image: url('../img/plus.png'); background-color: transparent;width:22px;margin: 0 0 0 5px;" title="Fejlesztes"></a>
						</form>
						</td>
					</tr>
					<tr style="height:15px;">
						<td>Generator</td>
						<td>
							<table>
								<tr>
									<td>
										<div class="szallag">
											<div class="aktualis_generator"></div>
										</div>
									</td>
									<td>
										<a style='color:white;'><?php echo $_SESSION["generator"]; ?></a>
									</td>
								</tr>
							</table>
						</td>
						<td>
						<form method='post' style="display:inline">
							<a><?php echo $generatorfejlesztesara;?><input type="submit" name="generatorfejlesztes" value="" style="background-image: url('../img/plus.png'); background-color: transparent;width:22px;margin: 0 0 0 5px;" title="Fejlesztes"></a>
						</form>
						</td>
					</tr>
					<tr style="height:15px;">
						<td>Tapasztalat</td>
						<td>
							<style>
							.aktualis_tapasztalatpont{
								height:10px;
								width:<?php echo round(($_SESSION["tapasztalat"]/$_SESSION["kovetkezo_szint_ossztp"]) * 100,1);?>%;
								border-right:solid 1px;
								background-color:rgb(153, 204, 255);
							}
							</style>
							<div class="szallag">
								<div class="aktualis_tapasztalatpont"></div>
							</div>
						</td>
					</tr>
				</table>
			</td>
			<td id="home_td">
				<table id="home_tabla3">
					<tr>
						<td id="bazis_fejlec">
							<table>
								<tr>
									<td id="bazis_fejlec_td1">
										<?php 
										$aktivbazis=$_SESSION["aktivbazis"];
										$aktivbazisneve=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM uzlet WHERE azonosito=$aktivbazis"))["megnevezes"];
										?>
										<div onclick="tablazat(event, '1')" id="elsodleges" style="cursor: pointer;">
											<?php
											echo $aktivbazisneve;
											?>
										</div>
									</td>
									<td id="bazis_fejlec_td2" onclick="tablazat(event, 'bazisvaltas')" style="cursor: pointer;">Bázis váltás</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td id="bazis_menu">
							<table>
								<?php 
								$maxbszam=$_SESSION["burkolatslotszam"];
								$maxpszam=$_SESSION["pajzsslotszam"];
								$maxlszam=$_SESSION["lezerslotszam"];
								$maxmszam=$_SESSION["meghajtoslotszam"];
								$maxgszam=$_SESSION["generatorslotszam"];
								?>
								<tr>
									<td id="elemektd">
										<table>
											<tr>
												<td id="megnevezestd">Burkolatok:</td>
												<?php
												for($bszam=1; $bszam <= $maxbszam; $bszam++){
												?>
												<td>
													<div class='hexagon' onclick="tablazat(event, 'b<?php echo $bszam;?>')">
														<div style='z-index: 1;'>
															<?php
															$adottslot=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["b".$bszam];
															if($adottslot != 0){
																echo "<a style='color:green;'>".$adottslot."</a>";
															}elseif($adottslot == 0){
																echo "<a style='color:gray;'>B".$bszam."</a>";
															}
															?>
														</div>
													</div>
												</td>
												<?php } ?>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td id="elemektd">
										<table>
											<tr>
												<td id="megnevezestd">Pajzsok:</td>
												<?php
												for($pszam=1; $pszam <= $maxpszam; $pszam++){
												?>
												<td>
													<div class='hexagon' onclick="tablazat(event, 'p<?php echo $pszam;?>')">
														<div style='z-index: 1;'>
															<?php
															$adottslot=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["p".$pszam];
															if($adottslot != 0){
																echo "<a style='color:#5EA6CF;'>".$adottslot."</a>";
															}elseif($adottslot == 0){
																echo "<a style='color:gray;'>P".$pszam."</a>";
															}
															?>
														</div>
													</div>
												</td>
												<?php } ?>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td id="elemektd">
										<table>
											<tr>
												<td id="megnevezestd">Lezerek:</td>
												<?php
												for($lszam=1; $lszam <= $maxlszam; $lszam++){
												?>
												<td>
													<div class='hexagon' onclick="tablazat(event, 'l<?php echo $lszam;?>')">
														<div style='z-index: 1;'>
															<?php
															$adottslot=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["l".$lszam];
															if($adottslot != 0){
																echo "<a style='color:#F52731;'>".$adottslot."</a>";
															}elseif($adottslot == 0){
																echo "<a style='color:gray;'>L".$lszam."</a>";
															}
															?>
														</div>
													</div>
												</td>
												<?php } ?>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td id="elemektd">
										<table>
											<tr>
												<td id="megnevezestd">Meghajtok:</td>
												<?php
												for($mszam=1; $mszam <= $maxmszam; $mszam++){
												?>
												<td>
													<div class='hexagon' onclick="tablazat(event, 'm<?php echo $mszam;?>')">
														<div style='z-index: 1;'>
															<?php
															$adottslot=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["m".$mszam];
															if($adottslot != 0){
																echo "<a style='color:#923005;'>".$adottslot."</a>";
															}elseif($adottslot == 0){
																echo "<a style='color:gray;'>M".$mszam."</a>";
															}
															?>
														</div>
													</div>
												</td>
												<?php } ?>
											</tr>
										</table>
									</td>
								</tr>
								<tr>
									<td id="elemektd">
										<table>
											<tr>
												<td id="megnevezestd">Generatorok:</td>
												<?php
												for($gszam=1; $gszam <= $maxgszam; $gszam++){
												?>
												<td>
													<div class='hexagon' onclick="tablazat(event, 'g<?php echo $gszam;?>')">
														<div style='z-index: 1;'>
															<?php
															$adottslot=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["g".$gszam];
															if($adottslot != 0){
																echo "<a style='color:#D7D131;'>".$adottslot."</a>";
															}elseif($adottslot == 0){
																echo "<a style='color:gray;'>G".$gszam."</a>";
															}
															?>
														</div>
													</div>
												</td>
												<?php } ?>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
			<td id="home_td">
				<table id="home_tabla4">
					<tr>
						<td id="home_td3" colspan="5">
							<div id="targyak">
								<div id="999" class="bloktartalom">
									<form method='post'>
										<table border=1 style='width: 96%; margin: 0 auto;'>
										</table>
									</form>
								</div>
								<div id="1" class="bloktartalom">
									<a style="color:red;">FEJLESZTES ALATT</a>
									<table>
										<tr>
											<td>ossztp</td>
											<td><?php echo $_SESSION["ossztp"];?></td>
										</tr>
										<tr>
											<td>altp</td>
											<td><?php echo $_SESSION["altp"];?></td>
										</tr>
										<tr>
											<td>kovi altp:</td>
											<td><?php echo $_SESSION["kovetkezo_szint_altp"];?></td>
										</tr>
									</table>
								</div>
								<?php /************************************Bázisváltás*****************Kijelzo*******************************************************/ ?>
								<div id="bazisvaltas" class="bloktartalom">
									<table id="targy">
										<tr>
											<td id="td_kep"></td>
											<td>
												<table id="nagytabla">
													<tr>
														<td>
															<table id="kicsitabla1">
																<tr>
																	<td>Bazis id:<?php echo $aktivbazis; ?></td>
																	<td>Hasznalatban</td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td>
															<table id="kicsitabla2">
																<tr>
																	<td>Leiras</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
									<?php
									for($szam=1; $szam<=10; $szam++){
										$bazis_burkolaterteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$szam"))["burkolatertek"];
										$bazis_pajzserteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$szam"))["pajzsertek"];
										$bazis_lezererteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$szam"))["lezerertek"];
										$bazis_meghajtoerteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$szam"))["meghajtoertek"];
										$bazis_generatorerteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$szam"))["generatorertek"];
										$valtasgombid = "valtas".$szam;
										if(isset($_POST["$valtasgombid"])){
											$stattok[1]=ceil(($stattok[0]+$bazis_burkolaterteke)+(($stattok[0]+$bazis_burkolaterteke)*$_SESSION["eletbonusz"]/100));
											$stattok[3]=ceil(($stattok[2]+$bazis_pajzserteke)+(($stattok[2]+$bazis_pajzserteke)*$_SESSION["pajzsbonusz"]/100));
											$stattok[5]=ceil(($stattok[4]+$bazis_lezererteke)+(($stattok[4]+$bazis_lezererteke)*$_SESSION["sebzesbonusz"]/100));
											$stattok[7]=ceil(($stattok[6]+$bazis_meghajtoerteke)+(($stattok[6]+$bazis_meghajtoerteke)*$_SESSION["sebessegbonusz"]/100));
											$stattok[9]=ceil(($stattok[8]+$bazis_generatorerteke)+(($stattok[8]+$bazis_generatorerteke)*$_SESSION["generatorbonusz"]/100));
											$up=serialize($stattok);
											mysqli_query($conn , "UPDATE felszerelesem SET bazis=$szam,b1=0,b2=0,b3=0,b4=0,b5=0,p1=0,p2=0,p3=0,p4=0,p5=0,l1=0,l2=0,l3=0,l4=0,l5=0,m1=0,m2=0,m3=0,m4=0,m5=0,g1=0,g2=0,g3=0,g4=0,g5=0 WHERE userid=$userid");
											mysqli_query($conn , "UPDATE users SET aktivbazis=$szam,stattok='$up' WHERE userid=$userid");
											header("Location: index.php");
										}
									}
									for($szam=1; $szam <= 10; $szam++){
										if($szam != $aktivbazis){
											$lekeres = mysqli_query($conn , "SELECT * from targyaim WHERE (item$szam> 0) and (id=$userid)");
											while($row = mysqli_fetch_object($lekeres)){
										?>
										<table id="targy">
											<tr>
												<td id="td_kep"></td>
												<td>
													<table id="nagytabla">
														<tr>
															<td>
																<table id="kicsitabla1">
																	<tr>
																		<td>Targy:<?php echo $szam;?></td>
																		<td></td>
																	</tr>
																</table>
															</td>
														</tr>
														<tr>
															<td>
																<table id="kicsitabla2">
																	<tr>
																		<td>Leiras</td>
																		<td>
																			<form action="index.php" method="post">
																			<?php $valtasgombid = "valtas".$szam; ?>
																				<input name="<?php echo $valtasgombid;?>" type="submit" value="Valtas">
																			</form>
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									<?php }}} ?>
								</div>
								<?php
								/************************************BURKOLAT*****************Kijelzo*******************************************************/
								for($bszam=1; $bszam <= $maxbszam; $bszam++){
									$b_szam="b".$bszam;
									$burkolat_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$b_szam"];
									$elozo_item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$burkolat_slotszam_erteke'"))["burkolatertek"];
									for($szam=11; $szam<=20; $szam++){
										$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$szam"))["burkolatertek"];
										$felszerelgombid= "b".$bszam."felszerel".$szam;
										if(isset($_POST["$felszerelgombid"])){
											mysqli_query($conn , "UPDATE felszerelesem SET $b_szam=$szam WHERE userid=$userid");
											$osszertek=0;
											for($i=1;$i<=5;$i++){
												$burkolat_szam="b".$i;
												$burkolat_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$burkolat_szam"];
												if($burkolat_slotszam_erteke != 0){
													$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$burkolat_slotszam_erteke"))["burkolatertek"];
													$osszertek=$osszertek+$item_ertek;
												}
												$stattok[1]=ceil($stattok[0]+$osszertek+$_SESSION["burkolatertek"]+($stattok[0]+$osszertek+$_SESSION["burkolatertek"])*($_SESSION["eletbonusz"]/100));
											}
											$up=serialize($stattok);
											mysqli_query($conn , "UPDATE users SET stattok='$up' WHERE userid=$userid");
											header("Location: index.php");
										}
									}
								?>
								<div id='b<?php echo $bszam;?>' class='bloktartalom'>
									<form method='post'>
										<?php
										echo "Burkolathely:".$bszam;
										for($szam=11; $szam <= 20; $szam++){
										$lekeres = mysqli_query($conn , "SELECT * from targyaim WHERE (item$szam> 0) and (id=$userid)");
										while($row = mysqli_fetch_object($lekeres)){
										$itemszam=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyaim WHERE id=$userid"))["item$szam"];
										if($_SESSION["b".$bszam] == $szam){
											?>
											<table id="targy">
												<tr>
													<td id="td_kep"></td>
													<td>
														<table id="nagytabla">
															<tr>
																<td>
																	<table id="kicsitabla1">
																		<tr>
																			<td>Targy:<?php echo $szam; ?></td>
																			<td><?php echo $itemszam-$burkolat_targyak_elofordulasimerteke[$szam];?> db</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr>
																<td>
																	<table id="kicsitabla2">
																		<tr>
																			<td>Leiras</td>
																			<td>Aktiv</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
											<?php
										}elseif($_SESSION["b".$bszam] != $szam){
											if(empty($burkolat_targyak_elofordulasimerteke[$szam]) and !isset($burkolat_targyak_elofordulasimerteke[$szam])){
												$burkolat_targyak_elofordulasimerteke[$szam] = 0;
											}
											if($burkolat_targyak_elofordulasimerteke[$szam] < $itemszam){
										?>
										<table id="targy">
												<tr>
													<td id="td_kep"></td>
													<td>
														<table id="nagytabla">
															<tr>
																<td>
																	<table id="kicsitabla1">
																		<tr>
																			<td>Targy:<?php echo $szam; ?></td>
																			<td><?php echo $itemszam-$burkolat_targyak_elofordulasimerteke[$szam];?> db</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr>
																<td>
																	<table id="kicsitabla2">
																		<tr>
																			<td>Leiras</td>
																			<td>
																				<form action="index.php" method="post">
																				<?php $felszerelgombid= "b".$bszam."felszerel".$szam; ?>
																					<input name="<?php echo $felszerelgombid;?>" type="submit" value="Felszerel">
																				</form>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										<?php }}}} ?>
									</form>
								</div>
								<?php }
								/************************************PAJZS*****************Kijelzo*******************************************************/
								for($pszam=1; $pszam <= $maxpszam; $pszam++){
									$p_szam="p".$pszam;
									$pajzs_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$p_szam"];
									$elozo_item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$pajzs_slotszam_erteke'"))["pajzsertek"];
									for($szam=21; $szam<=30; $szam++){
										$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$szam"))["pajzsertek"];
										$felszerelgombid= "p".$pszam."felszerel".$szam;
										if(isset($_POST["$felszerelgombid"])){
											mysqli_query($conn , "UPDATE felszerelesem SET $p_szam=$szam WHERE userid=$userid");
											$osszertek=0;
											for($i=1;$i<=5;$i++){
												$pajzs_szam="p".$i;
												$pajzs_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$pajzs_szam"];
												if($pajzs_slotszam_erteke != 0){
													$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$pajzs_slotszam_erteke"))["pajzsertek"];
													$osszertek=$osszertek+$item_ertek;
												}
												$stattok[3]=ceil($stattok[2]+$osszertek+$_SESSION["pajzsertek"]+($stattok[2]+$osszertek+$_SESSION["pajzsertek"])*($_SESSION["pajzsbonusz"]/100));
											}
											$up=serialize($stattok);
											mysqli_query($conn , "UPDATE users SET stattok='$up' WHERE userid=$userid");
											header("Location: index.php");
										}
									}
								?>
								<div id='p<?php echo $pszam;?>' class='bloktartalom'>
									<form method='post'>
										<?php
										echo "Pajzshely:".$pszam;
										for($szam=21; $szam <= 30; $szam++){
										$lekeres = mysqli_query($conn , "SELECT * from targyaim WHERE (item$szam> 0) and (id=$userid)");
										while($row = mysqli_fetch_object($lekeres)){
										$itemszam=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyaim WHERE id=$userid"))["item$szam"];
										if($_SESSION["p".$pszam] == $szam){
											
											?>
											<table id="targy">
												<tr>
													<td id="td_kep"></td>
													<td>
														<table id="nagytabla">
															<tr>
																<td>
																	<table id="kicsitabla1">
																		<tr>
																			<td>Targy:<?php echo $szam; ?></td>
																			<td><?php echo $itemszam-$pajzs_targyak_elofordulasimerteke[$szam];?> db</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr>
																<td>
																	<table id="kicsitabla2">
																		<tr>
																			<td>Leiras</td>
																			<td>Aktiv</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
											<?php
										}elseif($_SESSION["p".$pszam] != $szam){
											if(empty($pajzs_targyak_elofordulasimerteke[$szam]) and !isset($pajzs_targyak_elofordulasimerteke[$szam])){
												$pajzs_targyak_elofordulasimerteke[$szam] = 0;
											}
											if($pajzs_targyak_elofordulasimerteke[$szam] < $itemszam){
										?>
										<table id="targy">
												<tr>
													<td id="td_kep"></td>
													<td>
														<table id="nagytabla">
															<tr>
																<td>
																	<table id="kicsitabla1">
																		<tr>
																			<td>Targy:<?php echo $szam; ?></td>
																			<td><?php echo $itemszam-$pajzs_targyak_elofordulasimerteke[$szam];?> db</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr>
																<td>
																	<table id="kicsitabla2">
																		<tr>
																			<td>Leiras</td>
																			<td>
																				<form action="index.php" method="post">
																				<?php $felszerelgombid= "p".$pszam."felszerel".$szam; ?>
																					<input name="<?php echo $felszerelgombid;?>" type="submit" value="Felszerel">
																				</form>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										<?php }}}} ?>
									</form>
								</div>
								<?php }
								/************************************LEZER*****************Kijelzo*******************************************************/
								for($lszam=1; $lszam <= $maxlszam; $lszam++){
									$l_szam="l".$lszam;
									$lezer_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$l_szam"];
									$elozo_item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$lezer_slotszam_erteke'"))["lezerertek"];
									for($szam=31; $szam<=40; $szam++){
										$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$szam"))["lezerertek"];
										$felszerelgombid= "l".$lszam."felszerel".$szam;
										if(isset($_POST["$felszerelgombid"])){
											mysqli_query($conn , "UPDATE felszerelesem SET $l_szam=$szam WHERE userid=$userid");
											$osszertek=0;
											for($i=1;$i<=5;$i++){
												$lezer_szam="l".$i;
												$lezer_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$lezer_szam"];
												if($lezer_slotszam_erteke != 0){
													$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$lezer_slotszam_erteke"))["lezerertek"];
													$osszertek=$osszertek+$item_ertek;
												}
												$stattok[5]=ceil($stattok[4]+$osszertek+$_SESSION["lezerertek"]+($stattok[4]+$osszertek+$_SESSION["lezerertek"])*($_SESSION["sebzesbonusz"]/100));
											}
											$up=serialize($stattok);
											mysqli_query($conn , "UPDATE users SET stattok='$up' WHERE userid=$userid");
											header("Location: index.php");
										}
									}
								?>
								<div id='l<?php echo $lszam;?>' class='bloktartalom'>
									<form method='post'>
										<?php
										echo "Lezer:".$lszam;
										for($szam=31; $szam <= 40; $szam++){
										$lekeres = mysqli_query($conn , "SELECT * from targyaim WHERE (item$szam> 0) and (id=$userid)");
										while($row = mysqli_fetch_object($lekeres)){
										$itemszam=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyaim WHERE id=$userid"))["item$szam"];
										if($_SESSION["l".$lszam] == $szam){
											
											?>
											<table id="targy">
												<tr>
													<td id="td_kep"></td>
													<td>
														<table id="nagytabla">
															<tr>
																<td>
																	<table id="kicsitabla1">
																		<tr>
																			<td>Targy:<?php echo $szam; ?></td>
																			<td><?php echo $itemszam-$lezer_targyak_elofordulasimerteke[$szam];?> db</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr>
																<td>
																	<table id="kicsitabla2">
																		<tr>
																			<td>Leiras</td>
																			<td>Aktiv</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
											<?php
										}elseif($_SESSION["l".$lszam] != $szam){
											if(empty($lezer_targyak_elofordulasimerteke[$szam]) and !isset($lezer_targyak_elofordulasimerteke[$szam])){
												$lezer_targyak_elofordulasimerteke[$szam] = 0;
											}
											if($lezer_targyak_elofordulasimerteke[$szam] < $itemszam){
										?>
										<table id="targy">
												<tr>
													<td id="td_kep"></td>
													<td>
														<table id="nagytabla">
															<tr>
																<td>
																	<table id="kicsitabla1">
																		<tr>
																			<td>Targy:<?php echo $szam; ?></td>
																			<td><?php echo $itemszam-$lezer_targyak_elofordulasimerteke[$szam];?> db</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr>
																<td>
																	<table id="kicsitabla2">
																		<tr>
																			<td>Leiras</td>
																			<td>
																				<form action="index.php" method="post">
																				<?php $felszerelgombid= "l".$lszam."felszerel".$szam; ?>
																					<input name="<?php echo $felszerelgombid;?>" type="submit" value="Felszerel">
																				</form>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										<?php }}}} ?>
									</form>
								</div>
								<?php }
								/************************************Meghajto*****************Kijelzo*******************************************************/
								for($mszam=1; $mszam <= $maxmszam; $mszam++){
									$m_szam="m".$mszam;
									$meghajto_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$m_szam"];
									$elozo_item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$meghajto_slotszam_erteke'"))["meghajtoertek"];
									for($szam=41; $szam<=50; $szam++){
										$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$szam"))["meghajtoertek"];
										$felszerelgombid= "m".$mszam."felszerel".$szam;
										if(isset($_POST["$felszerelgombid"])){
											mysqli_query($conn , "UPDATE felszerelesem SET $m_szam=$szam WHERE userid=$userid");
											$osszertek=0;
											for($i=1;$i<=5;$i++){
												$meghajto_szam="m".$i;
												$meghajto_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$meghajto_szam"];
												if($meghajto_slotszam_erteke != 0){
													$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$meghajto_slotszam_erteke"))["meghajtoertek"];
													$osszertek=$osszertek+$item_ertek;
												}
												$stattok[7]=ceil($stattok[6]+$osszertek+$_SESSION["meghajtoertek"]+($stattok[6]+$osszertek+$_SESSION["meghajtoertek"])*($_SESSION["sebessegbonusz"]/100));
											}
											$up=serialize($stattok);
											mysqli_query($conn , "UPDATE users SET stattok='$up' WHERE userid=$userid");
											header("Location: index.php");
											
										}
									}
								?>
								<div id='m<?php echo $mszam;?>' class='bloktartalom'>
									<form method='post'>
										<?php
										echo "Meghajto:".$mszam;
										for($szam=41; $szam <= 50; $szam++){
										$lekeres = mysqli_query($conn , "SELECT * from targyaim WHERE (item$szam> 0) and (id=$userid)");
										while($row = mysqli_fetch_object($lekeres)){
										$itemszam=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyaim WHERE id=$userid"))["item$szam"];
										if($_SESSION["m".$mszam] == $szam){
											
											?>
											<table id="targy">
												<tr>
													<td id="td_kep"></td>
													<td>
														<table id="nagytabla">
															<tr>
																<td>
																	<table id="kicsitabla1">
																		<tr>
																			<td>Targy:<?php echo $szam; ?></td>
																			<td><?php echo $itemszam-$meghajto_targyak_elofordulasimerteke[$szam];?> db</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr>
																<td>
																	<table id="kicsitabla2">
																		<tr>
																			<td>Leiras</td>
																			<td>Aktiv</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
											<?php
										}elseif($_SESSION["m".$mszam] != $szam){
											if(empty($meghajto_targyak_elofordulasimerteke[$szam]) and !isset($meghajto_targyak_elofordulasimerteke[$szam])){
												$meghajto_targyak_elofordulasimerteke[$szam] = 0;
											}
											if($meghajto_targyak_elofordulasimerteke[$szam] < $itemszam){
										?>
										<table id="targy">
												<tr>
													<td id="td_kep"></td>
													<td>
														<table id="nagytabla">
															<tr>
																<td>
																	<table id="kicsitabla1">
																		<tr>
																			<td>Targy:<?php echo $szam; ?></td>
																			<td><?php echo $itemszam-$meghajto_targyak_elofordulasimerteke[$szam];?> db</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr>
																<td>
																	<table id="kicsitabla2">
																		<tr>
																			<td>Leiras</td>
																			<td>
																				<form action="index.php" method="post">
																				<?php $felszerelgombid= "m".$mszam."felszerel".$szam; ?>
																					<input name="<?php echo $felszerelgombid;?>" type="submit" value="Felszerel">
																				</form>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										<?php }}}} ?>
									</form>
								</div>
								<?php }
								/************************************Generator*****************Kijelzo*******************************************************/
								for($gszam=1; $gszam <= $maxgszam; $gszam++){
									$g_szam="g".$gszam;
									$generator_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$g_szam"];
									$elozo_item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito='$generator_slotszam_erteke'"))["generatorertek"];
									for($szam=51; $szam<=60; $szam++){
										$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$szam"))["generatorertek"];
										$felszerelgombid= "g".$gszam."felszerel".$szam;
										if(isset($_POST["$felszerelgombid"])){
											mysqli_query($conn , "UPDATE felszerelesem SET $g_szam=$szam WHERE userid=$userid");
											$osszertek=0;
											for($i=1;$i<=5;$i++){
												$generator_szam="g".$i;
												$generator_slotszam_erteke=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM felszerelesem WHERE userid=$userid"))["$generator_szam"];
												if($generator_slotszam_erteke != 0){
													$item_ertek=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$generator_slotszam_erteke"))["generatorertek"];
													$osszertek=$osszertek+$item_ertek;
												}
												$stattok[9]=ceil($stattok[8]+$osszertek+$_SESSION["generatorertek"]+($stattok[8]+$osszertek+$_SESSION["generatorertek"])*($_SESSION["generatorbonusz"]/100));
											}
											$up=serialize($stattok);
											mysqli_query($conn , "UPDATE users SET stattok='$up' WHERE userid=$userid");
											header("Location: index.php");
										}
									}
								?>
								<div id='g<?php echo $gszam;?>' class='bloktartalom'>
									<form method='post'>
										<?php
										echo "Generator:".$gszam;
										for($szam=51; $szam <= 60; $szam++){
										$lekeres = mysqli_query($conn , "SELECT * from targyaim WHERE (item$szam> 0) and (id=$userid)");
										while($row = mysqli_fetch_object($lekeres)){
										$itemszam=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM targyaim WHERE id=$userid"))["item$szam"];
										if($_SESSION["g".$gszam] == $szam){
											
											?>
											<table id="targy">
												<tr>
													<td id="td_kep"></td>
													<td>
														<table id="nagytabla">
															<tr>
																<td>
																	<table id="kicsitabla1">
																		<tr>
																			<td>Targy:<?php echo $szam; ?></td>
																			<td><?php echo $itemszam-$generator_targyak_elofordulasimerteke[$szam];?> db</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr>
																<td>
																	<table id="kicsitabla2">
																		<tr>
																			<td>Leiras</td>
																			<td>Aktiv</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
											<?php
										}elseif($_SESSION["g".$gszam] != $szam){
											if(empty($generator_targyak_elofordulasimerteke[$szam]) and !isset($generator_targyak_elofordulasimerteke[$szam])){
												$generator_targyak_elofordulasimerteke[$szam] = 0;
											}
											if($generator_targyak_elofordulasimerteke[$szam] < $itemszam){
										?>
										<table id="targy">
												<tr>
													<td id="td_kep"></td>
													<td>
														<table id="nagytabla">
															<tr>
																<td>
																	<table id="kicsitabla1">
																		<tr>
																			<td>Targy:<?php echo $szam; ?></td>
																			<td><?php echo $itemszam-$generator_targyak_elofordulasimerteke[$szam];?> db</td>
																		</tr>
																	</table>
																</td>
															</tr>
															<tr>
																<td>
																	<table id="kicsitabla2">
																		<tr>
																			<td>Leiras</td>
																			<td>
																				<form action="index.php" method="post">
																				<?php $felszerelgombid= "g".$gszam."felszerel".$szam; ?>
																					<input name="<?php echo $felszerelgombid;?>" type="submit" value="Felszerel">
																				</form>
																			</td>
																		</tr>
																	</table>
																</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										<?php }}}} ?>
									</form>
								</div>
								<?php } ?>
							</div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</div>
<div id="kozep_div2">
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