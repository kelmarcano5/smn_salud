select 
	count(smn_base.smn_componentes.smn_componentes_id) as afecta
from 
	smn_base.smn_componentes 
inner join smn_base.smn_servicios_componentes on
	smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id
where
	smn_base.smn_servicios_componentes.smn_servicios_id = ${fld:smn_servicios_rf} and
	smn_base.smn_componentes.cmp_visible = 'S' and 
	'${fld:smn_componente_rf}'  = 'NULL'
 having count(smn_base.smn_componentes.smn_componentes_id) > 0