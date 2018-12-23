<?php
	include "megtekintesvedelem.php";
	include "frissites.php";
	$elet = $_SESSION["elet"];
	$fejlesztesara=$_SESSION["fejlesztesara"];
?>
<html>
<body>
<a>Eletero</a>
<table>
	<tr>
		<td>
			<a style='color:white;'><?php echo $_SESSION["elet"]; ?></a>
		</td>
	</tr>
</table>
<form method='post' style="display:inline">
	<a><?php echo $_SESSION["fejlesztesara"];?><input type="submit" name="eletfejlesztes" value="" style="background-image: url('../img/plus.png'); background-color: transparent;width:22px;margin: 0 0 0 5px;" title="Fejlesztes"></a>
</form>
<br>
<script>
    function burkolatfejlesztes() {
        var value = parseInt(document.getElementById('elet').value, 10);
        value = isNaN(value) ? <?php echo $elet; ?> : value;
        value++;
		window.onload = function() {
		  var box = document.getElementById("box");
		  document.getElementById("gomb").onclick = function() {
			box.style.backgroundColor = "red";
		  }
		}
			var query = <?php mysqli_query ($conn , "UPDATE users SET eletszint=eletszint+1 , elet=elet+1 , kredit=kredit-$fejlesztesara , fejlesztesszint=fejlesztesszint+1 WHERE userid ='$userid' ");?>;
		
        document.getElementById('elet').value = value;
    }
</script>
<div id="box">fgg</div>
<input type="text" id="elet" value="<?php echo $elet; ?>"/>
<input id="gomb" type="button" onclick="burkolatfejlesztes()" value="Fejlesztes" />
</body>
</html>