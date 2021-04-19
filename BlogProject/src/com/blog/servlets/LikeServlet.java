package com.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blog.dao.LikeDao;
import com.blog.helpers.ConnectionProvider;

public class LikeServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String op = request.getParameter("operation");
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));

		PrintWriter out = response.getWriter();

		LikeDao dao = new LikeDao(ConnectionProvider.getConnection());
		if (op.equals("like")) {
			boolean res = (dao.insertLike(pid, uid));
			out.print(res);
		}
	}

}
