var orden = $('#orden').val();
console.log("ID DE ORDEN DESDE INSERT ORDEN: "+orden);
generarOrdenMedica(orden);
addNew();
alertBox ('${lbl:b_record_added}: ${fld:id}', '${lbl:b_continue_button}', null, 'search(); setFocusOnForm("form1");');

