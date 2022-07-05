document.form1.cmp_codigo.value='${fld:cmp_codigo@js}';
document.form1.cmp_descripcion.value='${fld:cmp_descripcion@js}';
document.form1.cmp_area_servicio.value='${fld:cmp_area_servicio}';
document.form1.cmp_unidad_servicio.value='${fld:cmp_unidad_servicio}';
document.form1.cmp_vigencia_desde.value='${fld:cmp_vigencia_desde@dd-MM-yyyy}';
document.form1.cmp_vigencia_hasta.value='${fld:cmp_vigencia_hasta@dd-MM-yyyy}';
setComboValue('cmp_visible','${fld:cmp_visible}','form1');
setComboValue('cmp_req_grupo_prestador','${fld:cmp_req_grupo_prestador}','form1');
document.form1.cmp_grupo_prestador.value='${fld:cmp_grupo_prestador}';
setComboValue('cmp_req_honorario','${fld:cmp_req_honorario}','form1');
document.form1.cmp_tiempo_estimado.value='${fld:cmp_tiempo_estimado@#.00}';
replaceDecimal(document.form1.cmp_tiempo_estimado);
document.form1.cmp_clase_auxiliar.value='${fld:cmp_clase_auxiliar}';
setComboValue('cmp_tipo','${fld:cmp_tipo}','form1');
document.form1.cmp_almacen.value='${fld:cmp_almacen}';
setComboValue('cmp_calculo','${fld:cmp_calculo}','form1');
document.form1.cmp_cantidad.value='${fld:cmp_cantidad@#.00}';
replaceDecimal(document.form1.cmp_cantidad);
document.form1.cmp_precio.value='${fld:cmp_precio@#.00}';
replaceDecimal(document.form1.cmp_precio);
document.form1.cmp_porcentaje.value='${fld:cmp_porcentaje@#.00}';
replaceDecimal(document.form1.cmp_porcentaje);
document.form1.cmp_trans_general.value='${fld:cmp_trans_general}';
document.form1.id.value='${fld:smn_componentes_id@#######}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");
<rows>selectSmnServiciosId('${fld:smn_servicios_id}','${fld:svc_codigo}');</rows>

