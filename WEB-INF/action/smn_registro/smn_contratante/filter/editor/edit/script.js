var est = '${fld:smn_estructura_organizacional_rf}';
if (est == '' || est == 0)  {

}else{
	$('#smn_estructura_organizacional_rf').val(est).change();
}

var aux = '${fld:smn_auxiliar_rf}';
if (aux == '' || aux == 0)  {

}else{
	$('#smn_auxiliar_rf').val(aux).change();
}

$('#auxiliar').show();
$('#clase').show();

setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
setComboValue('smn_documento_ingreso_id','${fld:smn_documento_ingreso_id}','form1');
document.form1.cnt_numero_control.value='${fld:cnt_numero_control@#,###,###}';
setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');
setComboValue('smn_baremos_id','${fld:smn_baremos_id}','form1');
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('smn_plan_id','${fld:smn_plan_id}','form1');
document.form1.cnt_fecha_de_inicio.value='${fld:cnt_fecha_de_inicio@dd-MM-yyyy}';
document.form1.cnt_cantidad_citas.value='${fld:cnt_cantidad_citas@#,###,###}';
document.form1.id.value='${fld:smn_contratante_id@#,###,###}';
setComboValue('smn_clase_baremos_rf','${fld:smn_clase_baremos_rf}','form1');

setComboValue('smn_estructura_organizacional_rf','${fld:smn_estructura_organizacional_rf}','form1');
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

if ('${fld:smn_baremos_id}' != "") {
	$('#claseb').show();
}else{
	$('#claseb').hide();
}
 

