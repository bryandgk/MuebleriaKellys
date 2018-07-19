<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%
	UserService us = UserServiceFactory.getUserService();
	User user = us.getCurrentUser();
%>
<!DOCTYPE html >
<html>
<head>
	<title>Añadir Producto</title>
	<meta charset="UTF-8">
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
			<div class="col-md-4 p-4">
				<div class="mx-auto">
					<a class="btn btn-success" href="/product">List of Productos</a>
				</div>
			</div>
			<div class="col-md-6 p-4">
				<h2 class="font-italic">Ingrese datos</h2>
				<form action="/product/add" method="post">
					<p>Seleccione Tipo:</p>
					<select class="form-control form-group" name="tipo">
						<option value="1">Sala Comedor</option>
						<option value="2">Juego Sala</option>
						<option value="3">Vitrina</option>
					</select>
					<p>Precio: </p>
					<input class="form-control form-group" type="text" name="price" value="" required="" pattern="[0-9]{4,6}" title="Ingrese un precio valido de 4 a6 cifras">
					<p>Ancho: </p>
					<input class="form-control form-group" type="text" name="width" required="" pattern="[0-9]{1,3}" title="Ingrese numero valido en cm, maximo 3 cifras">
					<p>Alto: </p>
					<input  class="form-control form-group" type="text" name="height" required="" pattern="[0-9]{1,3}" title="Ingrese numero valido en cm, maximo 3 cifras">
					<p> Lleva Vidrio?</p>
					<select class="form-control form-group" name="glass">
						<option value="true">Si</option>
						<option value="false">No</option>
					</select>
					<p>Numero de asientos: </p>
					<input class="form-control form-group" type="text" name="num" required="" pattern="[0-9]{1,2}" title="Ingrese numero valido, maximo 2 cifras"><br>
					<input class="btn btn-success" type="submit" value="Enviar">
				</form>
			</div>		
		</div>
	</div>
</body>
</html>