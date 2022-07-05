select 
SUM(smn_salud.smn_presupuesto_detalle.prd_precio) as precioml,
SUM(smn_salud.smn_presupuesto_detalle.prd_monto_moneda_local) as montoml,
SUM(smn_salud.smn_presupuesto_detalle.prd_monto_descuento_ml) as descuentoml,
SUM(smn_salud.smn_presupuesto_detalle.prd_monto_neto_ml) as netoml,

SUM(smn_salud.smn_presupuesto_detalle.prd_precio_ma) as precioma,
SUM(smn_salud.smn_presupuesto_detalle.prd_moneda_alterna) as montoma,
SUM(smn_salud.smn_presupuesto_detalle.prd_monto_descuento_ma) as descuentoma,
SUM(smn_salud.smn_presupuesto_detalle.prd_monto_neto_ma) as netoma
from smn_salud.smn_presupuesto_detalle
where 
smn_salud.smn_presupuesto_detalle.smn_presupuesto_id=${fld:id}