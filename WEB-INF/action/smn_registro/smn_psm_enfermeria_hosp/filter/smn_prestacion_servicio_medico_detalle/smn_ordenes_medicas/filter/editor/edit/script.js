
var contra = '${fld:smn_prestador_servicio_rf}';
$('#smn_prestador_servicio_rf').val(contra).trigger('change');

var contra = '${fld:omd_clase_auxiliar}';
$('#omd_clase_auxiliar').val(contra).trigger('change');

var contra = '${fld:omd_auxiliar}';
$('#omd_auxiliar').val(contra).trigger('change');

var contra = '${fld:smn_contratante_id}';
$('#smn_contratante_id').val(contra).trigger('change');

var ingreso = '${fld:smn_ingreso_id}';
$('#smn_ingreso_id').val(ingreso).trigger('change');

//document.form1.smn_ingreso_id.value='${fld:smn_ingreso_id@#,###,###}';
setComboValue('smn_ingreso_id','${fld:smn_ingreso_id}','form1');
document.form1.omd_numero_orden.value='${fld:omd_numero_orden@js}';
document.form1.omd_descripcion.value='${fld:omd_descripcion@js}';
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
setComboValue('omd_clase_auxiliar','${fld:omd_clase_auxiliar}','form1');
setComboValue('omd_auxiliar','${fld:omd_auxiliar}','form1');
// document.form1.omd_num_doc_oficial.value='${fld:omd_num_doc_oficial@js}';
setComboValue('omd_tipo_orden','${fld:omd_tipo_orden}','form1');
document.form1.omd_indicaciones.value='${fld:omd_indicaciones@js}';
document.form1.id.value='${fld:smn_ordenes_medicas_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

setComboValue('omd_estatus','${fld:omd_estatus}','form1');

<rows>selectSmnServiciosId('${fld:smn_servicios_id}','${fld:svc_descripcion}');</rows> 
