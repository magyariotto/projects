<?php
include("inc/connect.php");
mysqli_query ($conn , "UPDATE users SET energia=energia+1 WHERE (energia<10)");
?>