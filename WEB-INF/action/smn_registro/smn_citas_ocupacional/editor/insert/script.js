var idcitas = '${fld:id}';
var doc1 = '${fld:doc}';

alertBox ('Desea agregarle movimiento a esta cita?: ${fld:id}', '${lbl:b_yes}', '${lbl:b_not}',  'parent.search(); movimientoOK('+idcitas+','+doc1+');');



