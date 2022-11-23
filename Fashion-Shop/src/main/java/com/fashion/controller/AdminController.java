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
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.glassfish.jersey.media.multipart.FormDataMultiPart;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fashion.entity.HoaDon;
import com.fashion.entity.HoaDonChiTiet;
import com.fashion.entity.KhachHang;
import com.fashion.entity.LoaiSanPham;
import com.fashion.entity.NhanHieu;
import com.fashion.entity.SanPhamChiTiet;
import com.fashion.entity.Sanpham;
import com.fashion.entity.ThongBao;
import com.fashion.entity.TinTuc;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

@Controller
public class AdminController {

	@GetMapping(value = "/ql-san-pham")
	public String quanLySanPham(HttpServletRequest request, @RequestParam(required = false) Map<String, String> param,
			Model model) {
		HttpSession session = request.getSession();
		String ROLE = (String) session.getAttribute("role");
		if (ROLE == null || ROLE.equals("USER")) {
			return "redirect:/dang-nhap";
		} else if (ROLE.equals("ADMIN") || ROLE.equals("EDITOR")) {
			List<LoaiSanPham> lsp = TienIch.ListLoaiSanPham();
			int sotrang = Integer.parseInt(param.getOrDefault("page", "1"));
			model.addAttribute("sotrang", sotrang);
			List<Sanpham> list = TienIch.PhanTrang(sotrang);
			model.addAttribute("list", list);
			model.addAttribute("lsp", lsp);
			listNhanHieu(model);
			Long slsp = TienIch.count();
			model.addAttribute("sl", slsp);
			String lag = request.getParameter("lag");
			if (lag == null) {
				return "admin/sanpham";
			}
			switch (lag) {
			case "vi": {
				session.setAttribute("lag", "vi_VN");
				break;
			}
			case "en": {
				session.setAttribute("lag", "en_US");
				break;
			}
			case "ja": {
				session.setAttribute("lag", "ja_JP");
				break;
			}
			case "ko": {
				session.setAttribute("lag", "ko_KR");
				break;
			}
			case "lo": {
				session.setAttribute("lag", "lo_LA");
				break;
			}
			default:
				session.setAttribute("lag", "vi_VN");
			}
			return "admin/sanpham";
		}

		return "redirect:/dang-nhap";
	}

	// Lấy ra dánh sách Nhãn hiệu
	private static void listNhanHieu(Model model) {
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String URL = "http://localhost:8080/Fashion-Shop-Api/rest/Nhan-hieu/list";
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target(URL);
		String data = target.request(MediaType.APPLICATION_JSON).get(String.class);
		Type typeOfT = new TypeToken<List<NhanHieu>>() {
		}.getType();
		List<NhanHieu> list = gs.fromJson(data, typeOfT);
		model.addAttribute("lnh", list);
	}

	// Gửi cái form tìm kiếm sản phẩm ngay tại đây
	@GetMapping(value = "/tim-kiem-sp")
	public String timKiemSanPham(HttpServletRequest request, Model model) {
		// Lấy tên tìm + nhãn hiệu + loại sản phẩm để tìm
		String tentim = request.getParameter("tentim");
		int loaisp = Integer.parseInt(request.getParameter("loaisanpham"));
		int nhanhieu = Integer.parseInt(request.getParameter("nhanhieu"));
		// List sản phẩm ở đây
		String URL = "http://localhost:8080/Fashion-Shop-Api/rest/San-pham/list-san-pham";
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target(URL);
		String data = target.request(MediaType.APPLICATION_JSON).get(String.class);
		Type typeOfT = new TypeToken<List<Sanpham>>() {
		}.getType();
		List<Sanpham> listspp = gs.fromJson(data, typeOfT);
		//////////////////////////////////
		for (int i = 0; i < listspp.size(); i++) {
			if (listspp.get(i).getName().equals(tentim) && listspp.get(i).getIdtheloai() == loaisp
					&& listspp.get(i).getIdnhanhieu() == nhanhieu) {
				model.addAttribute("ltim", listspp.get(i));
				// Gửi lại cái list của nhan hiệu và list của loại sản phẩm
				listNhanHieu(model);
				List<LoaiSanPham> lst = TienIch.ListLoaiSanPham();
				model.addAttribute("lsp", lst);
				return "admin/sanpham";
			}
		}
		// Lạp lại cái list cho nhãn hiệu và list cho loại sản phẩm
		listNhanHieu(model);
		List<LoaiSanPham> lst = TienIch.ListLoaiSanPham();
		model.addAttribute("lsp", lst);
		model.addAttribute("oco", "Không tìm thấy sản phẩm!");
		return "admin/sanpham";
	}

