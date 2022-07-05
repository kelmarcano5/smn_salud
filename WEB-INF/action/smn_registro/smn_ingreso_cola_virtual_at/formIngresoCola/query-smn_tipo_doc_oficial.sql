select smn_base.smn_tipo_doc_oficial.tdo_codigo as id, smn_base.smn_tipo_doc_oficial.tdo_codigo  as item from smn_base.smn_tipo_doc_oficial 
where smn_base.smn_tipo_doc_oficial.tdo_codigo<>'1'
order by smn_base.smn_tipo_doc_oficial.tdo_descripcion