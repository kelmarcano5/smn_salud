select
	smn_base.smn_auxiliar.aux_maneja_sucursal as maneja_sucursal
from 
	smn_base.smn_auxiliar
	inner join smn_salud.smn_contratante on 
		smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf and
		smn_base.smn_auxiliar.smn_clase_auxiliar_rf = smn_salud.smn_contratante.smn_clase_auxiliar_rf
where 
	smn_salud.smn_contratante.smn_contratante_id = ${fld:smn_contratante_id}
and smn_base.smn_auxiliar.aux_maneja_sucursal = 'SI' and '${fld:smn_auxiliar_areas_servicios_rf}' = 'NULL'
