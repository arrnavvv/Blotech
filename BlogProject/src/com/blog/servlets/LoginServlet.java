package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blog.dao.JavaDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helpers.ConnectionProvider;

public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		// fetch email and password from request
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// connect to db
		Connection con = ConnectionProvider.getConnection();

		JavaDao dao = new JavaDao(con);
		User user = dao.getEmailAndPassword(email, password);

		if (user == null) {
			// user doesn't exist
			// out.print("Invalid details...Try again");
			Message msg = new Message("Invalid details...Try again", "error", "alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect("login_page.jsp");
		} else {
			// login success
			HttpSession session = request.getSession();
			session.setAttribute("current_user", user);
			response.sendRedirect("profile.jsp");
		}
	}

}
