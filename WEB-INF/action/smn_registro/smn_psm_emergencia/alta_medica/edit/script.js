
document.form1.ctm_observaciones_id.value='${fld:ctm_observaciones_id@js}';
document.form1.id.value='${fld:smn_ingresos_id@#######}';
 
document.getElementById("formTitle").innerHTML = "Alta Medica";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

document.form1.igs_hora_salida.value='${fld:igs_hora_salida@js}';
document.form1.igs_fecha_salida.value='${fld:igs_fecha_salida@dd-MM-yyyy}';

