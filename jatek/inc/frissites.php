<?php
include "connect.php";
$userid=$_SESSION["userid"];
$sql="SELECT * FROM users WHERE userid='$userid'";
$lekeres=mysqli_query($conn , $sql);
if ( mysqli_num_rows( $lekeres ) == 1 ) {
	$user = mysqli_fetch_assoc( $lekeres);
	{
		$_SESSION["userid"]=$user["userid"];
		$_SESSION["szint"]=$user["szint"];
		$_SESSION["kredit"]=$user["kredit"];
		$_SESSION["terra"]=$user["terra"];
		$_SESSION["aktivbazis"]=$user["aktivbazis"];
	    $_SESSION["username"]=$user["username"];
        $_SESSION["email"]=$user["email"];
		$_SESSION["password"]=$user["password"];
		$_SESSION["datum"]=$user["datum"];
		$_SESSION["nemed"]=$user["nemed"];
		$_SESSION["pontszam"]=$user["pontszam"];
		$_SESSION["energia"]=$user["energia"];
		$_SESSION["megnyertp"]=$user["megnyertp"];
		$_SESSION["elvesztettp"]=$user["elvesztettp"];
		$_SESSION["faj"]=$user["faj"];
		if($_SESSION["faj"] == 1){
			$fajom="Ember";
		}elseif($_SESSION["faj"] == 2){
			$fajom="Fantom";
		}
		$_SESSION["fejlesztesszint"]=$user["fejlesztesszint"];
		$_SESSION["kalozid"]=$user["kalozid"];
		$tp=unserialize($user["tp"]);
		$_SESSION["altp"]=$tp[0];
		$_SESSION["ossztp"]=$tp[1];
		
		
		
		$nyersanyagok=unserialize($user["nyersanyagok"]);
		$raktaron_iridium=$nyersanyagok[0];
		$raktaron_radon=$nyersanyagok[1];
		$raktaron_uran=$nyersanyagok[2];
		$raktaron_tantal=$nyersanyagok[3];
		$raktaron_palladium=$nyersanyagok[4];
		
		
		
		//********************************szintlepes jutalma********************
		//************************************SZINT*****************************
		$kovetkezo_szint=$_SESSION["szint"]+1;
		$sql_szintek_kovetkezo = mysqli_query($conn , "SELECT * FROM szintek WHERE szint=$kovetkezo_szint");
		if (mysqli_num_rows($sql_szintek_kovetkezo) == 1){
			$kovetkezo_sor = mysqli_fetch_assoc($sql_szintek_kovetkezo);
			{
				$_SESSION["kovetkezo_szint"]=$kovetkezo_sor["szint"];
				$_SESSION["kovetkezo_szint_ossztp"]=$kovetkezo_sor["ossztp"];
				$_SESSION["kovetkezo_szint_altp"]=$kovetkezo_sor["altp"];
			}
		}
		if($_SESSION["ossztp"] >= $_SESSION["kovetkezo_szint_ossztp"]){
			$modosit="UPDATE users SET szint=szint+1 WHERE userid='$userid'";
			mysqli_query($conn , $modosit);
		}
	}
}
//**************************************************SZOVETSEG******************************************************
$szovetsegem=unserialize(mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM users WHERE userid=$userid"))["szovetseg"]);
$aktualis_szovetseg=$szovetsegem[0];
$rangom_szovetseg=$szovetsegem[1];
$szovetsegkassza=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["kassza"]);
$_SESSION["szovetseg_kredite"]=$szovetsegkassza[0];
$_SESSION["szovetseg_terraja"]=$szovetsegkassza[1];
$_SESSION["szovetsegletszam"]=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["letszam"];
$szovetsegtagok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["szovetsegtagok"]);
//********************************************SZOVETSEG****BONUSZOK************************************************
$bonusz=array("eletbonusz","pajzsbonusz","sebzesbonusz","sebessegbonusz","generatorbonusz");
if($aktualis_szovetseg > 0){
	$megnevezesek1=array("eletbonuszszint","pajzsbonuszszint","sebzesbonuszszint","sebessegbonuszszint","generatorbonuszszint","letszambonuszszint");
	$megnevezesek2=array("eletbonuszar","pajzsbonuszar","sebzesbonuszar","sebessegbonuszar","generatorbonuszar","letszambonuszar");
	$szovetsegbonuszok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM szovetseg WHERE id=$aktualis_szovetseg"))["bonuszok"]);
	for($i=0;$i<=5;$i++){
		$_SESSION[$megnevezesek1[$i]]=$szovetsegbonuszok[$i];
		$_SESSION[$megnevezesek2[$i]]=pow($szovetsegbonuszok[$i]+1 , 3)*20;
	}
	for($i=0;$i<=4;$i++){
		
		$_SESSION[$bonusz[$i]]=($szovetsegbonuszok[$i])*0.2;
	}
}else{
	for($i=0;$i<=4;$i++){
		$_SESSION[$bonusz[$i]]=0;
	}
}
//**************************************************STATTOK********************************************************
$megnevezesek=array("eletszint","elet","pajzsszint","pajzs","sebzesszint","sebzes","sebessegszint","sebesseg","generatorszint","generator");
$stattok=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM users WHERE userid=$userid"))["stattok"]);
for($i=0;$i<=9;$i++){
	$_SESSION[$megnevezesek[$i]]=$stattok[$i];
}
//**************************************************munka********************************************************
$munkahelyek_szama=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM munkahelyek WHERE id = (select max(id) from munkahelyek)"))["id"];
$munka_sql="select * from munka WHERE id='$userid'";
$munka_lekeres=mysqli_query($conn , $munka_sql);
if ( mysqli_num_rows( $munka_lekeres ) == 1 ) {
	$user = mysqli_fetch_assoc( $munka_lekeres);
	{
		$_SESSION["dolgozik"]=$user["dolgozik"];
		$munkaido_sec=$user["munkaido_sec"];
		$kezdes_ido=is_numeric($user["kezdes"]);
		$jelen_ido= is_numeric(time());
		$eltelt_ido=$jelen_ido-$kezdes_ido;
		$munkaido=$munkaido_sec/60 - $eltelt_ido/60;
	}
}
$id_munkahoz=0;
do {
$id_munkahoz++;
$sql_munkahoz="select * from munka WHERE id=$id_munkahoz and dolgozik=1";
		$lekeres_munkahoz=mysqli_query($conn , $sql_munkahoz);
		if ( mysqli_num_rows( $lekeres_munkahoz ) == 1 ) {
			$user_munka = mysqli_fetch_assoc( $lekeres_munkahoz);
			{
				$userid_munka=$user_munka["id"];
				$munkaido_munka=$user_munka["munkaido"];
				$munkaido_sec_munka=$user_munka["munkaido_sec"];
				$munkahely_id_munka=$user_munka["munkahely_id"];
				$kezdes_ido_munka=$user_munka["kezdes"];
				$jelen_ido_munka= time();
				$eltelt_ido_munka=$jelen_ido_munka-$kezdes_ido_munka;
			}
			if($eltelt_ido_munka > $munkaido_sec_munka){
				$munka_vege_sql_munka="UPDATE munka SET kezdes=0,munkahely_id=0,munkaido=0,munkaido_sec=0,dolgozik=0 WHERE id=$id_munkahoz";
				mysqli_query($conn , $munka_vege_sql_munka);
				$munkahelyek_sql_munka="SELECT * FROM munkahelyek WHERE id=$munkahely_id_munka";
				$munkahelyek_lekeres_munka=mysqli_query($conn , $munkahelyek_sql_munka);
				if ( mysqli_num_rows( $munkahelyek_lekeres_munka ) == 1 ) {
				$user_munka = mysqli_fetch_assoc( $munkahelyek_lekeres_munka);
				{
					$oraber_munka=$user_munka["oraber"];
				}
				}
				$jutalom_munka=$oraber_munka*$munkaido_munka;
				$munka_jutalom_sql_munka="UPDATE users SET kredit=kredit+$jutalom_munka WHERE userid=$id_munkahoz";
				mysqli_query($conn , $munka_jutalom_sql_munka);
			}else{
				$hatravan_perc_munka=$munkaido_sec_munka/60 - $eltelt_ido_munka/60;
			}
		}
			
} while ($id_munkahoz<1000);
//***************************************************Felszereles*************************************************
$felszereles_sql="SELECT * FROM felszerelesem WHERE userid='$userid'";
$felszereles_lekeres=mysqli_query($conn , $felszereles_sql);
if(mysqli_num_rows($felszereles_lekeres) == 1){
	$slot = mysqli_fetch_assoc($felszereles_lekeres);
	{
		$_SESSION["b1"]=$slot["b1"];
		$_SESSION["b2"]=$slot["b2"];
		$_SESSION["b3"]=$slot["b3"];
		$_SESSION["b4"]=$slot["b4"];
		$_SESSION["b5"]=$slot["b5"];
		$_SESSION["p1"]=$slot["p1"];
		$_SESSION["p2"]=$slot["p2"];
		$_SESSION["p3"]=$slot["p3"];
		$_SESSION["p4"]=$slot["p4"];
		$_SESSION["p5"]=$slot["p5"];
		$_SESSION["l1"]=$slot["l1"];
		$_SESSION["l2"]=$slot["l2"];
		$_SESSION["l3"]=$slot["l3"];
		$_SESSION["l4"]=$slot["l4"];
		$_SESSION["l5"]=$slot["l5"];
		$_SESSION["m1"]=$slot["m1"];
		$_SESSION["m2"]=$slot["m2"];
		$_SESSION["m3"]=$slot["m3"];
		$_SESSION["m4"]=$slot["m4"];
		$_SESSION["m5"]=$slot["m5"];
		$_SESSION["g1"]=$slot["g1"];
		$_SESSION["g2"]=$slot["g2"];
		$_SESSION["g3"]=$slot["g3"];
		$_SESSION["g4"]=$slot["g4"];
		$_SESSION["g5"]=$slot["g5"];
	}
}
$burkolat_slot_tomb = array($_SESSION["b1"],$_SESSION["b2"],$_SESSION["b3"],$_SESSION["b4"],$_SESSION["b5"]);
$burkolat_targyak_elofordulasimerteke = array_count_values($burkolat_slot_tomb);
$pajzs_slot_tomb = array($_SESSION["p1"],$_SESSION["p2"],$_SESSION["p3"],$_SESSION["p4"],$_SESSION["p5"]);
$pajzs_targyak_elofordulasimerteke = array_count_values($pajzs_slot_tomb);
$lezer_slot_tomb = array($_SESSION["l1"],$_SESSION["l2"],$_SESSION["l3"],$_SESSION["l4"],$_SESSION["l5"]);
$lezer_targyak_elofordulasimerteke = array_count_values($lezer_slot_tomb);
$meghajto_slot_tomb = array($_SESSION["m1"],$_SESSION["m2"],$_SESSION["m3"],$_SESSION["m4"],$_SESSION["m5"]);
$meghajto_targyak_elofordulasimerteke = array_count_values($meghajto_slot_tomb);
$generator_slot_tomb = array($_SESSION["g1"],$_SESSION["g2"],$_SESSION["g3"],$_SESSION["g4"],$_SESSION["g5"]);
$generator_targyak_elofordulasimerteke = array_count_values($generator_slot_tomb);
//***************************************************AKTIV***BAZIS**********************************************
$aktivbazis=$_SESSION["aktivbazis"];
$aktivbazisertekek_lekeres=mysqli_query($conn , "SELECT * FROM targyak WHERE azonosito=$aktivbazis");
if(mysqli_num_rows($aktivbazisertekek_lekeres) == 1){
	$row = mysqli_fetch_assoc($aktivbazisertekek_lekeres);
	{
		$_SESSION["burkolatertek"]=$row["burkolatertek"];
		$_SESSION["pajzsertek"]=$row["pajzsertek"];
		$_SESSION["lezerertek"]=$row["lezerertek"];
		$_SESSION["meghajtoertek"]=$row["meghajtoertek"];
		$_SESSION["generatorertek"]=$row["generatorertek"];
		$_SESSION["burkolatslotszam"]=$row["burkolatslotszam"];
		$_SESSION["pajzsslotszam"]=$row["pajzsslotszam"];
		$_SESSION["lezerslotszam"]=$row["lezerslotszam"];
		$_SESSION["meghajtoslotszam"]=$row["meghajtoslotszam"];
		$_SESSION["generatorslotszam"]=$row["generatorslotszam"];
	}
}
$aktivbazisneve=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM uzlet WHERE azonosito=$aktivbazis"))["megnevezes"];
//***************************************************BANYAK**********************************************
$iridium_banyak_szama=mysqli_fetch_assoc(mysqli_query($conn , "SELECT max(sorszam) as sorszam FROM banyak WHERE besorolas = 1"))["sorszam"];
for($iba=1;$iba<=$iridium_banyak_szama;$iba++){
	$_SESSION["iridiumbanya_".$iba."_alaptermeles"]=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM banyak WHERE (besorolas=1) and (sorszam=$iba)"))["alaptermeles"];
}
//*********************************************Iridium***Termeles*******************************************
$iridium_banyak_szint=unserialize(mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM nyersanyagtermeles WHERE userid=$userid"))["iridium_banyak_szint"]);
for($ib_sz=0;$ib_sz<=($iridium_banyak_szama-1);$ib_sz++){
	$_SESSION["iridium_banya_".($ib_sz+1)."_szint"] = $iridium_banyak_szint[$ib_sz];
	if($iridium_banyak_szint[$ib_sz] > 0){
		$banya_szintje=$iridium_banyak_szint[$ib_sz];
		$banya_alaptermelese=$_SESSION["iridiumbanya_".($ib_sz+1)."_alaptermeles"];
		$_SESSION["iridiumbanyaszam".($ib_sz+1)."termeles"]=$banya_alaptermelese*pow($banya_szintje , 2);
	}
}
//***************************************************EPULETEK**********************************************
$epuletek_szama=mysqli_fetch_assoc(mysqli_query($conn , "SELECT max(azonosito) as azonosito FROM epuletek WHERE statusz = 1"))["azonosito"];
for($esz=1;$esz<=$epuletek_szama;$esz++){
	$_SESSION["epulet_".$esz."_nev"]=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM epuletek WHERE azonosito=$esz"))["nev"];
	$_SESSION["epulet_".$esz."_lvl"]=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM epuleteim WHERE userid=$userid"))["epulet_id:".$esz];
	$_SESSION["epulet_".$esz."_szintkorlat"]=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM epuletek WHERE azonosito=$esz"))["szintkorlat"];
}





//***************************************************URHAJOK**********************************************
$urhajo_tipusok_szama=mysqli_fetch_assoc(mysqli_query($conn , "SELECT max(azonosito) as azonosito FROM urhajok WHERE aktiv = 1"))["azonosito"];
for($utsz=1;$utsz<=$urhajo_tipusok_szama;$utsz++){
	$_SESSION["urhajo_".$utsz."_nev"]=mysqli_fetch_assoc(mysqli_query($conn , "SELECT * FROM urhajok WHERE azonosito=$utsz"))["nev"];
	$_SESSION["urhajo_".$utsz."_kep"]=mysqli_fetch_assoc(mysqli_query($conn, "SELECT * FROM urhajok WHERE azonosito=$utsz"))["kep"];
}


?>