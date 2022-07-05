setComboValue('smn_ingresos_id','${fld:smn_ingresos_id}','form1');
setComboValue('smn_mov_caja_cabecera_id','${fld:smn_mov_caja_cabecera_id}','form1');
setComboValue('smn_unidades_servicios_rf','${fld:smn_unidades_servicios_rf}','form1');
setComboValue('psc_estatus','${fld:psc_estatus}','form1');
document.form1.id.value='${fld:smn_prestacion_servicio_medico_cabecera_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

