<!DOCTYPE html>
<html>
<head>
<meta charset=utf-8 />
<title>Display latitude longitude on marker movement</title>

<script src="milfs/nuestrared/librerias/leaflet.js"></script>

<link rel="stylesheet" href="milfs/nuestrared/librerias/leaflet.css" />
<style>
  body { margin:0; padding:0; }
  #map {width: 100%;height: 500px;}
</style>
</head>
<body>


<h1>Nuestro mapa</h1>
<p style="display: inline;">Mis coordenadas: <div id='coordenadas' name='coordenadas' style="display: inline;"></div></p>
<div id='map'></div>

<?php 
	if ($_REQUEST[lat] !='') {$lat=$_REQUEST[lat];}else {$lat= "-72";}
	if ($_REQUEST[lon] !='') {$lon=$_REQUEST[lon];}else {$lon= "4";}
	if ($_REQUEST[zoom] !='') {$zoom=$_REQUEST[zoom];}else {$zoom= "5";}
	
 ?>
<script>
var map = L.map('map')
   .setView([<?php echo $lon ?>, <?php echo $lat ?>], <?php echo $zoom ?>);
L.tileLayer('http://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png').addTo(map);
function onLocationFound(e) {
			var radius = e.accuracy / 2;
			var marker = L.marker(e.latlng,{draggable: true}).addTo(map)
						L.circle(e.latlng, radius).addTo(map);
var mapa = window.parent.document.getElementById('coordenadas');
			
			marker.on('dragend', ondragend);
			ondragend();
			function ondragend() {
    			var m = marker.getLatLng();
    			var z = map.getZoom();
    mapa.innerHTML= m.lng+' '+m.lat+' '+z;
}

									}

function onLocationError(e) {
			//alert(e.message);
			var marker = L.marker([<?php echo $lon ?>,<?php echo $lat ?>],{draggable: true}).addTo(map);
			var mapa = window.parent.document.getElementById('coordenadas');
			marker.on('dragend', ondragend);
			ondragend();
			function ondragend() {
    			var m = marker.getLatLng();
    			var z = map.getZoom();
    mapa.innerHTML= m.lng+' '+m.lat+' '+z;
 }
		}

		map.on('locationfound', onLocationFound);
		map.on('locationerror', onLocationError);

map.locate({setView: true, maxZoom: 16});

</script>


</body>
</html>