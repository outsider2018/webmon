java -cp .;.\lib\derby.jar;.\lib\derbytools.jar;.\lib\derbyclient.jar -Dij.database=jdbc:derby://localhost:1527/MonDB;create=false org.apache.derby.tools.ij %DERBY_HOME%\create_table.sql