<?php
/// ESTE ARCHIVO DEBE ESTAR UN NIVEL POR ENCIMA DEL DIRECTORIO milfs 
session_start();
   if(isset($_REQUEST[debug])) {
ini_set('display_errors', 'On');
}
require ('milfs/xajax/xajax.inc.php');
$xajax = new xajax();
//require ('milfs/funciones/funciones.php');
require ('milfs/funciones/convert.php');
require ('milfs/funciones/login.php');
//require ("milfs/funciones/conex.php");
/// FUNCIONES DUMMY SI NO HAY MYSQL INSTALADO
//function Conectarse() {}
//function mysql_query(){}
$razon_social[0] ="NuestraRed.org";
$telefono[0] ="317 8946799";
$email[0] ="correo@nuestrared.org";
$facebook[0] ="https://www.facebook.com/pages/Fundaci%C3%B3n-Vivirenlafinca/337950126302058?fref=ts";
$twitter[0] ="@NuestraRedOrg";
$web[0] ="http://NuestraRed.Org";
$slogan[0] ="Red Comunitaria Colaborativa";

function enviar_mail($formulario) {
	
	$respuesta = new xajaxResponse('utf-8');
	if($formulario['nombre'] =="") { $error ="Por favor dinos tu nombre";}
	elseif($formulario['email'] =="") { $error ="Por favor escribe un correo electrónico para comunicarnos";}
	elseif($formulario['telefono'] =="") { $error ="Necesitamos un número telefónico para comunicarnos";}
	elseif($formulario['mensaje'] =="") { $error ="Cual es tu mensaje ?";}
	else { $error ="";}
	
	if ($error !=""){
$respuesta->addAlert("$error");
		return $respuesta;	

	
	}
	
	
$headers = "MIME-Version: 1.0\r\n"; 
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n"; 
$headers .= "From: NuestraRed.org <correo@nuestrared.org>\r\n"; 
$headers .= "Reply-To: correo@nuestrared.org\r\n"; 
$headers .= "Return-path: correo@nuestrared.org\r\n"; 
$headers .= "Cc: correo@nuestrared.org" . "\r\n";
$asunto ="Mensaje de Nuestra Red ";
$cuerpo ="
<img  src='http://nuestrared.org/images/logo.png' style='width:100%'>
Gracias <strong>$formulario[nombre]</strong> por comunicarse con <a href='NuestraRed.org'>NuestraRed.org</a>
<div>
<h3>$asunto</h3>
<li><strong>Nombre</strong> $formulario[nombre]</li>
<li><strong>Email</strong> $formulario[email]</li>
<li><strong>Teléfono</strong> $formulario[telefono]</li>
<li><strong>Mensaje</strong> $formulario[mensaje]</li>
</div> 
<p>Sigue en contacto con <a href='NuestraRed.org'>NuestraRed.org</a></p>

";

if(mail("$formulario[email]","$asunto","$cuerpo","$headers")){ 
$mensaje  ="$cuerpo";
 }else {$mensaje ="<div class='alert alert-danger'><h2>Error enviando correo </h2>";}


$respuesta->addAssign("div_contacto","innerHTML","$mensaje");
//$respuesta->addAlert("Hola Mundo");
		return $respuesta;	

} 
$xajax->registerFunction("enviar_mail");
 
require ("milfs/includes/markdown.php");
$xajax->processRequests(); 


?>
<!DOCTYPE html>
<html lang="en">
   <head >
    <meta charset="utf-8">
    <meta name="viewport" content="user-scalable=no, width=device-width,  maximum-scale=1,  initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="fredyrivera" >
     <?php $xajax->printJavascript("milfs/xajax/");  ?>
    <link rel="shortcut icon" href="favicon-152.png">
	<link rel="apple-touch-icon-precomposed" href="favicon-152.png">
	<link href="milfs/css/font-awesome/css/font-awesome.css" rel="stylesheet">
<!--  <link href="http://getbootstrap.com/examples/sticky-footer-navbar/sticky-footer-navbar.css" rel="stylesheet"> -->

<!-- <script src="http://cdn.leafletjs.com/leaflet-0.7/leaflet.js"></script> -->

