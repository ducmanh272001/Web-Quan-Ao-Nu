package com.fashion.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "tbl_user")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "USER_ID")
	private int id;
	@Column(name = "USER_NAME")
	@NotEmpty(message = "Không để trống tên đăng nhập")
	@Pattern(regexp = "[a-z0-9._]+@[a-z0-9._]+", message = "Email phải bao gồm từ a-z và có ký tự @")
	private String name;
	@Column(name = "PASSWORD")
	@NotEmpty(message = "Không để trống Password")
	@Length(min = 2, max = 50, message = "Mật khẩu tối thiểu là 2 kí tự tối đa là 50 kí tự")
	private String password;
	@Column(name = "ENABLED")
	private int enabled;
	@Length(min = 3, max = 50, message = "Tên đăng nhập tối thiểu 3 và tối đa là 50")
	@Column(name = "FULL_NAME")
	private String fullName;
	@OneToMany(mappedBy = "userId", fetch = FetchType.EAGER)
	private List<UserRole> listUserRole;

	public User() {

	}

	
	public User(String name, String password, String fullName, int enabled) {
		this.name = name;
		this.password = password;
		this.fullName = fullName;
	    this.enabled = enabled;
	}

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

	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public List<UserRole> getListUserRole() {
		return listUserRole;
	}

	public void setListUserRole(List<UserRole> listUserRole) {
		this.listUserRole = listUserRole;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", enabled=" + enabled + ", fullName="
				+ fullName + ", listUserRole=" + listUserRole + "]";
	}

}
