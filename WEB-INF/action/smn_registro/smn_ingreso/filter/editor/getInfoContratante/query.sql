select
	smn_base.smn_auxiliar.aux_maneja_sucursal as maneja_sucursal
from 
	smn_base.smn_auxiliar
	left join smn_salud.smn_contratante on 
		smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf 
where 
	smn_salud.smn_contratante.smn_contratante_id = ${fld:id}