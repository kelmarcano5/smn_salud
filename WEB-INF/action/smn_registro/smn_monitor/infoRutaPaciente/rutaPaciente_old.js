<rowsRuta>

document.getElementById('rta_ticket').innerHTML = "${fld:rta_ticket}";
document.getElementById('rta_numero_documento_identidad').innerHTML = "${fld:rta_numero_documento_identidad}";

document.getElementById('rta_ticket2').innerHTML = "${fld:rta_ticket}";
document.getElementById('rta_numero_documento_identidad2').innerHTML = "${fld:rta_numero_documento_identidad}";
		
document.getElementById('smn_auxiliar_rf_combo2').innerHTML = "${fld:smn_auxiliar_rf_combo}";
document.getElementById('smn_unidad_servicio_rf2').innerHTML = "${fld:smn_unidad_servicio_rf}";
document.getElementById('saldo2').innerHTML = "${fld:saldo}";

myElem= document.getElementById('smn_auxiliar_rf_combo');

if (myElem != null){

document.getElementById('smn_auxiliar_rf_combo').innerHTML = "${fld:smn_auxiliar_rf_combo}";


}


myElem= document.getElementById('smn_unidad_servicio_rf');

if (myElem != null){

document.getElementById('smn_unidad_servicio_rf').innerHTML = "${fld:smn_unidad_servicio_rf}";


}


myElem= document.getElementById('saldo');

if (myElem != null){

document.getElementById('saldo').innerHTML = "${fld:saldo}";


}

myElem= document.getElementById('tiempo');

if (myElem != null){

var tiempo = "${fld:saldo}" * "${fld:frecuencia}";

document.getElementById('tiempo').innerHTML = tiempo;


}





myElem= document.getElementById('smn_auxiliar_rf_combo2');

if (myElem != null){

document.getElementById('smn_auxiliar_rf_combo2').innerHTML = "${fld:smn_auxiliar_rf_combo}";


}


myElem= document.getElementById('smn_unidad_servicio_rf2');

if (myElem != null){

document.getElementById('smn_unidad_servicio_rf2').innerHTML = "${fld:smn_unidad_servicio_rf}";


}


myElem= document.getElementById('saldo2');

if (myElem != null){

document.getElementById('saldo2').innerHTML = "${fld:saldo}";


}

myElem= document.getElementById('tiempo2');

if (myElem != null){

var tiempo = "${fld:saldo}" * "${fld:frecuencia}";

document.getElementById('tiempo2').innerHTML = tiempo;


}


</rowsRuta>