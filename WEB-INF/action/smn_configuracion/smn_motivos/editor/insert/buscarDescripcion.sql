select
		smn_salud.smn_motivos.mtv_descripcion
from
		smn_salud.smn_motivos
where
		upper(smn_salud.smn_motivos.mtv_descripcion) = upper(${fld:mtv_descripcion})
