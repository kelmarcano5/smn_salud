var orden = $('#orden').val();
console.log("ID DE ORDEN DESDE INSERT ORDEN: "+orden);
var pato = $('#patologia').val();
console.log("ID DE PATOLOGIA DESDE INSERT PATOLOGIA: "+pato);
generarOrdenyPatologia(orden, pato);