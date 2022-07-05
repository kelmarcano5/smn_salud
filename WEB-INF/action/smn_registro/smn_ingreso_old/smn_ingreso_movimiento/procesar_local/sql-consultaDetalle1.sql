select 
    smn_salud.smn_ingresos.smn_ingresos_id,
    smn_salud.smn_ingreso_movimiento.smn_ingresos_mov_id as smn_ingresos_mov_id,
    smn_salud.smn_ingreso_movimiento.smn_unidades_servicios_rf as smn_unidades_servicios_rf,
        case
        when smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id then smn_base.smn_componentes.cmp_tipo_componente
    end as psd_tipo_componentes,
        smn_salud.smn_ingreso_movimiento.smn_servicios_rf as smn_servicios_rf,
    smn_salud.smn_ingreso_movimiento.smn_componente_rf as smn_componentes_rf,
    smn_salud.smn_ingresos.smn_moneda_rf as smn_moneda_rf,
    smn_salud.smn_ingreso_movimiento.inm_cantidad as psd_cantidad,
    smn_salud.smn_ingreso_movimiento.inm_precio_ml as psd_precio_propuesto_ml,
    smn_salud.smn_ingreso_movimiento.inm_cantidad * smn_salud.smn_ingreso_movimiento.inm_precio_ml as psd_monto_propuesto_ml,
        smn_salud.smn_ingresos.igs_fecha_registro
from smn_salud.smn_ingresos
    inner join smn_salud.smn_ingreso_movimiento on smn_salud.smn_ingreso_movimiento.smn_ingreso_id = smn_salud.smn_ingresos.smn_ingresos_id
    left join smn_base.smn_servicios_componentes on smn_base.smn_servicios_componentes.smn_servicios_id = smn_salud.smn_ingreso_movimiento.smn_servicios_rf
    left join smn_base.smn_componentes on smn_base.smn_componentes.smn_componentes_id = smn_base.smn_servicios_componentes.smn_componentes_id
WHERE
    smn_salud.smn_ingresos.smn_ingresos_id = ${fld:id_ingreso} 