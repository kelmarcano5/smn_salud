var auxiliar = '${fld:smn_auxiliar_rf}';
$('#smn_auxiliar_rf').val(auxiliar).trigger('change');

var diagnostico = '${fld:smn_diagnostico_rf}';
$('#smn_diagnostico_rf').val(diagnostico).trigger('change');

var motivo = '${fld:rpc_motivo}';
$('#rpc_motivo').val(motivo).trigger('change');

document.form1.smn_ingreso_id.value='${fld:smn_ingreso_id@#,###,###}';
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
setComboValue('smn_diagnostico_rf','${fld:smn_diagnostico_rf}','form1');
setComboValue('rpc_motivo','${fld:rpc_motivo}','form1');
//document.form1.smn_diagnostico_rf.value='${fld:smn_diagnostico_rf@#,###,###}';
document.form1.rpc_fecha_desde.value='${fld:rpc_fecha_desde@dd-MM-yyyy}';
document.form1.rpc_fecha_hasta.value='${fld:rpc_fecha_hasta@dd-MM-yyyy}';
document.form1.rpc_fecha_reintegro.value='${fld:rpc_fecha_reintegro@dd-MM-yyyy}';
//document.form1.rpc_motivo.value='${fld:rpc_motivo@#,###,###}';
document.form1.rpc_observacion.value='${fld:rpc_observacion@js}';
document.form1.id.value='${fld:smn_reposos_constancias_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

