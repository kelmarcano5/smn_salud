select
smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id as id, 
smn_base.smn_grupos_prestadores.gpp_codigo || ' - ' || smn_base.smn_grupos_prestadores.gpp_descripcion as item 
from smn_base.smn_grupos_prestadores
inner join smn_base.smn_grupo_prestador_servicio_frecuencia on smn_base.smn_grupo_prestador_servicio_frecuencia.smn_grupos_prestadores_id = smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id 
where smn_base.smn_grupo_prestador_servicio_frecuencia.smn_servicios_id = ${fld:id}
order by smn_base.smn_grupos_prestadores.gpp_descripcion
