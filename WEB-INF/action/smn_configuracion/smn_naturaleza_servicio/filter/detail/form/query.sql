select
		smn_salud.smn_naturaleza_servicio.smn_naturaleza_servicio_id,
	case
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='CO' then '${lbl:b_consulta}'
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='EX' then '${lbl:b_examenes}'
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='ES' then '${lbl:b_estudios}'
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='PR' then '${lbl:b_procedimientos}'
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='HO' then '${lbl:b_hospitalizacion}'
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='AD' then '${lbl:b_administrativos}'
	when smn_salud.smn_naturaleza_servicio.nts_naturaleza='CI' then '${lbl:b_cirugias}'
	end as nts_naturaleza,
	smn_base.smn_tipos_servicios.tsr_descripcion as smn_tipo_servicio_rf,
	smn_salud.smn_naturaleza_servicio.nts_fecha_registro
	
from
	smn_salud.smn_naturaleza_servicio
	inner join smn_base.smn_tipos_servicios on smn_base.smn_tipos_servicios.smn_tipos_servicios_id = smn_salud.smn_naturaleza_servicio.smn_tipo_servicio_rf
where
	smn_naturaleza_servicio_id = ${fld:id}
