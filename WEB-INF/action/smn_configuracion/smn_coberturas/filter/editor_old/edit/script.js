document.form1.cob_codigo.value='${fld:cob_codigo@js}';
document.form1.cob_descripcion.value='${fld:cob_descripcion@js}';
document.form1.cob_descuento.value='${fld:cob_descuento@#.00}';
replaceDecimal(document.form1.cob_descuento);
document.form1.cob_tiempo_servicio.value='${fld:cob_tiempo_servicio}';
setComboValue('cob_unidad_tiempo_rf','${fld:cob_unidad_tiempo_rf}','form1');
document.form1.cob_deducible.value='${fld:cob_deducible@#.00}';
replaceDecimal(document.form1.cob_deducible);
document.form1.cob_time_desp_afil.value='${fld:cob_time_desp_afil}';
setComboValue('cob_otros_centros','${fld:cob_otros_centros}','form1');
document.form1.cob_cantidad_servicio.value='${fld:cob_cantidad_servicio}';
document.form1.cob_vigencia_desde.value='${fld:cob_vigencia_desde@dd-MM-yyyy}';
document.form1.cob_vigencia_hasta.value='${fld:cob_vigencia_hasta@dd-MM-yyyy}';
document.form1.cob_cobertura_desde.value='${fld:cob_cobertura_desde@#.00}';
replaceDecimal(document.form1.cob_cobertura_desde);
document.form1.cob_cobertura_hasta.value='${fld:cob_cobertura_hasta@#.00}';
replaceDecimal(document.form1.cob_cobertura_hasta);
document.form1.cob_deducible_centro.value='${fld:cob_deducible_centro@#.00}';
replaceDecimal(document.form1.cob_deducible_centro);
document.form1.cob_porc_deducible.value='${fld:cob_porc_deducible@#.00}';
replaceDecimal(document.form1.cob_porc_deducible);
document.form1.id.value='${fld:smn_coberturas_id}';
 
document.getElementById("formTitle").innerHTML = "Editar registro";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");
<rows>setCheckboxValue('smn_localidad_id','${fld:smn_localidad_id}','form1');</rows>
<rows>setCheckboxValue('smn_horarios_id','${fld:smn_horarios_id}','form1');</rows>

