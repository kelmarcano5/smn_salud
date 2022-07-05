select
	smn_salud.smn_citas.smn_citas_id,
	smn_base.smn_auxiliar.aux_descripcion as cts_auxiliar,
	smn_base.smn_clase_auxiliar.cla_nombre as cts_clase_auxiliar, 
	contra.aux_descripcion as smn_contratante_id,
	smn_salud.smn_documento.doc_nombre as smn_documento_id,
	smn_salud.smn_estatus_citas.eci_descripcion as ctm_estatus_id,
	smn_salud.smn_citas.cts_num_control,
	smn_salud.smn_citas.cts_numero_ticket,
	smn_salud.smn_citas.cts_fecha_registro
	
	
from
	smn_salud.smn_citas
	inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_citas.cts_auxiliar
	inner join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_citas.cts_clase_auxiliar
	left join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_citas.smn_contratante_id
	left join smn_base.smn_auxiliar contra on contra.smn_auxiliar_id = smn_salud.smn_contratante.smn_auxiliar_rf
	left join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_citas.smn_documento_id
	inner join smn_salud.smn_estatus_citas on smn_salud.smn_estatus_citas.smn_estatus_citas_id = smn_salud.smn_citas.smn_estatus_citas_id
where
	smn_salud.smn_citas.smn_citas_id = ${fld:id}
