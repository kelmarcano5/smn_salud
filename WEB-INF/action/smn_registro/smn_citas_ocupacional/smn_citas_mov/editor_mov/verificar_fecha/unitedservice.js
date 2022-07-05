var fee = '${fld:fecha_del_dia}';
if (fee == null) {
	console.log("debtri dl if: "+fee);
	document.getElementById('fecha_del_dia').value='${fld:fecha_del_dia}';
} else {

	console.log("else if: "+fee);
	document.getElementById('fecha_del_dia').value='${fld:fecha_del_dia}';
}