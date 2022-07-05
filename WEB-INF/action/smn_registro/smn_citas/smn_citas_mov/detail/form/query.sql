select
	smn_salud.smn_citas_mov.smn_citas_id,
	smn_salud.smn_citas_mov.smn_citas_mov_id,
	smn_salud.smn_citas_mov.ctm_num_control_cita,
	smn_base.smn_servicios.svc_descripcion as smn_servicios_rf,
	smn_base.smn_unidades_servicios.uns_descripcion as smn_unidades_servicios_rf,
	smn_salud.smn_citas_mov.ctm_fecha_cita,
	smn_salud.smn_documento.doc_nombre as smn_documento_id,
	smn_salud.smn_tipo_consulta.tcs_nombre as smn_tipo_consulta_id,
	smn_salud.smn_estatus_citas.eci_descripcion as ctm_estatus_id,
	smn_salud.smn_citas_mov.smn_grupo_prestador_servicio_rf,
	smn_salud.smn_citas_mov.smn_prestador_servicio_rf,
	smn_salud.smn_motivos.mtv_descripcion as smn_motivos_id,
	smn_salud.smn_citas_mov.cts_tipo_orden,
	smn_salud.smn_citas_mov.ctm_fecha_registro
from 
	smn_salud.smn_citas_mov
	inner join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_citas_mov.smn_servicios_rf
	inner join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_citas_mov.smn_documento_id
	inner join smn_base.smn_unidades_servicios on smn_base.smn_unidades_servicios.smn_unidades_servicios_id = smn_salud.smn_citas_mov.smn_unidades_servicios_rf
	inner join smn_salud.smn_tipo_consulta on smn_salud.smn_tipo_consulta.smn_tipo_consulta_id = smn_salud.smn_citas_mov.smn_tipo_consulta_id
	inner join smn_salud.smn_estatus_citas on smn_salud.smn_estatus_citas.smn_estatus_citas_id = smn_salud.smn_citas_mov.ctm_estatus_id
	inner join smn_salud.smn_motivos on smn_salud.smn_motivos.smn_motivos_id = smn_salud.smn_citas_mov.smn_motivos_id
where
	smn_salud.smn_citas_mov.smn_citas_mov_id = ${fld:id}
