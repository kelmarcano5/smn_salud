select
	smn_base.smn_v_auxiliar.smn_item,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_base.smn_prestadores_servicios.prs_apellidos,
	smn_salud.smn_afiliados.afi_apellidos,
		smn_salud.smn_citas.smn_citas_id,
	${field}
from
	smn_salud.smn_citas
	left outer join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_salud.smn_citas.cts_auxiliar
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_citas.cts_clase_auxiliar
	left outer join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_citas.cts_ordenante
	inner join smn_salud.smn_afiliados on smn_salud.smn_afiliados.smn_afiliados_id = smn_salud.smn_citas.cts_titular
where
		smn_salud.smn_citas.smn_citas_id is not null
	${filter}
	
	
