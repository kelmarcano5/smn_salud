var smn_entidad_rf = '${fld:smn_entidad_rf}';
if (smn_entidad_rf == '' || smn_entidad_rf == 0)  {

}else{
	$('#smn_entidad_rf').val(smn_entidad_rf).change();
}

var smn_sucursal_rf = '${fld:smn_sucursal_rf}';
if (smn_sucursal_rf == '' || smn_sucursal_rf == 0)  {

}else{
	$('#smn_sucursal_rf').val(smn_sucursal_rf).change();
}

var smn_habitaciones_id = '${fld:smn_habitaciones_id}';
if (smn_habitaciones_id == '' || smn_habitaciones_id == 0)  {

}else{
	$('#smn_habitaciones_id').val(smn_habitaciones_id).change();
}

var smn_contratante_id = '${fld:smn_contratante_id}';
if (smn_contratante_id == '' || smn_contratante_id == 0)  {

}else{
	$('#smn_contratante_id').val(smn_contratante_id).change();
}

var smn_clase_auxiliar_rf = '${fld:smn_clase_auxiliar_rf}';
if (smn_clase_auxiliar_rf == '' || smn_clase_auxiliar_rf == 0)  {

}else{
	$('#smn_clase_auxiliar_rf').val(smn_clase_auxiliar_rf).change();
}

var smn_auxiliar_rf = '${fld:smn_auxiliar_rf}';
if (smn_auxiliar_rf == '' || smn_auxiliar_rf == 0)  {

}else{
	$('#smn_auxiliar_rf').val(smn_auxiliar_rf).change();
}

var smn_patologia_rf = '${fld:smn_patologia_rf}';
if (smn_patologia_rf == '' || smn_patologia_rf == 0)  {

}else{
	$('#smn_patologia_rf').val(smn_patologia_rf).change();
}


setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_habitaciones_id','${fld:smn_habitaciones_id}','form1');
document.form1.smn_presupuesto_id.value='${fld:smn_presupuesto_id@#,###,###}';
setComboValue('smn_contratante_id','${fld:smn_contratante_id}','form1');
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('smn_patologia_rf','${fld:smn_patologia_rf}','form1');
document.form1.plq_fecha_cirugia.value='${fld:plq_fecha_cirugia@dd-MM-yyyy}';
document.form1.plq_hora_inicial.value='${fld:plq_hora_inicial@js}';
document.form1.plq_hora_final.value='${fld:plq_hora_final@js}';
document.form1.plq_cantidad_horas.value='${fld:plq_cantidad_horas@#,###,###}';
document.form1.plq_observaciones.value='${fld:plq_observaciones@js}';
setComboValue('plq_estatus','${fld:plq_estatus}','form1');
document.form1.id.value='${fld:smn_plan_quirurgico_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

