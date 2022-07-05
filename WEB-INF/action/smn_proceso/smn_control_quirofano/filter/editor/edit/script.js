setComboValue('smn_agenda_rf','${fld:smn_agenda_rf}','form1');
document.form1.smn_presupuesto_id.value='${fld:smn_presupuesto_id@#,###,###}';
setComboValue('smn_ingreso_id','${fld:smn_ingreso_id}','form1');
document.form1.smn_prestacion_servicio_cabecera_id.value='${fld:smn_prestacion_servicio_cabecera_id@#,###,###}';
document.form1.smn_prestación_servicio_medico_detalle_id.value='${fld:smn_prestación_servicio_medico_detalle_id@#,###,###}';
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
document.form1.ccq_hora_entrada.value='${fld:ccq_hora_entrada@js}';
document.form1.ccq_hora_salida.value='${fld:ccq_hora_salida@#,###,###}';
document.form1.ccq_fecha_quirofano.value='${fld:ccq_fecha_quirofano@dd-MM-yyyy}';
setComboValue('smn_habitaciones_id','${fld:smn_habitaciones_id}','form1');
document.form1.ccq_cantidad_horas.value='${fld:ccq_cantidad_horas@#,###,###}';
setComboValue('smn_unidad_medida_rf','${fld:smn_unidad_medida_rf}','form1');
document.form1.id.value='${fld:smn_control_quirofano_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

