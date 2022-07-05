addNew();
document.form1.smn_ingreso_id.value="${fld:smn_ingreso_id}";
alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'setFocusOnForm("form1");');

