package com.blog.servlets;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.blog.dao.JavaDao;
import com.blog.entities.Message;
import com.blog.entities.User;
import com.blog.helpers.ConnectionProvider;
import com.blog.helpers.Helper;

@MultipartConfig
public class EditServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// fetch data frome edit form
		String email = request.getParameter("user_email");
		String userName = request.getParameter("user_name");
		String password = request.getParameter("user_password");
		String about = request.getParameter("user_about");
		Part part = request.getPart("user_profile");
		String imageName = part.getSubmittedFileName();

		// debug
		/*
		 * PrintWriter out = response.getWriter(); out.print(email + " " + userName +
		 * " " + password + " " + about + " " + imageName);
		 */

		// get user and change his-her details
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("current_user");
		user.setEmail(email);
		user.setName(userName);
		user.setAbout(about);
		user.setPassword(password);
		String oldFile = user.getProfile();
		user.setProfile(imageName);

		// update database
		JavaDao dao = new JavaDao(ConnectionProvider.getConnection());
		if (dao.updateUser(user)) {
			response.getWriter().println("Updated to Db");
			String path = request.getRealPath("/") + "profilepics" + File.separator + user.getProfile();
			String oldPath = request.getRealPath("/") + "profilepics" + File.separator + oldFile;
			if (!oldFile.equals("default.png"))
				Helper.deleteFile(oldPath);
			if (Helper.saveFile(part.getInputStream(), path)) {
				Message msg = new Message("Profile Updated", "success", "alert-success");
				HttpSession session = request.getSession();
				session.setAttribute("msg", msg);
			} else {
				Message msg = new Message("Something went wrong", "error", "alert-danger");
				HttpSession session = request.getSession();
				session.setAttribute("msg", msg);
			}

		} else {
			Message msg = new Message("Something went wrong", "error", "alert-danger");
			HttpSession session = request.getSession();
			session.setAttribute("msg", msg);
		}
		response.sendRedirect("profile.jsp");
	}

}
