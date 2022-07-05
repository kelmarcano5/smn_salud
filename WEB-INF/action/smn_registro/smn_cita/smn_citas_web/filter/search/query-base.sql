select
	(select smn_salud.smn_documento.doc_codigo || ' - ' || smn_salud.smn_documento.doc_nombre from  smn_salud.smn_documento  where smn_salud.smn_documento.smn_documento_id is not null  and smn_salud.smn_documento.smn_documento_id=smn_salud.smn_citas.smn_documento_id  order by smn_salud.smn_documento.doc_nombre ) as smn_documento_id,
	(select smn_base.smn_auxiliar_persona_natural.ant_num_doc_oficial || ' - ' || smn_base.smn_auxiliar_persona_natural.ant_nombres || ' ' || smn_base.smn_auxiliar_persona_natural.ant_apellidos from  smn_base.smn_auxiliar_persona_natural  where smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id is not null  and smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id=smn_salud.smn_citas.cts_auxiliar  order by smn_base.smn_auxiliar_persona_natural.ant_num_doc_oficial ) as ant_apellidos,
	smn_base.smn_clase_auxiliar.cla_nombre,
	smn_salud.smn_citas.cts_num_control,
	smn_salud.smn_citas.cts_numero_ticket,
	smn_salud.smn_citas.cts_auxiliar,
	smn_salud.smn_citas.cts_fecha_registro,
	smn_salud.smn_citas.smn_citas_id	
from
	smn_base.smn_auxiliar_persona_natural,
	smn_base.smn_clase_auxiliar,
	smn_salud.smn_citas
where
	smn_base.smn_auxiliar_persona_natural.smn_auxiliar_persona_natural_id = smn_salud.smn_citas.cts_auxiliar and
	smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_citas.cts_clase_auxiliar and
	smn_citas_id is not null
	${filter}
order by 1 desc 
