select
smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id as id, 
smn_base.smn_grupos_prestadores.gpp_codigo || ' - ' || smn_base.smn_grupos_prestadores.gpp_descripcion as item 
from smn_base.smn_grupos_prestadores 
where  smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = ${fld:id}
order by smn_base.smn_grupos_prestadores.gpp_descripcion
