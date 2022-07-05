<rowsRuta>

	var ticket = "${fld:rta_ticket}";
	var serie = "${fld:serie}";
	document.getElementById('rta_ticket').innerHTML = serie + "-" + ticket;
	document.getElementById('rta_numero_documento_identidad').innerHTML = "${fld:rta_numero_documento_identidad}";	

	var tbl =  document.getElementById('tabla2').getElementsByTagName('tbody')[0];
	var tr = tbl.getElementsByTagName('tr')[0];
	document.getElementById('rta_ticket2').innerHTML = serie + "-" + ticket;

	var myElem;

	myElem= document.getElementById('smn_auxiliar_rf_combo');

	if (myElem != null){

		document.getElementById('smn_auxiliar_rf_combo').innerHTML = "${fld:smn_auxiliar_rf_combo}";
		var tr = document.createElement('tr');
		
		var td = document.createElement('td');
		td.innerHTML = "${fld:rta_ticket}";
		tr.appendChild(td);
		var td = document.createElement('td');
		td.innerHTML = "${fld:rta_numero_documento_identidad}";
		tr.appendChild(td);
		
		var td = document.createElement('td');
		td.innerHTML = "${fld:smn_auxiliar_rf_combo}";
		tr.appendChild(td);

		var td = document.createElement('td');
		td.innerHTML = "${fld:puesto}";
		tr.appendChild(td);
		
		var td = document.createElement('td');
		td.innerHTML = "${fld:smn_unidad_servicio_rf}";
		tr.appendChild(td);
		
		var td = document.createElement('td');
		td.innerHTML = "${fld:saldo}";
		tr.appendChild(td);
		
		var td = document.createElement('td');
		var tiempo = "${fld:saldo}" * "${fld:frecuencia}";
		td.innerHTML = tiempo;
		tr.appendChild(td);
		
		tbl.appendChild(tr);
	}

	myElem= document.getElementById('smn_unidad_servicio_rf');

	if (myElem != null){

		document.getElementById('smn_unidad_servicio_rf').innerHTML = "${fld:smn_unidad_servicio_rf}";
		td = document.createElement('td');
		td.innerHTML = "${fld:smn_unidad_servicio_rf}";
	}

	myElem= document.getElementById('saldo');

	if (myElem != null){

		document.getElementById('saldo').innerHTML = "${fld:saldo}";
		td = document.createElement('td');
		td.innerHTML = "${fld:saldo}";
	}

	myElem= document.getElementById('tiempo');

	if (myElem != null){

		var tiempo = "${fld:saldo}" * "${fld:frecuencia}";
		document.getElementById('tiempo').innerHTML = tiempo;
		td = document.createElement('td');
		td.innerHTML = tiempo;
	}

</rowsRuta>

<rowsRuta2>

	document.getElementById('rta_ticket').innerHTML = "${fld:rta_ticket}";
	document.getElementById('rta_numero_documento_identidad').innerHTML = "${fld:rta_numero_documento_identidad}";

	var tbl =  document.getElementById('tabla2').getElementsByTagName('tbody')[0];
	var tr = tbl.getElementsByTagName('tr')[0];

	document.getElementById('rta_ticket2').innerHTML = "${fld:rta_ticket}";
		
	var myElem;

	myElem= document.getElementById('smn_auxiliar_rf_combo');

	if (myElem != null){

		document.getElementById('smn_auxiliar_rf_combo').innerHTML = "${fld:smn_auxiliar_rf_combo}";
		var tr = document.createElement('tr');
		
		var td = document.createElement('td');
		td.innerHTML = "${fld:rta_ticket}";
		tr.appendChild(td);

		var td = document.createElement('td');
		td.innerHTML = "${fld:rta_numero_documento_identidad}";
		tr.appendChild(td);
		
		var td = document.createElement('td');
		td.innerHTML = "${fld:smn_auxiliar_rf_combo}";
		tr.appendChild(td);

		var td = document.createElement('td');
		td.innerHTML = "${fld:puesto}";
		tr.appendChild(td);
		
		var td = document.createElement('td');
		td.innerHTML = "${fld:smn_unidad_servicio_rf}";
		tr.appendChild(td);
		
		var td = document.createElement('td');
		td.innerHTML = "${fld:saldo}";
		tr.appendChild(td);
		
		var td = document.createElement('td');
		var tiempo = "${fld:saldo}" * "${fld:frecuencia}";
		td.innerHTML = tiempo;
		tr.appendChild(td);
		
		tbl.appendChild(tr);
	}


	myElem= document.getElementById('smn_unidad_servicio_rf');

	if (myElem != null){

		document.getElementById('smn_unidad_servicio_rf').innerHTML = "${fld:smn_unidad_servicio_rf}";
		td = document.createElement('td');
		td.innerHTML = "${fld:smn_unidad_servicio_rf}";
	}


	myElem= document.getElementById('saldo');

	if (myElem != null){

		document.getElementById('saldo').innerHTML = "${fld:saldo}";
		td = document.createElement('td');
		td.innerHTML = "${fld:saldo}";
	}


	myElem= document.getElementById('tiempo');

	if (myElem != null){

		var tiempo = "${fld:saldo}" * "${fld:frecuencia}";
		document.getElementById('tiempo').innerHTML = tiempo;
		td = document.createElement('td');
		td.innerHTML = tiempo;
	}

</rowsRuta2>