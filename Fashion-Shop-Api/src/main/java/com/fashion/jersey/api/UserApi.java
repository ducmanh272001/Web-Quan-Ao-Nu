package com.fashion.jersey.api;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.fashion.DAO.UserImpl;
import com.fashion.entity.ThongBao;
import com.fashion.entity.User;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Path(value = "/User")
public class UserApi {

	@GET
	@Path(value = "")
	@Produces(MediaType.APPLICATION_JSON)
	public String listUser() {
		List<User> list = UserImpl.getNewUser().selectAll();
		for (User user : list) {
			user.setListUserRole(null);
		}
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String data = gs.toJson(list);
		return data;
	}

	//Api thêm
	@POST
	@Path(value = "/insert")
	@Produces(MediaType.APPLICATION_JSON)
	public String insertUser(String data) {
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		User user = gs.fromJson(data, User.class);
		ThongBao tb = new ThongBao();
		Boolean themTc = UserImpl.getNewUser().insert(user);
		if (themTc) {
			tb.setMacode(1);
			tb.setText("Thành công!");
		} else {
			tb.setMacode(0);
			tb.setText("Thất bại");
		}
		String trave = gs.toJson(tb);
		return trave;

	}
}
