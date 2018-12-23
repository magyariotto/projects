<?php
	include "connect.php";
	include "frissites.php";
	date_default_timezone_set("Europe/Bucharest");
?>
<link rel="stylesheet" href="../css/header.css">
<script type="text/javascript">
	nd=new Date('<?=date('F j, Y H:i:s')?>')
	function st(){
	nd.setSeconds(nd.getSeconds()+1)
	sd1=nd.getFullYear()
	sd2=nd.getMonth()+1
	if(sd2<10){sd2='0'+sd2}
	sd3=nd.getDate()
	if(sd3<10){sd3='0'+sd3}
	sd4=nd.getHours()
	if(sd4<10){sd4='0'+sd4}
	sd5=nd.getMinutes()
	if(sd5<10){sd5='0'+sd5}
	sd6=nd.getSeconds()
	if(sd6<10){sd6='0'+sd6}
	document.getElementById('nd').innerHTML=' Szerver ido : '+sd4+':'+sd5+':'+sd6
	document.getElementById('nd').style.color = "white";
	}
</script>
<table id="tabla1">
	<tr>
	<td id="td1">
		<table id="tabla2">
			<tr>
				<td id="td2">
					<table id="tabla3" style="color: white;">
						<tr>
							<td id="td7">
								<table id="avatar_tabla">
									<tr>
										<td id="avatar_tabla_td1">AVATÁR</td>
									</tr>
									<tr>
										<td id="avatar_tabla_td2">ID: <?php echo $_SESSION["userid"];?></td>
									</tr>
								</table>
							</td>
							<td id="td8" colspan="2" style="background-image: url('../img/infoboard.jpg');background-size: 100% 100%;">
								<table style="color:white;text-align:center;align:center;margin:0 auto;">
									<tr>
										<td>Név: <?php echo $_SESSION["username"];?></td>
									</tr>
									<tr>
										<td><a>Kredit: <?php echo number_format($_SESSION["kredit"]);?></a></td>
									</tr>
									<tr>
										<td><a>Terra: <?php echo number_format($_SESSION["terra"]);?></a></td>
									</tr>
									<tr>
										<td><a>Energia: <?php echo $_SESSION["energia"];?>/10</a></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
				<td id="td3">
					<table id="tabla4">
						<tr>
							<td id="td4">
							<table id="tabla6">
								<tr>
									<td id="nd"></td>
									<td id="td10"></td>
									<td id="td11">
										<div id="div1"><form method="post" action="ranglista.php?oldal=1"><input type="image" src="../img/gomb_ranglista.png" title="Ranglista" height="22" width="22"></form></div>
										<div id="div1"><form method="post" action="uzenet_bejovo.php"><input type="image" src="../img/gomb_uzenet_olvasott.png" title="Uzenetek" height="22" width="22"></form></div>
										<div id="div1"><form method="post" action="adataimmegvaltoztatasa.php"><input type="image" src="../img/gomb_beallitasok.png" title="Beallitasok" height="22" width="22"></form></div>
										<div id="div1"><form method="post" action="../?kilep"><input type="image" src="../img/gomb_kilepes.png" title="Kijelentkezes" height="22" width="22"></form></div>
									</td>
								</tr>
							</table>
							</td>
						</tr>
						<tr>
							<td id="td5">
								<table id="tabla5">
									<tr>
										<td>
										<style>
										#menu_gomb:hover{
											border-radius: 14px 14px 14px 14px;
											box-shadow: 0 0 30px 5px white;
										}
										</style>
										<a href="index.php"><img src="../img/menu_gomb_kezdolap.png" id="menu_gomb"></a>
										<a href="uzlet.php"><img src="../img/menu_gomb_uzlet.png" id="menu_gomb"></a>
										<a href="gyartelep.php"><img src="../img/menu_gomb_gyartelep.png" id="menu_gomb"></a>
										<a href="flotta.php"><img src="../img/menu_gomb_flotta.png" id="menu_gomb"></a>
										<a href="portya.php"><img src="../img/menu_gomb_portya.png" id="menu_gomb"></a>
										<a href="kuldetesek.php"><img src="../img/menu_gomb_kuldetesek.png" id="menu_gomb"></a>
										<a href="szovetseg.php"><img src="../img/menu_gomb_szovetseg.png" id="menu_gomb"></a></td>
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
<body onload="st();setInterval('st()',1000)" style="background-image: url('../img/hatter_body.png'); background-repeat: no-repeat; width:1400px; height: 95%;">				