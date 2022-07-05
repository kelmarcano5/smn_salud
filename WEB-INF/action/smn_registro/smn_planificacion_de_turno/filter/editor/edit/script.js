var smn_usuario_id = '${fld:smn_usuario_id}';
if (smn_usuario_id == '' || smn_usuario_id == 0)  {

}else{
	$('#smn_usuario_id').val(smn_usuario_id).change();
}

var smn_rol_id = '${fld:smn_rol_id}';
if (smn_rol_id == '' || smn_rol_id == 0)  {

}else{
	$('#smn_rol_id').val(smn_rol_id).change();
}

var smn_serie_id = '${fld:smn_serie_id}';
if (smn_serie_id == '' || smn_serie_id == 0)  {

}else{
	$('#smn_serie_id').val(smn_serie_id).change();
}

var smn_entidades_rf = '${fld:smn_entidades_rf}';
if (smn_entidades_rf == '' || smn_entidades_rf == 0)  {

}else{
	$('#smn_entidades_rf').val(smn_entidades_rf).change();
}

var smn_sucursales_rf = '${fld:smn_sucursales_rf}';
if (smn_sucursales_rf == '' || smn_sucursales_rf == 0)  {

}else{
	$('#smn_sucursales_rf').val(smn_sucursales_rf).change();
}

var smn_areas_servicios_rf = '${fld:smn_areas_servicios_rf}';
if (smn_areas_servicios_rf == '' || smn_areas_servicios_rf == 0)  {

}else{
	$('#smn_areas_servicios_rf').val(smn_areas_servicios_rf).change();
}

var smn_unidad_servicio_rf = '${fld:smn_unidad_servicio_rf}';
if (smn_unidad_servicio_rf == '' || smn_unidad_servicio_rf == 0)  {

}else{
	$('#smn_unidad_servicio_rf').val(smn_unidad_servicio_rf).change();
}

var smn_puesto_atencion_id = '${fld:smn_puesto_atencion_id}';
if (smn_puesto_atencion_id == '' || smn_puesto_atencion_id == 0)  {

}else{
	$('#smn_puesto_atencion_id').val(smn_puesto_atencion_id).change();
}

setComboValue('smn_usuario_id','${fld:smn_usuario_id}','form1');
setComboValue('smn_rol_id','${fld:smn_rol_id}','form1');
document.form1.ptu_fecha.value='${fld:ptu_fecha@dd-MM-yyyy}';
setComboValue('smn_serie_id','${fld:smn_serie_id}','form1');
setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
setComboValue('smn_sucursales_rf','${fld:smn_sucursales_rf}','form1');
setComboValue('smn_areas_servicios_rf','${fld:smn_areas_servicios_rf}','form1');
setComboValue('smn_unidad_servicio_rf','${fld:smn_unidad_servicio_rf}','form1');
setComboValue('ptu_estatus','${fld:ptu_estatus}','form1');
document.form1.id.value='${fld:smn_plan_turno_id@#######}';

setComboValue('smn_puesto_atencion_id','${fld:smn_puesto_atencion_id}','form1');
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

