select 
	smn_base.smn_auxiliar_sucursales.smn_auxiliar_sucursales_id as id, smn_base.smn_auxiliar_sucursales.trs_codigo ||' - '|| smn_base.smn_auxiliar_sucursales.trs_nombre as item 
from 
	smn_base.smn_auxiliar
	left join smn_salud.smn_contratante on 
		smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf 
				inner join smn_base.smn_auxiliar_sucursales on smn_base.smn_auxiliar_sucursales.smn_auxiliar_relacionado = smn_salud.smn_contratante.smn_auxiliar_rf
where 
	smn_salud.smn_contratante.smn_contratante_id = ${fld:id}