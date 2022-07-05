select 
	count(smn_servicios_id)
from 
	smn_base.smn_servicios
inner join smn_base.smn_tipos_servicios on
	smn_base.smn_servicios.smn_tipo_servicio_rf = smn_base.smn_tipos_servicios.smn_tipos_servicios_id
where smn_base.smn_tipos_servicios.tsr_codigo = '002' and smn_base.smn_servicios.smn_servicios_id = ${fld:smn_servicios_rf} and
 '${fld:smn_tipo_consulta_rf}'  = 'NULL'
 having count(smn_servicios_id) > 0
