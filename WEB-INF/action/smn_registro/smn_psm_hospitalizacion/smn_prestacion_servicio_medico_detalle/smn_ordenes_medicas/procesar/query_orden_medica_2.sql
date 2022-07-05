select DISTINCT smn_salud.smn_ordenes_medicas.*, 
    ${fld:smn_prestacion_servicio_medico_cabecera_id} as smn_prestacion_servicio_medico_cabecera_id, 
    ${fld:smn_ingreso_id}  as smn_ingreso_id,
    ${fld:smn_unidades_servicios_rf} as smn_unidades_servicios_rf,
    ${fld:smn_grupos_prestadores_id} as smn_grupos_prestadores_id,
    ${fld:smn_prestador_servicio_rf} as smn_prestador_servicio_rf,
    ${fld:smn_ordenes_medicas_id}  as smn_ordenes_medicas_id,
    smn_salud.smn_rel_orden_medica_servicios.smn_servicios_rf
from 
    smn_salud.smn_rel_orden_medica_servicios
    inner join smn_salud.smn_ordenes_medicas on smn_salud.smn_rel_orden_medica_servicios.smn_ordenes_medicas_id =  smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id
    INNER JOIN smn_base.smn_rel_servicio_area_unidad ON smn_base.smn_rel_servicio_area_unidad.smn_servicios_id = smn_salud.smn_rel_orden_medica_servicios.smn_servicios_rf
where smn_salud.smn_ordenes_medicas.smn_ordenes_medicas_id=${fld:smn_ordenes_medicas_id} and smn_salud.smn_ordenes_medicas.smn_ingreso_id=${fld:smn_ingreso_id} and smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf=${fld:smn_unidades_servicios_rf}
and  smn_salud.smn_rel_orden_medica_servicios.smn_grupo_prestador_rf=${fld:smn_grupos_prestadores_id} and smn_salud.smn_rel_orden_medica_servicios.smn_prestador_servicio_referido_rf=${fld:smn_prestador_servicio_rf}