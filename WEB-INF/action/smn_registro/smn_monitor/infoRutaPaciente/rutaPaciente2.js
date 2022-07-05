<rowsRuta>

	var ticket = "${fld:rta_ticket_ea}";
	var serie = "${fld:serie}";
	var tbl =  document.getElementById('tabla');
	var myElem;

	myElem= document.getElementById('smn_auxiliar_rf_combo');

	if (myElem != null){

		var tr = document.createElement('tr');

		var td = document.createElement('td');
		td.innerHTML = serie + "-" + ticket;
		tr.appendChild(td);
		tr.setAttribute('name','tr1');
		
		var td = document.createElement('td');
		td.innerHTML = "${fld:rta_numero_documento_identidad_ea}";
		tr.appendChild(td);
		tr.setAttribute('name','tr2');
		
		var td = document.createElement('td');
		td.innerHTML = "${fld:smn_auxiliar_rf_combo_ea}";
		tr.appendChild(td);
		tr.setAttribute('name','tr3');

		var td = document.createElement('td');
		td.innerHTML = "${fld:puesto}";
		tr.appendChild(td);
		tr.setAttribute('name','tr4');
		
		//var td = document.createElement('td');
		//td.innerHTML = "${fld:smn_unidad_servicio_rf_ea}";
		//tr.appendChild(td);
		//tr.setAttribute('name','tr5');
		tbl.appendChild(tr);
	}

	myElem= document.getElementById('smn_unidad_servicio_rf');
	if (myElem != null){
		//document.getElementById('smn_unidad_servicio_rf').innerHTML = "${fld:smn_unidad_servicio_rf_ea}";
	}

	myElem= document.getElementById('saldo');
	if (myElem != null){
		//document.getElementById('saldo').innerHTML = "${fld:saldo_ea}";
	}

	myElem= document.getElementById('tiempo');

	if (myElem != null){
		//var tiempo = "${fld:saldo_ea}" * "${fld:frecuencia_ea}";
		//document.getElementById('tiempo').innerHTML = tiempo;
		//console.log('Hola')
	}
</rowsRuta>

<rowsRuta2>
	var ticket = "${fld:rta_ticket}";
	var serie = "${fld:serie}";
	var tbl =  document.getElementById('tabla2');	
	var myElem;

	myElem= document.getElementById('smn_auxiliar_rf_combo');
		
	if (myElem != null){

		var tr = document.createElement('tr');
		
		var td = document.createElement('td');
		td.innerHTML = serie + "-" + ticket;
		tr.appendChild(td);
		tr.setAttribute('name','tr5');

		var td = document.createElement('td');
		td.innerHTML = "${fld:rta_numero_documento_identidad}";
		tr.appendChild(td);
		tr.setAttribute('name','tr6');

		var td = document.createElement('td');
		td.innerHTML = "${fld:smn_auxiliar_rf_combo}";
		tr.appendChild(td);
		tr.setAttribute('name','tr7');

		var td = document.createElement('td');
		td.innerHTML = "${fld:puesto}";
		tr.appendChild(td);
		tr.setAttribute('name','tr8');

		//var td = document.createElement('td');
		//td.innerHTML = "${fld:smn_unidad_servicio_rf}";
		//tr.appendChild(td);
		//tr.setAttribute('name','tr9');
		tbl.appendChild(tr);
	}

	myElem= document.getElementById('smn_unidad_servicio_rf');
	if (myElem != null){
		document.getElementById('smn_unidad_servicio_rf').innerHTML = "${fld:smn_unidad_servicio_rf}";

		//var tbl =  document.getElementById('tabla2').getElementsByTagName('tbody')[0];
		//		var tr = document.createElement('tr');
		//		td = document.createElement('td');
		//		td.innerHTML = "${fld:smn_unidad_servicio_rf}";
		//		tr.appendChild(td);
		//		tbl.appendChild(tr);
	}

	myElem= document.getElementById('saldo');
	if (myElem != null){
		//document.getElementById('saldo').innerHTML = "${fld:saldo}";

		//var tbl =  document.getElementById('tabla2').getElementsByTagName('tbody')[0];
		//		var tr = document.createElement('tr');
			//	td = document.createElement('td');
				//td.innerHTML = "${fld:saldo}";
		//		tr.appendChild(td);
		//		tbl.appendChild(tr);
	}


	myElem= document.getElementById('tiempo');
	if (myElem != null){
	//var tiempo = "${fld:saldo}" * "${fld:frecuencia}";

	//document.getElementById('tiempo').innerHTML = tiempo;


	//var tbl =  document.getElementById('tabla2').getElementsByTagName('tbody')[0];
	//		var tr = document.createElement('tr');
			//td = document.createElement('td');
			//td.innerHTML = tiempo;
	//		tr.appendChild(td);
	//		tbl.appendChild(tr);
	}

</rowsRuta2>