<!-- <link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7/leaflet.css" /> -->
<link href="milfs/css/bootstrap.min.css" rel="stylesheet">
<link href="milfs/css/estilos.php" rel="stylesheet">

<!--   <script src="http://code.jquery.com/jquery-2.1.0.min.js"></script> -->
<!--   <link rel="points" type="application/json" href="json.php?id=<?php echo $_REQUEST["id"] ?>"> -->
<link href="milfs/css/carousel.css" rel="stylesheet">
<style type="text/css">
body {
    background: url("") no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;
    background-size: cover;
    color: green;
    background-color: white;}
.alert-info{
color: #341208;
border-color:  #341208;
background-image: url("");
}

.jumbotron {
/*background-image: url("milfs/nuestrared/images/logoNR.png");*/ 
background-size: cover;
/*background-position: center;*/
/* text-shadow:  1px 1px 1px rgba(255,255,255,0.8) ; */
background-color: white;


}
.navbar{background-color: green;}
.navbar-header > p { font-size:20px; color: white; font-family: "Open Sans",sans-serif; font-weight: normal;display:inline }
.navbar-header > strong{ font-size:20px; color:white; font-weight: normal; font-family: "Open Sans",sans-serif; ;display:inline}
/*.navbar-header {width: 50%;}*/

.div_aplicacion {
background-color: #f0eee1 !important;
}
.div_aplicacion:hover {
   -webkit-animation: animatedBackground 1s ease-out 1;
        -moz-animation: animatedBackground 1s ease-out 1;
        animation: animatedBackground 1s ease-out 1;
        -webkit-animation-fill-mode: forwards;
        animation-fill-mode: forwards;
        z-index: 10000;
}

    @-webkit-keyframes animatedBackground {
        0% {
            -webkit-transform: scale(1, 1);
            -moz-transform: scale(1, 1);
            -ms-transform: scale(1, 1);
            -o-transform: scale(1, 1);
            transform: scale(1, 1)
        }
        100% {
        -webkit-transform: scale(1.1, 1.1);
        -moz-transform: scale(1.1, 1.1);
        -ms-transform: scale(1.1, 1.1);
        -o-transform: scale(1.1, 1.1);
        transform: scale(1.1, 1.1)
        }

    }
    
    
    @-moz-keyframes animatedBackground {
        0% {
            -webkit-transform: scale(1, 1);
            -moz-transform: scale(1, 1);
            -ms-transform: scale(1, 1);
            -o-transform: scale(1, 1);
            transform: scale(1, 1)
        }
        100% {
            -webkit-transform: scale(1.1, 1.1);
            -moz-transform: scale(1.1, 1.1);
            -ms-transform: scale(1.1, 1.1);
            -o-transform: scale(1.1, 1.1);
            transform: scale(1.1, 1.1)
        }

    }
    @keyframes animatedBackground {
        0% {
            -webkit-transform: scale(1, 1);
            -moz-transform: scale(1, 1);
            -ms-transform: scale(1, 1);
            -o-transform: scale(1, 1);
            transform: scale(1, 1)
        }
        100% {
            -webkit-transform: scale(1.1, 1.1);
            -moz-transform: scale(1.1, 1.1);
            -ms-transform: scale(1.1, 1.1);
            -o-transform: scale(1.1, 1.1);
            transform: scale(1.1, 1.1)
        }

    }
