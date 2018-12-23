<?php
include "megtekintesvedelem.php";
include "header.php";
$kalozid=$_SESSION["kalozid"];
		$kaloz= unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT ertekek from kalozok WHERE id='$kalozid'"))["ertekek"]);
		$kaloz_erteke=0;
		$en_ertekem=0;
		$kaloztp=$kaloz[6];
		$kalozkr=$kaloz[7];
		if($kaloz[1] > $_SESSION["elet"]){
			$kaloz_erteke++;
		}elseif($kaloz[1] == $_SESSION["elet"]){
			$kaloz_erteke++;
			$en_ertekem++;
		}elseif($kaloz[1] < $_SESSION["elet"]){
			$en_ertekem++;
		}
		if($kaloz[2] > $_SESSION["pajzs"]){
			$kaloz_erteke++;
		}elseif($kaloz[2] == $_SESSION["pajzs"]){
			$kaloz_erteke++;
			$en_ertekem++;
		}elseif($kaloz[2] < $_SESSION["pajzs"]){
			$en_ertekem++;
		}
		if($kaloz[3] > $_SESSION["sebzes"]){
			$kaloz_erteke++;
		}elseif($kaloz[3] == $_SESSION["sebzes"]){
			$kaloz_erteke++;
			$en_ertekem++;
		}elseif($kaloz[3] < $_SESSION["sebzes"]){
			$en_ertekem++;
		}
		if($kaloz[4] > $_SESSION["sebesseg"]){
			$kaloz_erteke++;
		}elseif($kaloz[4] == $_SESSION["sebesseg"]){
			$kaloz_erteke++;
			$en_ertekem++;
		}elseif($kaloz[4] < $_SESSION["sebesseg"]){
			$en_ertekem++;
		}
		if($kaloz[5] > $_SESSION["generator"]){
			$kaloz_erteke++;
		}elseif($kaloz[5] == $_SESSION["generator"]){
			$kaloz_erteke++;
			$en_ertekem++;
		}elseif($kaloz[5] < $_SESSION["generator"]){
			$en_ertekem++;
		}
		if($kaloz_erteke > $en_ertekem){
			$gyoztes = 3;
		}elseif($kaloz_erteke == $en_ertekem){
			$gyoztes = 2;
		}elseif($kaloz_erteke < $en_ertekem){
			$gyoztes = 1;
		}
		if(isset($_POST["kalozmegtamadasa"])){
			if($gyoztes == 1){
					mysqli_query($conn , "UPDATE users SET tapasztalat=tapasztalat+$kaloztp , kredit=kredit+$kalozkr , kalozid=kalozid+1 WHERE userid='$userid'");
					header ("Location: portya.php?v=2&eredmeny=1&tp=$kaloztp&kr=$kalozkr");
			}elseif($gyoztes == 2){
					header ("Location: portya.php?v=2&eredmeny=2");
			}elseif($gyoztes == 3){
					header ("Location: portya.php?v=2&eredmeny=3");
			}
		}
