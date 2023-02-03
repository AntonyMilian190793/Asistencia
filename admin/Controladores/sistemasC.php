<?php

    class SistemcasC{


        //ver perfil sistemas
        public function VerPerfilSistemasC(){

            $tablaBD = "sistemas";
            $id = $_SESSION["id"];
            $resultado = SistemasM::VerPefilSistemasM($tablaBD, $id);

            echo '
                <tr>
                    <td>'.$resultado["usuario"].'</td>
                    <td>'.$resultado["clave"].'</td>
                    <td>'.$resultado["nombre"].'</td>
                    <td>'.$resultado["apellido"].'</td>';

                    if($resultado["foto"] != ""){

                        echo '<td><img src="'.$resultado["foto"].'" class="img-responsive" width="40px"></td>';
                    }else{
                        echo '<td><img src="http://localhost/ViajesFyA/Vistas/img/defecto1.png" class="img-responsive" width="40px"></td>';
                    }

                $columna = "id";
                $valor = $resultado["id_consulta"];
                $consulta = ConsultasC::VerConsultasC($columna, $valor);

                    echo '<td>'.$consulta["nombre"].'</td>';
                    echo '<td>'.$resultado["documento"].'</td>';
                    
                    echo '<td>
                        <a href="http://localhost/ViajesFyA/perfil-S/'.$resultado["id"].'">
                            <button class="btn btn-success"><i class="fa fa-pencil"></i></button>
                        </a>
                    </td>
                </tr>';
        }



    }






?>