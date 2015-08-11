#!/bin/bash

TIME=`date +%b-%d-%y`
goaccess > /home/webserver/reportes/reporte-$TIME.html

