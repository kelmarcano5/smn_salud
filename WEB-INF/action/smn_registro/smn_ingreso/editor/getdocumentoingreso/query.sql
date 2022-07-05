select smn_salud.smn_documento.smn_documento_id as id, smn_salud.smn_documento.doc_nombre as item from smn_salud.smn_documento
inner join smn_salud.smn_contratante on smn_salud.smn_contratante.smn_documento_ingreso_id = smn_salud.smn_documento.smn_documento_id
where smn_salud.smn_contratante.smn_contratante_id =${fld:id}