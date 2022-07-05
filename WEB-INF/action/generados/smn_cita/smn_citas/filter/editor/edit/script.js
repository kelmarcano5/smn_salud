document.form1.cts_num_control.value='${fld:cts_num_control@js}';
document.form1.cts_num_doc_oficial.value='${fld:cts_num_doc_oficial@js}';
setComboValue('smn_motivos_id','${fld:smn_motivos_id}','form1');
setComboValue('cts_clase_auxiliar','${fld:cts_clase_auxiliar}','form1');
setComboValue('cts_auxiliar','${fld:cts_auxiliar}','form1');
setComboValue('smn_origen_id','${fld:smn_origen_id}','form1');
setComboValue('cts_ordenante','${fld:cts_ordenante}','form1');
setComboValue('cts_tipo_orden','${fld:cts_tipo_orden}','form1');
setComboValue('cts_titular','${fld:cts_titular}','form1');
setComboValue('smn_estatus_citas_id','${fld:smn_estatus_citas_id}','form1');
setComboValue('smn_relacionados_id','${fld:smn_relacionados_id}','form1');
setComboValue('smn_observaciones_citas_id','${fld:smn_observaciones_citas_id}','form1');
setComboValue('smn_citas_mov_id','${fld:smn_citas_mov_id}','form1');
document.form1.id.value='${fld:smn_citas_id}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");
<rows>setCheckboxValue('smn_servicios_id','${fld:smn_servicios_id}','form1');</rows>

