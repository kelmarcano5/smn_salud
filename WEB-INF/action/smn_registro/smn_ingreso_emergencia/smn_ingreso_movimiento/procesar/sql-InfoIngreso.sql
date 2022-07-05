SELECT smn_salud.smn_ingresos.*, (coalesce(smn_salud.smn_contratante.smn_clase_baremos_rf,0)) as smn_clase_auxiliar_rf, (coalesce(smn_salud.smn_contratante.smn_auxiliar_rf,0)) as auxiliar, 
(select case when smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id is null then 0 else smn_base.smn_tasas_de_cambio.smn_tasas_de_cambio_id end from smn_base.smn_tasas_de_cambio where smn_base.smn_tasas_de_cambio.tca_fecha_vigencia=(select smn_salud.smn_ingresos.igs_fecha_ingreso from smn_salud.smn_ingresos where smn_salud.smn_ingresos.smn_ingresos_id = ${fld:id_ingreso}) and  smn_base.smn_tasas_de_cambio.tca_estatus='AC' and smn_base.smn_tasas_de_cambio.tca_tipo_tasa=(select smn_salud.smn_documento.tca_tipo_tasa from smn_salud.smn_documento where smn_salud.smn_documento.smn_documento_id = (select smn_salud.smn_ingresos.smn_documento_id from smn_salud.smn_ingresos where smn_salud.smn_ingresos.smn_ingresos_id = ${fld:id_ingreso}))) as smn_tasas_de_cambio_id,
case
	when smn_salud.smn_ingresos.smn_contratante_id is null then 0 else smn_salud.smn_ingresos.smn_contratante_id 
end AS contratante_id,
case
	when smn_salud.smn_ingresos.smn_contratante_id is null then (select smn_salud.smn_documento.doc_codigo || ' - ' || smn_salud.smn_documento.doc_nombre from smn_salud.smn_documento where smn_salud.smn_documento.doc_contratante='NO' limit 1) 
	when smn_salud.smn_ingresos.smn_contratante_id IS NOT NULL then (select smn_salud.smn_documento.doc_codigo || ' - ' || smn_salud.smn_documento.doc_nombre from smn_salud.smn_documento where smn_salud.smn_documento.doc_contratante='SI' limit 1) 
end descripcion_origen
FROM smn_salud.smn_ingresos 
inner join smn_salud.smn_documento on
smn_salud.smn_ingresos.smn_documento_id = smn_salud.smn_documento.smn_documento_id
left join smn_salud.smn_contratante on
smn_salud.smn_ingresos.smn_contratante_id = smn_salud.smn_contratante.smn_contratante_id
left join smn_base.smn_tasas_de_cambio on
smn_salud.smn_ingresos.smn_moneda_rf = smn_base.smn_tasas_de_cambio.smn_monedas_id
WHERE smn_ingresos_id = ${fld:id_ingreso}