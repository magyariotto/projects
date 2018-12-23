<?php
include "connect.php";
if(isset($_POST["feltolt"])){
	$datum=$_POST['nap']." ".$_POST["honap"]." ".$_POST["ev"]." ".$_POST["milyennap"]." ora".$_POST["ido"];
	$szolgalo=$_POST["szolgalo"];
	$helyszin=$_POST["helyszin"];
	$sql="INSERT INTO `alkalmak` (`datum`,`szolgalo`,`helyszin`) VALUES (`$datum`,`$szolgalo`,`$helyszin`);";
	mysqli_query($conn , $sql);
}
?>
<table>
	<tr>
		<td>Datum</td>
		<td>
			<select name="nap">
			  <option value="1">1</option>
			  <option value="2">2</option>
			  <option value="3">3</option>
			  <option value="4">4</option>
			  <option value="5">5</option>
			  <option value="6">6</option>
			  <option value="7">7</option>
			  <option value="8">8</option>
			  <option value="9">9</option>
			  <option value="10">10</option>
			  <option value="11">11</option>
			  <option value="12">12</option>
			  <option value="13">13</option>
			  <option value="14">14</option>
			  <option value="15">15</option>
			  <option value="16">16</option>
			  <option value="17">17</option>
			  <option value="18">18</option>
			  <option value="19">19</option>
			  <option value="20">20</option>
			  <option value="21">21</option>
			  <option value="22">22</option>
			  <option value="23">23</option>
			  <option value="24">24</option>
			  <option value="25">25</option>
			  <option value="26">26</option>
			  <option value="27">27</option>
			  <option value="28">28</option>
			  <option value="29">29</option>
			  <option value="30">30</option>
			  <option value="31">21</option>
			</select>
			<select name="honap">
				<option value="ianuarie">Januar</option>
				<option value="februarie">Februar</option>
				<option value="martie">Marcius</option>
				<option value="aprilie">Aprilis</option>
				<option value="mai">Majus</option>
				<option value="iunie">Junius</option>
				<option value="iulie">Julius</option>
				<option value="august">Augusztus</option>
				<option value="septembrie">Szeptember</option>
				<option value="octombrie">Oktober</option>
				<option value="noiembrie">November</option>
				<option value="decembrie">December</option>
			</select>
			<select name="ev">
				<option value="2016">2016</option>
				<option value="2017">2017</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<?php echo "Ido:";?>
			<input type="text" name="ido" value="">
			<select name="milyennap">
				<option value="luni">Hetfo</option>
				<option value="marți">Kedd</option>
				<option value="miercuri">Szerda</option>
				<option value="joi">Csutortok</option>
				<option value="vineri">Pentek</option>
				<option value="sâmbătă">Szombat</option>
				<option value="duminică">Vasarnap</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>Szolgalo</td>
		<td><input type="text" name="szolgalo" value=""></td>
	</tr>
	<tr>
		<td>Helyszin</td>
		<td><input type="text" name="helyszin" value=""></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<form method="post" action="">
				<input type="submit" name="feltolt" value="Feltolt">
			</form>
		</td>
	</tr>
</table>