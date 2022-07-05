select
	smn_base.smn_auxiliar_terceros.atr_descripcion,
	smn_base.smn_clase_auxiliar.cla_nombre,
	${field}
from
	smn_base.smn_auxiliar_terceros,
	smn_base.smn_clase_auxiliar,
	smn_salud.smn_afiliado_titular
where
	smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id = smn_salud.smn_afiliado_titular.afi_auxiliar_rf and
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_afiliado_titular.afi_clase_auxiliar_rf and
		smn_salud.smn_afiliado_titular.smn_afiliados_id = ${fld:id}
	
