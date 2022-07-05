select DISTINCT
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id,
	smn_salud.smn_presupuesto.smn_presupuesto_id,
	smn_salud.smn_presupuesto_detalle.smn_servicios_rf
from smn_salud.smn_presupuesto_detalle
	INNER JOIN smn_salud.smn_presupuesto ON smn_salud.smn_presupuesto.smn_presupuesto_id = smn_salud.smn_presupuesto_detalle.smn_presupuesto_id
	--INNER JOIN smn_base.smn_servicios_componentes ON smn_base.smn_servicios_componentes.smn_servicios_id = smn_salud.smn_presupuesto_detalle.smn_servicios_rf
	--INNER JOIN smn_base.smn_componentes ON smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id
	--INNER JOIN smn_base.smn_baremos_detalle ON smn_base.smn_baremos_detalle.smn_servicios_rf = smn_salud.smn_presupuesto_detalle.smn_servicios_rf
WHERE
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_id=${fld:smn_presupuesto_id} and smn_salud.smn_presupuesto.smn_baremo_rf=${fld:smn_baremos_id}