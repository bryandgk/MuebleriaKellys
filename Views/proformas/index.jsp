<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controller.proformas.*"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<% 
List<Proforma> proformas = (List<Proforma>)request.getAttribute("proformas"); 
UserService us = UserServiceFactory.getUserService();
User user = us.getCurrentUser();
%>
<!DOCTYPE html>
<html>
<head>
<title>Añadir Proformas</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script>	
</script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
	integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
	crossorigin="anonymous">
</head>
<body>
	<div class="cabeza">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="container">
				<!-- Brand -->
				<a class="navbar-brand" href="/principal">Muebleria Kelly</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#iconosDeBarra">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="iconosDeBarra">
				<!-- Links -->
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">

					<!-- Dropdown -->
				
					<li class="nav-item">
						<a class="nav-link" href="/roles">Roles</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/users">Usuarios</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/resources">Recursos</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/access">Accesos</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/productos">Productos</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/clasificaciones">Clasificaciones</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/proformas">Proformas</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="/facturas">Factura</a>
					</li>
				</ul>
				</div>
				<div class="form-inline my-2 my-lg-0">
					<a class="btn btn-dark" href="/pedidos" title="Carrito de Compras"><i class="fas fa-shopping-cart"></i></a>
					<ul class="navbar-nav">
						<li class="nav-item dropdown">
							<a class="btn btn-dark nav-link mr-sm-2 dropdown-toggle" data-toggle="dropdown" href="#"><i class="far fa-user"></i> <%=user.getEmail() %></a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="/sesion/logout">Logout</a>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>	
	<div class="container">
		<div class="row">
			<div class="col-md-3 p-4">
				<a class="btn btn-success" href="/proformas/add">Add Proform</a>
			</div>
			<div class="col-md-9">
				<h1>Lista de Proformas</h1>
				<%
					if (proformas!=null && proformas.size()>0){
				%>
				<table class="table">
					<thead>
						<tr>
							<th>Nombre</th>
							<th>Dirección</th>
							<th>Teléfono</th>
							<th>Precio Total</th>
							<th>Acciones Disponibles</th>
						</tr>
					</thead>
					<%
						for ( Proforma c: proformas) {
					%>
					<tbody>
					<tr>
						<td><%=c.getName()%></td>
						<td> <%= c.getDireccion() %></td>
						<td><%=c.getTelefono()%></td>
						<td><%=c.gettPrecio()%></td>
						<td>
								<span><a href="/proformas/view?proformaId=<%= c.getId() %>">View</a></span>
								<span><a href="/proformas/delete?proformaId=<%= c.getId() %>">Delete</a></span>
								<span><a href="/proformas/update?proformaId=<%= c.getId() %>">Update</a></span>
							</td>
							</tr>
					</tbody>
					<%
						}
					%>
				</table>
				<%
					} else {
				%>
				
					<h3>No hay proforma</h3>
			
				<%
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>