select a.smn_auxiliar_id as id,
	   a.aux_codigo || ' - ' || a.aux_nombres || ' - ' || a.aux_apellidos as item
from smn_base.smn_auxiliar a 
-- where a.smn_auxiliar_id = ${fld:auxiliar_id}
-- order by a.smn_auxiliar_id