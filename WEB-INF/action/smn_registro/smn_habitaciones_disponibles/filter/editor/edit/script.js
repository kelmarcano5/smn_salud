var habitaciones = '${fld:smn_habitaciones_id}';
$('#smn_habitaciones_id').val(habitaciones).trigger('change');

var ingreso = '${fld:smn_ingreso_id}';
$('#smn_ingreso_id').val(ingreso).trigger('change');

//setComboValue('smn_habitaciones_id','${fld:smn_habitaciones_id}','form1');
//document.form1.smn_ingreso_id.value='${fld:smn_ingreso_id@#,###,###}';
document.form1.had_fecha_ingreso.value='${fld:had_fecha_ingreso@dd-MM-yyyy}';
document.form1.had_fecha_egreso.value='${fld:had_fecha_egreso@dd-MM-yyyy}';
setComboValue('had_estatus','${fld:had_estatus}','form1');
document.form1.id.value='${fld:smn_habitaciones_disponibles_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

