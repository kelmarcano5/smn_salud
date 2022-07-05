select smn_salud.smn_estatus.sta_cod_siguiente as id, 
	case
		when smn_salud.smn_estatus.sta_cod_siguiente='PE' then '${lbl:b_pend}'
		when smn_salud.smn_estatus.sta_cod_siguiente='EA' then '${lbl:b_enaten}'
		when smn_salud.smn_estatus.sta_cod_siguiente='AT' then '${lbl:b_atend}'
		when smn_salud.smn_estatus.sta_cod_siguiente='EG' then 'Egresado'
		when smn_salud.smn_estatus.sta_cod_siguiente='RV' then 'En Revision'
	end as item from smn_salud.smn_estatus
WHERE 
	smn_salud.smn_estatus.sta_codigo = ${fld:id2}  and smn_salud.smn_estatus.sta_cod_siguiente IN ('EG','RV')