</style>
<?php if($_REQUEST[id] !='' AND $_REQUEST[c]){$onload ="<script type=\"text/javascript\"> xajax_formulario_modal('$_REQUEST[id]','','$_REQUEST[c]','$_REQUEST[t]')</script>";} ?>
</head>
<body>
  <body><?php echo $onload; ?>

      <nav class="navbar navbar" role="navigation">
      	<div class="container-fluid">
      	  <div class='col-sx-12 ' id='logo_cabecera' style='width:100%;left:40px; background-color: white; '>
      	 
		      <div class='pull-right' >
		      	<div style="">
		      	<a title="Email" target="_redes" href="mailto:<?php echo $email[0];?>"><span style='font-size:20px; color:#E6E6E6'><i class='fa fa-envelope'></i></span></a>
		      	<a title="Facebook" target="_redes" href="<?php echo $facebook[0];?>"><span style='font-size:20px; color:#E6E6E6'><i class='fa fa-facebook-square'></i></span></a>
		      	<a title="Twitter" target="_redes" href="https://twitter.com/<?php echo $twitter[0];?>"><span style='font-size:20px; color:#E6E6E6'><i class='fa fa-twitter'></i></span></a>
		      	<a title="Inicio" target="" href="?"><span style='font-size:20px; color:#E6E6E6'><i class='fa fa-home'></i></span></a>
		      	
		      	</div>
		      	
		      </div>
	      </div>
          <div class="navbar-header" style="  ">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            
            	<p>|<?php echo $razon_social[0];?>|</p>
	
				
          </div>
          <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
            
					<li></li>
              
            </ul>

          </div><!--/.nav-collapse -->
		</div>
      </nav>
	<div class='container alert alert-danger' ><h1>Nuestrared.org <div class='lead'>Es un proyecto independiente de cualquier grupo político y financiado por autogestión.</div></h1> </div>
  	<div class="jumbotron">
	<h1><?php echo $slogan[0];?></h1>
  	<img src="milfs/nuestrared/images/logoNR.png" alt="NuestraRed.org" class='img img-responsive' style="width:100%">
	<br>
	<iframe frameborder='0' allowFullScreen  width="100%" height="370px" src="http://nuestrared.org/?contenido=fd9a1e7fc8cf4a4a66ee3747dd9dd4e1&plantilla=recomendado">
	
	</iframe>		
  	</div>
  
  
    <div class="container" >
		<div class="row">
			<div class="col-md-4 ">
				<img src="milfs/nuestrared/images/wikipedia.png" alt="Wikipedia" class='img img-responsive center-block '>
				<br>
				<a class='btn btn-block btn-success link' href="http://wikipedia.nuestrared.org/wikipedia_es_all_2014-12/A/Colombia.html">Wikipedia</a>
				<a class='btn btn-block btn-success' href= "http://wikipedia.nuestrared.org/wiktionary_es_all_12_2013/?">Diccionario</a>
				<a class='btn btn-block btn-success' href="http://wikipedia.nuestrared.org/wikibooks_es_all_2015-02/?" >Biblioteca</a>
				<a class='btn btn-block btn-success' href="http://wikipedia.nuestrared.org/wikivoyage_es_all_2015-03/?">Lugares</a>
				<a class='btn btn-block btn-success' href="http://wikipedia.nuestrared.org/wikiquote_es_all_2015-02/?" >Frases</a>
			
			</div>
			<div class="col-md-4" >
				<h2>Nuestra emisora</h2>
				<p >Esta emisora es experimental, toca solo música en discos de acetato y vinilo, no tiene horarios establecidos.</p>
				<div class="col-md-6">
				<strong>Escucha ahora</strong>
				<audio controls style="width: 98%" >
					<source src="http://radio.labmde.org:8000/radiosucia.mp3" type="audio/mp3" />
					<source src="http://radio.labmde.org:8000/radiosucia.ogg" type="audio/ogg" />
					<source src="http://radiosucia.nuestrared.org:8000/radiosucia-pregrabado.ogg" type="audio/ogg" />
					<em>Su navegador no soporta audio HTML5</em>
					</audio> 
					
					
				</div>
				<div class="col-md-6">
				<img src="http://radiosucia.nuestrared.org/motion/caratula.jpg" class="img img-responsive" style ="width:100%" alt="Portada">
				</div>
				<br>
				<div class='form-group'>
				<label>Enlaces para escuchar desde otros dispositivos</label>
				<input class='form-control' value="http://radiosucia.nuestrared.org:8000/radiosucia.ogg"  size="50" onclick="select()"  style="text-align:center" />
				</div>
				<div class='form-group'>
				<input class='form-control' value="http://radiosucia.nuestrared.org:8000/radiosucia.mp3"  size="50" onclick="select()"  style="text-align:center" />
				</div>
			</div>
			<div class="col-md-4 alert alert-success"  >
			<div id='div_contacto' class="container-fluid">
			<form role='form' class='form-horizontal' id='formulario_contacto' name='formulario_contacto'>
			<h2>Contacto y sugerencias</h2>
				<div class='form-group '>
					<label for='nombre'>Nombre</label>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-user"></i></span>
						<input class='form-control' id='nombre' name='nombre' type='text' >
					</div>
				</div>
				<div class='form-group '>
					<label for='email'>Correo electrónico</label>
					<div class="input-group">
						<span class="input-group-addon">@</span>
						<input class='form-control' id='email' name='email' type='email' >
					</div>
				</div>
				<div class='form-group '>
					<label for='telefono'>Teléfono</label>
					<div class="input-group">
						<span class="input-group-addon"><i class="fa fa-phone"></i></span>
						<input class='form-control' id='telefono' name='telefono' type='number' >
					</div>
				</div>
				<div class='form-group '>
					<label for='mensaje'>Mensaje</label>
						<textarea class='form-control' id='mensaje' name='mensaje'  ></textarea>
				</div>
				<br>
				<div class='btn btn-block btn-success' onclick="xajax_enviar_mail(xajax.getFormValues('formulario_contacto'))">Enviar</div>
						
			</form>
			
			</div>
			</div>
		</div>



	</div>



