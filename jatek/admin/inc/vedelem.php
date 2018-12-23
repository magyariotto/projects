<?php
session_id("sessionadmin");
session_start("sessionadmin");  
if(isset($_SESSION["adminbelepve"])) 
$_SESSION["adminbelepve"] = true;   
if (!$_SESSION["adminbelepve"])   
{  
  session_destroy("sessionadmin");  
  header("location: nincsbelepve.php");  
  exit;   
} 
?>