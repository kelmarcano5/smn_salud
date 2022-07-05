setComboValue('smn_dispositivos_id','${fld:smn_dispositivos_id}','form1');
setComboValue('smn_series_id','${fld:smn_series_id}','form1');
setComboValue('cvm_datos_pac','${fld:cvm_datos_pac}','form1');
setComboValue('cvm_unidad_llamada','${fld:cvm_unidad_llamada}','form1');
setComboValue('cvm_pacientes_espera','${fld:cvm_pacientes_espera}','form1');
setComboValue('cvm_tiempo_aprox_espera','${fld:cvm_tiempo_aprox_espera}','form1');
document.form1.id.value='${fld:smn_campos_vis_mon_dis_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

