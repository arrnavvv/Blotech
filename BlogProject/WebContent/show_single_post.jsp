<%@page import="com.blog.dao.LikeDao"%>
<%@page import="com.blog.dao.JavaDao"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.helpers.ConnectionProvider"%>
<%@page import="com.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error_page.jsp"%>

<%
User user = (User) session.getAttribute("current_user");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>
<%
int postId = Integer.parseInt(request.getParameter("post_id"));
PostDao dao = new PostDao(ConnectionProvider.getConnection());
Post post = dao.getPostByPostId(postId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- bootstrap css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/myStyle.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title><%=post.getpTitle()%></title>

<style>
.post-title{
	font-weight:100;
	font-size:30px;
}

.post-content{
	font-weight:100;
	font-size:25px;
}

.post-date{
	font-style:italic;
	font-weight:bold;
}
body{
background: url(img/bg.jpg);
background-size:cover;
background-attachment:fixed;
}

</style>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v10.0" nonce="YwSRAlOC"></script>

</head>
<body>

	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark primary-background"
		style="background-color: #5e35b1;">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa fa-certificate"></i> My Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"><i class="fa fa-copyright"></i>Arnav Mahajan
						<span class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="	fa fa-caret-square-o-down"></i>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Project Implementation</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fa fa-address-book-o"></i>Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><i
						class="fa fa-plus-circle"></i> Post</a></li>


			</ul>

			<ul class="navbar-nav mr-right">

				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><i
						class="fa fa-user-o"></i><%=user.getName()%></a></li>

				<li class="nav-item"><a class="nav-link" href="logout"><i
						class="	fa fa-minus-circle"></i> Log Out</a></li>

			</ul>


		</div>
	</nav>

	<!-- navbar end -->


	<!-- main content starts -->
	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">

				<div class="card">
					<div class="card-header">
						<h4 class="post-title"><%=post.getpTitle()%></h4>
					</div>

					<div class="card-body">
						<img src="blog_pics/<%=post.getpPic()%>"
							class="card-img-top my-2" />

						<div class="row">
							<div class="col-md-8">
							<%JavaDao d = new JavaDao(ConnectionProvider.getConnection()); %>
								<p><%=d.getUserByUserId(post.getUserId()).getName() %> has posted:</p>
							</div>

							<div class="col-md-4">
								<p class="post-date"><%=post.getpDate().toLocaleString()%></p>
							</div>
						</div>



						<p class="post-content"><%=post.getpContent()%></p>
						<br>
						<h6>Code:</h6>
						<div class="post-code">
							<pre><%=post.getpCode()%></pre>
						</div>
					</div>

					<%
					LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
					%>
					<div class="card-footer">
						<a href="#!" onclick="doLike(<%=post.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-primary  btn-small"><i
							class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ldao.countLikeOnPost(post.getPid()) %></span></a> <a href="#!"
							class="btn btn-outline-primary  btn-small">
					</div>
					<div class="fb-comments" data-href="http://localhost:9494/BlogProject/show_single_post.jsp?post_id=<%=post.getPid() %>" data-width="" data-numposts="5"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- main content ends -->




	<!-- profile modal -->


	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white">
					<h5 class="modal-title" id="exampleModalLabel">My Blog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="profilepics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px;"> <br>
						<h5 class="modal-title"><%=user.getName()%></h5>

						<!-- details -->
						<div id="profile-detail">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">E-mail</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">About</th>
										<td><%=user.getAbout()%></td>
									</tr>
									<tr>
										<th scope="row">Blogging since</th>
										<td><%=user.getDateTime().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- profile edit -->
						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Edit Carefully</h3>
							<form action="edit" method="post" enctype="multipart/form-data">
								<table class="table">
									<tbody>
										<tr>
											<th scope="row">ID</th>
											<td><%=user.getId()%></td>
										</tr>
										<tr>
											<th scope="row">Email</th>
											<td><input type="email" class="form-control"
												name="user_email" value="<%=user.getEmail()%>"></td>
										</tr>
										<tr>
											<th scope="row">Name</th>
											<td><input type="text" class="form-control"
												name="user_name" value="<%=user.getName()%>"></td>
										</tr>
										<tr>
											<th scope="row">Password</th>
											<td><input type="password" class="form-control"
												name="user_password" value="<%=user.getPassword()%>"></td>
										</tr>
										<tr>
											<th scope="row">Gender</th>
											<td><%=user.getGender().toUpperCase()%></td>
										</tr>
										<tr>
											<th scope="row">About</th>
											<td><textarea rows="5" class="form-control"
													name="user_about"><%=user.getAbout()%></textarea></td>
										</tr>
										<tr>
											<th scope="row">Profile Picture</th>
											<td><input type="file" class="form-control"
												name="user_profile"></td>
										</tr>
									</tbody>
								</table>
								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>

							</form>
						</div>



					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>

	<!-- end profile modal -->


	<!-- post modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<!-- form -->
					<form action="addPost" method="post" id="add-post-form">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>--Select Category--</option>
								<%
								PostDao pd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = pd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>
							</select>
						</div>

						<div class="form-group">
							<input type="text" placeholder="Enter Post Title"
								class="form-control" name="pTitle">
						</div>

						<div class="form-group">
							<textarea class="form-control" placeholder="Enter Content"
								rows="5" name="pContent"></textarea>
						</div>

						<div class="form-group">
							<textarea class="form-control" placeholder="Enter Code (If any)"
								rows="5" name="pCode"></textarea>
						</div>

						<div class="form-group">
							<label>Select Picture (If any)</label><br> <input
								type="file" name="pPic">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Post</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<!-- END post modal -->



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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="js/myJs.js" type="text/javascript"></script>

	<script>
		$(document).ready(function() {

			let editStatus = false;

			$("#edit-profile-btn").click(function() {

				if (!editStatus) {
					$("#profile-detail").hide();
					$("#profile-edit").show();
					$(this).text("Back");
					editStatus = true;
				} else {
					$("#profile-detail").show();
					$("#profile-edit").hide();
					$(this).text("Edit");
					editStatus = false;
				}

			})
		})
	</script>


	<!-- add post details to servlet js -->
	<script>
		$(document)
				.ready(
						function() {
							$("#add-post-form")
									.on(
											"submit",
											function(event) {
												console.log("submitted");
												//code runs when form is submitted
												event.preventDefault();

												let form = new FormData(this);

												//call to servlet
												$
														.ajax({
															url : "addPost",
															type : "post",
															data : form,
															success : function(
																	data) {
																if (data.trim() == 'done') {
																	swal(
																			"Post Done!",
																			"Uploaded successfully!",
																			"success");
																} else {
																	swal(
																			"Error!",
																			"Something went wrong!");
																	this.hide();
																}
															},
															error : function() {
																swal("Error!",
																		"Something went wrong!");
															},
															processData : false,
															contentType : false
														})

											})
						})
	</script>
</body>
</html>