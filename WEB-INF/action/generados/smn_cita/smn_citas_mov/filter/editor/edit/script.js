document.form1.ctm_num_control_cita.value='${fld:ctm_num_control_cita@js}';
document.form1.ctm_fecha.value='${fld:ctm_fecha@dd-MM-yyyy}';
document.form1.ctm_localidad.value='${fld:ctm_localidad@js}';
setComboValue('ctm_servicio','${fld:ctm_servicio}','form1');
setComboValue('ctm_componente','${fld:ctm_componente}','form1');
setComboValue('ctm_prestador_servicio','${fld:ctm_prestador_servicio}','form1');
setComboValue('ctm_tipo_componente','${fld:ctm_tipo_componente}','form1');
setComboValue('ctm_estatus','${fld:ctm_estatus}','form1');
setComboValue('ctm_observ_cita','${fld:ctm_observ_cita}','form1');
document.form1.id.value='${fld:smn_citas_mov_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

