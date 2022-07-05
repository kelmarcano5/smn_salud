var aux = '${fld:smn_auxiliar_rf}';
$('#smn_auxiliar_rf').val(aux).change();

var ejp = '${fld:coa_ejecutivo_atención_pagador}';
$('#coa_ejecutivo_atención_pagador').val(ejp).change();

var mon = '${fld:smn_moneda_rf}';
$('#smn_moneda_rf').val(mon).change();

var tas = '${fld:smn_tasa_rf}';
$('#smn_tasa_rf').val(tas).change();

var esp = '${fld:coa_estatus_proceso}';
$('#coa_estatus_proceso').val(esp).change();

var esf = '${fld:coa_estatus_financiero}';
$('#coa_estatus_financiero').val(esf).change();

var ing = '${fld:smn_ingreso_id}';
$('#smn_ingreso_id').val(ing).change();

var pre = '${fld:smn_presupuesto_id}';
$('#smn_presupuesto_id').val(pre).change();

document.form1.smn_ingreso_id.value='${fld:smn_ingreso_id@#,###,###}';
document.form1.smn_presupuesto_id.value='${fld:smn_presupuesto_id@#,###,###}';
setComboValue('smn_auxiliar_rf','${fld:smn_auxiliar_rf}','form1');
document.form1.coa_hora_solicitada.value='${fld:coa_hora_solicitada@#,###,###}';
setComboValue('coa_ejecutivo_atención_pagador','${fld:coa_ejecutivo_atención_pagador}','form1');
document.form1.coa_observación_inicial.value='${fld:coa_observación_inicial@#,###,###}';
document.form1.coa_monto_solicitado_servicios_clinicos_ml.value='${fld:coa_monto_solicitado_servicios_clinicos_ml@#,###,##0.00}';
document.form1.coa_monto_solicitado_medicinas_y_mmq_ml.value='${fld:coa_monto_solicitado_medicinas_y_mmq_ml@#,###,##0.00}';
document.form1.coa_monto_solicitado_honorarios_ml.value='${fld:coa_monto_solicitado_honorarios_ml@#,###,##0.00}';
document.form1.coa_monto_total_solicitado_ml.value='${fld:coa_monto_total_solicitado_ml@#,###,##0.00}';
setComboValue('smn_moneda_rf','${fld:smn_moneda_rf}','form1');
setComboValue('smn_tasa_rf','${fld:smn_tasa_rf}','form1');
document.form1.coa_monto_solicitado_servicios_clinicos_ma.value='${fld:coa_monto_solicitado_servicios_clinicos_ma@#,###,##0.00}';
document.form1.coa_monto_solicitado_medicinas_y_mmq_ma.value='${fld:coa_monto_solicitado_medicinas_y_mmq_ma@#,###,##0.00}';
document.form1.coa_monto_solicitado_honorarios_ma.value='${fld:coa_monto_solicitado_honorarios_ma@#,###,##0.00}';
document.form1.coa_monto_total_solicitado_ma.value='${fld:coa_monto_total_solicitado_ma@#,###,##0.00}';
document.form1.coa_fecha_aprobación.value='${fld:coa_fecha_aprobación@dd-MM-yyyy}';
document.form1.coa_hora_aprobación.value='${fld:coa_hora_aprobación@js}';
document.form1.coa_monto_aprobado_servicios_medicos_ml.value='${fld:coa_monto_aprobado_servicios_medicos_ml@#,###,##0.00}';
document.form1.coa_monto_aprobado_medicinas_y_mmq_ml.value='${fld:coa_monto_aprobado_medicinas_y_mmq_ml@#,###,##0.00}';
document.form1.coa_monto_aprobado_honorarios_ml.value='${fld:coa_monto_aprobado_honorarios_ml@#,###,##0.00}';
document.form1.coa_monto_total_aprobado_ml.value='${fld:coa_monto_total_aprobado_ml@#,###,##0.00}';
document.form1.coa_monto_aprobado_servicios_medicos_ma.value='${fld:coa_monto_aprobado_servicios_medicos_ma@#,###,##0.00}';
document.form1.coa_monto_aprobado_medicinas_y_mmq_ma.value='${fld:coa_monto_aprobado_medicinas_y_mmq_ma@#,###,##0.00}';
document.form1.coa_monto_aprobado_honorarios_ma.value='${fld:coa_monto_aprobado_honorarios_ma@#,###,##0.00}';
document.form1.coa_monto_total_aprobado_ma.value='${fld:coa_monto_total_aprobado_ma@#,###,##0.00}';
setComboValue('coa_estatus_proceso','${fld:coa_estatus_proceso}','form1');
setComboValue('coa_estatus_financiero','${fld:coa_estatus_financiero}','form1');
document.form1.id.value='${fld:smn_cobertura_admision_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

