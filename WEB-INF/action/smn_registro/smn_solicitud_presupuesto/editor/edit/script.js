

var aux = '${fld:smn_auxiliar}';
if (aux =="" || aux == 0) {

}else{
	$('#smn_auxiliar').val(aux).change();
}

var contra = '${fld:smn_contratante_id}';
if (contra =="" || contra == 0) {

}else{
	$('#smn_contratante_id').val(contra).change();
}





document.form1.spr_solicitud.value='${fld:spr_solicitud@#,###,###}';
setComboValue('smn_auxiliar','${fld:smn_auxiliar}','form1');
setComboValue('smn_contratante_id','${fld:smn_contratante_id}','form1');

setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
//setComboValue('smn_patologia_id','${fld:smn_patologia_id}','form1');
document.form1.spr_dias_hospitalizacion.value='${fld:spr_dias_hospitalizacion@#,###,###}';
document.form1.spr_horas_quirofano.value='${fld:spr_horas_quirofano@#,###,###}';
document.form1.spr_instrumentales.value='${fld:spr_instrumentales@js}';
document.form1.spr_honorarios.value='${fld:spr_honorarios@#,###,###}';
setComboValue('spr_estatus','${fld:spr_estatus}','form1');
document.form1.id.value='${fld:smn_solicitud_presupuesto_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");



<rows>selectSmnPatologiasId('${fld:smn_patologias_id}','${fld:pat_descripcion}');</rows>
 
<rows2>selectSmnServiciosId('${fld:smn_servicios_rf}','${fld:svc_descripcion}');</rows2>

<rows3>selectSmnEquiposId('${fld:smn_activo_fijo_rf}','${fld:act_descripcion}');</rows3> 