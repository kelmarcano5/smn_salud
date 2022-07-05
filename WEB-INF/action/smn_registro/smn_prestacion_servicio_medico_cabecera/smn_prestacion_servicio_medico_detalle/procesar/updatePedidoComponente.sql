UPDATE smn_comercial.smn_pedido_componentes set 
	smn_prestador_servicio_rf=${fld:prestador},
	pco_estatus='AP'
where
	smn_comercial.smn_pedido_componentes.smn_ingresos_rf=${fld:ingreso_id} 
	and smn_comercial.smn_pedido_componentes.smn_servicio_rf=${fld:servicios_id} 
	and smn_comercial.smn_pedido_componentes.smn_componente_rf=${fld:componentes_id} 
	and smn_comercial.smn_pedido_componentes.pco_tipo_componente='HO';

