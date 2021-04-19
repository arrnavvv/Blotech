package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.blog.entities.User;

public class JavaDao {
	private Connection con;

	public JavaDao(Connection con) {
		this.con = con;
	}

	// insert user data into database
	public boolean saveUser(User user) {
		boolean executedSuccessfully = false;
		try {
			String query = "INSERT INTO users(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement pstm = this.con.prepareStatement(query);
			pstm.setString(1, user.getName());
			pstm.setString(2, user.getEmail());
			pstm.setString(3, user.getPassword());
			pstm.setString(4, user.getGender());
			pstm.setString(5, user.getAbout());
			pstm.executeUpdate();
			executedSuccessfully = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return executedSuccessfully;
	}

	// get user from email and password for login
	public User getEmailAndPassword(String email, String password) {
		User user = null;
		try {
			String query = "Select * from users where email=? and password=?";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, email);
			pstm.setString(2, password);
			ResultSet set = pstm.executeQuery();
			if (set.next()) {
				user = new User();
				user.setName(set.getString("name"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setId(set.getInt("id"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	// update user details
	public boolean updateUser(User user) {
		boolean success = false;
		try {
			String query = "UPDATE users set name =?, email=?, password=?, gender=?,about=?,profile=? where id=?";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, user.getName());
			pstm.setString(2, user.getEmail());
			pstm.setString(3, user.getPassword());
			pstm.setString(4, user.getGender());
			pstm.setString(5, user.getAbout());
			pstm.setString(6, user.getProfile());
			pstm.setInt(7, user.getId());

			pstm.executeUpdate();
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return success;
	}

	public User getUserByUserId(int userId) {
		User user = null;
		try {
			String query = "Select * from users where id=?";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setInt(1, userId);
			ResultSet set = pstm.executeQuery();
			if (set.next()) {
				user = new User();
				user.setName(set.getString("name"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setAbout(set.getString("about"));
				user.setId(set.getInt("id"));
				user.setDateTime(set.getTimestamp("rdate"));
				user.setProfile(set.getString("profile"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

}
