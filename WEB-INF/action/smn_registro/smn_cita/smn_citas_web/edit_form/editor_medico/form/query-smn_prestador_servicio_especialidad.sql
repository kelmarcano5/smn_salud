select 
	smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id as id,
	smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_descripcion as item 
from 
	smn_base.smn_prestadores_servicios,
	smn_base.smn_prestadores_servicios_especialidad
where
	smn_base.smn_prestadores_servicios_especialidad.smn_prestadores_servicios_id = ${fld:id}
