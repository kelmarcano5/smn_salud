document.form1.afi_num_control.value='${fld:afi_num_control@js}';
document.form1.afi_apellidos.value='${fld:afi_apellidos@js}';
document.form1.afi_nombres.value='${fld:afi_nombres@js}';
setComboValue('afi_sexo','${fld:afi_sexo}','form1');
document.form1.afi_tipo_doc_oficial.value='${fld:afi_tipo_doc_oficial@#,###,###}';
document.form1.afi_nro_doc_oficial.value='${fld:afi_nro_doc_oficial@js}';
document.form1.id.value='${fld:smn_afiliados_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");