	// list Log

	// Quản lý khách hàng
	@GetMapping(value = "/khach-hang")
	public String QuanLyKh(@RequestParam(required = false) Map<String, String> param, HttpServletRequest request,
			Model model) {
		HttpSession session = request.getSession();
		String ROLE = (String) session.getAttribute("role");
		if (ROLE == null) {
			return "redirect:/dang-nhap";
		} else if (ROLE.equals("ADMIN") || ROLE.equals("EDITOR")) {
			int sotrang = Integer.parseInt(param.getOrDefault("page", "1"));
			List<KhachHang> list = TienIch.phanTrangKhachHang(sotrang);
			model.addAttribute("lok", list);
			Long soluong = TienIch.CountKhachHang();
			model.addAttribute("sl", soluong);
			return "khachhang/khachhang";
		}
		return "redirect:/dang-nhap";
	}

	// Sửa khách hàng
	@GetMapping(value = "/sua-khach-hang/{idla}")
	public String suaKhachHang(@PathVariable(value = "idla") int idla, Model model) {
		String URL = "http://localhost:8080/Fashion-Shop-Api/rest/KhachHang/search-kh/" + idla;
		Client client = ClientBuilder.newClient();
		WebTarget target = client.target(URL);
		String dulieu = target.request(MediaType.APPLICATION_JSON).get(String.class);
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		KhachHang kh = gs.fromJson(dulieu, KhachHang.class);
		model.addAttribute("kh", kh);
		return "khachhang/update";
	}

	// Sửa khách hàng
	@PostMapping(value = "/udate-kh-tc")
	public String updateKhachHangThanhCong(@ModelAttribute(value = "kh") KhachHang khachhang) {
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String data = gs.toJson(khachhang);
		TienIch.SuaKhachHang(data);
		return "redirect:/khach-hang";
	}

	// Xóa khách hàng
	@GetMapping(value = "/delete-khach-hang/{idla}")
	public String deleteKhachHang(@PathVariable(value = "idla") int idla, Model model) {
		String xoatc = TienIch.deleteKhachHang(idla);
		model.addAttribute("xoatc", xoatc);
		return "redirect:/khach-hang";
	}

	// List hóa đơn
	@GetMapping(value = "/list-hoa-don")
	public String ListHoaDon(@RequestParam(required = false) Map<String, String> param, HttpServletRequest request,
			Model model) {
		// Lấy role để so sanh 2 giá trị
		HttpSession session = request.getSession();
		String ROLE = (String) session.getAttribute("role");
		if (ROLE == null) {
			return "redirect:/dang-nhap";
		} else if (ROLE.equals("ADMIN") || ROLE.equals("EDITOR")) {
			int sotrang = Integer.parseInt(param.getOrDefault("page", "1"));
			List<HoaDon> list = TienIch.phanTrangHoaDon(sotrang);
			model.addAttribute("list", list);
			int soluong = TienIch.CountHoaDon();
			model.addAttribute("sl", soluong);
			return "hoadon/hoadon";
		}
		return "redirect:/dang-nhap";
	}

	// Xử lý hóa đơn
	@GetMapping(value = "/sua-hoa-don/{idla}")
	public String xuLyHoaDon(@PathVariable(value = "idla") int idla, Model model) {
		HoaDon hd = TienIch.timHoaDon(idla);
		model.addAttribute("hd", hd);
		return "hoadon/update";
	}

	@PostMapping(value = "/sua-hd-tc")
	public String suaHoaDon(@ModelAttribute(value = "hd") HoaDon hoadon) {
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		int idkh = hoadon.getIdmakh();
		KhachHang kh = TienIch.selectByKhachHang(idkh);
		hoadon.setMakh(kh);
		String data = gs.toJson(hoadon);
		TienIch.suaHoaDon(data);
		return "redirect:/list-hoa-don";
	}

	@GetMapping(value = "/delete-hoadon/{idxoa}")
	public String xoaHoaDon(@PathVariable(value = "idxoa") int idxoa, Model model) {
		String xoatc = TienIch.xoaHoaDon(idxoa);
		model.addAttribute("xoatc", xoatc);
		List<HoaDon> list = TienIch.ListHoaDon();
		model.addAttribute("list", list);
		return "hoadon/hoadon";
	}

