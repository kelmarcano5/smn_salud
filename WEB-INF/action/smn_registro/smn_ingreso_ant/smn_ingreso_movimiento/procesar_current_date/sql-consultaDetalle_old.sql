SELECT DISTINCT
    smn_salud.smn_ingresos.smn_ingresos_id,
    smn_salud.smn_prestacion_servicio_medico_cabecera.smn_prestacion_servicio_medico_cabecera_id AS smn_prestacion_servicio_medico_cabecera_id,
    smn_caja.smn_mov_caja_detalle.smn_mov_caja_detalle_id AS smn_mov_caja_detalle_id,
    smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id AS smn_ingresos_mov_id,
   smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id AS smn_mov_caja_cabecera_id,
    smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf AS smn_unidades_servicios_rf,
    CASE
        WHEN smn_base.smn_grupo_prestador_servicio_frecuencia.smn_prestadores_servicios_id IS NULL THEN
        smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf ELSE smn_base.smn_grupo_prestador_servicio_frecuencia.smn_prestadores_servicios_id 
    END AS smn_prestador_servicio_rf,
CASE
        WHEN smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id THEN
        smn_base.smn_componentes.cmp_tipo_componente 
    END AS psd_tipo_componentes,
    smn_base.smn_servicios_componentes.smn_servicios_id AS smn_servicios_rf,
    smn_base.smn_servicios_componentes.smn_componentes_id AS smn_componentes_rf,
    smn_salud.smn_ingreso_movimiento.smn_moneda_rf AS smn_moneda_rf,
    smn_salud.smn_ingreso_movimiento.inm_cantidad AS psd_cantidad,
    smn_salud.smn_ingreso_movimiento.inm_precio_ml AS psd_precio_propuesto_ml,
    smn_salud.smn_ingreso_movimiento.inm_precio_ma AS psd_precio_propuesto_ma,
    case 
            when smn_base.smn_componentes.cmp_tipo_componente='HO' and smn_base.smn_componentes.cmp_forma_calculo='PO' then smn_salud.smn_ingreso_movimiento.inm_precio_ml*smn_base.smn_componentes.cmp_porcentaje/100
            when smn_base.smn_componentes.cmp_tipo_componente='SE' and smn_base.smn_componentes.cmp_forma_calculo='D' then smn_salud.smn_ingreso_movimiento.inm_precio_ml*smn_salud.smn_ingreso_movimiento.inm_cantidad
                when smn_base.smn_componentes.cmp_tipo_componente='SE' and smn_base.smn_componentes.cmp_forma_calculo='M' then smn_salud.smn_ingreso_movimiento.inm_precio_ml
    end as psd_monto_propuesto_ml,
        case 
            when smn_base.smn_componentes.cmp_tipo_componente='HO' and smn_base.smn_componentes.cmp_forma_calculo='PO' then smn_salud.smn_ingreso_movimiento.inm_precio_ma*smn_base.smn_componentes.cmp_porcentaje/100
            when smn_base.smn_componentes.cmp_tipo_componente='SE' and smn_base.smn_componentes.cmp_forma_calculo='D' then smn_salud.smn_ingreso_movimiento.inm_precio_ma*smn_salud.smn_ingreso_movimiento.inm_cantidad
                when smn_base.smn_componentes.cmp_tipo_componente='SE' and smn_base.smn_componentes.cmp_forma_calculo='M' then smn_salud.smn_ingreso_movimiento.inm_precio_ma
    end as psd_monto_propuesto_ma,
    smn_salud.smn_ingresos.igs_fecha_registro 
FROM
    smn_salud.smn_ingresos
    INNER JOIN smn_salud.smn_ingreso_movimiento ON smn_salud.smn_ingreso_movimiento.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id
    left JOIN smn_caja.smn_mov_caja_cabecera ON smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf = smn_salud.smn_ingresos.igs_num_ingreso
    LEFT JOIN smn_caja.smn_mov_caja_detalle ON smn_caja.smn_mov_caja_detalle.smn_mov_caja_cabecera_id = smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id
    LEFT JOIN smn_salud.smn_prestacion_servicio_medico_cabecera ON smn_salud.smn_prestacion_servicio_medico_cabecera.smn_mov_caja_cabecera_id = smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id
    left JOIN smn_base.smn_grupo_prestador_servicio_frecuencia ON smn_base.smn_grupo_prestador_servicio_frecuencia.smn_servicios_id = smn_salud.smn_ingreso_movimiento.smn_servicios_rf
    left JOIN smn_base.smn_servicios_componentes ON smn_base.smn_servicios_componentes.smn_servicios_id =smn_salud.smn_ingreso_movimiento.smn_servicios_rf
    INNER JOIN smn_base.smn_componentes ON smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id 
WHERE
    smn_salud.smn_ingresos.smn_ingresos_id = ${fld:id_ingreso}   --and smn_base.smn_componentes.cmp_genera_grupo_prestador='SI'
    AND smn_base.smn_servicios_componentes.smn_servicios_id = smn_salud.smn_ingreso_movimiento.smn_servicios_rf 