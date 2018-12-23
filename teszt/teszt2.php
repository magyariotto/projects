<?php
echo "<table style='border-width:2px;border-style:double;'>";
$osszar=0;
for($i=1;$i<=150;$i++){
	$ar=$i*$i*20*$i;
	$osszar=$osszar+$ar;
	echo "<tr>
			<td style='border-width:1px;border-style:inset;'>Szint: 
			".$i."
			</td>
			<td style='border-width:1px;border-style:inset;'>Bonusz: 
			".$i*0.2 ."%
			</td>
			<td style='border-width:1px;border-style:inset;'>Ar: 
			".number_format($i*$i*20*$i) ." kredit
			</td>
			<td style='border-width:1px;border-style:inset;'>Ossz ar: 
			".number_format($osszar) ." kredit
			</td>
		</tr>";
}
echo "</table>";
?>