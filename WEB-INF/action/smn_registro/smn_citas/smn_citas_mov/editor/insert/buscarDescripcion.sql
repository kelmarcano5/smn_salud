select
	smn_salud.smn_citas_mov.cts_ordenante_descripcion
from
	smn_salud.smn_citas_mov
where
	upper(smn_salud.smn_citas_mov.cts_ordenante_descripcion) = upper(${fld:cts_ordenante_descripcion})
