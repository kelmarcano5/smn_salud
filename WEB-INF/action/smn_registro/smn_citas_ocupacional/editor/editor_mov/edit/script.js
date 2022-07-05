setComboValue('smn_citas_id','${fld:smn_citas_id}','form1');
setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.ctm_num_control_cita.value='${fld:ctm_num_control_cita@#,###,###}';
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_componente_rf','${fld:smn_componente_rf}','form1');
document.form1.ctm_accion.value='${fld:ctm_accion@js}';
setComboValue('smn_tipo_consulta_id','${fld:smn_tipo_consulta_id}','form1');
setComboValue('smn_grupo_prestador_servicio_rf','${fld:smn_grupo_prestador_servicio_rf}','form1');
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
document.form1.ctm_fecha_cita.value='${fld:ctm_fecha_cita@dd-MM-yyyy}';
document.form1.ctm_turno_cita.value='${fld:ctm_turno_cita@#,###,###}';
document.form1.ctm_hora_cita.value='${fld:ctm_hora_cita@js}';
setComboValue('ctm_estatus_id','${fld:ctm_estatus_id}','form1');
setComboValue('smn_motivos_id','${fld:smn_motivos_id}','form1');
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
document.form1.cts_ordenante_descripcion.value='${fld:cts_ordenante_descripcion@js}';
setComboValue('smn_sintoma_id','${fld:smn_sintoma_id}','form1');
setComboValue('cts_tipo_orden','${fld:cts_tipo_orden}','form1');
document.form1.cts_num_orden_medica.value='${fld:cts_num_orden_medica@#,###,###}';
setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
setComboValue('smn_sucursales_rf','${fld:smn_sucursales_rf}','form1');
setComboValue('smn_areas_servicios_rf','${fld:smn_areas_servicios_rf}','form1');
setComboValue('smn_unidades_servicios_rf','${fld:smn_unidades_servicios_rf}','form1');
setComboValue('ctm_observaciones_id','${fld:ctm_observaciones_id}','form1');
document.form1.id.value='${fld:smn_citas_mov_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

