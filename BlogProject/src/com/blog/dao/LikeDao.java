package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDao {
	private Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean insertLike(int pid, int uid) {
		boolean executedSuccessfully = false;
		try {
			String query = "INSERT into likes(pid,uid) values(?,?)";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setInt(1, pid);
			pstm.setInt(2, uid);
			pstm.executeUpdate();
			executedSuccessfully = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return executedSuccessfully;
	}

	public int countLikeOnPost(int pid) {
		int count = 0;

		String query = "select Count(*) from likes where pid=?";
		try {
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setInt(1, pid);
			ResultSet set = pstm.executeQuery();
			if (set.next()) {
				count += set.getInt("count(*)");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return count;
	}

	public boolean isLikedByUser(int pid, int uid) {
		boolean liked = false;
		try {
			String query = "Select * from likes where pid=? and uid =?";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setInt(1, pid);
			pstm.setInt(2, uid);
			ResultSet set = pstm.executeQuery();
			if (set.next()) {
				liked = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return liked;
	}

	public boolean deleteLike(int pid, int uid) {
		boolean del = false;
		try {
			String query = "delete from likes where pid=? and uid =?";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setInt(1, pid);
			pstm.setInt(2, uid);
			pstm.executeUpdate();
			del = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return del;
	}
}
