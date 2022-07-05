let myTable= "<table style='width:100%; border-collapse: separate; border-spacing: 5px;'>";
	myTable+="<tr style='width:100%; border-collapse: separate; border-spacing: 10px';><td> ${fld:seccion} </td></tr>";
<rows>
	myTable+="<tr style='background:${fld:csp_color_sombreado};'><td style=' color:${fld:csp_color_letra};font-family:${fld:csp_tipo_letra};font-size:${fld:csp_tamano_letra};text-indent:${fld:csp_espacio_identacion}; border: solid; border-width: 15px 15;'> ${fld:pregunta_combo}";
	myTable+="<table style='width:100%; border-collapse: separate; border-spacing: 10px;'>";
	if('${fld:smn_tipo_variable_col_1_combo}')
	{
		if('${fld:csp_tipo_valor}' == "IN")
			myTable+="<tr><td style='display:${fld:mostrar_variable_1}'>${fld:smn_tipo_variable_col_1_combo}:</td> <td><input style='font-size:20px' type='text' class='respuestas entero' name='respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_1_id}'>";
		else
		if('${fld:csp_tipo_valor}' == "TX")
			myTable+="<tr><td style='display:${fld:mostrar_variable_1}'>${fld:smn_tipo_variable_col_1_combo}:</td><td><textarea style='font-size:20px' rows='${fld:smn_limite_lineas_col_1}' maxlength='${fld:smn_limite_total_col_1}' name='respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_1_id}' class='respuestas'></textarea>";
		else
		if('${fld:csp_tipo_valor}' == "DC")
			myTable+="<tr><td style='display:${fld:mostrar_variable_1}'>${fld:smn_tipo_variable_col_1_combo}:</td> <td><input style='font-size:20px' type='text' class='respuestas decimal' name='respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_1_id}'>";
		else
		if('${fld:csp_tipo_valor}' == "DT")
			myTable+="<tr><td style='display:${fld:mostrar_variable_1}'>${fld:smn_tipo_variable_col_1_combo}:</td> <td><input style='font-size:20px' type='date' class='respuestas' name='respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_1_id}'>";
		else
		if('${fld:csp_tipo_valor}' == "HR")
			myTable+="<tr><td style='display:${fld:mostrar_variable_1}'>${fld:smn_tipo_variable_col_1_combo}:</td> <td><input style='font-size:20px' type='time' class='respuestas' name='respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_1_id}'>";

		myTable+="<div style='display:none;color:red;' id='msj-respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_1_id}'>${lbl:parameter_required}</div></td>";
		myTable+="<td style='display:none'><input type='hidden' id='obligatoriedad-respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_1_id}' name='obligatoriedad-respuesta1-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_1_id}' value='${fld:csp_obligatoriedad}'></td></tr>"
	}

	if('${fld:smn_tipo_variable_col_2_combo}')
	{
		if('${fld:csp_tipo_valor}' == "IN")
			myTable+="<tr><td style='display:${fld:mostrar_variable_2}'>${fld:smn_tipo_variable_col_2_combo}:</td> <td><input style='font-size:20px' type='text' class='respuestas entero' name='respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_2_id}'>";
		else
		if('${fld:csp_tipo_valor}' == "TX")
			myTable+="<tr><td style='display:${fld:mostrar_variable_2}'>${fld:smn_tipo_variable_col_2_combo}:</td> <td><textarea style='font-size:20px' rows='${fld:smn_limite_lineas_col_2}' maxlength='${fld:smn_limite_total_col_2}' name='respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_2_id}' class='respuestas'></textarea>";
		else
		if('${fld:csp_tipo_valor}' == "DC")
			myTable+="<tr><td style='display:${fld:mostrar_variable_2}'>${fld:smn_tipo_variable_col_2_combo}:</td> <td><input style='font-size:20px' type='text' class='respuestas decimal' name='respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_2_id}'>";
		else
		if('${fld:csp_tipo_valor}' == "DT")
			myTable+="<tr><td style='display:${fld:mostrar_variable_2}'>${fld:smn_tipo_variable_col_2_combo}:</td> <td><input style='font-size:20px' type='date' class='respuestas' name='respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_2_id}'>";
		else
		if('${fld:csp_tipo_valor}' == "HR")
			myTable+="<tr><td style='display:${fld:mostrar_variable_2}'>${fld:smn_tipo_variable_col_2_combo}:</td> <td><input style='font-size:20px' type='time' class='respuestas' name='respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_2_idsmn_tipo_variable_col_2_id}'>";

		myTable+="<div style='display:none;color:red;' id='msj-respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_2_id}'>${lbl:parameter_required}</div></td>";
		myTable+="<td style='display:none'><input type='hidden' id='obligatoriedad-respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_2_id}' name='obligatoriedad-respuesta2-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_2_idsmn_tipo_variable_col_2_id}' value='${fld:csp_obligatoriedad}'></td></tr>"
	}

	if('${fld:smn_tipo_variable_col_3_combo}')
	{
		if('${fld:csp_tipo_valor}' == "IN")
			myTable+="<tr><td style='display:${fld:mostrar_variable_3}'>${fld:smn_tipo_variable_col_3_combo}:</td> <td><input style='font-size:20px' type='text' class='respuestas entero' name='respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_3_id}'>";
		else
		if('${fld:csp_tipo_valor}' == "TX")
			myTable+="<tr><td style='display:${fld:mostrar_variable_3}'>${fld:smn_tipo_variable_col_3_combo}:</td> <td><textarea style='font-size:20px' rows='${fld:smn_limite_lineas_col_3}' maxlength='${fld:smn_limite_total_col_3}' name='respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_3_id}' class='respuestas'></textarea>";
		else
		if('${fld:csp_tipo_valor}' == "DC")
			myTable+="<tr><td style='display:${fld:mostrar_variable_3}'>${fld:smn_tipo_variable_col_3_combo}:</td> <td><input style='font-size:20px' type='text' class='respuestas decimal' name='respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_3_id}'>";
		else
		if('${fld:csp_tipo_valor}' == "DT")
			myTable+="<tr><td style='display:${fld:mostrar_variable_3}'>${fld:smn_tipo_variable_col_3_combo}:</td> <td><input style='font-size:20px' type='date' class='respuestas' name='respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_3_id}'>";
		else
		if('${fld:csp_tipo_valor}' == "HR")
			myTable+="<tr><td style='display:${fld:mostrar_variable_3}'>${fld:smn_tipo_variable_col_3_combo}:</td> <td><input style='font-size:20px' type='time' class='respuestas' name='respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_3_id}'>";

		myTable+="<div style='display:none;color:red;' id='msj-respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_3_id}'>${lbl:parameter_required}</div></td>";
		myTable+="<td style='display:none'><input type='hidden' id='obligatoriedad-respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_3_id}' name='obligatoriedad-respuesta3-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_3_id}' value='${fld:csp_obligatoriedad}'></td></tr>"
	}

	if('${fld:smn_tipo_variable_col_4_combo}')
	{
		if('${fld:csp_tipo_valor}' == "IN")
			myTable+="<tr><td style='display:${fld:mostrar_variable_4}'>${fld:smn_tipo_variable_col_4_combo}:</td> <td><input style='font-size:20px' type='text' class='respuestas entero' name='respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_4_id}'>";
		else
		if('${fld:csp_tipo_valor}' == "TX")
			myTable+="<tr><td style='display:${fld:mostrar_variable_4}'>${fld:smn_tipo_variable_col_4_combo}:</td> <td><textarea style='font-size:20px' rows='${fld:smn_limite_lineas_col_4}' maxlength='${fld:smn_limite_total_col_4}' name='respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_4_id}' class='respuestas'></textarea>";
		else
		if('${fld:csp_tipo_valor}' == "DC")
			myTable+="<tr><td style='display:${fld:mostrar_variable_4}'>${fld:smn_tipo_variable_col_4_combo}:</td> <td><input style='font-size:20px' type='text' class='respuestas decimal' name='respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_4_id}'>";
		else
		if('${fld:csp_tipo_valor}' == "DT")
			myTable+="<tr><td style='display:${fld:mostrar_variable_4}'>${fld:smn_tipo_variable_col_4_combo}:</td> <td><input style='font-size:20px' type='date' class='respuestas' name='respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_4_id}'>";
		else
		if('${fld:csp_tipo_valor}' == "HR")
			myTable+="<tr><td style='display:${fld:mostrar_variable_4}'>${fld:smn_tipo_variable_col_4_combo}:</td> <td><input style='font-size:20px' type='time' class='respuestas' name='respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_4_id}'>";

		myTable+="<div style='display:none;color:red;' id='msj-respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_4_id}'>${lbl:parameter_required}</div></td>";
		myTable+="<td style='display:none'><input type='hidden' id='obligatoriedad-respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_4_id}' name='obligatoriedad-respuesta4-${fld:smn_rel_cues_secc_preg_id}-${fld:smn_tipo_variable_col_4_id}' value='${fld:csp_obligatoriedad}'></td></tr>"
	}
	myTable+="</table>";
	myTable+="</td></tr>"; 
</rows>
myTable+="</table>";
document.getElementById('preguntas${fld:id}').innerHTML = myTable;

$(".entero").keypress(function(tecla){
	if(tecla.keyCode < 48 ||  tecla.keyCode > 57)
		return false;
});

$(".decimal").keypress(function(tecla){

	if(tecla.keyCode < 48 ||  tecla.keyCode > 57)
	{
		if(tecla.keyCode != 46 || this.value == "")
		{
			return false;
		}
	}
});