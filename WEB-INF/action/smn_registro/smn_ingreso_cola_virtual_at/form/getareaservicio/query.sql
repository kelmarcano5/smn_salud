SELECT 
	smn_base.smn_areas_servicios.smn_areas_servicios_id as id,
	smn_base.smn_areas_servicios.ase_codigo||'-'||smn_base.smn_areas_servicios.ase_descripcion as item 
from smn_base.smn_areas_servicios
where smn_base.smn_areas_servicios.ase_empresa=${fld:id}
group by id order by smn_base.smn_areas_servicios.ase_codigo desc