package com.blog.entities;

import java.sql.Timestamp;

public class User {
	private int id;
	private String name;
	private String password;
	private String email;
	private String gender;
	private String about;
	private Timestamp dateTime;
	private String profile;

	// constructors
	public User(String name, String email, String password, String gender, String about) {
		this.name = name;
		this.password = password;
		this.email = email;
		this.gender = gender;
		this.about = about;
	}

	public User() {

	}

	public User(int id, String name, String password, String email, String gender, String about, Timestamp dateTime) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.gender = gender;
		this.about = about;
		this.dateTime = dateTime;
	}

	// getters and setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public Timestamp getDateTime() {
		return dateTime;
	}

	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

}
