select
	smn_base.smn_v_auxiliar.smn_item,
	smn_base.smn_clase_auxiliar.cla_nombre,
		smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id,
select
		smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id,
select
		smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id,
select
		smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id,
	case
	when smn_salud.smn_ordenes_medicas.omd_tipo_orden='UG' then '${lbl:b_urgente}'
	when smn_salud.smn_ordenes_medicas.omd_tipo_orden='NR' then '${lbl:b_normal}'
	end as omd_tipo_orden,
	smn_salud.smn_ordenes_medicas.smn_ingreso_id,
	smn_salud.smn_ordenes_medicas.omd_numero_orden,
	smn_salud.smn_ordenes_medicas.omd_descripcion,
	smn_salud.smn_ordenes_medicas.smn_prestador_servicio_rf,
	smn_salud.smn_ordenes_medicas.omd_clase_auxiliar,
	smn_salud.smn_ordenes_medicas.omd_auxiliar,
	smn_salud.smn_ordenes_medicas.omd_num_doc_oficial,
	smn_salud.smn_ordenes_medicas.omd_tipo_orden,
	smn_salud.smn_ordenes_medicas.omd_indicaciones,
	smn_salud.smn_ordenes_medicas.omd_fecha_registro
	
from
	smn_salud.smn_ordenes_medicas
	left outer join smn_base.smn_v_auxiliar on smn_base.smn_v_auxiliar.smn_v_auxiliar_id = smn_salud.smn_ordenes_medicas.omd_auxiliar
	left outer join smn_base.smn_clase_auxiliar on smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id = smn_salud.smn_ordenes_medicas.omd_clase_auxiliar
