INSERT INTO smn_pagos.smn_rel_orden_pago_nrs
(
	smn_rel_orden_pago_nrs_id,
	smn_nota_recepcion_servicio_id,
	smn_orden_pago_id
)
VALUES
(
	${seq:nextval@smn_pagos.seq_smn_rel_orden_pago_nrs},
	${fld:smn_nota_recepcion_servicio_id},
	(select smn_pagos.smn_orden_pago.smn_orden_pago_id from smn_pagos.smn_orden_pago where smn_pagos.smn_orden_pago.smn_ingresos_rf=${fld:smn_ingresos_rf})
);