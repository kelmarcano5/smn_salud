listboxClear("smn_prestador_servicio_especialidad");

var optionChoose = document.createElement("option");
optionChoose.text = '[${lbl:b_choose}]';
optionChoose.value = "0";
document.form1.smn_prestador_servicio_especialidad.add(optionChoose, 0);

<smn_prestador_servicio_especialidad_rows>
	var option = document.createElement("option");
	option.text = "${fld:item@js}"; 
	option.value = "${fld:id}";
	document.form1.smn_prestador_servicio_especialidad.add(option, 0);
</smn_prestador_servicio_especialidad_rows>
