package com.fashion.jersey.api;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.fashion.DAO.TinTucIml;
import com.fashion.entity.ThongBao;
import com.fashion.entity.TinTuc;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Path(value = "/Tintuc")
public class TinTucApi {

	@POST
	@Path(value = "/insert")
	@Produces(MediaType.APPLICATION_JSON)
	public String insertTinTuc(String data) {
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		// Lưu dữ liệu
		TinTuc tintuc = gs.fromJson(data, TinTuc.class);
		ThongBao tb = new ThongBao();
		Boolean themtc = TinTucIml.getNewTinTuc().insert(tintuc);
		if (themtc) {
			tb.setMacode(1);
			tb.setText("Thêm tin tức thành công");
		} else {
			tb.setMacode(0);
			tb.setText("Thêm tin tức thất bại");
		}
		String trave = gs.toJson(tb);
		return trave;
	}

	// Update tin tức
	@POST
	@Path(value = "/update")
	@Produces(MediaType.APPLICATION_JSON)
	public String updateTinTuc(String data) {
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		// Lưu dữ liệu
		TinTuc tintuc = gs.fromJson(data, TinTuc.class);
		ThongBao tb = new ThongBao();
		Boolean themtc = TinTucIml.getNewTinTuc().update(tintuc);
		if (themtc) {
			tb.setMacode(1);
			tb.setText("Đã sửa tin tức thành công");
		} else {
			tb.setMacode(0);
			tb.setText("Đã sửa tin tức thất bại");
		}
		String trave = gs.toJson(tb);
		return trave;
	}

	@POST
	@Path(value = "/delete/{idxoa}")
	@Produces(MediaType.APPLICATION_JSON)
	public String deleteTinTuc(@PathParam(value = "idxoa")int idxoa) {
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		Boolean xoatc = TinTucIml.getNewTinTuc().delete(idxoa);
		ThongBao tb = new ThongBao();
		if(xoatc) {
			tb.setMacode(1);
			tb.setText("Xóa thành công");
		}else {
			tb.setMacode(0);
			tb.setText("Xóa không thành công");
		}
		String trave = gs.toJson(tb);
		return trave;
	}

	// List tin tức
	@GET
	@Path(value = "/list")
	@Produces(MediaType.APPLICATION_JSON)
	public String ListTinTuc(String data) {
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		List<TinTuc> list = TinTucIml.getNewTinTuc().selectAll();
		String trave = gs.toJson(list);
		return trave;
	}

	
	@GET
	@Path(value = "/search-id/{idtim}")
	@Produces(MediaType.APPLICATION_JSON)
	public String searchTinTuc(@PathParam(value = "idtim")int idtim) {
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		TinTuc tintuc = TinTucIml.getNewTinTuc().selectById(idtim);
		String trave = gs.toJson(tintuc);
		return trave;
	}
	
	@GET
	@Path(value = "/count")
	@Produces(MediaType.APPLICATION_JSON)
	public String countTinTuc() {
		Long soluong = TinTucIml.getNewTinTuc().countTinTuc();
		Gson gs = new Gson();
		String trave = gs.toJson(soluong);
		return trave;
	}
}
