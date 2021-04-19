<%@page import="com.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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

	<main
		class="d-flex align-items-center primary-background text-white clip-p"
		style="height: 70vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-4">

					<div class="card">

						<div class="card-header primary-background text-white">
							<i class="fa fa-user-circle fa-2x"></i>
							<h3>Login</h3>
						</div>
						
						<%
						Message m = (Message)session.getAttribute("msg");
						if(m!=null){
							%>
							<div class="alert <%=m.getCssClass() %>" role="alert">
							<%= m.getContent()%>
							</div>
						<% 
						session.removeAttribute("msg");
						}
						%>
	
						

						<div class="card-body">
							<form action="login" method="post">
								<div class="form-group text-dark">
									<label for="email">Email address</label> <input type="email"
										class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email"
										name="email" required> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group text-dark">
									<label for="password">Password</label> <input type="password"
										class="form-control" id="exampleInputPassword1"
										placeholder="Password" name="password" required>
								</div>
								<button type="submit" class="btn btn-primary primary-background">Submit</button>
							</form>
						</div>

					</div>

				</div>
			</div>
		</div>
	</main>





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