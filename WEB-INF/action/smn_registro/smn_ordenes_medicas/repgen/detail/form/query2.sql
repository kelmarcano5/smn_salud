select
		smn_salud.smn_ordenes_medicas.omd_numero_orden,
	smn_salud.smn_ordenes_medicas.omd_descripcion,
	smn_salud.smn_ordenes_medicas.omd_clase_auxiliar,
	smn_salud.smn_ordenes_medicas.omd_auxiliar,
	smn_salud.smn_ordenes_medicas.omd_num_doc_oficial,
	smn_salud.smn_ordenes_medicas.omd_tipo_orden,
	smn_salud.smn_ordenes_medicas.omd_fecha_registro,
	smn_salud.smn_ordenes_medicas.omd_numero_orden,
	smn_salud.smn_ordenes_medicas.omd_descripcion,
	smn_salud.smn_ordenes_medicas.omd_clase_auxiliar,
	smn_salud.smn_ordenes_medicas.omd_auxiliar,
	smn_salud.smn_ordenes_medicas.omd_num_doc_oficial,
	smn_salud.smn_ordenes_medicas.omd_tipo_orden,
	smn_salud.smn_ordenes_medicas.omd_fecha_registro,
	smn_salud.smn_ordenes_medicas.omd_numero_orden,
	smn_salud.smn_ordenes_medicas.omd_descripcion,
	smn_salud.smn_ordenes_medicas.omd_clase_auxiliar,
	smn_salud.smn_ordenes_medicas.omd_auxiliar,
	smn_salud.smn_ordenes_medicas.omd_num_doc_oficial,
	smn_salud.smn_ordenes_medicas.omd_tipo_orden,
	smn_salud.smn_ordenes_medicas.omd_fecha_registro
from
	smn_salud.smn_ordenes_medicas 
where
	smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id = ${fld:id}
