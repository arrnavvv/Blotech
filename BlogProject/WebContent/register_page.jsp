<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
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

	<main class="primary-background text-white clip-p p-2"
		style="padding-bottom: 80px;">
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3">

					<div class="card">
						<div class="card-header primary-background text-white">
							<i class="fa fa-user-plus fa-2x"></i>
							<h3>Register</h3>
						</div>

						<div class="card-body">
							<form action="register" method="post" id="reg_form">
								<div class="form-group text-dark">
									<label for="user_name">User Name</label> <input type="text"
										class="form-control" id="user_name" name="user_name"
										aria-describedby="user_name" placeholder="Enter user name" required>
								</div>
								<div class="form-group text-dark">
									<label for="user_email">Email address</label> <input
										name="user_email" type="email" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Enter email"required> <small id="emailHelp"
										class="form-text text-muted">We'll never share your
										email with anyone else.</small>
								</div>
								<div class="form-group text-dark">
									<label for="user_password">Password</label> <input
										type="password" class="form-control" name="user_password"
										id="exampleInputPassword1" placeholder="Password" required>
								</div>
								<div class="form-group text-dark">
									<label for="gender">Choose Gender </label> <select id="gender"
										name="gender" required>
										<option value="male">Male</option>
										<option value="female">Female</option>
										<option value="other">Other</option>
									</select>
								</div>
								<div class="form-group text-dark">
									<textarea name="about" class="form-control"
										placeholder="Something about yourself" cols="30" rows="5"></textarea>
								</div>
								<div class="form-check text-dark ">
									<input type="checkbox" name="check"
										class="form-check-input primary-background" id="exampleCheck1">
									<label class="form-check-label mb-2 " for="check">Terms
										And Conditions</label>
								</div>
								<div class="container text-dark text-center" id="loader"
									style="display: none">
									<i class="	fa fa-refresh fa-spin fa-3x"></i>
									<h4>Please Wait...</h4>
								</div>


								<button id="submit_button" type="submit"
									class="btn btn-primary primary-background">Submit</button>
							</form>
						</div>


					</div>


				</div>

			</div>

		</div>


	</main>



	<!-- bootstrap and ajax javascript -->
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

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {
			console.log("ready");
		})

		$('#reg_form').on("submit", function(event) {
			event.preventDefault();

			let form = new FormData(this);
			$('submit_button').hide();
			$('loader').show();

			//send data to register servlet
			$.ajax({
				url : "register",
				type : "post",
				data : form,
				success : function(data, textStatus, jqHXR) {
					console.log(data.trim());

					if (data.trim() === 'Done') {
						swal("Done!", "You have registered", "success");
					} else {
						swal(data);
					}
					$('submit_button').show();
					$('loader').hide();
				},
				error : function(jqHXR, textStatus, errorThrown) {
					console.log(jqHXR)
					swal("ERROR!", "Something went wrong..Couldn't register");
					$('submit_button').show();
					$('loader').hide();
				},
				processData : false,
				contentType : false
			})

		})
	</script>

</body>
</html>