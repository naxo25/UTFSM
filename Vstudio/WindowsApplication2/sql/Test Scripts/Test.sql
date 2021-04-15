-- Ejemplos para consultas efectuadas por distintos objetos SQL implementadas por este
-- ensamblado

-----------------------------------------------------------------------------------------
-- Procedimiento almacenado
-----------------------------------------------------------------------------------------
-- exec StoredProcedureName


-----------------------------------------------------------------------------------------
-- Función definida por el usuario
-----------------------------------------------------------------------------------------
-- select dbo.FunctionName()


-----------------------------------------------------------------------------------------
-- Tipo definido por el usuario
-----------------------------------------------------------------------------------------
-- CREATE TABLE test_table (col1 UserType)
-- go
--
-- INSERT INTO test_table VALUES (convert(uri, 'Instantiation String 1'))
-- INSERT INTO test_table VALUES (convert(uri, 'Instantiation String 2'))
-- INSERT INTO test_table VALUES (convert(uri, 'Instantiation String 3'))
--
-- select col1::method1() from test_table



-----------------------------------------------------------------------------------------
-- Tipo definido por el usuario
-----------------------------------------------------------------------------------------
-- select dbo.AggregateName(Column1) from Table1


select 'Para ejecutar su proyecto, modifique el archivo Test.sql de su proyecto. Este 
archivo está ubicado en la carpeta Secuencia de comandos de prueba, en el Explorador de 
soluciones.'
