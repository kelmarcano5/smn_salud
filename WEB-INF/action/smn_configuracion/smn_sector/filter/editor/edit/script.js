document.form1.sec_codigo.value='${fld:sec_codigo@js}';
document.form1.sec_descripcion.value='${fld:sec_descripcion@js}';
setComboValue('smn_pais_rf','${fld:smn_pais_rf}','form1');
setComboValue('smn_entidades_federales_rf','${fld:smn_entidades_federales_rf}','form1');
setComboValue('smn_ciudades_rf','${fld:smn_ciudades_rf}','form1');
setComboValue('smn_municipios_rf','${fld:smn_municipios_rf}','form1');
setComboValue('smn_parroquias_rf','${fld:smn_parroquias_rf}','form1');
setComboValue('smn_zonas_postales_rf','${fld:smn_zonas_postales_rf}','form1');
document.form1.id.value='${fld:smn_sector_id@#,###,###}';
 
document.getElementById("formTitle").innerHTML = "${lbl:b_edit_record}";
document.getElementById("grabar").disabled=false;
setFocusOnForm("form1");


document.form1.sec_codigo.disabled=true;
 

