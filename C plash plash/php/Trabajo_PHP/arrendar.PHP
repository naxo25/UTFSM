<HTML>
    <link href="style.html" rel="import" /> <!-- importar en html -->

	<HEAD>
		<META CHARSET = "UTF-8">
		<title>Arrendar</title>
	</HEAD>

	<BODY background="fondo_arrendar.jpg">
        <form method = POST action ="pagar.php">
		<h2>
			ARRIENDO DE PELICULA
			<BR><BR>
		</h2>
		<h3>
    <fieldset>
 <?php

	include("style.html");

	//$con = mysqli_connect($serverName, $userName, $password, $dataBase) or die("No se pudo conectar a la base de datos");

    $Conexion = mysqli_connect("localhost","root","","PRUEBA");
    if(!$Conexion){
        echo "Error MySQL: " . mysqli_error($Conexion);
    exit; }

    $error=false;
	//Validar rut.
	$TXT_RUT = ""; if(isset($_POST['TXT_RUT_CLIENTE'])) {$TXT_RUT = $_POST['TXT_RUT_CLIENTE'];} //$TXT_RUT es el rut recivido de arriendo.html
    $TXT_DIG = ""; if(isset($_POST['TXT_DIGITO'])) {$TXT_DIG = $_POST['TXT_DIGITO'];}
    $e1 = 0;
    $e2 = 0;
    $e3 = 1;

	function validar_rut($TXT_RUT,$TXT_DIG){
        $TXT_RUT = ""; if(isset($_POST['TXT_RUT_CLIENTE'])) {$TXT_RUT = $_POST['TXT_RUT_CLIENTE'];} //$TXT_RUT es el rut recivido de arriendo.html
        $TXT_DIG = ""; if(isset($_POST['TXT_DIGITO'])) {$TXT_DIG = $_POST['TXT_DIGITO'];}
        $x=2;
        $RutSuma=0;
        for ($i=strlen($TXT_RUT)-1; $i>=0; $i--){
            $n=$TXT_RUT[$i];
            $RutSuma=($RutSuma + ($n*$x));
            $x++;
            if ($x==8){
                $x=2;}
        }
        $resto= $RutSuma%11;
        $Dverificado= 11-$resto;

        if ($Dverificado==10){$Dverificado="k";}
        if ($Dverificado==11){$Dverificado=0;}

        if ($TXT_DIG==$Dverificado){
            return true;
        }else{
            return false;
        }
    }

    $test_VR = validar_rut($TXT_RUT,$TXT_DIG);
    if (!$test_VR){
        echo "<br>Rut invalido <br>";
        $error=true;
     }

     if (!$error){
	//Validar que el cliente esta en base de datos.

	$qry_cliente_bd = "SELECT RUT_CLIENTE, NOMBRE_CLIENTE FROM CLIENTES";
	$res_cliente_bd = mysqli_query($Conexion,$qry_cliente_bd);

    $encontrado = false;
    while($clientes =  mysqli_fetch_assoc($res_cliente_bd)) {
        if ($TXT_RUT == $clientes['RUT_CLIENTE']){
            $encontrado = true;
            echo "Nombre_cliente: ".$clientes['NOMBRE_CLIENTE'] ."<br>"."Rut:". $clientes['RUT_CLIENTE']."<br>";
            $e1 = 1;
        }
	}
	if ($encontrado==false) echo "Error! Cliente no se encuentra en la Base de datos <br>";
	}

    if (!$error){
	//Validar que el video esta en base de datos.
	$TXT_COD_V =""; if(isset($_POST['TXT_COD_VIDEO'])) {$TXT_COD_V = $_POST['TXT_COD_VIDEO'];}
    $qry_video_bd = "SELECT COD_VIDEO, NOMBRE_VIDEO, TOTAL, VALOR FROM VIDEOS";
    $res_video_bd = mysqli_query($Conexion, $qry_video_bd);

    $encontrado = false;
    while($video =  mysqli_fetch_assoc($res_video_bd)) {
        if ($TXT_COD_V == $video['COD_VIDEO'] && $video['TOTAL'] > 0){
            $e2 = 1;
            $encontrado = true;
            $VALOR = $video['VALOR'];
            echo "Nombre_Video: ".$video['NOMBRE_VIDEO']."<br>";
                 } else if ($TXT_COD_V == $video['COD_VIDEO'] && $video['TOTAL'] == 0){
                            $encontrado = true;
                            echo 'No hay stock de ' . $video['NOMBRE_VIDEO'] . "<br>";
                            $e2 = 0;
                        }
	}
	if ($encontrado==false) echo "Error! Video no se encuentra en la Base de datos <br>";
    }
    
    if (!$error){
	//Validar si tiene arriendos pendientes.
	$Clientes = "SELECT RUT_CLIENTE, NOMBRE_CLIENTE FROM CLIENTES";
    $Arriendos = "SELECT RUT_CLIENTE, COD_VIDEO, ESTADO, VALOR, FECHA FROM ARRIENDOS";
    $Videos = "SELECT V.COD_VIDEO, V.NOMBRE_VIDEO, V.COD_GENERO, G.NOMBRE_GENERO FROM VIDEOS V, GENEROS G";
    $SQL_GEN="SELECT COD_GENERO FROM GENEROS" ;
    $COD_GEN= mysqli_query($Conexion, $SQL_GEN);

    $Resultado = mysqli_query($Conexion, $Clientes);
    $Resultado1 = mysqli_query($Conexion, $Videos);
    $Resultado2 = mysqli_query($Conexion, $Arriendos);
    $Fecha_Deuda = 0;
    $MULTA=0;
    if (!$Resultado && !Resultado1 && !Resultado2) {
        echo "Error MySQL: " . mysqli_error($Conexion);
    }
    else{
         if (mysqli_affected_rows($Conexion) == 0){
            echo "Tabla Vacía";
            }else{
                 while ($Fila = mysqli_fetch_assoc($Resultado)) {
                       if ($Fila['RUT_CLIENTE'] == $TXT_RUT) echo $Fila['NOMBRE_CLIENTE'] . "<br>";
                              while ($Fila = mysqli_fetch_assoc($Resultado2)) {
                                 if ($Fila ['RUT_CLIENTE'] == $TXT_RUT) {
                                    IF ($Fila ['ESTADO'] == 'A') {
                                    $Fecha_Deuda = round ( (strtotime('now') - strtotime ($Fila['FECHA'])) / 86400 );
                                    $e3 = 1;
                                    if ($Fecha_Deuda > 3) {
                                       $Fecha_Deuda -= 3;
                                       echo " CODIGO: " . $Fila['COD_VIDEO'] . "  Fecha de arrendado" . $Fila['FECHA'] . "  Deuda: ";
                                       $Mpordia = 0;
                                       while ($Fecha_Deuda != 0) {
                                          $Fecha_Deuda -= 1;
                                          $Mpordia += $Fila['VALOR'] * 0.3;
                                          $e3 = 0;
                                       }
                                       ECHO $Mpordia . "<br>";
                                       $MULTA += $Mpordia;
                                    }
                                }
                             }
                       }
             }
        }
        ECHO $Fila['RUT_CLIENTE'] . " DEBE " . $MULTA . "<br>";
        }
    }

    if ($e1 == 1 && $e2 == 1 && $e3 == 1){
       $sql = "INSERT INTO ARRIENDOS (FECHA,RUT_CLIENTE,COD_VIDEO,ESTADO,VALOR)
       VALUES ('".date("Y-m-d H:i:s")."' , '".$TXT_RUT."', '".$TXT_COD_V."', '".'A'."', '".$VALOR."') ";
       $resultado = mysqli_query($Conexion,$sql);
       $sql = "update VIDEOS set TOTAL = TOTAL - 1, EN_ARRIENDO = EN_ARRIENDO + 1 WHERE COD_VIDEO = $TXT_COD_V";
       $resultado = mysqli_query($Conexion,$sql);
    }
    
?>
    </fieldset>
    </h3>
        <h2>
            <a href="arrendar.html"><button type='button' style='width:70px; height:40px'>Regresar</button></a>
            <INPUT TYPE = "SUBMIT" name="BTN_PAGAR" value="Pagar" style='width:70px; height:40px'>
        </h2>
        
</HTML>
