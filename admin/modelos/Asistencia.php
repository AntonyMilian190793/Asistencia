<?php 
//incluir la conexion de base de datos
require "../config/Conexion.php";
class Asistencia{


	//implementamos nuestro constructor
public function __construct(){

}


//listar registros
public function listar(){
	$sql="SELECT a.idasistencia as id,a.codigo_persona,a.tipo,DATE_FORMAT(a.fecha, '%d-%m-%Y') as fecha,u.nombre,u.apellidos,d.nombre as departamento, a.estado as estado, DATE_FORMAT(a.hora, '%h:%i:%s %p') as hora
	FROM asistencia a 
	INNER JOIN usuarios u INNER JOIN departamento d ON u.iddepartamento=d.iddepartamento 
	WHERE a.codigo_persona=u.codigo_persona ORDER BY idasistencia ASC";
	return ejecutarConsulta($sql);
}

public function listaru($idusuario){
	$sql="SELECT a.idasistencia,a.codigo_persona,a.fecha_hora,a.tipo,a.fecha,u.nombre,u.apellidos,d.nombre as departamento FROM asistencia a INNER JOIN usuarios u INNER JOIN departamento d ON u.iddepartamento=d.iddepartamento WHERE a.codigo_persona=u.codigo_persona AND u.idusuario='$idusuario'";
	return ejecutarConsulta($sql);
}

public function listar_asistencia($fecha_inicio,$fecha_fin,$codigo_persona){
	$sql="SELECT a.idasistencia,a.codigo_persona,a.fecha_hora,a.tipo,DATE_FORMAT(a.fecha, '%d-%m-%Y') as fecha,u.nombre,u.apellidos, d.nombre as area, a.estado as estado, DATE_FORMAT(a.hora, '%h:%i:%s %p') as hora
FROM asistencia a 
INNER JOIN usuarios u ON  a.codigo_persona=u.codigo_persona 
INNER JOIN departamento d ON u.iddepartamento = d.iddepartamento
WHERE DATE(a.fecha)>='$fecha_inicio' AND DATE(a.fecha)<='$fecha_fin' AND a.codigo_persona='$codigo_persona' ORDER BY hora DESC";
	return ejecutarConsulta($sql);
}


}

 ?>
