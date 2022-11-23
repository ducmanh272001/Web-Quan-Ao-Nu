package com.fashion.Test;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.fashion.DAO.TinTucIml;
import com.fashion.entity.TinTuc;

public class TestOkk {

	public static void main(String[] args) {
		// Thêm tin tức
		Date ngayok = null;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		try {

			ngayok = sf.parse("2001-09-09");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		TinTuc tt = new TinTuc(0, "title1", "descripe1", "content1", "type1", ngayok, "img1", 1);
		Boolean themtc = TinTucIml.getNewTinTuc().insert(tt);
		if(themtc) {
			System.out.println("thêm thành công");
		}else {
			System.out.println("Them thất bại");
		}
	}

}
