select
	smn_base.smn_rel_cuestionario_seccion.*,
	smn_base.smn_rel_cuestionario_seccion.rcs_tamano_letra||'px' as tamano_letra,
	smn_base.smn_rel_cuestionario_seccion.rcs_espacio_identacion || 'px' as identacion,
	smn_base.smn_rel_cuestionario_seccion.rcs_color_sombreado || ' solid 5px' as color_formulario2,
	smn_base.smn_seccion.sec_descripcion as seccion_combo
from
	smn_base.smn_cuestionario
	LEFT OUTER JOIN
	smn_base.smn_rel_cuestionario_seccion ON smn_base.smn_cuestionario.smn_cuestionario_id=smn_base.smn_rel_cuestionario_seccion.smn_cuestionario_id
	LEFT OUTER JOIN 
	smn_base.smn_seccion ON smn_base.smn_seccion.smn_seccion_id = smn_base.smn_rel_cuestionario_seccion.smn_seccion_id
where
	smn_base.smn_rel_cuestionario_seccion.smn_cuestionario_id = ${fld:cuestionario_id}
order by 
	smn_base.smn_rel_cuestionario_seccion.rcs_secuencia
