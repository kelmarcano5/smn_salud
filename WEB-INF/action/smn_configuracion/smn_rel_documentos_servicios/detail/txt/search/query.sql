select
select
select
	case
	when smn_salud.smn_rel_documentos_servicios.rdt_tipo_generacion=IN then '${lbl:b_ingreso}'
	when smn_salud.smn_rel_documentos_servicios.rdt_tipo_generacion=DI then '${lbl:b_diaria}'
	end as rdt_tipo_generacion_combo,
	smn_salud.smn_rel_documentos_servicios.*
from
	smn_salud.smn_rel_documentos_servicios
where
	smn_rel_documentos_servicios_id = ${fld:id}
