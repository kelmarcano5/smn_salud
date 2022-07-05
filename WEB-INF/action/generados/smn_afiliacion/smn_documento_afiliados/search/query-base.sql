select	
	smn_salud.smn_tipo_documento_afiliado.smn_tipo_documento_afiliado_id, 
	smn_salud.smn_tipo_documento_afiliado.tdo_codigo as tdo_codigo_pl0,
	smn_salud.smn_afiliados.smn_afiliados_id, 
	smn_salud.smn_afiliados.afi_num_control as afi_num_control_pl1,
	(select smn_salud.smn_tipo_documento_afiliado.tdo_codigo || ' - ' || smn_salud.smn_tipo_documento_afiliado.tdo_descripcion from  smn_salud.smn_tipo_documento_afiliado  where smn_salud.smn_tipo_documento_afiliado.smn_tipo_documento_afiliado_id is not null  and smn_salud.smn_tipo_documento_afiliado.smn_tipo_documento_afiliado_id=smn_salud.smn_documento_afiliados.smn_tipo_documento_afiliado_id  order by smn_salud.smn_tipo_documento_afiliado.tdo_descripcion ) as smn_tipo_documento_afiliado_id_combo,
	(select smn_salud.smn_afiliados.afi_num_control || ' - ' || smn_salud.smn_afiliados.afi_nombres || ' ' || smn_salud.smn_afiliados.afi_apellidos from  smn_salud.smn_afiliados  where smn_salud.smn_afiliados.smn_afiliados_id is not null  and smn_salud.smn_afiliados.smn_afiliados_id=smn_salud.smn_documento_afiliados.smn_afiliados_id  order by 1 ) as smn_afiliados_id_combo,
	smn_salud.smn_documento_afiliados.smn_documento_afiliados_id,
	smn_salud.smn_documento_afiliados.doc_desc_documento,
	smn_salud.smn_documento_afiliados.doc_archivo,
	smn_salud.smn_documento_afiliados.doc_contenido,
	smn_salud.smn_documento_afiliados.doc_descripcion,
	smn_salud.smn_documento_afiliados.doc_tamano,
	smn_salud.smn_documento_afiliados.doc_idioma,
	smn_salud.smn_documento_afiliados.doc_usuario,
	smn_salud.smn_documento_afiliados.doc_fecha_registro,
	smn_salud.smn_documento_afiliados.doc_hora

from
	smn_salud.smn_tipo_documento_afiliado,
	smn_salud.smn_afiliados,
	smn_salud.smn_documento_afiliados 
where
	smn_documento_afiliados_id is not null
and 	smn_salud.smn_tipo_documento_afiliado.smn_tipo_documento_afiliado_id=smn_salud.smn_documento_afiliados.smn_tipo_documento_afiliado_id and
	smn_salud.smn_afiliados.smn_afiliados_id=smn_salud.smn_documento_afiliados.smn_afiliados_id 

${filter}
order by 
	smn_documento_afiliados_id