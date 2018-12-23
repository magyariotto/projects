<?php
unset($_SESSION["adminbelepve"]);
unset($_SESSION["username"]);
unset($_SESSION["email"]);
session_destroy();
ob_end_clean();
header("Location: index.php");
die();
?>
