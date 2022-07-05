select
		smn_salud.smn_puesto_atencion.put_codigo
from
		smn_salud.smn_puesto_atencion
where
		upper(smn_salud.smn_puesto_atencion.put_codigo) = upper(${fld:put_codigo})
