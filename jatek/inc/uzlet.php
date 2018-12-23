<?php
include "megtekintesvedelem.php";
include "header.php";
include "frissites.php";
$szint = $_SESSION["szint"];
for($i=0; $i <=60; $i++){
	$ara=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM uzlet WHERE azonosito=$i"))["ara"];
	$item="item".$i;
	if(isset($_POST["$i"])){
		if($_SESSION["kredit"] >= $ara){
			mysqli_query($conn , "UPDATE targyaim SET $item=$item+1 WHERE  id=$userid");
			mysqli_query($conn , "UPDATE users SET kredit=kredit-$ara WHERE userid=$userid");
			Header("Location: uzlet.php");
		}else{
			echo "Nincs eleg penzed";
		}
	}
}
?>
<title>Uzlet</title>
<link rel="stylesheet" href="../css/uzlet.css">
<body>
<div id="kozep_div1">
	<table id="kozep_tabla1">
		<tr>
			<td id="menu_td">
				<table id="menu_lista_tabla">
					<tr>
						<td id="menu_lista_elem"><div onclick="tablazat(event, '1')" id="elsodleges">Bázisok</div></td>
					</tr>
					<tr>
						<td id="menu_lista_elem"><div onclick="tablazat(event, '2')">Burkolatok</div></td>
					</tr>
					<tr>
						<td id="menu_lista_elem"><div onclick="tablazat(event, '3')">Pajzsok</div></td>
					</tr>
					<tr>
						<td id="menu_lista_elem"><div onclick="tablazat(event, '4')">Lezerek</div></td>
					</tr>
					<tr>
						<td id="menu_lista_elem"><div onclick="tablazat(event, '5')">Meghajtok</div></td>
					</tr>
					<tr>
						<td id="menu_lista_elem"><div onclick="tablazat(event, '6')">Generatorok</div></td>
					</tr>
				</table>
			</td>
			<td id="uzlet_td">
			<div id="uzlet_div">
				<div id="1" class="bloktartalom">
					<table>
						<?php
						$lekeres = mysqli_query($conn , "SELECT * from uzlet WHERE (kategoria='bazis') and (aktiv='1') and (szintkorlat <= $szint)");
						while($row = mysqli_fetch_object($lekeres)){
							$azonosito=$row->azonosito;
						?>
						<tr>
							<td id="uzlet_sor">
								<table>
									<tr>
										<td id="td_kep"></td>
										<td id="td_reszletek">
											<table>
												<tr>
													<td id="td_targyneve">
														<table>
															<tr>
																<td id="td_megnevezes"><?php echo $row->megnevezes;?></td>
																<td id="td_ara"><?php echo number_format($row->ara)." ".$row->penznem;?></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td id="reszletek_td">
														<table>
															<tr>
																<td id="td_leiras">Leiras</td>
																<td id="td_gomb">
																	<form action="uzlet.php" method="post">
																		<input id="vasarlas" type="submit" name="<?php echo $azonosito;?>" value="Megveszem">
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
							</td>
						</tr>
						<?php
						}
						$lekeres = mysqli_query($conn , "SELECT * from uzlet WHERE (kategoria='bazis') and (aktiv='1') and (szintkorlat > $szint)");
						while($row = mysqli_fetch_object($lekeres)){
						?>
						<tr>
							<td id="uzlet_sor">
								<table>
									<tr>
										<td id="td_kep"></td>
										<td id="td_reszletek">
											<table>
												<tr>
													<td id="td_targyneve">
														<table>
															<tr>
																<td id="td_megnevezes"><?php echo $row->megnevezes;?></td>
																<td id="td_ara"><?php echo number_format($row->ara)." ".$row->penznem;?></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td id="reszletek_td">
														<table>
															<tr>
																<td id="td_nemelerheto">Elerheto a <?php echo $row->szintkorlat;?>. - szinttol.</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<?php } ?>
					</table>
				</div>
				<div id="2" class="bloktartalom">
					<table>
						<?php
						$lekeres = mysqli_query($conn , "SELECT * from uzlet WHERE (kategoria='burkolat') and (aktiv='1') and (szintkorlat <= $szint)");
						while($row = mysqli_fetch_object($lekeres)){
							$azonosito=$row->azonosito;
						?>
						<tr>
							<td id="uzlet_sor">
								<table>
									<tr>
										<td id="td_kep"></td>
										<td id="td_reszletek">
											<table>
												<tr>
													<td id="td_targyneve">
														<table>
															<tr>
																<td id="td_megnevezes"><?php echo $row->megnevezes;?></td>
																<td id="td_ara"><?php echo $row->ara." ".$row->penznem;?></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td id="reszletek_td">
														<table>
															<tr>
																<td id="td_leiras">Leiras</td>
																<td id="td_gomb">
																	<form action="uzlet.php" method="post">
																		<input id="vasarlas" type="submit" name="<?php echo $azonosito;?>" value="Megveszem">
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
							</td>
						</tr>
						<?php
						}
						$lekeres = mysqli_query($conn , "SELECT * from uzlet WHERE (kategoria='burkolat') and (aktiv='1') and (szintkorlat > $szint)");
						while($row = mysqli_fetch_object($lekeres)){
						?>
						<tr>
							<td id="uzlet_sor">
								<table>
									<tr>
										<td id="td_kep"></td>
										<td id="td_reszletek">
											<table>
												<tr>
													<td id="td_targyneve">
														<table>
															<tr>
																<td id="td_megnevezes"><?php echo $row->megnevezes;?></td>
																<td id="td_ara"><?php echo $row->ara." ".$row->penznem;?></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td id="reszletek_td">
														<table>
															<tr>
																<td id="td_nemelerheto">Elerheto a <?php echo $row->szintkorlat;?>. - szinttol.</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<?php } ?>
					</table>
				</div>
				<div id="3" class="bloktartalom">
					<table>
						<?php
						$lekeres = mysqli_query($conn , "SELECT * from uzlet WHERE (kategoria='pajzs') and (aktiv='1') and (szintkorlat <= $szint)");
						while($row = mysqli_fetch_object($lekeres)){
							$azonosito=$row->azonosito;
						?>
						<tr>
							<td id="uzlet_sor">
								<table>
									<tr>
										<td id="td_kep"></td>
										<td id="td_reszletek">
											<table>
												<tr>
													<td id="td_targyneve">
														<table>
															<tr>
																<td id="td_megnevezes"><?php echo $row->megnevezes;?></td>
																<td id="td_ara"><?php echo $row->ara." ".$row->penznem;?></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td id="reszletek_td">
														<table>
															<tr>
																<td id="td_leiras">Leiras</td>
																<td id="td_gomb">
																	<form action="uzlet.php" method="post">
																		<input id="vasarlas" type="submit" name="<?php echo $azonosito;?>" value="Megveszem">
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
							</td>
						</tr>
						<?php
						}
						$lekeres = mysqli_query($conn , "SELECT * from uzlet WHERE (kategoria='pajzs') and (aktiv='1') and (szintkorlat > $szint)");
						while($row = mysqli_fetch_object($lekeres)){
						?>
						<tr>
							<td id="uzlet_sor">
								<table>
									<tr>
										<td id="td_kep"></td>
										<td id="td_reszletek">
											<table>
												<tr>
													<td id="td_targyneve">
														<table>
															<tr>
																<td id="td_megnevezes"><?php echo $row->megnevezes;?></td>
																<td id="td_ara"><?php echo $row->ara." ".$row->penznem;?></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td id="reszletek_td">
														<table>
															<tr>
																<td id="td_nemelerheto">Elerheto a <?php echo $row->szintkorlat;?>. - szinttol.</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<?php } ?>
					</table>
				</div>
				<div id="4" class="bloktartalom">
					<table>
						<?php
						$lekeres = mysqli_query($conn , "SELECT * from uzlet WHERE (kategoria='lezer') and (aktiv='1') and (szintkorlat <= $szint)");
						while($row = mysqli_fetch_object($lekeres)){
							$azonosito=$row->azonosito;
						?>
						<tr>
							<td id="uzlet_sor">
								<table>
									<tr>
										<td id="td_kep"></td>
										<td id="td_reszletek">
											<table>
												<tr>
													<td id="td_targyneve">
														<table>
															<tr>
																<td id="td_megnevezes"><?php echo $row->megnevezes;?></td>
																<td id="td_ara"><?php echo $row->ara." ".$row->penznem;?></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td id="reszletek_td">
														<table>
															<tr>
																<td id="td_leiras">Leiras</td>
																<td id="td_gomb">
																	<form action="uzlet.php" method="post">
																		<input id="vasarlas" type="submit" name="<?php echo $azonosito;?>" value="Megveszem">
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
							</td>
						</tr>
						<?php
						}
						$lekeres = mysqli_query($conn , "SELECT * from uzlet WHERE (kategoria='lezer') and (aktiv='1') and (szintkorlat > $szint)");
						while($row = mysqli_fetch_object($lekeres)){
						?>
						<tr>
							<td id="uzlet_sor">
								<table>
									<tr>
										<td id="td_kep"></td>
										<td id="td_reszletek">
											<table>
												<tr>
													<td id="td_targyneve">
														<table>
															<tr>
																<td id="td_megnevezes"><?php echo $row->megnevezes;?></td>
																<td id="td_ara"><?php echo $row->ara." ".$row->penznem;?></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td id="reszletek_td">
														<table>
															<tr>
																<td id="td_nemelerheto">Elerheto a <?php echo $row->szintkorlat;?>. - szinttol.</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<?php } ?>
					</table>
				</div>
				<div id="5" class="bloktartalom">
					<table>
						<?php
						$lekeres = mysqli_query($conn , "SELECT * from uzlet WHERE (kategoria='meghajto') and (aktiv='1') and (szintkorlat <= $szint)");
						while($row = mysqli_fetch_object($lekeres)){
							$azonosito=$row->azonosito;
						?>
						<tr>
							<td id="uzlet_sor">
								<table>
									<tr>
										<td id="td_kep"></td>
										<td id="td_reszletek">
											<table>
												<tr>
													<td id="td_targyneve">
														<table>
															<tr>
																<td id="td_megnevezes"><?php echo $row->megnevezes;?></td>
																<td id="td_ara"><?php echo $row->ara." ".$row->penznem;?></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td id="reszletek_td">
														<table>
															<tr>
																<td id="td_leiras">Leiras</td>
																<td id="td_gomb">
																	<form action="uzlet.php" method="post">
																		<input id="vasarlas" type="submit" name="<?php echo $azonosito;?>" value="Megveszem">
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
							</td>
						</tr>
						<?php
						}
						$lekeres = mysqli_query($conn , "SELECT * from uzlet WHERE (kategoria='meghajto') and (aktiv='1') and (szintkorlat > $szint)");
						while($row = mysqli_fetch_object($lekeres)){
						?>
						<tr>
							<td id="uzlet_sor">
								<table>
									<tr>
										<td id="td_kep"></td>
										<td id="td_reszletek">
											<table>
												<tr>
													<td id="td_targyneve">
														<table>
															<tr>
																<td id="td_megnevezes"><?php echo $row->megnevezes;?></td>
																<td id="td_ara"><?php echo $row->ara." ".$row->penznem;?></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td id="reszletek_td">
														<table>
															<tr>
																<td id="td_nemelerheto">Elerheto a <?php echo $row->szintkorlat;?>. - szinttol.</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<?php } ?>
					</table>
				</div>
				<div id="6" class="bloktartalom">
					<table>
						<?php
						$lekeres = mysqli_query($conn , "SELECT * from uzlet WHERE (kategoria='generator') and (aktiv='1') and (szintkorlat <= $szint)");
						while($row = mysqli_fetch_object($lekeres)){
							$azonosito=$row->azonosito;
						?>
						<tr>
							<td id="uzlet_sor">
								<table>
									<tr>
										<td id="td_kep"></td>
										<td id="td_reszletek">
											<table>
												<tr>
													<td id="td_targyneve">
														<table>
															<tr>
																<td id="td_megnevezes"><?php echo $row->megnevezes;?></td>
																<td id="td_ara"><?php echo $row->ara." ".$row->penznem;?></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td id="reszletek_td">
														<table>
															<tr>
																<td id="td_leiras">Leiras</td>
																<td id="td_gomb">
																	<form action="uzlet.php" method="post">
																		<input id="vasarlas" type="submit" name="<?php echo $azonosito;?>" value="Megveszem">
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
							</td>
						</tr>
						<?php
						}
						$lekeres = mysqli_query($conn , "SELECT * from uzlet WHERE (kategoria='generator') and (aktiv='1') and (szintkorlat > $szint)");
						while($row = mysqli_fetch_object($lekeres)){
						?>
						<tr>
							<td id="uzlet_sor">
								<table>
									<tr>
										<td id="td_kep"></td>
										<td id="td_reszletek">
											<table>
												<tr>
													<td id="td_targyneve">
														<table>
															<tr>
																<td id="td_megnevezes"><?php echo $row->megnevezes;?></td>
																<td id="td_ara"><?php echo $row->ara." ".$row->penznem;?></td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td id="reszletek_td">
														<table>
															<tr>
																<td id="td_nemelerheto">Elerheto a <?php echo $row->szintkorlat;?>. - szinttol.</td>
															</tr>
														</table>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<?php } ?>
					</table>
				</div>
			</td>
			</div>
		</tr>
	</table>
</div>
<div id="alja_div">Keszitette: Magyari Otto</div>
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