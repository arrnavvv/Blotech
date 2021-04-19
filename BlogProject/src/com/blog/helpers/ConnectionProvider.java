package com.blog.helpers;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			if(con==null) {
			//driver class load
			Class.forName("com.mysql.jdbc.Driver"); 
			
			//create connection
			con = DriverManager.getConnection("jdbc:mysql://localhost/blogproject","root","");
			
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return con;
	}

}
