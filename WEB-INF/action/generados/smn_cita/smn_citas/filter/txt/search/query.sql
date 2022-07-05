select
	smn_base.smn_auxiliar_terceros.atr_descripcion,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_base.smn_prestadores_servicios.prs_apellidos,
	smn_salud.smn_afiliados.afi_apellidos,
	smn_salud.smn_citas.smn_citas_id,
	smn_salud.smn_citas.cts_num_control,
	smn_salud.smn_citas.cts_num_doc_oficial,
	smn_salud.smn_citas.cts_clase_auxiliar,
	smn_salud.smn_citas.cts_auxiliar,
	smn_salud.smn_citas.cts_ordenante,
	smn_salud.smn_citas.cts_titular,
	smn_salud.smn_citas.cts_fecha_registro	
from
	smn_salud.smn_citas
	left outer join smn_base.smn_auxiliar_terceros on smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id = smn_salud.smn_citas.cts_auxiliar
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_citas.cts_clase_auxiliar
	left outer join smn_base.smn_prestadores_servicios on smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id = smn_salud.smn_citas.cts_ordenante
	inner join smn_salud.smn_afiliados on smn_salud.smn_afiliados.smn_afiliados_id = smn_salud.smn_citas.cts_titular
