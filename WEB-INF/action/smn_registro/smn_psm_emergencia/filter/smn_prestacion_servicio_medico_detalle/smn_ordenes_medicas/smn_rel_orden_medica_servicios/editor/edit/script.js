var ser = '${fld:smn_servicios_rf}';
$('#smn_servicios_rf').val(ser).change();

var gru = '${fld:smn_grupo_prestador_rf}';
$('#smn_grupo_prestador_servicio_rf').val(gru).change();

var pres = '${fld:smn_prestador_servicio_referido_rf}';
$('#smn_prestador_servicio_rf').val(pres).change();


	$('#tr_prestador').show();
		$('#tr_grupo').show();


document.form1.smn_ordenes_medicas_id.value='${fld:smn_ordenes_medicas_id@#,###,###}';
setComboValue('smn_servicios_rf','${fld:smn_servicios_rf}','form1');
document.form1.ros_observacion.value='${fld:ros_observacion@js}';
setComboValue('smn_grupo_prestador_servicio_rf','${fld:smn_grupo_prestador_servicio_rf}','form1');
setComboValue('smn_prestador_servicio_rf','${fld:smn_prestador_servicio_rf}','form1');
document.form1.id.value='${fld:smn_rel_orden_medica_servicios_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

