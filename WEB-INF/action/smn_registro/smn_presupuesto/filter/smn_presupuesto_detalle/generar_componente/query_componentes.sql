SELECT DISTINCT smn_salud.smn_presupuesto.smn_presupuesto_id,
	smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id,	
    'SE' as smn_tipo_componentes_rf,
	smn_salud.smn_presupuesto_detalle.smn_servicios_rf,
	smn_salud.smn_presupuesto_detalle.prd_monto_moneda_local as pde_precio,
	smn_salud.smn_presupuesto_detalle.prd_moneda_alterna as pde_precio_moneda_alterna,
	case
		when smn_base.smn_componentes.cmp_forma_calculo='PO' then smn_salud.smn_presupuesto_detalle.prd_monto_moneda_local * smn_base.smn_componentes.cmp_porcentaje/100 
		when smn_base.smn_componentes.cmp_forma_calculo='M' then 
			case
				when smn_base.smn_componentes.cmp_monto_moneda_local > 0 then smn_salud.smn_presupuesto_detalle.prd_cantidad*smn_base.smn_servicios_componentes.sec_cantidad*cmp_monto_moneda_local
				else (smn_salud.smn_presupuesto_detalle.prd_cantidad*smn_base.smn_servicios_componentes.sec_cantidad*cmp_monto_moneda_alterna * tca_tasa_cambio)
			end
		when smn_base.smn_componentes.cmp_forma_calculo='D' then smn_salud.smn_presupuesto_detalle.prd_monto_moneda_local-(SELECT 
			COALESCE(sum(case 
			when smn_base.smn_componentes.cmp_forma_calculo='PO' then prd_monto_moneda_local*smn_base.smn_componentes.cmp_porcentaje/100 
			when smn_base.smn_componentes.cmp_forma_calculo='M' then 
				case
					when smn_base.smn_componentes.cmp_monto_moneda_local > 0 then smn_salud.smn_presupuesto_detalle.prd_cantidad*smn_base.smn_servicios_componentes.sec_cantidad*cmp_monto_moneda_local
					else (smn_salud.smn_presupuesto_detalle.prd_cantidad*smn_base.smn_servicios_componentes.sec_cantidad*cmp_monto_moneda_alterna*tca_tasa_cambio)
				end
			end),0)
			FROM smn_salud.smn_presupuesto_detalle
				inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = ${fld:smn_servicios_rf}
				inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
				inner join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id=smn_salud.smn_presupuesto_detalle.smn_tasa_rf
			WHERE 
				smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id=${fld:smn_presupuesto_detalle_id}
			and
				smn_base.smn_componentes.cmp_forma_calculo<>'D'
			and
				smn_base.smn_servicios_componentes.smn_servicios_id=${fld:smn_servicios_rf})
	end as monto_componente_ml,
	
	case
		when smn_base.smn_componentes.cmp_forma_calculo='PO' then smn_salud.smn_presupuesto_detalle.prd_moneda_alterna * smn_base.smn_componentes.cmp_porcentaje/100 
		when smn_base.smn_componentes.cmp_forma_calculo='M' then smn_salud.smn_presupuesto_detalle.prd_cantidad*smn_base.smn_servicios_componentes.sec_cantidad*cmp_monto_moneda_alterna
		when smn_base.smn_componentes.cmp_forma_calculo='D' then smn_salud.smn_presupuesto_detalle.prd_moneda_alterna-(SELECT 
			COALESCE(sum(case 
			when smn_base.smn_componentes.cmp_forma_calculo='PO' then prd_moneda_alterna*smn_base.smn_componentes.cmp_porcentaje/100 
			when smn_base.smn_componentes.cmp_forma_calculo='M' then 
				case
					when smn_base.smn_componentes.cmp_monto_moneda_local > 0 then cmp_monto_moneda_alterna
					else (smn_salud.smn_presupuesto_detalle.prd_cantidad*cmp_monto_moneda_alterna)
				end
			end),0)
			FROM smn_salud.smn_presupuesto_detalle
				inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = ${fld:smn_servicios_rf}
				inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
				
			WHERE 
				smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id=${fld:smn_presupuesto_detalle_id}
			and
				smn_base.smn_componentes.cmp_forma_calculo<>'D'
			and
				smn_base.smn_servicios_componentes.smn_servicios_id=${fld:smn_servicios_rf})
	end as monto_componente_ma,
	case
		when smn_salud.smn_presupuesto_detalle.smn_moneda_rf is null then 0 else smn_salud.smn_presupuesto_detalle.smn_moneda_rf
	end as smn_moneda_rf,
	smn_salud.smn_presupuesto_detalle.smn_tasa_rf,
	'Componentes Generados desde Presupuesto Detalle' as pde_especificaciones_pedido,
	smn_salud.smn_presupuesto_detalle.prd_cantidad*smn_base.smn_servicios_componentes.sec_cantidad as prd_cantidad,
	smn_base.smn_componentes.smn_componentes_id,
		case
		when smn_base.smn_componentes.cmp_porcentaje is null then 0 else smn_base.smn_componentes.cmp_porcentaje
	end as cmp_porcentaje,
	smn_base.smn_componentes.cmp_descripcion,
	smn_base.smn_componentes.cmp_forma_calculo,
	smn_base.smn_componentes.cmp_tipo_componente,
	smn_base.smn_componentes.cmp_visible,
	smn_base.smn_componentes.smn_imprime,
	case 
	 when smn_base.smn_componentes.cmp_grupo_prestador is null then 0 else smn_base.smn_componentes.cmp_grupo_prestador
	end as cmp_grupo_prestador,
	case 
	 when smn_base.smn_componentes.cmp_clase_auxiliar_rf is null then 0 else smn_base.smn_componentes.cmp_clase_auxiliar_rf
	end as smn_clase_auxiliar_rf,
	case 
	 when smn_base.smn_componentes.smn_grupo_componente_rf is null then 0 else smn_base.smn_componentes.smn_grupo_componente_rf
	end as smn_grupo_componente_rf,
	case 
	 when smn_base.smn_componentes.smn_grupo_titulo_impresion_rf is null then 0 else smn_base.smn_componentes.smn_grupo_titulo_impresion_rf
	end as smn_grupo_titulo_impresion_rf,
	case 
	 when smn_base.smn_componentes.smn_tipo_gasto_rf is null then 0 else smn_base.smn_componentes.smn_tipo_gasto_rf
	end as smn_tipo_gasto_rf,
	case 
	 when smn_base.smn_componentes.smn_sub_tipo_gasto_rf is null then 0 else smn_base.smn_componentes.smn_sub_tipo_gasto_rf
	end as smn_sub_tipo_gasto_rf,
	smn_salud.smn_presupuesto.smn_auxiliar_rf,
	smn_salud.smn_presupuesto.pre_numero_control as pre_numero_control,
	${fld:smn_presupuesto_detalle_id} as smn_presupuesto_detalle_id
from smn_salud.smn_presupuesto
	inner join smn_salud.smn_presupuesto_detalle on smn_salud.smn_presupuesto_detalle.smn_presupuesto_id = smn_salud.smn_presupuesto.smn_presupuesto_id
	inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = ${fld:smn_servicios_rf}
	inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
	inner join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id=smn_salud.smn_presupuesto_detalle.smn_tasa_rf
where
	smn_salud.smn_presupuesto.smn_presupuesto_id=${fld:smn_presupuesto_id} and smn_salud.smn_presupuesto_detalle.smn_presupuesto_detalle_id=${fld:smn_presupuesto_detalle_id} 
	and smn_base.smn_servicios_componentes.smn_servicios_id=${fld:smn_servicios_rf}
ORDER BY
	smn_base.smn_componentes.cmp_forma_calculo ASC