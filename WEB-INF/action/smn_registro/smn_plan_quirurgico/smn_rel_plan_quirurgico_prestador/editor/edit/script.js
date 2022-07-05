var smn_servicios_rf = '${fld:smn_servicios_rf}';
if (smn_servicios_rf == '' || smn_servicios_rf == 0)  {

}else{
	$('#smn_servicios_rf').val(smn_servicios_rf).change();
}

var smn_componentes_rf = '${fld:smn_componentes_rf}';
if (smn_componentes_rf == '' || smn_componentes_rf == 0)  {

}else{
	$('#smn_componentes_rf').val(smn_componentes_rf).change();
}

var smn_grupo_prestador_servicio_rf = '${fld:smn_grupo_prestador_servicio_rf}';
if (smn_grupo_prestador_servicio_rf == '' || smn_grupo_prestador_servicio_rf == 0)  {

}else{
	$('#smn_grupo_prestador_servicio_rf').val(smn_grupo_prestador_servicio_rf).change();
}

var smn_prestador_servicio_rf = '${fld:smn_prestador_servicio_rf}';
if (smn_prestador_servicio_rf == '' || smn_prestador_servicio_rf == 0)  {

}else{
	$('#smn_prestador_servicio_rf').val(smn_prestador_servicio_rf).change();
}

document.form1.smn_plan_quirurgico_id.value='${fld:smn_plan_quirurgico_id@#,###,###}';
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_componentes_rf','${fld:smn_componentes_rf}','form1');
setComboValue('smn_grupo_prestador_servicio_rf','${fld:smn_grupo_prestador_servicio_rf}','form1');
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
document.form1.id.value='${fld:smn_rel_plan_quirurgico_prestador_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

