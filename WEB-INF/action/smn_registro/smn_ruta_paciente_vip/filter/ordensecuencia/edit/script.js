setComboValue('smn_unidad_servicio_rf','${fld:smn_unidad_servicio_rf}','form1');
document.form1.rta_secuencia.value='${fld:rta_secuencia@#######}';

document.form1.id.value='${fld:smn_ruta_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");



 

