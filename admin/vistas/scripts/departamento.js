var tabla;

//funcion que se ejecuta al inicio
function init(){
   mostrarform(false);
   listar();

   $("#formulario").on("submit",function(e){
   	guardaryeditar(e);
   })
}

//funcion limpiar
function limpiar(){
	$("#iddepartamento").val("");
	$("#nombre").val("");
	$("#descripcion").val(""); 
}
 
//funcion mostrar formulario
function mostrarform(flag){
	limpiar();
	if(flag){
		$("#listadoregistros").hide();
		$("#formularioregistros").show();
		$("#btnGuardar").prop("disabled",false);
		$("#btnagregar").hide();
	}else{
		$("#listadoregistros").show();
		$("#formularioregistros").hide();
		$("#btnagregar").show();
	}
}

//cancelar form
function cancelarform(){
	limpiar();
	mostrarform(false);
}

//funcion listar
function listar(){
	tabla=$('#tbllistado').dataTable({
		"aProcessing": true, //activamos el procesamiento de databbles
		"aServerSide": true, //paginacion y filtrado realizadosp por el servidor
		dom: '<Bl<f>rtip>', //definimos los elementos del control de la tabla
		buttons: [
			'copyHtml5',
			'excelHtml5',
			'csvHtml5',
			'pdf'
		],
		"language": {
			sSearch: "Buscar:",
			sEmptyTable: "No hay datos disponibles",
			sZeroRecords: "No se encontraron resultados",
			sInfo: "Mostrando _START_ a _END_ de _TOTAL_ registros",
			sInfoEmpty: "Mostrando 0 a 0 de 0 registros",
			SInfoFiltered: "(Filtrado de _MAX_ registros)",
			oPaginate: {
				sFirst: "Primero",
				sLast: "Último",
				sNext: "Siguiente",
				sPrevious: "Anterior"
			},
			sLoadingRecords: "Cargando...",
			sLengthMenu: "Mostrar _MENU_ Registros",
		},
		"ajax":
		{
			url:'../ajax/departamento.php?op=listar',
			type: "get",
			dataType : "json",
			error:function(e){
				console.log(e.responseText);
			}
		},
		"bDestroy":true,
		"iDisplayLength":10,//paginacion
		"order":[[0,"desc"]]//ordenar (columna, orden)
	}).DataTable();
}
//funcion para guardaryeditar
function guardaryeditar(e){
     e.preventDefault();//no se activara la accion predeterminada 
     $("#btnGuardar").prop("disabled",true);
     var formData=new FormData($("#formulario")[0]);

     $.ajax({
     	url: "../ajax/departamento.php?op=guardaryeditar",
     	type: "POST",
     	data: formData,
     	contentType: false,
     	processData: false,

     	success: function(datos){
     		bootbox.alert(datos);
     		mostrarform(false);
     		tabla.ajax.reload();
     	}
     });

     limpiar();
}

function mostrar(iddepartamento){
	$.post("../ajax/departamento.php?op=mostrar",{iddepartamento : iddepartamento},
		function(data,status)
		{
			data=JSON.parse(data);
			mostrarform(true);

			$("#nombre").val(data.nombre);
			$("#descripcion").val(data.descripcion);
			$("#iddepartamento").val(data.iddepartamento);
		})
}


//funcion para desactivar
function desactivar(iddepartamento){
	bootbox.confirm("¿Esta seguro de desactivar este dato?", function(result){
		if (result) {
			$.post("../ajax/departamento.php?op=desactivar", {iddepartamento : iddepartamento}, function(e){
				bootbox.alert(e);
				tabla.ajax.reload();
			});
		}
	})
}

function activar(iddepartamento){
	bootbox.confirm("¿Esta seguro de activar este dato?" , function(result){
		if (result) {
			$.post("../ajax/departamento.php?op=activar" , {iddepartamento : iddepartamento}, function(e){
				bootbox.alert(e);
				tabla.ajax.reload();
			});
		}
	})
}

init();