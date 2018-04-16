![](https://use.fair-coin.org/wp-content/uploads/job-manager-uploads/main_image/2018/04/logoNR.png)

# NuestraRED

En este repositorio puedes encontrar diferentes archivos y información sobre la implementación de NuestraRED.

La implementación técnica de este proyecto ha sido un reto para el equipo técnico, al no contar con un presupuesto elevado hemos optado por reciclar equipos y por utilizar como base el sistema operativo Linux que va de la mano con los principios de la red. El Software Libre nos ha permitido crear una red robusta y estable con una configuración que es fácil de replicar por otros proyecto.

### ¿Como funciona una red sin acceso a Internet?

Uno de los principales problema que hemos tenido que enfrentar en NuestraRED es la imposibilidad de compartir internet a las personas que se conectan a la red. Para esto hemos tenido que hacer diferentes tipos de configuraciones para evitar que las personas que se conectan a la red acaparen el poco ancho de banda de la única conexión a Internet que tenemos disponible y que usamos en primer lugar para el trabajo de quienes mantienen la red y poder dar acceso a algunos contenidos que no podemos tener de manera local.

Para lograr esto bloqueamos el acceso a la red utilizando un proxy (SQUID) instalado en nuestro servidor.
Para ahorrar ancho de banda tuvimos que bloquear el acceso a Whatsapp eso lo tuvimos que hacer creando una serie de reglas de firewall bastante extensas en el unico Gateway con salida a internet en la red. Esas configuraciones las pueden encontrar en la carpeta ** REDMESH ** en donde copiamos las configuraciones que hacemos a la red.

### ¿NuestraRED.org tiene un portal captivo?

Uno de los retos técnicos más exigentes fue la de poder poner un portal captivo que nos permitiera anunciar a las personas que se conectan a la red los servicios que ofrecemos, por cuestiones técnicas y algunas limitantes del firmware QMP es que no provee un portal captivo fácil de configurar.

Por esta razón tuvimos que compilar SQUID con configuraciones especiales para lograr interceptar las conexiones HTTPS (SSL BUMP) y que diera soporte a un portal captivo.
A su vez implementamos ** e2guardian ** un filtro para SQUID que nos permite bloquear todo el acceso a sitios en la red y permitir solo los que ponemos en una lista blanca.
Los archivos de configuración de estos servicios se pueden encontrar en la carpeta ** Proxy **

El portal captivo funciona a su vez gracias a un seudo envenenamiento DNS que aplicamos a toda la red, todo los nodos tienen configurados solo el servidor DNS local que corre usando ** DNSMASQ ** y lee el archivo /etc/hosts del servidor en donde enrutamos muchos dns a la ip local del servidor, esas configuraciones se pueden encontrar en la carpeta ** Servidor **

Para lograr que los celulares muestren el portal captivo hicimos una configuración especial en el servidor web principal que hace creer a los celulares android y apple que los servicios que prueban la conectividad son nuestro servidor local esa configuración se puede encontrar en el archivo ** Servidor/nginx/sites-enabled/captive ** 

Para asegurarnos que esto funcione bien agregamos en la tabla de hosts de cada uno de los nodos de la red varios dominios que necesitamos que vayan a la IP local de nuestro servidor.

### ¿Como funcionan los contenidos locales de NuestraRED.org?

1. Para correr wikipedia y otros servicios de wikimedia foundation de manera local utilizamos kiwix-server que tuvimos que compilar a mano debido a algunos cambios en los kernel modernos de Linux DEBIAN.
1. Tenemos una instancia de la ultima versión de ** MEDIAGOBLIN ** para tener un archivo multimedia en donde ofrecemos a nuestros usuarios una serie de videos y audios bajo licencias abiertas.
1. Tenemos una instancia de ** UMAP ** que nos sirve para ofrecer a las personas que se conectan a la red una serie de cartografías sociales y ademas la posibilidad de crear las propias.
1. Tenemos una copia local del ** TUPALE ** que sincroniza con el servicio principal de Tupale.co

Cada uno de estos servicios corren en puertos diferentes, para evitar exponer los puertos de los servicios a la red, utilizamos un proxy reverso que corre usando ** NGINX ** allí aplicamos algunas configuraciones de cache y seguridad.

### ¿En donde puedo encontrar más información?
Si requiere más información tecnica sobre NuestraRED.org nos puede escribir a correo@nuestrared.org
