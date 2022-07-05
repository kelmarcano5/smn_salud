select
	smn_base.smn_auxiliar_persona_natural.ant_apellidos,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_salud.smn_citas.*
from
	smn_base.smn_auxiliar_persona_natural,
	smn_base.smn_clase_auxiliar,
	smn_salud.smn_citas
where
	smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id = smn_salud.smn_citas.cts_auxiliar and
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_citas.cts_clase_auxiliar and
	smn_citas_id = ${fld:id}
