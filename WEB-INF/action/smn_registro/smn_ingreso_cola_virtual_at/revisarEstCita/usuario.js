
var status =  "${fld:estado}";
var cedula =  "${fld:cedula}";

console.log(status);
console.log(cedula);
if(status == '04'){


	 ajaxCall(	
		httpMethod="POST", 
		uri="${def:actionroot}/actualizarPaciente?serie=" + "E" + "&cedula=" + cedula, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)


}else{


ajaxCall(	
		httpMethod="POST", 
		uri="${def:actionroot}/revisarEstFinan?cedula=" + cedula, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)


}





