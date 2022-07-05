
var status =  "${fld:status}";
var cedula =  "${fld:cedula}";

var stCO = 'CO'
var stCR = 'CR'



if(status == stCO ){

	 ajaxCall(	
		httpMethod="POST", 
		uri="${def:actionroot}/actualizarPaciente?serie=" + "C" + "&cedula=" + cedula, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)


}else if(status == stCR){

		ajaxCall(	
		httpMethod="POST", 
		uri="${def:actionroot}/actualizarPaciente?serie=" + "D" + "&cedula=" + cedula, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)
}





