<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "model.entity.Role" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%
	Role role = (Role) request.getAttribute("role");
UserService us = UserServiceFactory.getUserService();
User user = us.getCurrentUser();
%>
<!DOCTYPE html>
<html>
	<head>
		<title>Usuarios</title>
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
			<div class="col-md-3 mx-auto p-4">
				<a class="btn btn-success " href="/roles">Lists of Roles</a>
			</div>
			<div class="derecha col-md-9">
				<h1 class="text-success border-bottom border-success">Update Role</h1><br>
				
				<form class="form-control" action="/roles/update?userId=<%=role.getId() %>" method="post">
		
					<h2>Id <%= role.getId() %></h2>
					<p>Name<span class="text-danger">*</span></p>
					<input class="form-control form-group w-25" type="text" pattern="[A-Za-z]{2,17}" name="rol" placeholder="Ingrese rol" value="<%= role.getRoles() %>" required >
		
					<input  class="btn btn-success btn-lg" type="submit" value="Actualizar"/>
				</form>
			</div>
		</div>
	</div>
	</body>
</html>