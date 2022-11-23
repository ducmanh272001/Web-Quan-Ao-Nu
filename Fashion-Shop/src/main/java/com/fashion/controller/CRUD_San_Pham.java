package com.fashion.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Type;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardOpenOption;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fashion.entity.LoaiSanPham;
import com.fashion.entity.NhanHieu;
import com.fashion.entity.Sanpham;
import com.fashion.entity.ThongBao;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

@Controller
public class CRUD_San_Pham {

	// Lấy ra cái list sản phẩm
	private static void listSanPham(Model model) {
		String URL = "http://localhost:8080/Fashion-Shop-Api/rest/San-pham/list-san-pham";
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target(URL);
		String data = target.request(MediaType.APPLICATION_JSON).get(String.class);
		Type typeOfT = new TypeToken<List<Sanpham>>() {
		}.getType();
		List<Sanpham> listok = gs.fromJson(data, typeOfT);
		model.addAttribute("list", listok);
	}

	// Lấy cái list nhãn hiệu và list loại sản phẩm
	private static void ListNhanHieu(Model model) {
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String URL = "http://localhost:8080/Fashion-Shop-Api/rest/Nhan-hieu/list";
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target(URL);
		String data = target.request(MediaType.APPLICATION_JSON).get(String.class);
		Type typeOfT = new TypeToken<List<NhanHieu>>() {
		}.getType();
		List<NhanHieu> list = gs.fromJson(data, typeOfT);
		model.addAttribute("list", list);
	}

	// Lấy ra loại sản phẩm
	private static void ListLoaiSanPham(Model model) {
		// Lấy ra loai sản phẩm
		Gson gs = new Gson();
		String URL2 = "http://localhost:8080/Fashion-Shop-Api/rest/The-loai/list";
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target(URL2);
		String listTl = target.request(MediaType.APPLICATION_JSON).get(String.class);
		Type typeTl = new TypeToken<List<LoaiSanPham>>() {
		}.getType();
		List<LoaiSanPham> loaisp = gs.fromJson(listTl, typeTl);
		model.addAttribute("lsp", loaisp);
	}

	@GetMapping(value = "/delete-san-pham/{idxoa}")
	public String deleteSanPham(@PathVariable(value = "idxoa") int xoaok, HttpServletRequest request, Model model) {
		String URL = "http://localhost:8080/Fashion-Shop-Api/rest/San-pham/delete/" + xoaok;
		// Xóa
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target(URL);
		Sanpham sanpham = new Sanpham();
		Gson gs = new Gson();
		String xoaOk = gs.toJson(sanpham);
		Response response = target.request().post(Entity.entity(xoaOk, MediaType.APPLICATION_JSON));
		String trave = response.readEntity(String.class);
		ThongBao tb = gs.fromJson(trave, ThongBao.class);
		model.addAttribute("tb", tb);
		// Nạp lại cái list
		int sotrang = 1;
		sotrang = Integer.parseInt(request.getParameter("page"));
		List<Sanpham> list = TienIch.PhanTrang(sotrang);
		model.addAttribute("list", list);
		model.addAttribute("sotrang", sotrang);
		// Nạp lại số trang
		Long slsp = TienIch.count();
		model.addAttribute("sl", slsp);
		return "admin/sanpham";
	}

	/// Update sản phẩm
	@GetMapping(value = "/update-san-pham/{idla}")
	public String updateSanPham(@PathVariable(value = "idla") int idla, Model model) {
		String URL = "http://localhost:8080/Fashion-Shop-Api/rest/San-pham/search-id/" + idla;
		// Lấy ra sản phẩm chi tiết
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target(URL);
		String chitiet = target.request(MediaType.APPLICATION_JSON).get(String.class);
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		Sanpham spct = gs.fromJson(chitiet, Sanpham.class);
		model.addAttribute("spct", spct);
		List<NhanHieu> listnh = TienIch.ListNhanHieu();
		model.addAttribute("list", listnh);
		List<LoaiSanPham> list = TienIch.ListLoaiSanPham();
		model.addAttribute("lsp", list);
		return "sanpham/update";
	}

