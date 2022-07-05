with re as (
	select 	smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id as ids,
				smn_salud.smn_presupuesto_detalle.prd_precio as precio,
			case
					when pc.smn_tipos_componentes_rf='HO' and pc.prc_forma_calculo_rf='PO' then smn_salud.smn_presupuesto_detalle.prd_precio*pc.prc_porcentaje_prestador/100
			end honorarios,
			case
					when pc.smn_tipos_componentes_rf='IT' and pc.prc_forma_calculo_rf='R' then pc.prc_cantidad*pc.prc_porcentaje_prestador
			end item,
			case
				when pc.smn_tipos_componentes_rf='SE' and pc.prc_forma_calculo_rf='D' then smn_salud.smn_presupuesto_detalle.prd_precio
			end servicios
  from 
		smn_salud.smn_presupuesto_detalle
		inner join smn_salud.smn_presupuesto_componente pc on pc.smn_presupuesto_detalle_id = smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id
	where 
		smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id=${fld:id2}
		)
UPDATE smn_salud.smn_presupuesto_componente SET 
		prc_monto_ml=re.precio-(select smn_salud.smn_presupuesto_componente.prc_monto_ml from smn_salud.smn_presupuesto_componente where smn_salud.smn_presupuesto_componente.smn_presupuesto_detalle_id=${fld:id2} and smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf='HO' limit 1)-(select smn_salud.smn_presupuesto_componente.prc_monto_ml from smn_salud.smn_presupuesto_componente where smn_salud.smn_presupuesto_componente.smn_presupuesto_detalle_id=${fld:id2} and smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf='IT' limit 1),
		prc_monto_neto_ml=re.precio-(select smn_salud.smn_presupuesto_componente.prc_monto_ml from smn_salud.smn_presupuesto_componente where smn_salud.smn_presupuesto_componente.smn_presupuesto_detalle_id=${fld:id2} and smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf='HO' limit 1)-(select smn_salud.smn_presupuesto_componente.prc_monto_ml from smn_salud.smn_presupuesto_componente where smn_salud.smn_presupuesto_componente.smn_presupuesto_detalle_id=${fld:id2} and smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf='IT' limit 1)
from re
where smn_salud.smn_presupuesto_componente.smn_presupuesto_detalle_id=${fld:id2} and smn_salud.smn_presupuesto_componente.smn_presupuesto_detalle_id = re.ids and smn_salud.smn_presupuesto_componente.smn_tipos_componentes_rf='SE';

