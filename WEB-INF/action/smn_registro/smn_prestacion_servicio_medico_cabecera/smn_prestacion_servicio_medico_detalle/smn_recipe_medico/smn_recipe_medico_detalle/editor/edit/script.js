var principio = '${fld:smn_principio_activo_rf}';
if (principio == 0) {
	$('#smn_principio_activo_rf').val(0).change();
}else{
	$('#smn_principio_activo_rf').val(principio).change();
}

var item = '${fld:smn_item_rf}';
if (item == 0) {
	$('#smn_item_rf').val(0).change();
}else{
	$('#smn_item_rf').val(item).change();
}

var presentacion = '${fld:smn_presentacion_rf}';
if (presentacion == 0) {
	$('#smn_presentacion_rf').val(0).change();
}else{
    $('#smn_presentacion_rf').val(presentacion).change();
}

var marca = '${fld:smn_marca_comercial_id}';
//alert(marca);
if (marca == 0) {
	$('#smn_marca_comercial_id').val(0).change();
}else{
    $('#smn_marca_comercial_id').val(marca).change();
}

document.form1.smn_recipe_medico_id.value='${fld:smn_recipe_medico_id@#######}';
setComboValue('smn_principio_activo_rf','${fld:smn_principio_activo_rf}','form1');
setComboValue('smn_item_rf','${fld:smn_item_rf}','form1');
setComboValue('smn_presentacion_rf','${fld:smn_presentacion_rf}','form1');
document.form1.rmd_dosis.value='${fld:rmd_dosis@#,###,##0.00}';
document.form1.rmd_frecuencia.value='${fld:rmd_frecuencia@#,###,###}';
setComboValue('rmd_tiempo_frecuencia','${fld:rmd_tiempo_frecuencia}','form1');
setComboValue('rmd_tiempo_frecuencia_2','${fld:rmd_tiempo_frecuencia_2}','form1');
document.form1.rmd_especificacion.value='${fld:rmd_especificacion@js}';
document.form1.rmd_concentracion.value='${fld:rmd_concentracion@js}';
document.form1.rmd_dias_tratamiento.value='${fld:rmd_dias_tratamiento@#,###,###}';
document.form1.rmd_dosis_total.value='${fld:rmd_dosis_total@#,###,###}';
document.form1.rmd_observacion.value='${fld:rmd_observacion@js}';
document.form1.id.value='${fld:smn_recipe_medico_detalle_id@#######}';
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");



 

