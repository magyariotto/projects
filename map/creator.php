<?php
echo '"fields":{';

$szam = 10;
for($x=0;$x<$szam ;$x++){
	for($y=0;$y<$szam ;$y++){
		
		echo 'f'.$x.$y.':{"fieldname"'.'f'.$x.$y.':},"regions":{';
		for($z=0;$z<$szam ;$z++){
			echo '"r'.$x.$z.'"';
			if($z != $szam){
				echo ",";
			}
		}
		echo '}';
		
	}
	echo '},"ownerplayer":""},';
	
}
?>