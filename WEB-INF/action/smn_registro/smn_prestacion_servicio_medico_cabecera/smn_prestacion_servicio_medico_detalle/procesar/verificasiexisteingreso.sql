select smn_pagos.smn_nota_recepcion_servicio.smn_ingresos_rf,
${fld:smn_nota_recepcion_servicio_id} as smn_nota_recepcion_servicio_id,
${fld:smn_proveedor_id} as smn_proveedor_id
 from smn_pagos.smn_nota_recepcion_servicio where smn_pagos.smn_nota_recepcion_servicio.smn_ingresos_rf=${fld:ingreso}
