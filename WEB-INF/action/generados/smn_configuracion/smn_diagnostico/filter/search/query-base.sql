select	
	case
		when smn_salud.smn_diagnostico.dgn_tipo='1' then '${lbl:b_cie10}'
		when smn_salud.smn_diagnostico.dgn_tipo='2' then '${lbl:b_procedimientos}'
		when smn_salud.smn_diagnostico.dgn_tipo='3' then '${lbl:b_otra}'
	end as dgn_tipo_combo,
	smn_salud.smn_diagnostico.dgn_codigo,
	smn_salud.smn_diagnostico.dgn_descripcion,
	smn_salud.smn_diagnostico.dgn_tipo,
	smn_salud.smn_diagnostico.dgn_fecha_registro,
	smn_salud.smn_diagnostico.smn_diagnostico_id

from
	smn_salud.smn_diagnostico
where
	smn_diagnostico_id is not null	
 	 	${filter}
order by 
	smn_diagnostico_id