<div  class="center-block" style="  z-index:10000; bottom:10px; background-color: white; color :green; padding: 10px;">
  Con el apoyo de:<p>
  <div class='row'>
		<div class="col-sm-4">
		 <a target='new' href='https://www.apc.org/es/projects/premio-chris-nicol-de-software-libre-de-apc'>
		  <img  style='height:150px;'  class='img img-responsive center-block' src="images/apc.png" alt="Asociación para el progreso de las comunicaciones">
		  </a>
		</div> 
		<div class="col-sm-4">
			<a target='new' href='http://vivirenlafinca.org'>
		  <img   style='height:150px;'  class='img img-responsive center-block' src="images/logovivirenlafinca.png" alt="Fundación vivirenlafinca">
		  </a>
		</div> 
		<div class="col-sm-4">
			<a target='new' href='https://comunidadconvergentes.wordpress.com/'>
		  <img   style='height:150px;'  class='img img-responsive center-block' src="images/convergentes.jpg" alt="Comunidad de practica convergentes">
		  </a>
		</div> 
  
  
  </div>
  Agradecimientos:
  <div class='row '>
	<div class="col-sm-4">
		<a target='new' href='http://qmp.cat'>
		<img   style='height:100px;'  class='img img-responsive center-block' src="images/qmp.png" alt="QMP ">
		</a>
	</div>  
	<div class="col-sm-4">
		<a target='new' href='#'>
		<img   style='height:100px;'   class='img img-responsive center-block' src="images/unloquer.png" alt="Un/Loquer ">
		</a>
	</div><div class="col-sm-4 center-block">
		<a target='new' href='platohedro.org'>
		<img  style='height:100px;'  class='img img-responsive center-block' src="images/platohedro.jpg" alt="Platohedro ">
		</a>
	</div>
  </div>
 
  	<br>
  </div>
  <!-- Modal -->

<div class='modal fade ' id='muestraInfo' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>
  <div class='modal-dialog' >
    <div class='modal-content'>
      <div class='modal-header' >
        <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>&times;</button>
        <h4 class='modal-title' id='myModalLabel_info'><div id='titulo_modal'></div></h4>
      </div>
      <div class='modal-body'>
      
       <div id='muestra_form'></div>
      </div>
      <div class='modal-footer' id='pie_modal'>
        
       
      </div>
    </div>
  </div>
</div>
<div class='pie' style=" 
	       position: fixed; z-index: 10000;
  bottom: 0;
  width: 100%;
  /* Set the fixed height of the footer here */
  height: 20px;
 /* background-color: white;*/
background-image: url('');
">

        <a class='pull-right' href='http://QWERTY.co/milfs'>Powered by: &copy; MILFS </a>... 
        	</div> 
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
     <script src="milfs/js/jquery.min.js"></script> 
    <script src="milfs/js/bootstrap.min.js"></script>
    <script src="milfs/js/scripts.js"></script>


</body>
</html>
