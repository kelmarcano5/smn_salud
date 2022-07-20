var cedula = '${fld:cedula}';
var contra = '${fld:contratante_id}';
var contraf = '${fld:contratante}';
var nuevo = '${fld:nuevo}';
var particular = '${fld:particular}';
var cod_serie = '${fld:sri_codigo}';
var unidad = '${fld:unidad}';
var grupo = '${fld:grupo}';
var ticket = '${fld:ticket}';
var serie = '${fld:serie}';
var unidadcol = '${fld:smn_unidad}';
console.log("PARA EJECUTAR NUEVO UUSARIO: "+unidadcol+"SERIE: "+serie);

if (serie=='A' && contraf=='' && nuevo=='SI' && particular=='NO') {
console.log("PARA EJECUTAR NUEVO UUSARIO: "+unidadcol);
	var uri="${def:actionroot}/nuevoUsuario?serie="+cod_serie+"&cedula="+cedula+"&contratante="+contraf+"&unidad="+unidad+"&grupo="+grupo+"&smn_unidad="+unidadcol;
	console.log(uri)
	ajaxCall(httpMethod="POST", 
		uri, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)
}

if (serie=='B' && contraf=='' && nuevo=='NO' && particular=='NO') {
console.log("PARA EJECUTAR NUEVO UUSARIO: "+unidadcol);
	var uri="${def:actionroot}/nuevoUsuario?serie="+cod_serie+"&cedula="+cedula+"&contratante="+contraf+"&unidad="+unidad+"&grupo="+grupo+"&smn_unidad="+unidadcol;
	console.log(uri);
	ajaxCall(httpMethod="POST", 
		uri, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)
}

if (serie=='C' && contraf=='' && nuevo=='NO' && particular=='NO' && ticket==0 && cedula!='') {
console.log("PARA EJECUTAR NUEVO UUSARIO: "+unidadcol);
	var uri="${def:actionroot}/revisarEstCita?cedula=" + cedula;
	console.log(uri);

	ajaxCall(	
		httpMethod="POST", 
		uri, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)
}


if (serie=='G' && contraf!='' && nuevo=='SI' && particular=='SI') {
	console.log("PARA EJECUTAR NUEVO UUSARIO: "+unidadcol);
	cod_serie='G'
	var uri="${def:actionroot}/nuevoUsuario?serie="+cod_serie+"&cedula="+cedula+"&contratante="+contraf+"&unidad="+unidad+"&grupo="+grupo+"&smn_unidad="+unidadcol;
	console.log(uri)
	ajaxCall(httpMethod="POST", 
		uri, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)
}

if (serie=='H' && contraf!='' && nuevo=='NO' && particular=='SI') {
	console.log("PARA EJECUTAR NUEVO UUSARIO: "+unidadcol);
	cod_serie='H'
	var uri="${def:actionroot}/nuevoUsuario?serie="+cod_serie+"&cedula="+cedula+"&contratante="+contraf+"&unidad="+unidad+"&grupo="+grupo+"&smn_unidad="+unidadcol;
	console.log(uri)
	ajaxCall(httpMethod="POST", 
		uri, 
		divResponse=null, 
		divProgress="status", 
		formName="form1", 
		afterResponseFn=null)
}

// if (cedula=='' && contra!=contraf) {
// 	cod_serie='G';
// }

// if (cedula!='' && contra==contraf) {
// 	cod_serie='H'
// }


