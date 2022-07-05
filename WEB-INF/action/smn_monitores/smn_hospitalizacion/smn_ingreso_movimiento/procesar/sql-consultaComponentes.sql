select DISTINCT smn_salud.smn_ingresos.smn_ingresos_id,
	smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id,	
 'SE' as smn_tipo_componentes_rf,
	smn_salud.smn_ingreso_movimiento.smn_servicios_rf,
	smn_salud.smn_ingreso_movimiento.inm_monto_ml as pde_precio,
	smn_salud.smn_ingreso_movimiento.inm_monto_ma as pde_precio_moneda_alterna,
	case
		when smn_base.smn_componentes.cmp_forma_calculo='PO' then smn_salud.smn_ingreso_movimiento.inm_monto_ml * smn_base.smn_componentes.cmp_porcentaje/100 
		when smn_base.smn_componentes.cmp_forma_calculo='M' then 
			case
				when smn_base.smn_componentes.cmp_monto_moneda_local > 0 then cmp_monto_moneda_local
				else (cmp_monto_moneda_alterna * (select smn_base.smn_tasas_de_cambio.tca_tasa_cambio 
			from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=CURRENT_DATE 
			and smn_base.smn_tasas_de_cambio.tca_tipo_tasa=${fld:tipo_tasa} 
			and smn_base.smn_tasas_de_cambio.tca_estatus='AC'))
			end
		when smn_base.smn_componentes.cmp_forma_calculo='D' then smn_salud.smn_ingreso_movimiento.inm_monto_ml-(SELECT 
			COALESCE(sum(case 
			when smn_base.smn_componentes.cmp_forma_calculo='PO' then smn_salud.smn_ingreso_movimiento.inm_monto_ml*smn_base.smn_componentes.cmp_porcentaje/100 
			when smn_base.smn_componentes.cmp_forma_calculo='M' then 
				case
					when smn_base.smn_componentes.cmp_monto_moneda_local > 0 then cmp_monto_moneda_local
						else (cmp_monto_moneda_alterna * (select smn_base.smn_tasas_de_cambio.tca_tasa_cambio 
			from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=CURRENT_DATE 
			and smn_base.smn_tasas_de_cambio.tca_tipo_tasa=${fld:tipo_tasa} 
			and smn_base.smn_tasas_de_cambio.tca_estatus='AC'))
				end
			end),0)
			FROM smn_salud.smn_ingreso_movimiento
				inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = smn_salud.smn_ingreso_movimiento.smn_servicios_rf
				inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
			WHERE 
				smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id=${fld:smn_ingresos_mov_id}
			and
				smn_base.smn_componentes.cmp_forma_calculo<>'D'
			and
				smn_base.smn_servicios_componentes.smn_servicios_id=${fld:smn_servicios_rf})
	end as monto_componente_ml,
	case
		when smn_base.smn_componentes.cmp_forma_calculo='PO' then smn_salud.smn_ingreso_movimiento.inm_monto_ma * smn_base.smn_componentes.cmp_porcentaje/100 
		when smn_base.smn_componentes.cmp_forma_calculo='M' then cmp_monto_moneda_alterna
		when smn_base.smn_componentes.cmp_forma_calculo='D' then smn_salud.smn_ingreso_movimiento.inm_monto_ma-(SELECT 
			COALESCE(sum(case 
			when smn_base.smn_componentes.cmp_forma_calculo='PO' then inm_monto_ma*smn_base.smn_componentes.cmp_porcentaje/100 
			when smn_base.smn_componentes.cmp_forma_calculo='M' then cmp_monto_moneda_alterna
			end),0)
			FROM smn_salud.smn_ingreso_movimiento
				inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = smn_salud.smn_ingreso_movimiento.smn_servicios_rf
				inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
			WHERE 
				smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id=${fld:smn_ingresos_mov_id}
			and
				smn_base.smn_componentes.cmp_forma_calculo<>'D'
			and
				smn_base.smn_servicios_componentes.smn_servicios_id=${fld:smn_servicios_rf})
	end as monto_componente_ma,
	case
		when smn_salud.smn_ingreso_movimiento.smn_moneda_rf is null then 0 else smn_salud.smn_ingreso_movimiento.smn_moneda_rf
	end as smn_moneda_rf,
	smn_salud.smn_ingreso_movimiento.smn_tasa_rf,
	smn_base.smn_modulos.mod_nombre ||' - '|| 'Generado desde Ingreso Hospitalizacion' as pde_especificaciones_pedido,
	1 as pde_cantidad_pedido,
	smn_base.smn_componentes.smn_componentes_id,
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
	smn_salud.smn_ingresos.smn_auxiliar_rf,
	smn_salud.smn_ingresos.smn_ingresos_id as smn_num_doc_origen_rf,--,
	${fld:smn_pedido_detalle_id} as smn_pedido_detalle_id
from smn_salud.smn_ingresos
	inner join smn_salud.smn_ingreso_movimiento on smn_salud.smn_ingreso_movimiento.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id
	inner join smn_base.smn_modulos on smn_base.smn_modulos.smn_modulos_id = 1
	inner join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = smn_salud.smn_ingreso_movimiento.smn_servicios_rf
	inner join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
	left join smn_base.smn_tasas_de_cambio on smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id=smn_salud.smn_ingreso_movimiento.smn_tasa_rf
where
	smn_salud.smn_ingresos.smn_ingresos_id=${fld:id_ingreso} and smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id=${fld:smn_ingresos_mov_id} and smn_base.smn_servicios_componentes.smn_servicios_id=${fld:smn_servicios_rf}
ORDER BY
	smn_base.smn_componentes.cmp_forma_calculo DESC