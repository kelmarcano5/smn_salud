var aux = '${fld:afecta}';
var aux2 = '${fld:tipo_consulta}';
var svc_req_prestador = '${fld:svc_req_prestador}';


// if(aux > 0){
// 	document.getElementById('tr_componente').style.display='';
// 	document.getElementById('tr_accion').style.display='';
// 	listboxClear("smn_componente_rf");
// }else{
// 	document.getElementById('tr_componente').style.display='none';
// 	document.getElementById('tr_accion').style.display='none';	
// 	listboxClear("smn_componente_rf");
// }

if(aux2 > 0){
	document.getElementById('tr_tipo_consulta').style.display='';
}else{
	document.getElementById('tr_tipo_consulta').style.display='none';	
}

if(svc_req_prestador == 'S'){
	document.getElementById('tr_grupo').style.display='none';
	document.getElementById('tr_prestador').style.display='';
	listboxClear("smn_prestador_servicio_rf");
	//listboxClear("smn_grupo_prestador_servicio_rf");
// }else{
// 	document.getElementById('tr_grupo').style.display='none';
// 	document.getElementById('tr_prestador').style.display='';
// 	listboxClear("smn_prestador_servicio_rf");
// }

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "";

var optionChoose1 = document.createElement("option");
optionChoose1.text = '[${lbl:b_choose}]';
optionChoose1.value = "";

var optionChoose2 = document.createElement("option");
optionChoose2.text = '[${lbl:b_choose}]';
optionChoose2.value = "0";


//document.form1.smn_componente_rf.add(optionChoose, 0);
document.form1.smn_prestador_servicio_rf.add(optionChoose1, 0);
document.form1.smn_grupo_prestador_servicio_rf.add(optionChoose2, 0);

<smn_auxilia_unidad_servicio_rf_rows>
	document.form1.smn_unidades_servicios_rf.value="${fld:smn_unidades_servicios_rf}";
</smn_auxilia_unidad_servicio_rf_rows>


// <smn_componente_rf_rows>
// 	var option = document.createElement("option");
// 	option.text = "${fld:item@js}"; 
// 	option.value = "${fld:id}";
// 	document.form1.smn_componente_rf.add(option, 0);
// </smn_componente_rf_rows>

<smn_grupo_prestador_servicio_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_grupo_prestador_servicio_rf.add(option, 0);
</smn_grupo_prestador_servicio_rf_rows>

<smn_prestador_servicio_rf_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_prestador_servicio_rf.add(option, 0);
</smn_prestador_servicio_rf_rows>