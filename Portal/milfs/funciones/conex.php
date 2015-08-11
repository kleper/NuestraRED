<?php
function Conectarse(){
	if ( !isset ( $link ) ) {
		
	include("includes/datos.php");
   		if(!isset($db)) {
   include("milfs/includes/datos.php");
   		}
//$err_level = error_reporting(0);
   if (!($link=mysql_connect($servidor,$usuario,$password)))
   {
   	//error_reporting($err_level); 
      echo "Error conectando a la base de datos.";
      exit();
   }
   if (!mysql_select_db($db,$link))
   {
   	//error_reporting($err_level); 
      echo "Error seleccionando la base de datos.";
      exit();
   }
   
	$_SESSION['path']= $path_instalacion;
	$_SESSION['path_images_secure']= $path_images_secure;
	$_SESSION['url']= $url;
	$_SESSION['upload_size']= $upload_size;
   return $link;
   }
}

?>