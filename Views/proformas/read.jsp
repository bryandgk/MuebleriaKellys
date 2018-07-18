<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controller.proformas.*"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%
	Proforma proformas = (Proforma) request.getAttribute("proformas");
	SimpleDateFormat formato = new SimpleDateFormat("dd-MM-yyyy");
	UserService us = UserServiceFactory.getUserService();
	User user = us.getCurrentUser();
	String fecha = formato.format(proformas.getDate());
%>


<!DOCTYPE html>
<html>
<head>
<title>Ver proforma</title>
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
				<a class="navbar-brand" href="/index.html">Muebleria Kelly</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#iconosDeBarra">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="iconosDeBarra">
				<!-- Links -->
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">

					<!-- Dropdown -->
					<li class="nav-item">
						<a class="nav-link" href="">Nosotros</a>
					</li>
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
						<a class="nav-link" href="/product">Productos</a>
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
					<ul >
						<li class="btn form-control bg-success mx-auto"><a class="btn btn-success" href="/facturas/add">Add Access</a></li>					
						<li class="btn form-control bg-success"><a class="btn btn-success" href="/facturas/update?userId=<%= proformas.getId() %>">Update</a></li>
						<li class="btn form-control bg-success"><a class="btn btn-success" href="/facturas/delete?userId=<%= proformas.getId() %>">Delete</a></li>
						<li class="btn form-control bg-success"><a class="btn btn-success" href="/facturas">List of Access</a></li>
					</ul>
			</div>
			<div class="table col-md-6 medium-8 p-4">
				<h3>Proforma con ID: <%=proformas.getId()%></h3>
				<table class="vertical-table">
					<tbody>
						<tr >
							<th escope=row">Nombre: </th>
							<td><%= proformas.getName() %></td>
						</tr>
						<tr>
							<th escope=row">Dirección: </th>
							<td><%=proformas.getDireccion() %></td>
						</tr>
						<tr>
							<th escope=row">Telefono: </th>
							<td><%=proformas.getTelefono() %></td>
						</tr>
						<tr>
							<th escope=row">Fecha de creación: </th>
							<td><%=fecha %></td>
						</tr>
						<tr>
							<th escope=row">Objeto a comprar: </th>
							<td><%=proformas.getName() %></td>
						</tr>
						<tr>
							<th escope=row">Precio por unidad: </th>
							<td>15</td>
						</tr>
						<tr>
							<th escope=row">Cantidad de objetos: </th>
							<td><%=proformas.getCant() %></td>
						</tr>
						<tr>
							<th escope=row">Total a Pagar</th>
							<td><%=proformas.gettPrecio() %></td>
						</tr>
					</tbody>
				</table>
				<a href="/proformas" class="btn btn-info" role="button">Retornar
				a la lista de proformas</a>		
			</div>
		</div>
	</div>
</body>
</html>