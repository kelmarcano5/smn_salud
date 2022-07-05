INSERT INTO smn_salud.smn_ruta_paciente
    (

       	smn_ruta_id,
        smn_clase_auxiliar_rf,
        smn_auxiliar_rf,
        rta_numero_documento_identidad,
        smn_entidad_rf,
        smn_sucursal_rf,
        smn_area_servicio_rf,
        smn_unidad_servicio_rf,
        rta_estatus,
        rta_secuencia,
        smn_serie_id,
        rta_ticket,
        rta_idioma,
        rta_usuario,
        rta_fecha_registro,
        rta_hora,
        smn_contratante_id

    )
    VALUES
    (
    ${seq:currval@smn_salud.seq_smn_ruta_paciente},
     ${fld:smn_clase_auxiliar_rf},
    (select smn_auxiliar_id from smn_base.smn_auxiliar where smn_clase_auxiliar_rf = 47 AND smn_base.smn_auxiliar.aux_codigo=${fld:rta_numero_documento_identidad}),
    ${fld:rta_numero_documento_identidad},
    ${fld:smn_entidad_rf},
    ${fld:smn_sucursal_rf},
    ${fld:smn_area_servicio_rf},
	(select smn_salud.smn_relacion_unidad_paso.smn_unidad_servicio_rf from smn_salud.smn_relacion_unidad_paso
    LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id
    where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf=${fld:smn_area_servicio_rf} and smn_salud.smn_series.sri_codigo=${fld:smn_serie_id} 
    and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=1 limit 1),
    'PE',
    (select smn_salud.smn_relacion_unidad_paso.rup_secuencia from smn_salud.smn_relacion_unidad_paso
    LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id
    where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf=${fld:smn_area_servicio_rf} and smn_salud.smn_series.sri_codigo=${fld:smn_serie_id} 
    and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=1 limit 1),
    ${fld:smn_serie_id},
    (select sri_ultimo_numero from smn_salud.smn_series where sri_codigo = ${fld:smn_serie_id}),
    '${def:locale}',
    '${def:user}',
    '${def:date}',
    '${def:time}',
    ${fld:smn_contratante_id}
);

with rows as (
INSERT INTO smn_salud.smn_ruta_paciente
(

   smn_ruta_id,
    smn_clase_auxiliar_rf,
    smn_auxiliar_rf,
    rta_numero_documento_identidad,
    smn_entidad_rf,
    smn_sucursal_rf,
    smn_area_servicio_rf,
    smn_unidad_servicio_rf,
    rta_estatus,
    rta_secuencia,
    smn_serie_id,
    rta_ticket,
    rta_idioma,
    rta_usuario,
    rta_fecha_registro,
    rta_hora,
    smn_contratante_id

)
VALUES
(
    ${seq:nextval@smn_salud.seq_smn_ruta_paciente},
    ${fld:smn_clase_auxiliar_rf},
    (select smn_auxiliar_id from smn_base.smn_auxiliar where smn_clase_auxiliar_rf = 47 AND smn_base.smn_auxiliar.aux_codigo=${fld:rta_numero_documento_identidad}),
    ${fld:rta_numero_documento_identidad},
    ${fld:smn_entidad_rf},
    ${fld:smn_sucursal_rf},
    ${fld:smn_area_servicio_rf},
  	(select smn_salud.smn_relacion_unidad_paso.smn_unidad_servicio_rf from smn_salud.smn_relacion_unidad_paso
    LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id
    where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf=${fld:smn_area_servicio_rf} and smn_salud.smn_series.sri_codigo=${fld:smn_serie_id} 
    and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=2 limit 1),
    'PE',
  	(select smn_salud.smn_relacion_unidad_paso.rup_secuencia from smn_salud.smn_relacion_unidad_paso
    LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id
    where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf=${fld:smn_area_servicio_rf} and smn_salud.smn_series.sri_codigo=${fld:smn_serie_id} 
    and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=2 limit 1),
    ${fld:smn_serie_id},
    (select sri_ultimo_numero from smn_salud.smn_series where sri_codigo = ${fld:smn_serie_id}),
    '${def:locale}',
    '${def:user}',
    '${def:date}',
    '${def:time}',
    ${fld:smn_contratante_id}
    )
    RETURNING rta_ticket, smn_serie_id
)
UPDATE smn_salud.smn_series set sri_ultimo_numero = rows.rta_ticket
FROM rows
    where sri_codigo = rows.smn_serie_id