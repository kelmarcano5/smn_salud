document.form1.dis_codigo.value='${fld:dis_codigo@js}';
document.form1.dis_nombre.value='${fld:dis_nombre@js}';
setComboValue('dis_tipo','${fld:dis_tipo}','form1');
document.form1.dis_mac_address.value='${fld:dis_mac_address@js}';
setComboValue('smn_usuario_id','${fld:smn_usuario_id}','form1');
setComboValue('smn_entidades_rf','${fld:smn_entidades_rf}','form1');
setComboValue('smn_sucursales_rf','${fld:smn_sucursales_rf}','form1');
setComboValue('smn_areas_servicios_rf','${fld:smn_areas_servicios_rf}','form1');
setComboValue('smn_unidad_servicio_rf','${fld:smn_unidad_servicio_rf}','form1');
document.form1.id.value='${fld:smn_dispositivos_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.dis_codigo.disabled=true;
 

