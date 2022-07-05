select
	smn_cuestionario.smn_cuestionario_id,
	smn_cuestionario.cue_codigo as cue_codigo_pl0,
	smn_cuestionario.cue_descripcion,
	smn_cuestionario.smn_modulo_rf,
	smn_cuestionario.cue_tipo_letra,
	smn_cuestionario.cue_color_letra,
	smn_cuestionario.cue_color_formulario||' solid 5px' as color_formulario,
	smn_cuestionario.cue_color_formulario,
	smn_cuestionario.cue_color_sombreado,
	smn_cuestionario.cue_tamano_letra ||'px' as tamano_letra2,
	smn_cuestionario.cue_estatus,
	smn_cuestionario.cue_nivel_seguridad
from
	smn_base.smn_cuestionario
where
	smn_cuestionario.smn_cuestionario_id = ${fld:id}