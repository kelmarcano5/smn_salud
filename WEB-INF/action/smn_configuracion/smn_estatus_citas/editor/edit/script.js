document.form1.eci_num_secuencia.value='${fld:eci_num_secuencia@js}';
document.form1.eci_descripcion.value='${fld:eci_descripcion@js}';
setComboValue('eci_aplica','${fld:eci_aplica}','form1');
document.form1.id.value='${fld:smn_estatus_citas_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 


 

