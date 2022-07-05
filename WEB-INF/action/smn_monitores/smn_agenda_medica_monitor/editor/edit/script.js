if ('${fld:smn_agenda_id}' == ''  || '${fld:smn_agenda_id}'==0) {
	setComboValue('smn_agenda_id','${fld:smn_agenda_id}','form1');
}else{
		 var smn_agenda_id = '${fld:smn_agenda_id}';
	$('#smn_agenda_id').val(smn_agenda_id).change();
}
//alert('${fld:smn_grupo_prestador_servicio_rf}');
if ('${fld:smn_grupo_prestador_servicio_rf}' == ''  || '${fld:smn_grupo_prestador_servicio_rf}'==0) {
	setComboValue('smn_grupo_prestador_servicio_rf','${fld:smn_grupo_prestador_servicio_rf}','form1');
}else{
	var smn_grupo_prestador_servicio_rf = '${fld:smn_grupo_prestador_servicio_rf}';
	$('#smn_grupo_prestador_servicio_rf').val(smn_grupo_prestador_servicio_rf).change();
}

if ('${fld:smn_prestador_servicio_rf}' == ''  || '${fld:smn_prestador_servicio_rf}'==0) {
	setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
}else{
		 var smn_prestador_servicio_rf = '${fld:smn_prestador_servicio_rf}';
	$('#smn_prestador_servicio_rf').val(smn_prestador_servicio_rf).change();
}

var smn_habitaciones_id = '${fld:smn_habitaciones_id}';
$('#smn_habitaciones_id').val(smn_habitaciones_id).change();

var smn_areas_servicios_rf = '${fld:smn_areas_servicios_rf}';
$('#smn_areas_servicios_rf').val(smn_areas_servicios_rf).change();

var smn_unidades_servicios_rf = '${fld:smn_unidades_servicios_rf}';
$('#smn_unidades_servicios_rf').val(smn_unidades_servicios_rf).change();

var smn_especialidad_rf = '${fld:smn_especialidad_rf}';
$('#smn_especialidad_rf').val(smn_especialidad_rf).change();

 var smn_entidades_rf = '${fld:smn_entidades_rf}';
$('#smn_entidades_rf').val(smn_entidades_rf).change();
//alert('${fld:smn_sucursales_rf}');
if ('${fld:smn_sucursales_rf}' == null  || '${fld:smn_sucursales_rf}'==0) {
	setComboValue('smn_sucursales_rf','${fld:smn_sucursales_rf}','form1');
}else{
	var smn_sucursales_rf = '${fld:smn_sucursales_rf}';
	$('#smn_sucursales_rf').val(smn_sucursales_rf).change();
}



setComboValue('smn_agenda_id','${fld:smn_agenda_id}','form1');
setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
setComboValue('smn_habitaciones_id','${fld:smn_habitaciones_id}','form1');
setComboValue('smn_areas_servicios_rf','${fld:smn_areas_servicios_rf}','form1');
setComboValue('smn_unidades_servicios_rf','${fld:smn_unidades_servicios_rf}','form1');
setComboValue('smn_grupo_prestador_servicio_rf','${fld:smn_grupo_prestador_servicio_rf}','form1');
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
setComboValue('smn_especialidad_rf','${fld:smn_especialidad_rf}','form1');
setComboValue('agm_jornada_desde_rf','${fld:agm_jornada_desde_rf}','form1');
document.form1.agm_frecuencia.value='${fld:agm_frecuencia@#,###,###}';
document.form1.agm_cantidad_frecuencia.value='${fld:agm_cantidad_frecuencia@#,###,###}';
setComboValue('agm_estatus','${fld:agm_estatus}','form1');
document.form1.id.value='${fld:smn_agenda_medica_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");
document.getElementById("smn_agenda_id").disabled=true;

 

