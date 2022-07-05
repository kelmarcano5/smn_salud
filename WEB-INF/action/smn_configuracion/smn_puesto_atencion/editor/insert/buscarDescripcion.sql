select
		smn_salud.smn_puesto_atencion.put_descripcion
from
		smn_salud.smn_puesto_atencion
where
		upper(smn_salud.smn_puesto_atencion.put_descripcion) = upper(${fld:put_descripcion})