	@PostMapping(value = "/xuly-hoadon-ok")
	public String xuLyOk(HttpServletRequest request) {
		Boolean trangthai = Boolean.parseBoolean(request.getParameter("trangthai"));
		int idla = Integer.parseInt(request.getParameter("idla"));
		HoaDon hd = TienIch.timHoaDon(idla);
		hd.setStatus(trangthai);
		int idkh = hd.getIdmakh();
		KhachHang kh = TienIch.selectByKhachHang(idkh);
		hd.setMakh(kh);
		// Sẽ sửa lại hóa đơn
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String data = gs.toJson(hd);
		TienIch.suaHoaDon(data);
		return "redirect:/list-hoa-don";
	}

	// xEM chi tiết hóa đơn
	@GetMapping(value = "/xem-ct-hoa-don/{idla}")
	public String xemChitietHoaDon(@PathVariable(value = "idla") int idla, HttpServletRequest request, Model model) {
		List<HoaDonChiTiet> list = TienIch.listHoaDonChiTiet(idla);
		HttpSession session = request.getSession();
		float tongtien = 0;
		for (HoaDonChiTiet hdct : list) {
			int Idspct = hdct.getIdSanPhamCt();
			SanPhamChiTiet spct = TienIch.searchSanPhamCt(Idspct);
			hdct.setId_sp(spct);
			// Tính tổng tiển
			tongtien += hdct.getPrice() * hdct.getQuantity();
		}
		session.setAttribute("tthd", tongtien);
		model.addAttribute("list", list);
		return "hoadon/chitiet-hoadon";
	}

	// Tin tức
	@GetMapping(value = "/tin-tuc")
	public String listTinTuc(HttpServletRequest request, Model model) {
		// Lấy list tin tức
		HttpSession session = request.getSession();
		String ROLE = (String) session.getAttribute("role");
		if (ROLE == null) {
			return "redirect:/dang-nhap";
		} else if (ROLE.equals("ADMIN") || ROLE.equals("EDITOR")) {
			List<TinTuc> list = TienIch.listTinTuc();
			model.addAttribute("list", list);
			model.addAttribute("title", "Tạo tin tức");
			model.addAttribute("tintuc", "Tin tức");
			// Số lượng tin tức
			int soluong = TienIch.countTinTuc();
			model.addAttribute("sl", soluong);
			return "admin/tintuc";
		}
		return "redirect:/dang-nhap";
	}

	@GetMapping(value = "/insert-tin-tuc")
	public String insertTinTuc(Model model) {
		TinTuc tintuc = new TinTuc();
		model.addAttribute("tintuc", tintuc);
		return "admin/insert-tin-tuc";
	}

	@PostMapping(value = "/insert-tintuc-thanhcong")
	public String insertThanhCong(@ModelAttribute(value = "tintuc") TinTuc tintuc,
			@RequestParam(value = "uploadfile") MultipartFile mf, Model model) {
		// Sau lấy về tên đường dẫn
		String tendd = mf.getOriginalFilename();
		Date ngay = new Date();
		tintuc.setDay_tin(ngay);
		tintuc.setImg(tendd);
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String dulieu = gs.toJson(tintuc);
		String trave = TienIch.themTinTuc(dulieu);
		if (trave.equals("Thêm tin tức thành công")) {
			return "redirect:/tin-tuc";
		}
		model.addAttribute("tctintuc", trave);
		return "admin/insert-tin-tuc";
	}

	// Xóa tin tức
	@GetMapping(value = "/delete-tin-tuc/{idla}")
	public String deleteTinTuc(@PathVariable(value = "idla") int idla, Model model) {
		ThongBao tb = TienIch.xoaTinTuc(idla);
		model.addAttribute("tb", tb);
		return "redirect:/tin-tuc";
	}

	// Tìm tin tức
	@GetMapping(value = "/search-tin-tuc/{idla}")
	public String searchTinTuc(@PathVariable(value = "idla") int idla, Model model) {
		TinTuc tintuc = TienIch.TimTinTuc(idla);
		model.addAttribute("tintuc", tintuc);
		return "admin/update-tin-tuc";
	}

