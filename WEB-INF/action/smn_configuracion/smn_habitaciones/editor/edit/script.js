setComboValue('smn_activo_fijo_rf','${fld:smn_activo_fijo_rf}','form1');
document.form1.hab_codigo.value='${fld:hab_codigo@js}';
document.form1.hab_descripcion.value='${fld:hab_descripcion@js}';
setComboValue('hab_estatus','${fld:hab_estatus}','form1');
setComboValue('hab_clase','${fld:hab_clase}','form1');
setComboValue('hab_tipo_servicio','${fld:hab_tipo_servicio}','form1');
document.form1.id.value='${fld:smn_habitaciones_id@#,###,###}';

setComboValue('hab_naturaleza','${fld:hab_naturaleza}','form1');
setComboValue('smn_areas_servicios_rf','${fld:smn_areas_servicios_rf}','form1');
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.hab_codigo.disabled=true;
 

