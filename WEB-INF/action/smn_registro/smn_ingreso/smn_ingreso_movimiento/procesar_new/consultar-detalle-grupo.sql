select distinct
    smn_salud.smn_ingresos.smn_ingresos_id,
    smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id as smn_ingresos_mov_id,
    smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf as smn_unidades_servicios_rf,
    case
        when smn_base.smn_grupo_prestador_servicio_frecuencia.smn_prestadores_servicios_id is null then
        smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf ELSE smn_base.smn_grupo_prestador_servicio_frecuencia.smn_prestadores_servicios_id 
    end as smn_prestador_servicio_rf,
    case
        when smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id then
        smn_base.smn_componentes.cmp_tipo_componente 
    end as psd_tipo_componentes,
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
    smn_salud.smn_ingresos.igs_fecha_registro,
    ${fld:smn_prestacion_servicio_medico_cabecera_id} AS smn_prestacion_servicio_medico_cabecera_id 
from
    smn_salud.smn_ingresos
    inner join smn_salud.smn_ingreso_movimiento ON smn_salud.smn_ingreso_movimiento.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id
    inner join smn_salud.smn_prestacion_servicio_medico_cabecera on smn_salud.smn_prestacion_servicio_medico_cabecera.smn_ingresos_id = smn_salud.smn_ingresos.smn_ingresos_id
    left join smn_base.smn_grupo_prestador_servicio_frecuencia ON smn_base.smn_grupo_prestador_servicio_frecuencia.smn_servicios_id = smn_salud.smn_ingreso_movimiento.smn_servicios_rf
    left join smn_base.smn_servicios_componentes ON smn_base.smn_servicios_componentes.smn_servicios_id =smn_salud.smn_ingreso_movimiento.smn_servicios_rf
    left join smn_base.smn_componentes ON smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id
    inner join smn_base.smn_grupos_prestadores on smn_base.smn_grupos_prestadores.smn_grupos_prestadores_id = smn_salud.smn_ingreso_movimiento.smn_grupo_prestador_servicio_rf 
where
    smn_salud.smn_ingresos.smn_ingresos_id = ${fld:id_ingreso} and 
    smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf=${fld:smn_unidades_servicios_rf} and 
    smn_base.smn_grupo_prestador_servicio_frecuencia.smn_grupos_prestadores_id=${fld:smn_grupo_prestador_rf} and  
    smn_salud.smn_ingreso_movimiento.smn_prestador_servicio_rf=${fld:smn_prestador_servicio_rf} 