	@PostMapping(value = "/update-tintuc-thanhcong")
	public String updateTinTuc(@ModelAttribute(value = "tintuc") TinTuc tintuc,
			@RequestParam(value = "uploadfile") MultipartFile mf, Model model) {
		//Nếu mafko nhập ảnh sẽ lấy ảnh gốc
		String tendd = null;
		if(mf.getSize() == 0) {
			tendd = tintuc.getImg();
		}else {
			tendd = mf.getOriginalFilename();
		} 
		Date ngay = new Date();
		tintuc.setDay_tin(ngay);
		tintuc.setImg(tendd);
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String dulieu = gs.toJson(tintuc);
		String trave = TienIch.suaTinTuc(dulieu);
		model.addAttribute("tctintuc", trave);
		if (trave.equals("Đã sửa tin tức thành công")) {
			return "redirect:/tin-tuc";
		}
		return "admin/update-tin-tuc";

	}

	@GetMapping(value = "/danh-muc")
	public String danhmuc(@RequestParam(required = false) Map<String, String> param, HttpServletRequest request,
			Model model) {
		// Lấy role để so sanh 2 giá trị
		HttpSession session = request.getSession();
		String ROLE = (String) session.getAttribute("role");
		if (ROLE == null) {
			return "redirect:/dang-nhap";
		} else if (ROLE.equals("ADMIN") || ROLE.equals("EDITOR")) {
			int sotrang = Integer.parseInt(param.getOrDefault("page", "1"));
			List<LoaiSanPham> list = TienIch.phanTrangDanhMuc(sotrang);
			model.addAttribute("list", list);
			Long soluong = TienIch.countDanhMuc();
			model.addAttribute("sl", soluong);
			model.addAttribute("danhsach", "Danh sách danh mục");
			model.addAttribute("tao", "Tạo danh mục");
			return "danhmuc/danhmuc";
		}
		return "redirect:/dang-nhap";
	}

	@GetMapping(value = "/tim-danh-muc/{idla}")
	public String suaDanhMuc(@PathVariable(value = "idla") int idla, Model model) {
		LoaiSanPham lsp = TienIch.timDanhMuc(idla);
		model.addAttribute("lsp", lsp);
		return "danhmuc/update";
	}

	// Sửa danh mục
	@PostMapping(value = "/sua-danhmuc-tc")
	public String suaThanhCongDanhMuc(@ModelAttribute(value = "lsp") LoaiSanPham loaisp, Model model) {
		Gson gs = new Gson();
		String data = gs.toJson(loaisp);
		ThongBao tb = TienIch.suaDanhMuc(data);
		model.addAttribute("tb", tb);
		if (tb.getMacode() == 1) {
			return "redirect:/danh-muc";
		}
		return "danhmuc/update";
	}

	@GetMapping(value = "/insert-danh-muc")
	public String insertDanhMuc(Model model) {
		LoaiSanPham lsp = new LoaiSanPham();
		model.addAttribute("lsp", lsp);
		return "danhmuc/insert";
	}

	// Thêm danh mục
	@PostMapping(value = "/them-danhmuc-tc")
	public String themThanhCongDanhMuc(@ModelAttribute(value = "lsp") LoaiSanPham loaisp, Model model) {
		Gson gs = new Gson();
		String data = gs.toJson(loaisp);
		ThongBao tb = TienIch.themDanhMuc(data);
		model.addAttribute("tb", tb);
		if (tb.getMacode() == 1) {
			return "redirect:/danh-muc";
		}
		return "danhmuc/insert";
	}

	// Xóa danh mục
	@GetMapping(value = "/delete-danh-muc/{idxoa}")
	public String xoaDanhMuc(@RequestParam(required = false) Map<String, String> param,
			@PathVariable(value = "idxoa") int idxoa, Model model) {
		ThongBao tb = TienIch.xoaDanhMuc(idxoa);
		model.addAttribute("tb", tb);
		int sotrang = Integer.parseInt(param.getOrDefault("page", "1"));
		List<LoaiSanPham> list = TienIch.phanTrangDanhMuc(sotrang);
		model.addAttribute("list", list);
		Long soluong = TienIch.countDanhMuc();
		model.addAttribute("sl", soluong);
		model.addAttribute("danhsach", "Danh sách danh mục");
		model.addAttribute("tao", "Tạo danh mục");
		return "danhmuc/danhmuc";
	}

