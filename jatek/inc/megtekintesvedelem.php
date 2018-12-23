<?php
session_start();  
if (!$_SESSION["userid"])   
{  
  session_destroy();  
  header("location: nincsbelepve.php");  
  exit;   
} 
?>