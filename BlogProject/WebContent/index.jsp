<%@page import="com.blog.helpers.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<!-- navbar -->
	<%@include file="normalNavBar.jsp"%>

	<!-- banner -->
	<div class="container-fluid p-0 m-0 text-white clip-p">
		<div class="jumbotron" style="background-color: #5e35b1;">
			<div class="container">
				<h3 class="display-3">Welcome to my Blog</h3>
				<p>The World of technology - Arnav Mahajan</p>
				<p>A programming language is a formal language comprising a set
					of instructions that produce various kinds of output. Programming
					languages are used in computer programming to implement algorithms.</p>

				<p>You can learn to code too. Register and dive into the world
					of programming. Happy Coding!</p>
				<a href="register_page.jsp" class="btn btn-outline-light btn-lg"><i
					class="	fa fa-mortar-board"></i> Start! It's Free</a> <a
					href="login_page.jsp" class="btn btn-outline-light btn-lg"><i
					class="fa fa-user-circle fa-spin "></i> Login</a>
			</div>
		</div>
	</div>
	<br>


	<div class='container'>

		<!-- first row -->
		<div class="row mb-2">
			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java</h5>
						<p class="card-text">Java is a class-based, object-oriented
							programming language that is designed to have as few
							implementation dependencies as possible. It is a general-purpose
							programming language intended to let application developers write
							once, run anywhere</p>
						<a href="#" class="btn btn-primary text-white primary-background">Read
							More</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java</h5>
						<p class="card-text">Java is a class-based, object-oriented
							programming language that is designed to have as few
							implementation dependencies as possible. It is a general-purpose
							programming language intended to let application developers write
							once, run anywhere</p>
						<a href="#" class="btn btn-primary text-white primary-background">Read
							More</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java</h5>
						<p class="card-text">Java is a class-based, object-oriented
							programming language that is designed to have as few
							implementation dependencies as possible. It is a general-purpose
							programming language intended to let application developers write
							once, run anywhere</p>
						<a href="#" class="btn btn-primary text-white primary-background">Read
							More</a>
					</div>
				</div>
			</div>

		</div>

		<!-- second row -->
		<div class="row">

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java</h5>
						<p class="card-text">Java is a class-based, object-oriented
							programming language that is designed to have as few
							implementation dependencies as possible. It is a general-purpose
							programming language intended to let application developers write
							once, run anywhere</p>
						<a href="#" class="btn btn-primary text-white primary-background">Read
							More</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java</h5>
						<p class="card-text">Java is a class-based, object-oriented
							programming language that is designed to have as few
							implementation dependencies as possible. It is a general-purpose
							programming language intended to let application developers write
							once, run anywhere</p>
						<a href="#" class="btn btn-primary text-white primary-background">Read
							More</a>
					</div>
				</div>
			</div>

			<div class="col-md-4">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Java</h5>
						<p class="card-text">Java is a class-based, object-oriented
							programming language that is designed to have as few
							implementation dependencies as possible. It is a general-purpose
							programming language intended to let application developers write
							once, run anywhere</p>
						<a href="#" class="btn btn-primary text-white primary-background">Read
							More</a>
					</div>
				</div>
			</div>

		</div>






	</div>






	<!-- bootstrap javascript -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>
</html>