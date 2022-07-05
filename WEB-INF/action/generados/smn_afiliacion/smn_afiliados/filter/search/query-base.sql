select	
	case
		when smn_salud.smn_afiliados.afi_sexo='MA' then '${lbl:b_male}'
		when smn_salud.smn_afiliados.afi_sexo='FE' then '${lbl:b_female}'
	end as afi_sexo_combo,
	smn_salud.smn_afiliados.afi_num_control,
	smn_salud.smn_afiliados.afi_apellidos,
	smn_salud.smn_afiliados.afi_nombres,
	smn_salud.smn_afiliados.afi_sexo,
	smn_salud.smn_afiliados.afi_tipo_doc_oficial,
	smn_salud.smn_afiliados.afi_nro_doc_oficial,
	smn_salud.smn_afiliados.afi_idioma,
	smn_salud.smn_afiliados.afi_usuario,
	smn_salud.smn_afiliados.afi_fecha_registro,
	smn_salud.smn_afiliados.afi_hora,
	smn_salud.smn_afiliados.smn_afiliados_id

from
	smn_salud.smn_afiliados
where
	smn_afiliados_id is not null	
 	 	${filter}
order by 
	smn_afiliados_id