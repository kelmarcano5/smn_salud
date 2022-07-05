select DISTINCT
	smn_salud.smn_documento.doc_codigo || ' - ' || smn_salud.smn_documento.doc_nombre  as smn_documento_id,
	paciente.aux_descripcion as cts_auxiliar,
	smn_salud.smn_citas.smn_citas_id,
	smn_salud.smn_citas.cts_num_control,
	smn_salud.smn_citas.cts_numero_ticket,
	contratante.aux_descripcion as contratante,
	smn_salud.smn_citas_mov.ctm_fecha_cita as fecha_cita,
	smn_base.smn_servicios.svc_descripcion as servicio,
	smn_salud.smn_documento.smn_documento_id as documento_id,
	smn_salud.smn_citas_mov.smn_unidades_servicios_rf as unidad,
	smn_salud.smn_estatus_citas.eci_descripcion as smn_estatus_citas_id,
	smn_salud.smn_citas.cts_fecha_registro
	
from
	smn_salud.smn_citas
	inner join smn_base.smn_auxiliar paciente on paciente.smn_auxiliar_id = smn_salud.smn_citas.cts_auxiliar
	inner join smn_base.smn_auxiliar_clase on smn_base.smn_auxiliar_clase.smn_auxiliar_id = smn_salud.smn_citas.cts_auxiliar
	inner join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_contratante_id = smn_salud.smn_citas.smn_contratante_id
	--inner join smn_salud.smn_afiliado_titular ON smn_salud.smn_afiliado_titular.smn_contratante_id = smn_salud.smn_citas.smn_contratante_id 
	left join smn_base.smn_auxiliar contratante on contratante.smn_auxiliar_id = smn_salud.smn_citas.smn_contratante_id
	left join smn_salud.smn_documento on smn_salud.smn_documento.smn_documento_id = smn_salud.smn_citas.smn_documento_id
	left join smn_salud.smn_citas_mov on  smn_salud.smn_citas_mov.smn_citas_id = smn_salud.smn_citas.smn_citas_id
	left join smn_base.smn_servicios on smn_base.smn_servicios.smn_servicios_id = smn_salud.smn_citas_mov.smn_servicios_rf
	inner join smn_salud.smn_estatus_citas on smn_salud.smn_estatus_citas.smn_estatus_citas_id = smn_salud.smn_citas.smn_estatus_citas_id


where
	smn_salud.smn_citas.smn_citas_id is not null
	${filter}
order by 1 desc 
