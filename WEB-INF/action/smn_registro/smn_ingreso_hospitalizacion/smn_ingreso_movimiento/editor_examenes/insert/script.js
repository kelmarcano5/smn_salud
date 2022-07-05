addNew();
document.form1.smn_ingreso_id.value="${fld:smn_ingreso_id}";
document.form1.id_area.value="${fld:id_area}";
alertBox ('El registro fue grabado en la base de datos', '${lbl:b_continue_button}', null, 'setFocusOnForm("form1");');