?>
<html>
<link rel="stylesheet" href="../css/portya.css">
<body><br>
<?php
if(empty($_GET["v"]) and empty($_GET["galaxy"])){
?>
<table id="portya_tabla1">
	<tr>
		<td>
			<div id="portya_div1">
			<div id="portya_div1a">Űrlény vádaszat:</div>
				<table id="portya_div1_talba1">
					<tr>
						<td id="portya_div1_td1">
							<form method="post" action="portya.php?v=1">
								<input id="urlenyvadaszat_gomb" type="submit" name="urlenyevadaszat" value="Űrlény vadászat megkezdése">
							</form>
						</td>
					</tr>
					<tr>
						<td id="portya_div1_td2">Leíras</td>
					</tr>
				</table>
					
			</div>
			<div id="portya_div2">
			<div id="portya_div2a">Kaloz vadászat:</div>
				<table id="portya_div2_tabla2">
					<tr>
						<td id="portya_div2_td1">
							<form method="post" action="portya.php?v=2">
								<input id="urlenyvadaszat_gomb" type="submit" name="kalozvadaszat" value="Kaloz vadászat megkezdése">
							</form>
						</td>
					</tr>
					<tr>
						<td id="portya_div2_td2">Leírás</td>
					</tr>
				</table>
			</div>
			<div id="portya_div3">
				<div id="portya_div3a">Új galaxis felfedezése:</div>
				<table id="portya_div3_tabla3">
					<tr>
						<td style="color:white;border-width:1px;border-style:double;width:350px;height:376px;margin:0 auto;background-color: rgba(0, 0, 0, 0.8);text-align:center;">
							<form style="height:20px;" method="post" action="portya.php?galaxy=1">
								<input style="height:20px;color:white;background:transparent;" type="submit" name="galaxy1" value="Ismeretlen Galaxisok Felfedezése">
							</form>
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
</table>
<?php 
}
if(isset($_GET["v"])){
	if($_GET["v"] == 1){
		$npc1id = mysqli_fetch_assoc(mysqli_query($conn , "SELECT npcid from urlenyek ORDER BY RAND()"))["npcid"];
		$npc2id = mysqli_fetch_assoc(mysqli_query($conn , "SELECT npcid from urlenyek WHERE npcid !=$npc1id ORDER BY RAND()"))["npcid"];
		$npc1_lvl=array($_SESSION["szint"]-1,$_SESSION["szint"],$_SESSION["szint"]+1);
		$random_keys=array_rand($npc1_lvl);
		$npc1_szint=$npc1_lvl[$random_keys];
		$npc1_lekeres=mysqli_query($conn , "SELECT * FROM urlenyek WHERE npcid='$npc1id'");
		if ( mysqli_num_rows( $npc1_lekeres ) == 1 ) {
			$npc1_sor = mysqli_fetch_assoc( $npc1_lekeres);
			{
				$npc1_nev=$npc1_sor["npcnev"];
				$npc1_kep=$npc1_sor["kep"];
				$npc1_alap_elet=$npc1_sor["elet"];
				$npc1_alap_pajzs=$npc1_sor["pajzs"];
				$npc1_alap_sebzes=$npc1_sor["sebzes"];
				$npc1_alap_sebesseg=$npc1_sor["sebesseg"];
				$npc1_alap_generator=$npc1_sor["generator"];
				$npc1_alap_tapasztalat=$npc1_sor["tapasztalat"];
				$npc1_alap_kredit=$npc1_sor["kredit"];
			}
		}
		$npc2_lekeres=mysqli_query($conn , "SELECT * FROM urlenyek WHERE npcid='$npc2id'");
			if ( mysqli_num_rows( $npc2_lekeres ) == 1 ) {
			$npc2_sor = mysqli_fetch_assoc( $npc2_lekeres);
			{
				$npc2_nev=$npc2_sor["npcnev"];
				$npc2_kep=$npc2_sor["kep"];
				$npc2_alap_elet=$npc2_sor["elet"];
				$npc2_alap_pajzs=$npc2_sor["pajzs"];
				$npc2_alap_sebzes=$npc2_sor["sebzes"];
				$npc2_alap_sebesseg=$npc2_sor["sebesseg"];
				$npc2_alap_generator=$npc2_sor["generator"];
				$npc2_alap_tapasztalat=$npc2_sor["tapasztalat"];
				$npc2_alap_kredit=$npc2_sor["kredit"];
			}
		}
		$npc2_lvl=array($_SESSION["szint"]-1,$_SESSION["szint"],$_SESSION["szint"]+1);
		$random_keys=array_rand($npc2_lvl);
		$npc2_szint=$npc2_lvl[$random_keys];
	if(!isset($_GET["eredmeny"])){
		$ertek_npc1=0;
		$ertek_en=0;
		if(round($npc1_alap_elet*$npc1_szint+$_SESSION["szint"]) > $_SESSION["elet"]){
			$ertek_npc1++;
		}elseif(round($npc1_alap_elet*$npc1_szint+$_SESSION["szint"]) == $_SESSION["elet"]){
			$ertek_npc1++;
			$ertek_en++;
		}elseif(round($npc1_alap_elet*$npc1_szint+$_SESSION["szint"]) < $_SESSION["elet"]){
			$ertek_en++;
		}
		if(round($npc1_alap_pajzs*$npc1_szint+$_SESSION["szint"]) > $_SESSION["pajzs"]){
			$ertek_npc1++;
		}elseif(round($npc1_alap_pajzs*$npc1_szint+$_SESSION["szint"]) == $_SESSION["pajzs"]){
			$ertek_npc1++;
			$ertek_en++;
		}elseif(round($npc1_alap_pajzs*$npc1_szint+$_SESSION["szint"]) < $_SESSION["pajzs"]){
			$ertek_en++;
		}
		if(round($npc1_alap_sebzes*$npc1_szint+$_SESSION["szint"]) > $_SESSION["sebzes"]){
			$ertek_npc1++;
		}elseif(round($npc1_alap_sebzes*$npc1_szint+$_SESSION["szint"]) == $_SESSION["sebzes"]){
			$ertek_npc1++;
			$ertek_en++;
		}elseif(round($npc1_alap_sebzes*$npc1_szint+$_SESSION["szint"]) < $_SESSION["sebzes"]){
			$ertek_en++;
		}
		if(round($npc1_alap_sebesseg*$npc1_szint+$_SESSION["szint"]) > $_SESSION["sebesseg"]){
			$ertek_npc1++;
		}elseif(round($npc1_alap_sebesseg*$npc1_szint+$_SESSION["szint"]) == $_SESSION["sebesseg"]){
			$ertek_npc1++;
			$ertek_en++;
		}elseif(round($npc1_alap_sebesseg*$npc1_szint+$_SESSION["szint"]) < $_SESSION["sebesseg"]){
			$ertek_en++;
		}
		if(round($npc1_alap_generator*$npc1_szint+$_SESSION["szint"]) > $_SESSION["generator"]){
			$ertek_npc1++;
		}elseif(round($npc1_alap_generator*$npc1_szint+$_SESSION["szint"]) == $_SESSION["generator"]){
			$ertek_npc1++;
			$ertek_en++;
		}elseif(round($npc1_alap_generator*$npc1_szint+$_SESSION["szint"]) < $_SESSION["generator"]){
			$ertek_en++;
		}
		if($ertek_npc1 > $ertek_en){
			$npc1vsen=3;
		}elseif($ertek_npc1 == $ertek_en){
			$npc1vsen=2;
		}elseif($ertek_npc1 < $ertek_en){
			$npc1vsen=1;
		}
		$ertek_npc2=0;
		$ertek_en2=0;
		if(round($npc2_alap_elet*$npc2_szint+$_SESSION["szint"]) > $_SESSION["elet"]){
			$ertek_npc2++;
		}elseif(round($npc2_alap_elet*$npc2_szint+$_SESSION["szint"]) == $_SESSION["elet"]){
			$ertek_npc2++;
			$ertek_en2++;
		}elseif(round($npc2_alap_elet*$npc2_szint+$_SESSION["szint"]) < $_SESSION["elet"]){
			$ertek_en2++;
		}
		if(round($npc2_alap_pajzs*$npc2_szint+$_SESSION["szint"]) > $_SESSION["pajzs"]){
			$ertek_npc2++;
		}elseif(round($npc2_alap_pajzs*$npc2_szint+$_SESSION["szint"]) == $_SESSION["pajzs"]){
			$ertek_npc2++;
			$ertek_en2++;
		}elseif(round($npc2_alap_pajzs*$npc2_szint+$_SESSION["szint"]) < $_SESSION["pajzs"]){
			$ertek_en2++;
		}
		if(round($npc2_alap_sebzes*$npc2_szint+$_SESSION["szint"]) > $_SESSION["sebzes"]){
			$ertek_npc2++;
		}elseif(round($npc2_alap_sebzes*$npc2_szint+$_SESSION["szint"]) == $_SESSION["sebzes"]){
			$ertek_npc2++;
			$ertek_en2++;
		}elseif(round($npc2_alap_sebzes*$npc2_szint+$_SESSION["szint"]) < $_SESSION["sebzes"]){
			$ertek_en2++;
		}
		if(round($npc2_alap_sebesseg*$npc2_szint+$_SESSION["szint"]) > $_SESSION["sebesseg"]){
			$ertek_npc2++;
		}elseif(round($npc2_alap_sebesseg*$npc2_szint+$_SESSION["szint"]) == $_SESSION["sebesseg"]){
			$ertek_npc2++;
			$ertek_en2++;
		}elseif(round($npc2_alap_sebesseg*$npc2_szint+$_SESSION["szint"]) < $_SESSION["sebesseg"]){
			$ertek_en2++;
		}
		if(round($npc2_alap_generator*$npc2_szint+$_SESSION["szint"]) > $_SESSION["generator"]){
			$ertek_npc2++;
		}elseif(round($npc2_alap_generator*$npc2_szint+$_SESSION["szint"]) == $_SESSION["generator"]){
			$ertek_npc2++;
			$ertek_en2++;
		}elseif(round($npc2_alap_generator*$npc2_szint+$_SESSION["szint"]) < $_SESSION["generator"]){
			$ertek_en2++;
		}
		if($ertek_npc2 > $ertek_en2){
			$npc2vsen2=3;
		}elseif($ertek_npc2 == $ertek_en2){
			$npc2vsen2=2;
		}elseif($ertek_npc2 < $ertek_en2){
			$npc2vsen2=1;
		}
		if(isset($_POST["npc1_kihivas"])){
			$kiir= unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT urleny from users WHERE userid='$userid'"))["urleny"]);
			$megjegyzet_npc1id=$kiir[0];
			$megjegyzet_npc1szint=$kiir[1];
			$megjegyzet_npc1vsen=$kiir[4];
			$npc1_tapasztalat=$npc1_alap_tapasztalat*$megjegyzet_npc1szint*$megjegyzet_npc1szint*0.5;
			$npc1_kredit=$npc1_alap_kredit*$megjegyzet_npc1szint*$megjegyzet_npc1szint*0.5;
			if($megjegyzet_npc1vsen == 1){
				if($megjegyzet_npc1szint != 0){
					mysqli_query($conn , "UPDATE users SET tapasztalat=tapasztalat+'$npc1_tapasztalat' , kredit=kredit+'$npc1_kredit' , energia=energia-1 WHERE userid='$userid'");
					header ("Location: portya.php?v=1&eredmeny=1&tp=$npc1_tapasztalat&kr=$npc1_kredit");
				}elseif($megjegyzet_npc1szint == 0){
					mysqli_query($conn , "UPDATE users SET tapasztalat=tapasztalat+10 , kredit=kredit+10 , energia=energia-1 WHERE userid='$userid'");
					header ("Location: portya.php?v=1&eredmeny=1&tp=10&kr=10");
				}
				
			}elseif($megjegyzet_npc1vsen == 2){
				header ("Location: portya.php?v=1&eredmeny=2");
			}elseif($megjegyzet_npc1vsen == 3){
				header ("Location: portya.php?v=1&eredmeny=3");
			}
		}
		if(isset($_POST["npc2_kihivas"])){
			$kiir= unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT urleny from users WHERE userid='$userid'"))["urleny"]);
			$megjegyzet_npc2id=$kiir[2];
			$megjegyzet_npc2szint=$kiir[3];
			$megjegyzet_npc2vsen2=$kiir[5];
			$npc2_tapasztalat=$npc2_alap_tapasztalat*$megjegyzet_npc2szint*$megjegyzet_npc2szint*0.5;
			$npc2_kredit=$npc2_alap_kredit*$megjegyzet_npc2szint*$megjegyzet_npc2szint*0.5;
			if($megjegyzet_npc2vsen2 == 1){
				if($megjegyzet_npc2szint != 0){
					mysqli_query($conn , "UPDATE users SET tapasztalat=tapasztalat+'$npc2_tapasztalat' , kredit=kredit+'$npc2_kredit' , energia=energia-1 WHERE userid='$userid'");
					header ("Location: portya.php?v=1&eredmeny=1&tp=$npc2_tapasztalat&kr=$npc2_kredit");
				}elseif($megjegyzet_npc2szint == 0){
					mysqli_query($conn , "UPDATE users SET tapasztalat=tapasztalat+10 , kredit=kredit+10 , energia=energia-1 WHERE userid='$userid'");
					header ("Location: portya.php?v=1&eredmeny=1&tp=10&kr=10");
				}
			}elseif($megjegyzet_npc2vsen2 == 2){
				header ("Location: portya.php?v=1&eredmeny=2");
			}elseif($megjegyzet_npc2vsen2 == 3){
				header ("Location: portya.php?v=1&eredmeny=3");
			}
		}
	?>
	<table id="portya_urleny">
		<tr>
			<td>
				<table id="portya_urleny_tabla1">
					<tr>
						<td id="portya_urleny_tabla1_td1"><?php
							echo "<p align='center'>".$npc1_nev." (Lvl.".$npc1_szint.")</p>";
						?></td>
					</tr>
					<tr>
						<td id="portya_urleny_tabla1_td2" style="background-image: url(<?php echo $npc1_kep; ?>);background-size:100% 100%;">
							<form method="post" action="">
								<input id="urlenyvadaszat_gomb2" type="submit" name="npc1_kihivas" value="Űrlény megtámadása">
							</form>
						</td>
					</tr>
					<tr>
						<td id="portya_urleny_tabla1_td2"></td>
					</tr>
				</table>
				</td><td>
				<table id="portya_urleny_tabla1">
					<tr>
						<td id="portya_urleny_tabla1_td1"><?php
							echo "<p align='center'>".$npc2_nev." (Lvl.".$npc2_szint.")</p>";
						?></td>
					</tr>
					<tr>
						<td id="portya_urleny_tabla1_td2" style="background-image: url(<?php echo $npc2_kep; ?>);background-size:100% 100%;">
							<form method="post" action="">
								<input id="urlenyvadaszat_gomb2" type="submit" name="npc2_kihivas" value="Űrlény megtámadása">
							</form>
						</td>
					</tr>
					<tr>
						<td id="portya_urleny_tabla1_td2"></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td style="color:white;" align="center" colspan="2">
				<table>
					<td style="float: left;margin: 0 83 0 0;">
						<form method="post" action="">
							<input type="submit" name="ujurlenyekkeresese" value="Új űrlények keresése">
						</form>
					</td>
					<td style="float: left;margin: 0 83 0 0;">
						<form method="post" action="portya.php">
							<input type="submit" name="vissza" value="Vissza">
						</form>
					</td>
				</table>
			</td>
		</tr>
	</table>
	<?php
	$kiir= unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT urleny from users WHERE userid='$userid'"))["urleny"]);
	$npc1idsqlbe=$kiir[0];
	if(mysqli_fetch_assoc(mysqli_query($conn , "SELECT '$npc1idsqlbe' from users"))["$npc1idsqlbe"] == 0){
		$tomb= serialize(array($npc1id,$npc1_szint,$npc2id,$npc2_szint,$npc1vsen,$npc2vsen2));
		mysqli_query($conn , "UPDATE users SET urleny='$tomb' WHERE userid='$userid'");
	}
	if(isset($_POST["ujurlenyekkeresese"])){
		$tomb= serialize(array($npc1id,$npc1_szint,$npc2id,$npc2_szint,$npc1vsen,$npc2vsen2));
		mysqli_query($conn , "UPDATE users SET urleny='$tomb' WHERE userid='$userid'");
		function Redirect() {
			flush();
			ob_flush();
			header("Location: portya.php?v=1");
			die;
		}
	}
	}else{
		$kiir= unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT urleny from users WHERE userid='$userid'"))["urleny"]);
		if($kiir[4] != 0 and $kiir[5] != 0){
			if($_GET["eredmeny"] == 1){
				echo "
					<table id='portya_urleny_eredmeny_tabla'>
						<tr>
							<td>Nyertél!A jutalmad: ".$_GET["tp"]." tapasztalatpontot és ".$_GET["kr"]." kredit.</td>
							<td>
								<form method='post' action='portya.php?v=1'>
									<input style='margin: 12 0 0 0;' type='submit' name='vissza' value='Vissza'>
								</form>
							</td>
						</tr>
					</table>
				";
			}elseif($_GET["eredmeny"] == 2){
				echo "
					<table id='portya_urleny_eredmeny_tabla'>
						<tr>
							<td>Döntetlen!</td>
							<td>
								<form method='post' action='portya.php?v=1'>
									<input style='margin: 12 0 0 0;' type='submit' name='vissza' value='Vissza'>
								</form>
							</td>
						</tr>
					</table>
				";
			}elseif($_GET["eredmeny"] == 3){
				echo "
					<table id='portya_urleny_eredmeny_tabla'>
						<tr>
							<td>Vesztettél!</td>
							<td>
								<form method='post' action='portya.php?v=1'>
									<input style='margin: 12 0 0 0;' type='submit' name='vissza' value='Vissza'>
								</form>
							</td>
						</tr>
					</table>
				";
			}
			$nulltomb= serialize(array(0,0,0,0,0,0));
			mysqli_query($conn , "UPDATE users SET urleny='$nulltomb' WHERE userid='$userid'");
		}else{
			?>
			<table id="portya_urleny_eredmeny_tabla">
				<tr>
					<td>Nem létezik csata jelentés</td>
					<td>
						<form method='post' action='portya.php?v=1'>
							<input style="margin: 12 0 0 0;" type='submit' name='vissza' value='Vissza'>
						</form>
					</td>
				</tr>
			</table>
			<?php
		}
	}
	}elseif($_GET["v"] == 2){
		if(!isset($_GET["eredmeny"])){

			?>
			<table id="portya_urleny">
			<tr>
				<td>
					<table id="portya_kaloz_tabla1">
						<tr>
							<td id="portya_kaloz_tabla1_td1"><?php
								echo "<p align='center'>nev (Lvl.".$kalozid.")</p>";
							?></td>
						</tr>
						<tr>
							<td id="portya_kaloz_tabla1_td2">
								<form id="kalozvadaszat_gomb" method="post" action="">
									<input type="submit" name="kalozmegtamadasa" value="Kaloz megtámadasa">
								</form>
								<form id="kalozvadaszat_gomb" method="post" action="portya.php">
									<input type="submit" name="vissza" value="Vissza">
								</form>
							</td>
						</tr>
						<tr>
							<td id="portya_kaloz_tabla1_td2">
								<table style="color:white;">
									<tr>
										<td>Élet:</td>
										<td><?php echo $kaloz[1];?></td>
									</tr>
									<tr>
										<td>Pajzs:</td>
										<td><?php echo $kaloz[2];?></td>
									</tr>
									<tr>
										<td>Sebzés:</td>
										<td><?php echo $kaloz[3];?></td>
									</tr>
									<tr>
										<td>Sebesség:</td>
										<td><?php echo $kaloz[4];?></td>
									</tr>
									<tr>
										<td>Generátor:</td>
										<td><?php echo $kaloz[5];?></td>
									</tr>
									<tr>
										<td>Tapasztalat:</td>
										<td><?php echo $kaloz[6];?></td>
									</tr>
									<tr>
										<td>Kredit:</td>
										<td><?php echo $kaloz[7];?></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</table>
			<?php
	}else{
		?>
		<table id='portya_urleny_eredmeny_tabla'>
			<tr>
				<?php
				if($_GET["eredmeny"] == 1){
					echo "<td>Nyertél!A jutalmad: ".$_GET["tp"]." tapasztalatpontot és ".$_GET["kr"]." kredit.</td>";
				}elseif($_GET["eredmeny"] == 2){
					echo "<td>Dontetlen!Nem nyertél semmitse</td>";
				}elseif($_GET["eredmeny"] == 3){
					echo "<td>Vesztettel.Az ellenfél erősebb volt nálad!</td>";
				}
				?>
				<td>
					<form method='post' action='portya.php?v=2'>
						<input style='margin: 12 0 0 0;' type='submit' name='vissza' value='Vissza a kalozokhoz'>
					</form>
				</td>
			</tr>
		</table>
		<?php
	}
	}
	}elseif(isset($_GET["galaxy"]) and empty($_GET["v"]) and !isset($_GET["start"])){
		$aktualiskapu=$_GET["galaxy"];
		$kreditbonusz=0;
		$kapureszek=0;
		$galaxy= unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$userid'"))["galaxy".$aktualiskapu]);
		$galaxyatjaroreszek= mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM galaxy WHERE galaxisid='$aktualiskapu'"))["atjaroreszek"];
		if($galaxy[1] == $galaxyatjaroreszek){
			$kapukesz=serialize(array(1,$galaxy[1],$galaxy[2]));
			mysqli_query($conn , "UPDATE users SET galaxy$aktualiskapu ='$kapukesz' WHERE userid='$userid'");
		}
		if(isset($_POST["porgetes1sevel"])){
			if($_SESSION["kredit"] >= 100){
				for($szam=0; $szam <1; $szam++){
					$veletlenszeru= rand(1,10000);
					if($veletlenszeru <= 900 ){
						if($galaxy[1]+$kapureszek < $galaxyatjaroreszek){
							$kapureszek++;
						}
					}elseif($veletlenszeru >= 1001 and $veletlenszeru <= 1200){
						$kreditbonusz=$kreditbonusz+25;
					}elseif($veletlenszeru >= 2001 and $veletlenszeru <= 2140){
						$kreditbonusz=$kreditbonusz+50;
					}elseif($veletlenszeru >= 3001 and $veletlenszeru <= 3120){
						$kreditbonusz=$kreditbonusz+75;
					}elseif($veletlenszeru >= 4001 and $veletlenszeru <= 4140){
						$kreditbonusz=$kreditbonusz+100;
					}elseif($veletlenszeru >= 5001 and $veletlenszeru <= 5020){
						$kreditbonusz=$kreditbonusz+500;
					}elseif($veletlenszeru >= 6001 and $veletlenszeru <= 6020){
						$kreditbonusz=$kreditbonusz+1000;
					}elseif($veletlenszeru >= 7001 and $veletlenszeru <= 7010){
						$kreditbonusz=$kreditbonusz+2000;
					}elseif($veletlenszeru >= 8001 and $veletlenszeru <= 8005){
						$kreditbonusz=$kreditbonusz+10000;
					}elseif($veletlenszeru == 10000){
						$kreditbonusz=$kreditbonusz+50000;
					}
				}
				$kredit=$kreditbonusz-100;
				$tomb=serialize(array($galaxy[0],$galaxy[1]+$kapureszek,$galaxy[2]));
				$porgeteslogup=serialize(array(1,1,-100,$kapureszek,$kreditbonusz));
				mysqli_query($conn , "UPDATE users SET kredit=kredit+'$kredit' , galaxy$aktualiskapu ='$tomb' , porgeteslog='$porgeteslogup' WHERE userid='$userid'");
				header ("Location: portya.php?galaxy=$aktualiskapu");
			}else{
				echo "<div style='color:white;'>Ehez nincs elég kredited!</div>";
			}
		}
		if(isset($_POST["porgetes10sevel"])){
			if($_SESSION["kredit"] >= 1000){
				for($szam=0; $szam <10; $szam++){
					$veletlenszeru= rand(1,1000);
					if($veletlenszeru >= 1 and $veletlenszeru <= 100 ){
						if($galaxy[1]+$kapureszek < $galaxyatjaroreszek){
							$kapureszek++;
						}
					}elseif($veletlenszeru >= 101 and $veletlenszeru <= 200){
						$kreditbonusz=$kreditbonusz+25;
					}elseif($veletlenszeru >= 201 and $veletlenszeru <= 250){
						$kreditbonusz=$kreditbonusz+50;
					}elseif($veletlenszeru >= 301 and $veletlenszeru <= 250){
						$kreditbonusz=$kreditbonusz+75;
					}elseif($veletlenszeru >= 401 and $veletlenszeru <= 430){
						$kreditbonusz=$kreditbonusz+100;
					}elseif($veletlenszeru >= 501 and $veletlenszeru <= 520){
						$kreditbonusz=$kreditbonusz+500;
					}elseif($veletlenszeru >= 601 and $veletlenszeru <= 610){
						$kreditbonusz=$kreditbonusz+1000;
					}elseif($veletlenszeru >= 701 and $veletlenszeru <= 705){
						$kreditbonusz=$kreditbonusz+2000;
					}elseif($veletlenszeru >= 801 and $veletlenszeru <= 802){
						$kreditbonusz=$kreditbonusz+10000;
					}elseif($veletlenszeru == 1000){
						$kreditbonusz=$kreditbonusz+50000;
					}
				}
				$kredit=$kreditbonusz-1000;
				$tomb=serialize(array($galaxy[0],$galaxy[1]+$kapureszek,$galaxy[2]));
				$porgeteslogup=serialize(array(1,10,-1000,$kapureszek,$kreditbonusz));
				mysqli_query($conn , "UPDATE users SET kredit=kredit+'$kredit' , galaxy$aktualiskapu ='$tomb' , porgeteslog='$porgeteslogup' WHERE userid='$userid'");
				header ("Location: portya.php?galaxy=$aktualiskapu");
			}else{
				echo "<div style='color:white;'>Ehez nincs elég kredited!</div>";
			}
		}
		if(isset($_POST["porgetes100saval"])){
			if($_SESSION["kredit"] >= 10000){
				for($szam=0; $szam <100; $szam++){
					$veletlenszeru= rand(1,10000);
					if($veletlenszeru <= 900 ){
						if($galaxy[1]+$kapureszek < $galaxyatjaroreszek){
							$kapureszek++;
						}
					}elseif($veletlenszeru >= 1001 and $veletlenszeru <= 1200){
						$kreditbonusz=$kreditbonusz+25;
					}elseif($veletlenszeru >= 2001 and $veletlenszeru <= 2140){
						$kreditbonusz=$kreditbonusz+50;
					}elseif($veletlenszeru >= 3001 and $veletlenszeru <= 3120){
						$kreditbonusz=$kreditbonusz+75;
					}elseif($veletlenszeru >= 4001 and $veletlenszeru <= 4140){
						$kreditbonusz=$kreditbonusz+100;
					}elseif($veletlenszeru >= 5001 and $veletlenszeru <= 5020){
						$kreditbonusz=$kreditbonusz+500;
					}elseif($veletlenszeru >= 6001 and $veletlenszeru <= 6020){
						$kreditbonusz=$kreditbonusz+1000;
					}elseif($veletlenszeru >= 7001 and $veletlenszeru <= 7010){
						$kreditbonusz=$kreditbonusz+2000;
					}elseif($veletlenszeru >= 8001 and $veletlenszeru <= 8005){
						$kreditbonusz=$kreditbonusz+10000;
					}elseif($veletlenszeru == 10000){
						$kreditbonusz=$kreditbonusz+50000;
					}
				}
				$kredit=$kreditbonusz-10000;
				$tomb=serialize(array($galaxy[0],$galaxy[1]+$kapureszek,$galaxy[2]));
				$porgeteslogup=serialize(array(1,100,-10000,$kapureszek,$kreditbonusz));
				mysqli_query($conn , "UPDATE users SET kredit=kredit+'$kredit' , galaxy$aktualiskapu ='$tomb' , porgeteslog='$porgeteslogup' WHERE userid='$userid'");
				header ("Location: portya.php?galaxy=$aktualiskapu");
			}else{
				echo "<div style='color:white;'>Ehez nincs elég kredited!</div>";
			}
		}
		?>
		<table style="border-width:1px;border-style:double;color:white;width:810px;height:500px;margin:0 auto;background-color: rgba(0, 0, 0, 0.8);">
			<tr>
				<td style="border-width:1px;border-style:double;width:300px;height:500px;">
					<div style="border-width:1px;border-style:double;width:300px;height:500px;">
						<?php
						$galaxis_sql=mysqli_query($conn , "SELECT * FROM galaxy WHERE aktiv=1");
						while($galaxis = mysqli_fetch_object($galaxis_sql)){
							echo "
								<div style='border-width:1px;border-style:double;width:300px;height:48px;'>
									<form method='post' action='portya.php?galaxy=".$galaxis->galaxisid."'>
										<input type='submit' name='galaxy".$galaxis->galaxisid."' value='Galaxy ".$galaxis->galaxisid."'>
									</form>
								</div>
							";
						}
						?>
					</div>
				</td>
				<td style="border-width:1px;border-style:double;width:510px;height:500px;">
					<table style="border-width:1px;border-style:double;color:white;width:490px;height:500px;margin:0 auto;">
						<tr style="margin:10 20;">
							<td>
								<table style="color:white;">
									<tr>
										<td style="border-width:1px;border-style:double;width:300px;height:265px;">
											<?php
											if($galaxy[1] != $galaxyatjaroreszek){
												echo "<a style='font-size:24;'>".$galaxy[1]."/".$galaxyatjaroreszek."</a>";
											}else{
												echo"
												<a>Kapu kirakva!</a><br>
												<form method='post' action='portya.php?galaxy=".$aktualiskapu."&start'>
													<input type='submit' name='startgalaxy' value='START'>
												</form>
												";
											}
											?>
										</td>
										<td style="border-width:1px;border-style:double;width:180px;height:265px;text-align:center">
											<form method="post" action="">
												<input style="color:white;background:transparent;" type="submit" name="porgetes1sevel" value="Pörgetés 1 sével">
											</form>
											<form method="post" action="">
												<input style="color:white;background:transparent;" type="submit" name="porgetes10sevel" value="Pörgetés 10 sével">
											</form>
											<form method="post" action="">
												<input style="color:white;background:transparent;" type="submit" name="porgetes100saval" value="Pörgetés 100 sával">
											</form>
										</td>
									</tr>
									<tr>
										<td style="border-width:1px;border-style:double;width:350px;height:220px;">Kapu leírás:</td>
										<td style="border-width:1px;border-style:double;width:150px;height:220px;">
											<table style="width:180px;height:220px;color:white;">
												<tr>
													<td style="border-width:1px;border-style:double;width:200px;height:20px;text-align:center;">LOG:</td>
												</tr>
												<tr>
													<td style="border-width:1px;border-style:double;width:200px;height:200px;">
														<table style="color:white;text-align:center">
															<?php
															$porgeteslog= unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users"))["porgeteslog"]);
															if($porgeteslog[0] == 1){
																if($porgeteslog[1] != 0){
																	echo "
																	<tr><td>Pörgetés: ".$porgeteslog[1]."x</td></tr>
																	";
																}
																if($porgeteslog[2] != 0){
																	echo "
																	<tr><td>Kaptál: ".$porgeteslog[2]." kreditet</td></tr>
																	";
																}
																echo "
																<tr><td>Kaptál: ".$porgeteslog[3]." kapurészt</td></tr>
																<tr><td>Kaptál: ".$porgeteslog[4]." kreditet</td></tr>
																";
															}elseif($porgeteslog[0] == 2){
																echo "
																<tr><td>".$aktualiskapu." átjaró teljesitve!</td></tr>
																<tr><td>Kaptál ".$porgeteslog[1]." tapasztalatpontot!</td></tr>
																<tr><td>Kaptál ".$porgeteslog[2]." kreditet!</td></tr>
																";
															}
															?>
														</table>
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
		</table>
		<?php
}elseif(isset($_GET["start"])){
	$aktualiskapu=$_GET["galaxy"];
	$kapu= unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$userid'"))["galaxy".$aktualiskapu]);
	$log= unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid='$userid'"))["galaxylog"]);
	if($kapu[0] != 0){
		$npcszam=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM galaxy WHERE galaxisid='$aktualiskapu'"))["npcszam"];
		if($kapu[2] == $npcszam+1){
			$kapuvege=serialize(array(0,0,1));
			$jutalom=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM galaxy WHERE galaxisid='$aktualiskapu'"))["jutalom"]);
			$jutalomlog=serialize(array(2,$jutalom[1],$jutalom[2]));
			mysqli_query($conn , "UPDATE users SET tapasztalat=tapasztalat+$jutalom[1] , kredit=kredit+$jutalom[2] , galaxy$aktualiskapu='$kapuvege' , porgeteslog='$jutalomlog' WHERE userid='$userid'");
			header ("Location: portya.php?galaxy=$aktualiskapu&start");
		}
	$npc= unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM galaxy WHERE galaxisid=$aktualiskapu"))["npc".$kapu[2]]);
	if(isset($_POST["megtamadas"])){
		$npc_erteke=0;
		$jatekos_erteke=0;
		if($npc[2] > $_SESSION["elet"]){
			$npc_erteke++;
		}elseif($npc[2] == $_SESSION["elet"]){
			$npc_erteke++;
			$jatekos_erteke++;
		}elseif($npc[2] < $_SESSION["elet"]){
			$jatekos_erteke++;
		}
		if($npc[3] > $_SESSION["pajzs"]){
			$npc_erteke++;
		}elseif($npc[3] == $_SESSION["pajzs"]){
			$npc_erteke++;
			$jatekos_erteke++;
		}elseif($npc[3] < $_SESSION["pajzs"]){
			$jatekos_erteke++;
		}
		if($npc[4] > $_SESSION["sebzes"]){
			$npc_erteke++;
		}elseif($npc[4] == $_SESSION["sebzes"]){
			$npc_erteke++;
			$jatekos_erteke++;
		}elseif($npc[4] < $_SESSION["sebzes"]){
			$jatekos_erteke++;
		}
		if($npc[5] > $_SESSION["sebesseg"]){
			$npc_erteke++;
		}elseif($npc[5] == $_SESSION["sebesseg"]){
			$npc_erteke++;
			$jatekos_erteke++;
		}elseif($npc[5] < $_SESSION["sebesseg"]){
			$jatekos_erteke++;
		}
		if($npc[6] > $_SESSION["generator"]){
			$npc_erteke++;
		}elseif($npc[6] == $_SESSION["generator"]){
			$npc_erteke++;
			$jatekos_erteke++;
		}elseif($npc[6] < $_SESSION["generator"]){
			$jatekos_erteke++;
		}
		if($npc_erteke > $jatekos_erteke){
			echo "vesztettél";
		}elseif($npc_erteke == $jatekos_erteke){
			echo "döntetlen";
		}elseif($npc_erteke < $jatekos_erteke){
			$galaxytomb=serialize(array(1,$kapu[1],$kapu[2]+1));
			$logtomb=serialize(array(1,$aktualiskapu,$npc[0],1,$npc[7],$npc[8]));
			mysqli_query($conn , "UPDATE users SET tapasztalat=tapasztalat+'$npc[7]' , kredit=kredit+'$npc[8]' ,galaxy$aktualiskapu='$galaxytomb' , galaxylog='$logtomb' WHERE userid='$userid'");
			header ("Location: portya.php?galaxy=$aktualiskapu&start");
		}
	}
	?>
	<table style="color:white;border-width:2px;border-style:double;width: 950px;height: 350px;margin:0 auto;background-color: rgba(0, 0, 0, 0.7);">
		<tr>
			<td>
				<table style="color:white;border-width:2px;border-style:double;width: 700px;height: 350px;">
					<tr>
						<td style="border-width:1px;border-style:double;width:700px;height:30px;text-align:center;" colspan="2">
							<?php
							echo "GALAXY ".$_GET["galaxy"];
							?>
						</td>
					</tr>
					<tr>
						<td style="border-width:1px;border-style:double;width:275px;height:275px;text-align:center;" align="center">
							<table style="color:white;width:275px;height:270px;">
								<tr>
									<td style="border-width:1px;border-style:double;width:275px;height:250px;">Kép</td>
								</tr>
								<tr>
									<td style="border-width:1px;border-style:double;width:275px;height:20px;text-align:center;"><?php echo $npc[1]; ?>
									</td>
								</tr>
							</table>
						</td>
						<td style="border-width:1px;border-style:double;width:425px;height:275px;">
							<table style="color:white;border-width:1px;border-style:double; width: 420px;height:275px;text-align:center;">
								<tr>
									<td style="width:415px;height:30px;">Életerő:</td>
									<td style="width:415px;height:30px;"><?php echo $npc[2];?></td>
								</tr>
								<tr>
									<td style="width:415px;height:30px;">Pajzs:</td>
									<td style="width:415px;height:30px;"><?php echo $npc[3];?></td>
								</tr>
								<tr>
									<td style="width:415px;height:30px;">Sebzés:</td>
									<td style="width:415px;height:30px;"><?php echo $npc[4];?></td>
								</tr>
								<tr>
									<td style="width:415px;height:30px;">Sebesség:</td>
									<td style="width:415px;height:30px;"><?php echo $npc[5];?></td>
								</tr>
								<tr>
									<td style="width:415px;height:30px;">Generátor:</td>
									<td style="width:415px;height:30px;"><?php echo $npc[6];?></td>
								</tr>
								<tr>
									<td style="width:415px;height:30px;">Tapasztalat jutalom:</td>
									<td style="width:415px;height:30px;"><?php echo $npc[7];?></td>
								</tr>
								<tr>
									<td style="width:415px;height:30px;">Kredit jutalom:</td>
									<td style="width:415px;height:30px;"><?php echo $npc[8];?></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td style="width:700px;height:20px;text-align:center;" colspan="2">
						<div align="center">
						<form style="height:1px;display:table-cell;" method="post" action="">
							<input style="background:transparent;color:white;" type="submit" name="megtamadas" value="Megtamádas">
						</form>
						<form style="height:1px;display:table-cell;" method="post" action="portya.php?galaxy=1">
							<input style="background:transparent;color:white;" type="submit" name="vissza" value="Vissza az átjarokhoz">
						</form>
						</div>
						</td>
					</tr>
				</table>
			</td>
			<td>
				<table style="color:white;border-width:2px;border-style:double;width: 250px;height: 350px;">
					<tr>
						<td style="border-width:1px;border-style:double;width:245px;height:20px;text-align:center;">LOG:</td>
					</tr>
					<tr>
						<td style="border-width:1px;border-style:double;width:245px;height:310px;">
							<?php
							if($log[0] == 1){
								?>
								<table style="color:white;width:240px;text-align:center;">
									<tr>
										<td>Galaxis: <?php echo $log[1];?></td>
									</tr>
									<tr>
										<td>Npc: <?php echo $log[2];?></td>
									</tr>
									<?php
								if($log[3] ==1){
									echo "
									<tr><td>Eredmény: Nyertél!</td></tr>
									<tr><td>Kaptál:".$log[4]." tapasztalatpontot.</td></tr>
									<tr><td>Kaptál:".$log[5]." kreditet.</td></tr>
									";
								}elseif($log[3] == 0){
									echo "
									<tr><td>Eredmény: Vesztettél!</td></tr>
									";
								}
							}
							?>
								</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
		<?php
	}else{
		header ("Location: portya.php?galaxy=$aktualiskapu");
	}
}
?>
</body>
</html>