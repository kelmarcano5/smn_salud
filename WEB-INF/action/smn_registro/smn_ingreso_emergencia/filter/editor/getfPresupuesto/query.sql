select smn_salud.smn_presupuesto.smn_presupuesto_id as id, smn_salud.smn_presupuesto.pre_numero_control ||' - Paciente: '|| smn_base.smn_auxiliar.aux_nombres ||' '|| smn_base.smn_auxiliar.aux_apellidos as item,
smn_salud.smn_presupuesto.pre_numero_control from smn_base.smn_auxiliar
left join smn_salud.smn_presupuesto on smn_salud.smn_presupuesto.smn_auxiliar_rf = smn_base.smn_auxiliar.smn_auxiliar_id
where smn_salud.smn_presupuesto.smn_presupuesto_id=${fld:id} and smn_salud.smn_presupuesto.smn_estado_presupuesto_id=1