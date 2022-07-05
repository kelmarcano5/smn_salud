UPDATE smn_salud.smn_ordenes_medicas SET
    omd_estatus='EM'

WHERE
    smn_ordenes_medicas_id=${fld:smn_ordenes_medicas_id} and smn_ingreso_id=${fld:smn_ingreso_id}

