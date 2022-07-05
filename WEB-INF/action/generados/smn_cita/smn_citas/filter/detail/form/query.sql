select
	(select smn_salud.smn_motivos.mtv_codigo || ' - ' || smn_salud.smn_motivos.mtv_descripcion from  smn_salud.smn_motivos  where smn_salud.smn_motivos.smn_motivos_id is not null  and smn_salud.smn_motivos.smn_motivos_id=smn_salud.smn_citas.smn_motivos_id  order by smn_salud.smn_motivos.mtv_descripcion ) as smn_motivos_id_combo,
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_salud.smn_citas.cts_clase_auxiliar  order by smn_base.smn_clase_auxiliar.cla_nombre ) as cla_nombre_combo,
	(select smn_base.smn_auxiliar_terceros.atr_codigo || ' - ' ||  smn_base.smn_auxiliar_terceros.atr_descripcion from  smn_base.smn_auxiliar_terceros  where smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id is not null  and smn_base.smn_auxiliar_terceros.smn_auxiliar_terceros_id=smn_salud.smn_citas.cts_auxiliar  order by smn_base.smn_auxiliar_terceros.atr_descripcion ) as smn_item_combo,
	(select smn_salud.smn_origen.ori_codigo || ' - ' || smn_salud.smn_origen.ori_descripcion from  smn_salud.smn_origen  where smn_salud.smn_origen.smn_origen_id is not null  and smn_salud.smn_origen.smn_origen_id=smn_salud.smn_citas.smn_origen_id  order by smn_salud.smn_origen.ori_descripcion ) as smn_origen_id_combo,
	(select smn_base.smn_prestadores_servicios.prs_codigo || ' - ' || smn_base.smn_prestadores_servicios.prs_nombres || ' ' || smn_base.smn_prestadores_servicios.prs_apellidos from  smn_base.smn_prestadores_servicios  where smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id is not null  and smn_base.smn_prestadores_servicios.smn_prestadores_servicios_id=smn_salud.smn_citas.cts_ordenante  order by smn_base.smn_prestadores_servicios.prs_nombres ) as prs_apellidos_combo,
	case
		when smn_salud.smn_citas.cts_tipo_orden='UG' then 'Urgente'
		when smn_salud.smn_citas.cts_tipo_orden='NR' then 'Normal'
	end as cts_tipo_orden_combo,
	(select smn_salud.smn_afiliados.afi_nombres || ' ' || smn_salud.smn_afiliados.afi_apellidos from  smn_salud.smn_afiliados  where smn_salud.smn_afiliados.smn_afiliados_id is not null  and smn_salud.smn_afiliados.smn_afiliados_id=smn_salud.smn_citas.cts_titular  order by  smn_salud.smn_afiliados.afi_nombres ) as afi_apellidos_combo,
	(select smn_salud.smn_estatus_citas.eci_num_secuencia || ' ' || smn_salud.smn_estatus_citas.eci_descripcion from  smn_salud.smn_estatus_citas  where smn_salud.smn_estatus_citas.smn_estatus_citas_id is not null  and smn_salud.smn_estatus_citas.smn_estatus_citas_id=smn_salud.smn_citas.smn_estatus_citas_id  order by  smn_salud.smn_estatus_citas.eci_num_secuencia ) as smn_estatus_citas_id_combo,
	(select smn_salud.smn_relacionados.rel_nombres || ' ' || smn_salud.smn_relacionados.rel_apellidos from  smn_salud.smn_relacionados  where smn_salud.smn_relacionados.smn_relacionados_id is not null  and smn_salud.smn_relacionados.smn_relacionados_id=smn_salud.smn_citas.smn_relacionados_id  order by smn_salud.smn_relacionados.rel_nombres ) as smn_relacionados_id_combo,
	(select smn_salud.smn_citas_mov.ctm_num_control_cita || ' - ' || smn_salud.smn_citas_mov.ctm_localidad from  smn_salud.smn_citas_mov  where smn_salud.smn_citas_mov.smn_citas_mov_id is not null  and smn_salud.smn_citas_mov.smn_citas_mov_id=smn_salud.smn_citas.smn_citas_mov_id  order by smn_salud.smn_citas_mov.ctm_localidad ) as smn_citas_mov_id_combo,
	smn_salud.smn_citas.*
from 
	smn_salud.smn_citas
where
	smn_citas_id = ${fld:id}
