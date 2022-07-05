select
	(select smn_salud.smn_afiliados.afi_nombres || ' - ' || smn_salud.smn_afiliados.afi_apellidos from  smn_salud.smn_afiliados  where smn_salud.smn_afiliados.smn_afiliados_id is not null  and smn_salud.smn_afiliados.smn_afiliados_id=smn_salud.smn_presupuesto.pre_titular  order by smn_salud.smn_afiliados.afi_nombres ) as pre_titular_combo,
	(select smn_salud.smn_familiar.fam_nombres || ' - ' || smn_salud.smn_familiar.fam_apellidos from  smn_salud.smn_familiar  where smn_salud.smn_familiar.smn_familiar_id is not null  and smn_salud.smn_familiar.smn_familiar_id=smn_salud.smn_presupuesto.pre_beneficiario  order by smn_salud.smn_familiar.fam_nombres ) as pre_beneficiario_combo,
	(select smn_salud.smn_planes.pla_codigo || ' - ' || smn_salud.smn_planes.pla_descripcion from  smn_salud.smn_planes  where smn_salud.smn_planes.smn_planes_id is not null  and smn_salud.smn_planes.smn_planes_id=smn_salud.smn_presupuesto.pre_plan  order by smn_salud.smn_planes.pla_descripcion ) as pre_plan_combo,
	(select smn_base.smn_clase_auxiliar.cla_codigo|| ' - ' || smn_base.smn_clase_auxiliar.cla_nombre from  smn_base.smn_clase_auxiliar  where smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id is not null  and smn_base.smn_clase_auxiliar.smn_clase_auxiliar_id=smn_salud.smn_presupuesto.pre_clase_auxiliar  order by smn_base.smn_clase_auxiliar.cla_nombre ) as pre_clase_auxiliar_combo,
	(select smn_base.smn_v_auxiliar.smn_codigo || ' - ' ||  smn_base.smn_v_auxiliar.smn_item from  smn_base.smn_v_auxiliar  where smn_base.smn_v_auxiliar.smn_v_auxiliar_id is not null  and smn_base.smn_v_auxiliar.smn_v_auxiliar_id=smn_salud.smn_presupuesto.pre_auxiliar  order by smn_base.smn_v_auxiliar.smn_item ) as pre_auxiliar_combo,
	(select smn_salud.smn_ordenes_medicas.omd_numero_orden || ' - ' || smn_salud.smn_ordenes_medicas.omd_descripcion from  smn_salud.smn_ordenes_medicas  where smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id is not null  and smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id=smn_salud.smn_presupuesto.smn_ordenes_medicas_id  order by smn_salud.smn_ordenes_medicas.omd_descripcion ) as smn_ordenes_medicas_id_combo,
	(select smn_salud.smn_estado_presupuesto.epr_codigo || ' - ' || smn_salud.smn_estado_presupuesto.epr_descripcion from  smn_salud.smn_estado_presupuesto  where smn_salud.smn_estado_presupuesto.smn_estado_presupuesto_id is not null  and smn_salud.smn_estado_presupuesto.smn_estado_presupuesto_id=smn_salud.smn_presupuesto.smn_estado_presupuesto_id  order by 1 ) as smn_estado_presupuesto_id_combo,
	smn_salud.smn_presupuesto.*
from 
	smn_salud.smn_presupuesto
where
	smn_presupuesto_id = ${fld:id}