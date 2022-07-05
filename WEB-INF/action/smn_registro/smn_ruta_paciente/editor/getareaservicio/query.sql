SELECT 
smn_base.smn_areas_servicios.smn_areas_servicios_id as id,
smn_base.smn_areas_servicios.ase_codigo||'-'||smn_base.smn_areas_servicios.ase_descripcion as item 
from smn_base.smn_areas_servicios
left outer join smn_base.smn_sucursales on smn_base.smn_sucursales.smn_sucursales_id = smn_base.smn_areas_servicios.ase_sucursal
left outer join smn_base.smn_entidades on smn_base.smn_entidades.smn_entidades_id = smn_base.smn_sucursales.suc_empresa
where smn_base.smn_areas_servicios.ase_empresa=${fld:id}