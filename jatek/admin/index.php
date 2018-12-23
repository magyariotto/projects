<html>
<body style="background-image: url('../img/hatter_body.png');">
<?php
  session_start();
  ob_start();
  include("../inc/connect.php");
include("inc/belepes.php");
if(isset($_GET["kilepes"]))
include("inc/kilepes.php");
if(isset($_SESSION["adminbelepve"]))
{
header("Location: inc/kezdolap.php");
}
?>
</body>
</html>