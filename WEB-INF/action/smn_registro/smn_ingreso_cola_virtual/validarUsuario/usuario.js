var cedula = '${fld:cedula}';
var ced = '${fld:ced}';
var ticket = '${fld:ticket}';

if (cedula == ''){


ajaxCall(	
		httpMethod="POST", 
		uri="${def:actionroot}/validarUsuarioSistema?cedula=" + ced, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)

	

}else if (cedula != '' && ticket != 0){

	alertBox ('${lbl:b_ticket_existe}', '${lbl:b_continue_button}', null);
	

}else if (cedula != "" && ticket == 0){

	

	ajaxCall(	
		httpMethod="POST", 
		uri="${def:actionroot}/revisarEstCita?cedula=" + cedula , 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)

}

document.getElementById("write").value = "";

