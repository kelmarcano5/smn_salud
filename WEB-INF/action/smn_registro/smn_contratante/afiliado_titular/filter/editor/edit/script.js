setComboValue('smn_documento_id','${fld:smn_documento_id}','form1');
document.form1.afi_numero_control.value='${fld:afi_numero_control@#,###,###}';
setComboValue('smn_contratante_id','${fld:smn_contratante_id}','form1');
setComboValue('smn_auxiliar_unidades_negocios_rf','${fld:smn_auxiliar_unidades_negocios_rf}','form1');
setComboValue('smn_auxiliar_sucursales_rf','${fld:smn_auxiliar_sucursales_rf}','form1');
setComboValue('smn_auxiliar_areas_servicios_rf','${fld:smn_auxiliar_areas_servicios_rf}','form1');
setComboValue('smn_auxiliar_unidades_servicios_rf','${fld:smn_auxiliar_unidades_servicios_rf}','form1');
setComboValue('afi_clase_auxiliar_rf','${fld:afi_clase_auxiliar_rf}','form1');
setComboValue('afi_auxiliar_rf','${fld:afi_auxiliar_rf}','form1');
document.form1.afi_fecha_de_registro.value='${fld:afi_fecha_de_registro@dd-MM-yyyy}';
document.form1.afi_fecha_de_inicio.value='${fld:afi_fecha_de_inicio@dd-MM-yyyy}';
setComboValue('afi_estatus','${fld:afi_estatus}','form1');
document.form1.afi_fecha_desafiliado.value='${fld:afi_fecha_desafiliado@dd-MM-yyyy}';
document.form1.id.value='${fld:smn_afiliados_id@#,###,###}';
//document.form1.aux_maneja_sucursal.value='${fld:aux_maneja_sucursal@js}';
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


 

