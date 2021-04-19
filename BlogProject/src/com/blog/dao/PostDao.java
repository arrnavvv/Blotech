package com.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.blog.entities.Category;
import com.blog.entities.Post;

public class PostDao {
	private Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = null;

		try {
			String query = "Select * from categories";
			PreparedStatement pstm = con.prepareStatement(query);
			ResultSet set = pstm.executeQuery();
			list = new ArrayList<>();
			while (set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String des = set.getString("description");
				Category cat = new Category(cid, name, des);
				list.add(cat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean savePost(Post p) {

		boolean success = false;

		try {
			String query = "Insert into posts(ptitle,pcontent,pcode,ppic,cid,userid) values(?,?,?,?,?,?)";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setString(1, p.getpTitle());
			pstm.setString(2, p.getpContent());
			pstm.setString(3, p.getpCode());
			pstm.setString(4, p.getpPic());
			pstm.setInt(5, p.getCid());
			pstm.setInt(6, p.getUserId());

			pstm.executeUpdate();
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;

	}

	public List<Post> getAllPosts() {
		List<Post> list = new ArrayList<>();
		// get all posts

		try {
			String query = "select * from posts order by pid desc";
			PreparedStatement pstm = con.prepareStatement(query);
			ResultSet set = pstm.executeQuery();

			while (set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("ptitle");
				String pContent = set.getString("pcontent");
				String pCode = set.getString("pcode");
				String pPic = set.getString("ppic");
				Timestamp date = set.getTimestamp("pdate");
				int cid = set.getInt("cid");
				int userId = set.getInt("userid");

				Post p = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<Post> getPostsByCid(int cid) {
		List<Post> list = new ArrayList<>();
		// get all posts by cid

		try {
			String query = "select * from posts where cid = ?";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setInt(1, cid);
			ResultSet set = pstm.executeQuery();

			while (set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("ptitle");
				String pContent = set.getString("pcontent");
				String pCode = set.getString("pcode");
				String pPic = set.getString("ppic");
				Timestamp date = set.getTimestamp("pdate");
				int userId = set.getInt("userid");

				Post p = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public Post getPostByPostId(int pid) {
		Post post = null;
		try {
			String query = "select * from posts where pid = ?";
			PreparedStatement pstm = con.prepareStatement(query);
			pstm.setInt(1, pid);
			ResultSet set = pstm.executeQuery();

			while (set.next()) {
				int cid = set.getInt("cid");
				String pTitle = set.getString("ptitle");
				String pContent = set.getString("pcontent");
				String pCode = set.getString("pcode");
				String pPic = set.getString("ppic");
				Timestamp date = set.getTimestamp("pdate");
				int userId = set.getInt("userid");

				post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}

}
