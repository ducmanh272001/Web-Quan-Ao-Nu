package com.fashion.jersey.api;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.fashion.DAO.RoleImpl;
import com.fashion.entity.Roles;
import com.google.gson.Gson;

@Path(value = "/role")
public class RoleApi {

	@GET
	@Path(value = "/list")
	@Produces(MediaType.APPLICATION_JSON)
	public String listRole() {
		List<Roles> list = RoleImpl.getNewRole().selectAll();
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setListUserRole(null);
		}
		Gson gs = new Gson();
		String data = gs.toJson(list);
		return data;
	}
}
