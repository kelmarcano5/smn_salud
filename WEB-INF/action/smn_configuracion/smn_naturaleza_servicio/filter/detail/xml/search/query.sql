select
select
	case
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='CO' then '${lbl:b_consulta}'
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='EX' then '${lbl:b_examenes}'
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='ES' then '${lbl:b_estudios}'
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='PR' then '${lbl:b_procedimientos}'
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='HO' then '${lbl:b_hospitalizacion}'
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='AD' then '${lbl:b_administrativos}'
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='CI' then '${lbl:b_cirugias}'
	end as nts_naturaleza,
	smn_salud.smn_naturaleza_servicio.*
from
	smn_salud.smn_naturaleza_servicio
where
	smn_naturaleza_servicio_id = ${fld:id}
