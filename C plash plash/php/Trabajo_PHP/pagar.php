<html>
 <style>
	h1{
		text-align: center;
		color: #04B4AE;
	}
	h2{
		text-align: center;
		color: #F7FE2E;
	}
	h3{
		color: #F7FE2E;
	}
	body{
		background-color: #5882FA;
	}
	div {
		background-color: gray;
		width: 300px;
		border: 25px solid green;
		padding: 25px;
		margin: 25px;
	}

</style>
 <head>
    <meta charset = "utf-8">
 <head>
 <body background="fondo_pagar.jpg">
    <form method = POST action ="pagar.php">
    <?PHP
    


    $TXT_RUT = ""; if(isset($_POST['TXT_RUT'])) {$TXT_RUT = $_POST['TXT_RUT'];}
    $Conexion = mysqli_connect("localhost","root","","PRUEBA");
    if(!$Conexion){
        echo "Error MySQL: " . mysqli_error($Conexion);
    exit; }
    $Arriendos = "SELECT * FROM ARRIENDOS WHERE RUT_CLIENTE = '$TXT_RUT'";
    $Videos = "SELECT * FROM VIDEOS";
    $Todo_arr = mysqli_query($Conexion, $Arriendos);
    $Todo_vid = mysqli_query($Conexion, $Videos);
    if (!$Todo_arr) {
        echo "Error MySQL: " . mysqli_error($Conexion);
    }
    else{
         if (mysqli_affected_rows($Conexion) == 0){
            echo "Tabla Vacía";
            }else{
                 while ($Fila_A = mysqli_fetch_assoc($Todo_arr)) {
            //PRINT_R($Fila_A);

                    IF ('A'==$Fila_A['estado']){
                        echo "JAJAJAJAJA";
                        $RUT_C= $Fila_A['rut_cliente'];
                        $C_V= $Fila_A['cod_video'];
                        echo $RUT_C."_-_".$C_V;

                        $sql_estado = "UPDATE ARRIENDOS SET ESTADO='D' WHERE RUT_CLIENTE=$RUT_C";
                        mysql_select_db('prueba');
                        $res_estado = mysqli_query($Conexion,$sql_estado);
                        if ($res_estado){
                            echo "Se canceló la deuda con éxito";
                        }else{
                            echo "No se canceló la deuda";
                        }

                    }
                }
            }
         }
    ?>
        <fieldset>
        <h3>
            La deuda ha sido cancelada.
			<BR><BR>
		</h3>
		</fieldset>
      <a href="arrendar.html"><button type='button' style='width:70px; height:40px'>Regresar</button></a>
    </form>
 </body>



</html>
