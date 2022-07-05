select
		smn_salud.smn_rel_documentos_servicios.smn_rel_documentos_servicios_id,
select
		smn_salud.smn_rel_documentos_servicios.smn_rel_documentos_servicios_id,
select
		smn_salud.smn_rel_documentos_servicios.smn_rel_documentos_servicios_id,
	case
	when smn_salud.smn_rel_documentos_servicios.rdt_tipo_generacion=IN then '${lbl:b_ingreso}'
	when smn_salud.smn_rel_documentos_servicios.rdt_tipo_generacion=DI then '${lbl:b_diaria}'
	end as rdt_tipo_generacion_combo,
	smn_salud.smn_rel_documentos_servicios.smn_documentos_id,
	smn_salud.smn_rel_documentos_servicios.smn_servicios_id,
	smn_salud.smn_rel_documentos_servicios.rdt_tipo_generacion,
	smn_salud.smn_rel_documentos_servicios.rdt_hora_generacion
	
from
	smn_salud.smn_rel_documentos_servicios
