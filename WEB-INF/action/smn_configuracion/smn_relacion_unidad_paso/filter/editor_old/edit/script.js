setComboValue('smn_area_servicio_rf','${fld:smn_area_servicio_rf}','form1');
setComboValue('smn_unidad_servicio_rf','${fld:smn_unidad_servicio_rf}','form1');
setComboValue('smn_paso_rf','${fld:smn_paso_rf}','form1');
setComboValue('smn_serie_id','${fld:smn_serie_id}','form1');
setComboValue('rup_estatus','${fld:rup_estatus}','form1');
document.form1.rup_vigencia.value='${fld:rup_vigencia@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_rel_unidad_paso@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