	// Test
	@GetMapping(value = "/trang-them-san-pham")
	public String themSanPham(HttpServletRequest request, Model model) {
		// Lấy cái list nhãn hiệu về đây
		HttpSession session = request.getSession();
		String ROLE = (String) session.getAttribute("role");
		if (ROLE == null || ROLE.equals("USER")) {
			return "redirect:/dang-nhap";
		} else if (ROLE.equals("ADMIN") || ROLE.equals("EDITOR")) {
			List<NhanHieu> listnh = TienIch.ListNhanHieu();
			model.addAttribute("list", listnh);
			List<LoaiSanPham> list = TienIch.ListLoaiSanPham();
			model.addAttribute("lsp", list);
		}
		return "sanpham/insert";
	}

	@PostMapping(value = "/them-san-phamok")
	public String themSanPham(HttpServletRequest request, @RequestParam(value = "uploadFile") MultipartFile mf,
			Model model) throws IOException {
		String tensp = request.getParameter("tensp");
		String mota = request.getParameter("descripe");
		String information = request.getParameter("information");
		float gianhap = Float.parseFloat(request.getParameter("gianhap"));
		float giacu = Float.parseFloat(request.getParameter("giacu"));
		float giamoi = Float.parseFloat(request.getParameter("giamoi"));
		int spview = Integer.parseInt(request.getParameter("nguoixem"));
		int loaisp = Integer.parseInt(request.getParameter("loaisanpham"));
		int brand = Integer.parseInt(request.getParameter("nhanhieu"));
		Boolean trangthai = Boolean.parseBoolean(request.getParameter("status"));
		String tenanh = mf.getOriginalFilename();
		///////////////
		String URL = "http://localhost:8080/Fashion-Shop-Api/rest/San-pham/insert-san-pham";
		Client client = ClientBuilder.newClient();
		client.register(MultiPartFeature.class);

		NhanHieu nh = new NhanHieu();
		nh.setId(brand);
		LoaiSanPham lsp = new LoaiSanPham();
		lsp.setId(loaisp);
		// Lấy cái ngày cập nhât lun
		Date date = new Date();
		Sanpham sanphamok = new Sanpham(tensp, mota, information, gianhap, giacu, giamoi, spview, date, trangthai, nh,
				lsp, tenanh);
		Gson gs = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		String dulieu = gs.toJson(sanphamok);
		// Lấy ra cái list sản phẩm
		String URLl = "http://localhost:8080/Fashion-Shop-Api/rest/San-pham/list-san-pham";
		WebTarget targetsp = client.target(URLl);
		WebTarget target = client.target(URL);
		String listSp = targetsp.request(MediaType.APPLICATION_JSON).get(String.class);
		Type lok = new TypeToken<List<Sanpham>>() {
		}.getType();
		List<Sanpham> spList = gs.fromJson(listSp, lok);
		for (int i = 0; i < spList.size(); i++) {
			if (spList.get(i).getImg().equals(tenanh)) {
				// giống tên ảnh vẫn được thêm nhưng thông báo
				// Vẫn cho thêm
//				model.addAttribute("tb2", "Bạn đã thêm ảnh trùng nhau");
				FormDataMultiPart fdm = new FormDataMultiPart();
				InputStream is = mf.getInputStream();
				fdm.field("mf", is, new MediaType());
				fdm.field("dulieu", dulieu);
				Response response = target.request().post(Entity.entity(fdm, MediaType.MULTIPART_FORM_DATA));
				String layve = response.readEntity(String.class);
				ThongBao tb = gs.fromJson(layve, ThongBao.class);
				// Nếu thêm thất bại thì sẻ ở lại trang thêm và báo thêm thất bại
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
		// Đây là lưu lại fie hình ảnh
		String ddgoc = request.getServletContext().getRealPath("/public/img");
		try {
			File file = new File(ddgoc + File.separator + tenanh);
			System.out.println(file);
			byte luu[] = mf.getBytes();
			Path path = file.toPath();
			Files.write(path, luu, StandardOpenOption.CREATE_NEW);
			// Đọc dữ liệu đã
			FormDataMultiPart fdm = new FormDataMultiPart();
			InputStream is = mf.getInputStream();
			fdm.field("mf", is, new MediaType());
			fdm.field("dulieu", dulieu);
			Response response = target.request().post(Entity.entity(fdm, MediaType.MULTIPART_FORM_DATA));
			String trave = response.readEntity(String.class);
			ThongBao tb = gs.fromJson(trave, ThongBao.class);
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
