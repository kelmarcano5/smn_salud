select	
	(select smn_salud.smn_afiliados.afi_nombres || ' - ' || smn_salud.smn_afiliados.afi_apellidos from  smn_salud.smn_afiliados  where smn_salud.smn_afiliados.smn_afiliados_id is not null  and smn_salud.smn_afiliados.smn_afiliados_id=smn_salud.smn_presupuesto.pre_titular  order by smn_salud.smn_afiliados.afi_nombres ) as pre_titular_combo,
	(select smn_salud.smn_familiar.fam_nombres || ' - ' || smn_salud.smn_familiar.fam_apellidos from  smn_salud.smn_familiar  where smn_salud.smn_familiar.smn_familiar_id is not null  and smn_salud.smn_familiar.smn_familiar_id=smn_salud.smn_presupuesto.pre_beneficiario  order by smn_salud.smn_familiar.fam_nombres ) as pre_beneficiario_combo,
	(select smn_salud.smn_planes.pla_codigo || ' - ' || smn_salud.smn_planes.pla_descripcion from  smn_salud.smn_planes  where smn_salud.smn_planes.smn_planes_id is not null  and smn_salud.smn_planes.smn_planes_id=smn_salud.smn_presupuesto.pre_plan  order by smn_salud.smn_planes.pla_descripcion ) as pre_plan_combo,
	(select smn_base.smn_v_auxiliar.smn_codigo || ' - ' ||  smn_base.smn_v_auxiliar.smn_item from  smn_base.smn_v_auxiliar  where smn_base.smn_v_auxiliar.smn_v_auxiliar_id is not null  and smn_base.smn_v_auxiliar.smn_v_auxiliar_id=smn_salud.smn_presupuesto.pre_auxiliar  order by smn_base.smn_v_auxiliar.smn_item ) as pre_auxiliar_combo,
	smn_salud.smn_presupuesto.pre_numero_control,
	smn_salud.smn_presupuesto.pre_fecha,
	smn_salud.smn_presupuesto.pre_titular,
	smn_salud.smn_presupuesto.pre_beneficiario,
	smn_salud.smn_presupuesto.pre_plan,
	smn_salud.smn_presupuesto.pre_auxiliar,
	smn_salud.smn_presupuesto.pre_fecha_registro,
	smn_salud.smn_presupuesto.smn_presupuesto_id

from
	smn_salud.smn_presupuesto
where
	smn_presupuesto_id is not null	
 	 	${filter}
order by 
	smn_presupuesto_id