SELECT 
smn_base.smn_sucursales.smn_sucursales_id as id,
smn_base.smn_sucursales.suc_codigo||'-'||smn_base.smn_sucursales.suc_nombre as item 
from smn_base.smn_sucursales 
left outer join smn_salud.smn_ingreso_cola_virtual on smn_salud.smn_ingreso_cola_virtual.smn_sucursal_rf=smn_base.smn_sucursales.smn_sucursales_id
where smn_base.smn_sucursales.smn_sucursales_id=(SELECT smn_salud.smn_ingreso_cola_virtual.smn_sucursal_rf
from smn_salud.smn_ingreso_cola_virtual
where
smn_salud.smn_ingreso_cola_virtual.smn_entidad_rf=${fld:id} group by smn_salud.smn_ingreso_cola_virtual.smn_sucursal_rf)  GROUP BY id