<?php
 include('../../inc/connect.php');
 $userid = $_GET['userid'];
 mysqli_query($conn , "DELETE FROM users WHERE userid=$userid");
 header("Location: felhasznalok_megtekintese.php");
?>