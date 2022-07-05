setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
document.form1.rta_numero_documento_identidad.value='${fld:rta_numero_documento_identidad@js}';
setComboValue('smn_entidad_rf','${fld:smn_entidad_rf}','form1');
setComboValue('smn_sucursal_rf','${fld:smn_sucursal_rf}','form1');
setComboValue('smn_area_servicio_rf','${fld:smn_area_servicio_rf}','form1');
setComboValue('smn_unidad_servicio_rf','${fld:smn_unidad_servicio_rf}','form1');
setComboValue('smn_grupo_prestador_rf','${fld:smn_grupo_prestador_rf}','form1');
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
document.form1.rta_hora_llegada_unidad.value='${fld:rta_hora_llegada_unidad@#######}';
document.form1.rta_hora_salida_unidad.value='${fld:rta_hora_salida_unidad@#######}';
setComboValue('smn_serie_id','${fld:smn_serie_id}','form1');
setComboValue('rta_estatus','${fld:rta_estatus}','form1');
document.form1.rta_secuencia.value='${fld:rta_secuencia@#######}';
//document.form1.smn_serie_id.value='${fld:smn_serie_id@js}';
document.form1.rta_ticket.value='${fld:rta_ticket@#,###,###}';
document.form1.id.value='${fld:smn_ruta_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");



 

