UPDATE smn_comercial.smn_pedido_componentes set 
	smn_prestador_servicio_rf=${fld:prestador},
	pco_estatus='AP'
where
	smn_comercial.smn_pedido_componentes.smn_ingresos_rf=${fld:ingreso_id} 
	and smn_comercial.smn_pedido_componentes.smn_servicio_rf=${fld:servicios_id} 
	and smn_comercial.smn_pedido_componentes.smn_componente_rf=${fld:componentes_id} 
	and smn_comercial.smn_pedido_componentes.pco_tipo_componente='HO';

UPDATE smn_salud.smn_prestacion_servicio_medico_detalle SET
	psd_estatus='AP'
WHERE
	smn_prestacion_servicio_medico_detalle_id=${fld:prestacion_detalle_id};


UPDATE smn_salud.smn_prestacion_servicio_medico_cabecera SET
	psc_estatus='AP'
WHERE
	smn_prestacion_servicio_medico_cabecera_id=(select smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_cabecera_id from smn_salud.smn_prestacion_servicio_medico_detalle where smn_salud.smn_prestacion_servicio_medico_detalle.smn_prestacion_servicio_medico_detalle_id=${fld:prestacion_detalle_id} limit 1);


UPDATE smn_salud.smn_ruta_paciente set rta_estatus =  'AT'
     WHERE rta_estatus = 'EA' and rta_secuencia = 1 and rta_ticket IN (
         SELECT igs_ticket 
         FROM smn_salud.smn_ingresos 
         WHERE smn_ingresos_id = ${fld:ingreso_id}
);

