<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "model.entity.Access" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%
UserService us = UserServiceFactory.getUserService();
User user = us.getCurrentUser();
Access access = (Access) request.getAttribute("access");
%>
<!DOCTYPE html>
<html>
	<head>
		<title>Access</title>
		<meta charset="utf-8">
  		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
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
			<div class=" col-md-3 p-4"> 
				<div class="">
					<h1 class="text-center text-success font-weight-bold">Actions</h1>
					<ul >
						<li class="btn form-control bg-success mx-auto"><a class="btn btn-success" href="/access/add">Add Access</a></li>
						<li class="btn form-control bg-success"><a class="btn btn-success" href="/access/update?userId=<%= access.getId() %>">Update</a></li>
						<li class="btn form-control bg-success"><a class="btn btn-success" href="/access/delete?userId=<%= access.getId() %>">Delete</a></li>
						<li class="btn form-control bg-success"><a class="btn btn-success" href="/access">List of Access</a></li>
					</ul>
				</div>
			</div>
			<div class="table col-md-9 large-9 medium-8 colums p-4"> 
				<h2 class="text-success border-bottom border-success">User with Id:  <%= access.getId() %></h2>
					<table class="vertical-table">
						<tbody>
							<tr>
								<th scope="row">Role</th>
								<td><%=access.getIdRol()%></td>
							</tr>
							<tr>
								<th scope="row">Resource</th>
								<td><%=access.getResource()%></td>
							</tr>
							<tr>
								<th scope="row">Status</th>
								<td><%= access.isStatus()%></td>
							</tr>
						</tbody>
					</table>
			</div>
		</div>
	</div>
	</body>
</html>