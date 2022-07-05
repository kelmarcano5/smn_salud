var smn_tipo_documento_id = '${fld:smn_tipo_documento_id}';
$('#smn_tipo_documento_id').val(smn_tipo_documento_id).change();

var smn_documento_gen = '${fld:smn_documento_general_rf}';
if (smn_documento_gen == '') {

}else{
	setComboValue('smn_documento_general_rf','${fld:smn_documento_general_rf}','form1');
	$('#smn_documento_general_rf').val(smn_documento_gen).change();
}


var caja = '${fld:smn_caja_rf}';
if (caja == '' || caja == 0) {
	$('#smn_caja_rf').val(0).change();
}else{
	setComboValue('smn_caja_rf','${fld:smn_caja_rf}','form1');
	$('#smn_caja_rf').val(caja).change();
}

var smn_servicios_cobertura = '${fld:smn_servicios_cobertura}';
$('#smn_servicios_cobertura').val(smn_servicios_cobertura).change();

var smn_categoria_justificacion_rf = '${fld:smn_categoria_justificacion_rf}';
$('#smn_categoria_justificacion_rf').val(smn_categoria_justificacion_rf).change();

var doc_contratante = '${fld:doc_contratante}';
$('#doc_contratante').val(doc_contratante).change();

var doc_afiliacion_persona_natural = '${fld:doc_afiliacion_persona_natural}';
$('#doc_afiliacion_persona_natural').val(doc_afiliacion_persona_natural).change();

var doc_maneja_moneda_alt = '${fld:doc_maneja_moneda_alt}';
$('#doc_maneja_moneda_alt').val(doc_maneja_moneda_alt).change();

if ('${fld:doc_maneja_moneda_alt}' == 'SI') {
	$('#tasa').show();
	var tasa = '${fld:tca_tipo_tasa}';
	$('#tca_tipo_tasa').val(tasa).change();
}else{
	$('#tasa').hide();
}


// var entidad = '${fld:smn_entidades_rf}';
// if (entidad == '' || entidad==0) {

// }else{
// 	setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
// 	$('#smn_entidades_rf').val(smn_entidades_rf).change();
// }

// var sucursal = '${fld:smn_sucursales_rf}';
// if (sucursal == '' || sucursal==0) {

// }else{
// 	setComboValue('smn_sucursales_rf','${fld:smn_sucursales_rf}','form1');
// 	$('#smn_sucursales_rf').val(smn_sucursales_rf).change();
// }




setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
setComboValue('smn_sucursales_rf','${fld:smn_sucursales_rf}','form1');
setComboValue('doc_afiliacion_persona_natural','${fld:doc_afiliacion_persona_natural}','form1');
setComboValue('doc_maneja_moneda_alt','${fld:doc_maneja_moneda_alt}','form1');
setComboValue('smn_tipo_documento_id','${fld:smn_tipo_documento_id}','form1');

document.form1.doc_codigo.value='${fld:doc_codigo@js}';
document.form1.doc_nombre.value='${fld:doc_nombre@js}';
document.form1.id.value='${fld:smn_documento_id@#,###,###}';
setComboValue('smn_categoria_justificacion_rf','${fld:smn_categoria_justificacion_rf}','form1');
setComboValue('doc_contratante','${fld:doc_contratante}','form1');

document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.doc_codigo.disabled=true;
 

