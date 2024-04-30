<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="<c:url value="/resources/css/test.css" />">
       
 <link rel="preconnect" href="https://fonts.gstatic.com">
    <link rel="shortcut icon" href="img/icons/icon-48x48.png" />

    <link rel="canonical" href="https://demo-basic.adminkit.io/" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
</head>
<body>
  
    <div class="container-fluid">

        <div class="row">

            <div class="col-sm-3 col-md-2 sidebar">

                <div class="client-info clearfix">
                    <img src="" alt="Cliente" width="50" height="50" class="pull-left">
                    <p>Sample Name</p>
                </div>

                <ul class="nav nav-sidebar">

                    <li><a href=""><i class="fa fa-user fa-fw"></i> Datos Personales</a></li>
                    <li><a href=""><i class="fa fa-folder fa-fw"></i> Expediente Medico/Dental</a></li>

                    <a class="sidebar-header text-center" data-toggle="collapse" href="#clinica">Actividades
                        Clinicas</a>
                    <div class="collapse" id="clinica">
                        <li><a href=""><i class="fa fa-th-list fa-fw"></i> Plan de Tratamiento</a></li>
                        <li><a href=""><i class="fa fa-puzzle-piece fa-fw"></i> Odontograma</a></li>
                        <li><a href=""><i class="fa fa-clipboard fa-fw"></i> Historial de Procedimientos</a></li>
                    </div>

                    <li class="sidebar-header text-center">Administraci&oacute;n</li>
                    <li><a href=""><i class="fa fa-search fa-fw"></i> Buscar Paciente</a></li>
                    <li><a href=""><i class="fa fa-calculator fa-fw"></i> Presupuestos</a></li>
                    <li><a href=""><i class="fa fa-calculator fa-fw"></i> Presupuestos Procesados</a></li>
                    <li><a href=""><i class="fa fa-list fa-fw"></i> Pagos Realizados</a></li>
                    <li><a href=""><i class="fa fa-usd fa-fw"></i> Precios por Grupo</a></li>
                    <li><a href=""><i class="fa fa-list fa-fw"></i> Utilidades</a></li>

                    <li class="sidebar-header text-center">Inventario</li>
                    <li><a href=""><i class="fa fa-search fa-fw"></i> Buscar Producto</a></li>
                    <li><a href=""><i class="fa fa-plus fa-fw"></i> Agregar Producto</a></li>
                    <li><a href=""><i class="fa fa-cube fa-fw"></i> Productos</a></li>
                    <li><a href=""><i class="fa fa-times fa-fw"></i> Productos Desactivados</a></li>
                    <li><a href=""><i class="fa fa-dashboard fa-fw"></i> Unidades de Medida</a></li>

                    <li class="sidebar-header text-center">Paquetes</li>
                    <li><a href=""><i class="fa fa-tasks fa-fw"></i> Crear Paquete</a></li>
                    <li><a href=""><i class="fa fa-th-list fa-fw"></i> Paquetes</a></li>
                    <li><a href=""><i class="fa fa-times fa-fw"></i> Paquetes Desactivados</a></li>

                    <li class="sidebar-header text-center">Entradas</li>
                    <li><a href=""><i class="fa fa-cubes fa-fw"></i> Entradas de Producto</a></li>
                    <li><a href=""><i class="fa fa-times fa-fw"></i> Entradas Canceladas</a></li>

                    <li class="sidebar-header text-center">Salidas</li>
                    <li><a href=""><i class="fa fa-inbox fa-fw"></i> Peticiones</a></li>
                    <li><a href=""><i class="fa fa-th-large fa-fw"></i>Peticiones Atendidas</a></li>
                    <li><a href=""><i class="fa fa-times fa-fw"></i>Peticiones Canceladas</a></li>

                    <li class="sidebar-header text-center">Altas</li>
                    <li><a href=""><i class="fa fa-user-md fa-fw"></i> Medicos</a></li>
                    <li><a href=""><i class="fa fa-user fa-fw"></i> Pacientes</a></li>
                    <li><a href=""><i class="fa fa-users fa-fw"></i> Grupos</a></li>
                    <li><a href=""><i class="fa fa-heart fa-fw"></i> Tratamientos</a></li>
                    <li><a href=""><i class="fa fa-heart fa-fw"></i> Tratamientos Preventivos</a></li>
                    <li><a href=""><i class="fa fa-heart fa-fw"></i> Evaluaciones</a></li>
                </ul>

            </div><!-- end .sidebar -->

        </div>

    </div>
 <script src="<c:url value="/resources/js/script.js" />"></script>
</body>
</html>