// var smn_ser = '${fld:smn_servicios_rf}';
// if (smn_ser == '' || smn_ser == 0)  {

// }else{
// 	setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');

// 	$('#smn_servicios_rf').val(smn_ser).trigger('change');
// }

// var smn_grup = '${fld:smn_grupo_prestador_servicio_rf}';
// if (smn_grup == '' || smn_grup == 0)  {

// }else{

// 	$('#tr_grupo').show();
// 	setComboValue('smn_grupo_prestador_servicio_rf','${fld:smn_grupo_prestador_servicio_rf}','form1');

// 	$('#smn_grupo_prestador_servicio_rf').val(smn_grup).trigger('change');
// }

// var smn_prest = '${fld:smn_prestador_servicio_rf}';
// if (smn_prest == '' || smn_prest == 0)  {

// }else{
// 	$('#tr_prestador').show();
// 	setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');

// 	$('#smn_prestador_servicio_rf').val(smn_prest).trigger('change');
// }




var tipo = '${fld:inm_tipo_orden}';
if (tipo == '' || tipo == 0)  {

}else{
	//$("#inm_tipo_orden option[value="0"]").remove();
	//setComboValue('inm_tipo_orden','${fld:inm_tipo_orden}','form1');

	$('#inm_tipo_orden').val(tipo).trigger('change');
}

var aux = '${fld:smn_auxiliar_rf}';
if (aux == '' || aux == 0)  {

}else{
	setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');

	$('#smn_auxiliar_rf').val(aux).trigger('change');
}

var cla = '${fld:smn_clase_auxiliar_rf}';
if (cla == '' || cla == 0)  {

}else{
	setComboValue('smn_clase_auxiliar_rf','${fld:smn_clase_auxiliar_rf}','form1');

	$('#smn_clase_auxiliar_rf').val(cla).trigger('change');
}



document.form1.smn_unidades_servicios_rf.value='${fld:smn_unidades_servicios_rf@#######}';


document.form1.smn_ingreso_id.value='${fld:smn_ingreso_id@#######}';
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
setComboValue('smn_componente_rf','${fld:smn_componente_rf}','form1');
document.form1.inm_accion.value='${fld:inm_accion@js}';
setComboValue('smn_tipo_consulta_rf','${fld:smn_tipo_consulta_rf}','form1');
setComboValue('smn_grupo_prestador_servicio_rf','${fld:smn_grupo_prestador_servicio_rf}','form1');
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
setComboValue('smn_motivos_id','${fld:smn_motivos_id}','form1');
document.form1.smn_clase_auxiliar_rf.value='${fld:smn_clase_auxiliar_rf@#######}';

document.form1.smn_auxiliar_rf.value='${fld:smn_auxiliar_rf@#######}';
document.form1.inm_ordenante_descripcion.value='${fld:inm_ordenante_descripcion@js}';
setComboValue('smn_sintoma_id','${fld:smn_sintoma_id}','form1');
//setComboValue('inm_tipo_orden','${fld:inm_tipo_orden}','form1');
document.form1.inm_num_orden_medica.value='${fld:inm_num_orden_medica@#######}';
//setComboValue('inm_estatus','${fld:inm_estatus}','form1');
document.form1.id.value='${fld:smn_ingresos_mov_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");
<rows>selectSmnServiciosId('${fld:smn_servicios_id}','${fld:svc_codigo}');</rows> 



 

