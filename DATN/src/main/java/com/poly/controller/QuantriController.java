package com.poly.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.HoaDonDAO;
import com.poly.dao.KhachHangDAO;
import com.poly.dao.SanPhamDAO;

@Controller
@RequestMapping("admin")
public class QuantriController {
	  @Autowired
    KhachHangDAO khdao;
    @Autowired
    SanPhamDAO spdao;
    @Autowired
    HoaDonDAO hddao;

	@RequestMapping("/qldanhmuc")
	public String qldanhmuc() {
		
		return "admin/view/qldanhmuc";
	}
	@RequestMapping("/baocaochung")
	public String baocaochung(Model model) {
		model.addAttribute("slsp", spdao.count());
		model.addAttribute("slhd", hddao.count());
  		model.addAttribute("slspht", spdao.countByTrangthaisp(false));
		model.addAttribute("tkhk", khdao.countKhachhangByTrangthaikh2(2));
		model.addAttribute("sldhh", hddao.countDontt(5));
		Long tongtien = hddao.getTongTienTatCaHoaDon();
		if(tongtien== null){
			model.addAttribute("tthoadon", 0);
		}else{
			model.addAttribute("tthoadon", tongtien);
		}
		
   
		model.addAttribute("listspbc", spdao.findSanPhamBanChay());
		model.addAttribute("listspht", spdao.findByTtsp(false));

		return "admin/view/baocaochung";
	}
	

	
}
