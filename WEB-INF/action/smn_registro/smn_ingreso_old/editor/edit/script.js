var contra = '${fld:smn_contratante_id}';
if (contra =="" || contra == 0) {

}else{
	$('#smn_contratante_id').val(contra).trigger('change');
}

var sint = '${fld:smn_sintoma_id}';
if (sint =="" || sint == 0) {

}else{
	$('#smn_sintoma_id').val(sint).trigger('change');
}

var mot = '${fld:smn_motivos_id}';
if (mot =="" || mot == 0) {

}else{
	$('#smn_motivos_id').val(mot).trigger('change');
}

document.form1.smn_doc_orig.value='${fld:smn_doc_orig@#,###,###}';
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.igs_doc_origen.value='${fld:igs_doc_origen@#,###,###}';
document.form1.igs_num_ingreso.value='${fld:igs_num_ingreso@#,###,###}';
setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
setComboValue('smn_sucursales_rf','${fld:smn_sucursales_rf}','form1');
setComboValue('smn_areas_servicios_rf','${fld:smn_areas_servicios_rf}','form1');
setComboValue('smn_unidades_servicios_rf','${fld:smn_unidades_servicios_rf}','form1');
document.form1.ctm_observaciones_id.value='${fld:ctm_observaciones_id@js}';
document.form1.igs_ticket.value='${fld:igs_ticket@#,###,###}';
//document.form1.smn_clase_rf.value='${fld:smn_clase_rf@#,###,###}';
//document.form1.smn_auxiliar_rf.value='${fld:smn_auxiliar_rf@#,###,###}';
setComboValue('smn_contratante_id','${fld:smn_contratante_id}','form1');
document.form1.smn_auxiliar_sucursales_rf.value='${fld:smn_auxiliar_sucursales_rf@#,###,###}';
document.form1.smn_auxiliar_areas_servicios_rf.value='${fld:smn_auxiliar_areas_servicios_rf@#,###,###}';
document.form1.smn_auxilia_unidad_servicio_rf.value='${fld:smn_auxilia_unidad_servicio_rf@#,###,###}';
setComboValue('smn_motivos_id','${fld:smn_motivos_id}','form1');
document.form1.smn_observaciones_ingresos_id.value='${fld:smn_observaciones_ingresos_id@#,###,###}';
document.form1.igs_monto_moneda_local.value='${fld:igs_monto_moneda_local@#,###,##0.00}';
document.form1.smn_moneda_rf.value='${fld:smn_moneda_rf@#,###,###}';
document.form1.igs_monto_moneda_alterna.value='${fld:igs_monto_moneda_alterna@#,###,###}';
setComboValue('smn_sintoma_id','${fld:smn_sintoma_id}','form1');
document.form1.igs_estatus_financiero.value='${fld:igs_estatus_financiero@js}';
document.form1.id.value='${fld:smn_ingresos_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


setComboValue('smn_activo_fijo_rf','${fld:smn_activo_fijo_rf}','form1');

 