	// update thành công
	@PostMapping(value = "/update-success")
	public String updateSuccess(@ModelAttribute(value = "spct") Sanpham sanpham,
			@RequestParam(value = "uploadFile") MultipartFile mf, Model model, HttpServletRequest request)
			throws IOException {
		String img = null;
		if (mf.getSize() != 0) {
			img = mf.getOriginalFilename();
		} else {
			img = sanpham.getImg();
		}
		// Cái ni là lấy cả id về
		String URL = "http://localhost:8080/Fashion-Shop-Api/rest/San-pham/update-san-pham";
		String URLLIST = "http://localhost:8080/Fashion-Shop-Api/rest/San-pham/list-san-pham";
		Client client = ClientBuilder.newClient();
		client.register(MultiPartFeature.class);
		WebTarget target = client.target(URLLIST);
		WebTarget target2 = client.target(URL);
		String data = target.request(MediaType.APPLICATION_JSON).get(String.class);
		Type typeOfT = new TypeToken<List<Sanpham>>() {
		}.getType();
		Gson gs2 = new Gson();
		List<Sanpham> listok = gs2.fromJson(data, typeOfT);
		// Tạo cái san phẩm
		NhanHieu nh = new NhanHieu();
		nh.setId(sanpham.getIdnhanhieu());
		LoaiSanPham lsp = new LoaiSanPham();
		lsp.setId(sanpham.getIdtheloai());
		Date date = new Date();
		Sanpham sanphamok = new Sanpham(sanpham.getId(), sanpham.getName(), sanpham.getDescripe(),
				sanpham.getInformation(), sanpham.getPrice_import(), sanpham.getPrice_old(), sanpham.getPrice_new(),
				sanpham.getSp_view(), date, sanpham.isStatus(), nh, lsp, img);
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String dulieu = gs.toJson(sanphamok);
		InputStream is = mf.getInputStream();
		FormDataMultiPart fdm = new FormDataMultiPart();
		fdm.field("dulieu", dulieu);
		fdm.field("mf", is, new MediaType());
		for (int i = 0; i < listok.size(); i++) {
			if (listok.get(i).getImg().equals(img)) {
				Response response = target2.request().post(Entity.entity(fdm, MediaType.MULTIPART_FORM_DATA));
				String layve = response.readEntity(String.class);
				ThongBao tb = gs.fromJson(layve, ThongBao.class);
				if (tb.getMacode() == 0) {
					model.addAttribute("spok", sanphamok);
					List<NhanHieu> listnh = TienIch.ListNhanHieu();
					model.addAttribute("list", listnh);
					List<LoaiSanPham> list = TienIch.ListLoaiSanPham();
					model.addAttribute("lsp", list);
					model.addAttribute("tb", tb);
					return "sanpham/insert";
				}
				return "redirect:/ql-san-pham";
			}
		}
		// Còn đây thì sẽ lưu lại hình hảnh thôi
		String ddgoc = request.getServletContext().getRealPath("/public/img");
		try {
			File file = new File(ddgoc + File.separator + img);
			System.out.println(file);
			Path path = file.toPath();
			byte luulai[] = mf.getBytes();
			Files.write(path, luulai, StandardOpenOption.CREATE_NEW);
			// Và thêm vào formdata mang đi
			Response response = target2.request().post(Entity.entity(fdm, MediaType.MULTIPART_FORM_DATA));
			String tradulieu = response.readEntity(String.class);
			ThongBao tb = gs.fromJson(tradulieu, ThongBao.class);
			if (tb.getMacode() == 0) {
				model.addAttribute("spok", sanphamok);
				List<NhanHieu> listnh = TienIch.ListNhanHieu();
				model.addAttribute("list", listnh);
				List<LoaiSanPham> list = TienIch.ListLoaiSanPham();
				model.addAttribute("lsp", list);
				model.addAttribute("tb", tb);
				return "sanpham/insert";
			}
		} catch (Exception e) {
			model.addAttribute("spok", sanphamok);
			List<NhanHieu> listnh = TienIch.ListNhanHieu();
			model.addAttribute("list", listnh);
			List<LoaiSanPham> list = TienIch.ListLoaiSanPham();
			model.addAttribute("lsp", list);
            model.addAttribute("loinl", "Xảy ra lỗi file hình ảnh đã được lưu!");
			return "sanpham/insert";
		}
		return "redirect:/ql-san-pham";
	}
}
