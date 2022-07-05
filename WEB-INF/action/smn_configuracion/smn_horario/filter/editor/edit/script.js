document.form1.hor_codigo.value='${fld:hor_codigo@js}';
document.form1.hor_descripcion.value='${fld:hor_descripcion@js}';
setComboValue('hor_status','${fld:hor_status}','form1');
document.form1.id.value='${fld:smn_horarios_id}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");
<rows>setCheckboxValue('smn_tramos_id','${fld:smn_tramos_id}','form1');</rows>

