SELECT 
smn_base.smn_sucursales.smn_sucursales_id as id,
smn_base.smn_sucursales.suc_codigo||'-'||smn_base.smn_sucursales.suc_nombre as item 
from smn_base.smn_sucursales 
where smn_base.smn_sucursales.smn_sucursales_id =(SELECT smn_base.smn_areas_servicios.ase_sucursal
from smn_base.smn_areas_servicios
where smn_base.smn_areas_servicios.smn_areas_servicios_id=${fld:id})