let myTable= "<table style='width:100%; border-collapse: separate; border-spacing: 5px;'>";
	myTable+="<tr style='width:100%; border-collapse: separate; border-spacing: 10px';><td> ${fld:seccion} </td></tr>";
<rows>
	myTable+="<tr style='background:${fld:csp_color_sombreado};'><td style=' color:${fld:csp_color_letra};font-family:${fld:csp_tipo_letra};font-size:${fld:csp_tamano_letra};text-indent:${fld:csp_espacio_identacion}; border: none; '> ${fld:pregunta_combo}";
	myTable+="<table style='width:100%; border-collapse: separate; border-spacing: 10px;'>";
	if('${fld:smn_tipo_variable_col_1_combo}')
	{
		myTable+="<tr><td style='display:${fld:mostrar_variable_1}'>${fld:smn_tipo_variable_col_1_combo}: ${fld:respuesta1}</td></tr>";
	}

	if('${fld:smn_tipo_variable_col_2_combo}')
	{
		myTable+="<tr><td style='display:${fld:mostrar_variable_2}'>${fld:smn_tipo_variable_col_2_combo}: ${fld:respuesta2}</td></tr>";
	}

	if('${fld:smn_tipo_variable_col_3_combo}')
	{
		myTable+="<tr><td style='display:${fld:mostrar_variable_3}'>${fld:smn_tipo_variable_col_3_combo}: ${fld:respuesta3}</td></tr>";
	}

	if('${fld:smn_tipo_variable_col_4_combo}')
	{
		myTable+="<tr><td style='display:${fld:mostrar_variable_4}'>${fld:smn_tipo_variable_col_4_combo}: ${fld:respuesta4}</td></tr>";
	}
	myTable+="</table>";
	myTable+="</td></tr>"; 
</rows>
myTable+="</table>";
document.getElementById('preguntas${fld:id}').innerHTML = myTable;