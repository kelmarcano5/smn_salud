var precio1 = '${fld:precio@##,###,##0.00}';
var precio = formatear_monto(precio1);
var preciom = '${fld:precioma}';
var moneda = '${fld:smn_moneda_rf}';
	$('#prec_alt').hide();
	$('#mont_alt').hide();
// console.log(precio);
// console.log(preciom);
// console.log(moneda);
if(preciom != 0) {
	if (moneda != 0 && moneda != "") {
		obtenertasadeldia(moneda);
	}

	var precioma = '${fld:precioma@##,###,##0.00}';
	//alert("entro aqui");
	document.form1.prd_precio_ma.value = formatear_monto(precioma);
	document.form1.smn_moneda_rf.value = moneda;
	$('#prec_alt').show();
	$('#mont_alt').show();
	//document.getElementById("prec_alt").style.display='';
	//document.getElementById("mont_alt").style.display='';
	document.form1.prd_moneda_alterna.disabled=true;
}else{
	$('#prec_alt').hide();
	$('#mont_alt').hide();
	document.form1.prd_precio_ma.value =0;
	document.form1.prd_moneda_alterna.value =0;
	document.form1.prd_precio.disabled=true;
	//document.getElementById("prec_alt").style.display='none';
	//document.getElementById("mont_alt").style.display='none';
		document.form1.prd_precio.disabled=true;
}

document.getElementById("prd_precio").value = precio;
	document.form1.prd_precio.disabled=true;

function obtenertasadeldia(moneda) {
	var uri="${def:actionroot}/gettasaactual?id=" + moneda;
	console.log(uri);
	 ajaxCall(	
			httpMethod="GET", 
			uri, 
			divResponse=null, 
			divProgress="status", 
			formName="form1", 
			afterResponseFn=null, //function 'setElementFirstIndex' select first element of combo list
			onErrorFn=null); 
}

function formatear_monto(monto){
		var base = monto;
		base1 = base.replace('.','');
		base = base1.replace('.','');
		base1 = base.replace(',','.');
		
		return base1;
	}

