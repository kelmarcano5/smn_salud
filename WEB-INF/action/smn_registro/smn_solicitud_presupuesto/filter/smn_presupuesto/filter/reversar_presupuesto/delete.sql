delete from smn_salud.smn_pedido_componentes where smn_pedido_cabecera_id = (select smn_salud.smn_pedido_cabecera.smn_pedido_cabecera_id from smn_salud.smn_pedido_cabecera where smn_salud.smn_pedido_cabecera.smn_oferta_id=${fld:id} limit 1);
delete from smn_salud.smn_pedido_detalle where smn_pedido_cabecera_id = (select smn_salud.smn_pedido_cabecera.smn_pedido_cabecera_id from smn_salud.smn_pedido_cabecera where smn_salud.smn_pedido_cabecera.smn_oferta_id=${fld:id} limit 1);

delete from smn_salud.smn_pedido_cabecera where smn_oferta_id = ${fld:id};

update smn_salud.smn_presupuesto set smn_estado_presupuesto_id = 1 where
smn_salud.smn_presupuesto.smn_presupuesto_id=${fld:id};
