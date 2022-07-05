var orden = $('#orden').val();
console.log("ID DE ORDEN DESDE INSERT ORDEN: "+orden);
var pato = $('#patologia').val();
var baremos = $('#baremo').val();
console.log("ID DE PATOLOGIA DESDE INSERT PATOLOGIA: "+pato+" baremos: "+ baremos);
generarOrdenyPatologia(orden, pato, baremos);