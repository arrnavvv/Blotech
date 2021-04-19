<%@page import="com.blog.entities.User"%>
<%@page import="com.blog.dao.LikeDao"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.helpers.ConnectionProvider"%>
<%@page import="com.blog.dao.PostDao"%>

<div class="row">


	<%
	User user = (User) session.getAttribute("current_user");
	if (user == null) {
		response.sendRedirect("login_page.jsp");
	}
	
	
	PostDao dao = new PostDao(ConnectionProvider.getConnection());
	int cid = Integer.parseInt(request.getParameter("cid"));
	List<Post> posts =null;
	if(cid==0){
	posts= dao.getAllPosts();
	}
	else{
		posts = dao.getPostsByCid(cid);
	}
	
	if(posts.size()==0){
		out.println("<h3 class='display-3 text-center'>No posts in this category</h3>");
		return;
	}

	for (Post p : posts) {
	%>
	<div class="col-md-6">
		<div class="card border-dark mb-3">
		<img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap" class="img-fluid"
							style="height:225px;">
			<div class="card-body">
			<b class="card-title"><%=p.getpTitle()%></b>
			<p> <%=p.getpContent() %></p>
			</div>
			
			<%
					LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
					%>
			<div class="card-footer">
				<a href="show_single_post.jsp?post_id=<%=p.getPid()%>" class="btn btn-outline-primary  btn-small">Read More</a>
				<a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-primary  btn-small"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%=ldao.countLikeOnPost(p.getPid()) %></span></a>
				<a href="#!" class="btn btn-outline-primary  btn-small"><i class="fa fa-commenting-o"></i><span>10</span></a>
			</div>
			
			</div>
			</div>
			
		<%
		}
		%>
	</div>