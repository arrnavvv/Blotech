package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.dao.JavaDao;
import com.blog.entities.User;
import com.blog.helpers.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String check = request.getParameter("check");
		// box checked or not
		if (check == null) {
			out.println("Terms and conditions not checked");
		} else {
			String name = request.getParameter("user_name");
			String email = request.getParameter("user_email");
			String password = request.getParameter("user_password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");

			// connect to database
			Connection con = ConnectionProvider.getConnection();

			// create user object
			User user = new User(name, email, password, gender, about);

			// saving user to database
			JavaDao dao = new JavaDao(con);

			// check data saved successfully
			if (dao.saveUser(user)) {
				out.println("Done");
			} else {
				out.println("Error");
			}
		}
	}

}
