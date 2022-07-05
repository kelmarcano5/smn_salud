select 
CASE
WHEN smn_base.smn_tasas_de_cambio.tca_tasa_cambio IS NULL then 0 else smn_base.smn_tasas_de_cambio.tca_tasa_cambio
END AS tasa_cambio
   from smn_base.smn_tasas_de_cambio left outer join smn_base.smn_monedas on smn_base.smn_monedas.smn_monedas_id = smn_base.smn_tasas_de_cambio.smn_monedas_id
where  smn_base.smn_tasas_de_cambio.tca_estatus='AC' and smn_base.smn_tasas_de_cambio.tca_fecha_vigencia = current_date limit 1