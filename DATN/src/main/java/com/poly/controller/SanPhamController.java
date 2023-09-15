package com.poly.controller;

import java.io.File;
import java.io.IOException;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;

import com.poly.dao.HangSanXuatDAO;
import com.poly.dao.HoaDonCTDAO;
import com.poly.dao.HoaDonDAO;
import com.poly.dao.SanPhamDAO;
import com.poly.entities.HangSanXuat;
import com.poly.entities.SanPham;

@Controller
@RequestMapping("admin")
public class SanPhamController {
	@Autowired
	ServletContext app;

	@Autowired
	HangSanXuatDAO hsxdao;

	@Autowired
	SanPhamDAO spdao;

	@Autowired
	HoaDonDAO hddao;

	@Autowired
	HoaDonCTDAO hdctdao;

	@RequestMapping("/qlsanpham")
	public String qlsanpham(Model model) {

		SanPham sp = new SanPham();
		model.addAttribute("sp", sp);
		HangSanXuat hsx = new HangSanXuat();
		model.addAttribute("hsx", hsx);
		// load danh mục hãng sảnxuất
		List<HangSanXuat> listhsx = hsxdao.findAll();
		model.addAttribute("listhsx", listhsx);
		// model.addAttribute("listsp", spService.findAll());

		List<SanPham> listsp = spdao.findAll();
		model.addAttribute("listsp", listsp);

		return "admin/view/product";

	}

	@RequestMapping("/addsanpham")
	public String addsanpham(Model model) {
		SanPham sp = new SanPham();
		model.addAttribute("sp", sp);
		HangSanXuat hsx = new HangSanXuat();
		model.addAttribute("hsx", hsx);
		// load danh mục hãng sản xuất
		List<HangSanXuat> listhsx = hsxdao.findAll();
		model.addAttribute("listhsx", listhsx);
		return "admin/view/add_product";
	}

	@RequestMapping("/addsanpham/{masp}")
	public String editmasp(Model model, @PathVariable("masp") Integer masp) {
		List<HangSanXuat> listhsx = hsxdao.findAll();
		model.addAttribute("listhsx", listhsx);
		SanPham sp = spdao.findById(masp).get();
		// System.out.println(sp.getHinhanh());
		model.addAttribute("sp", sp);
		return "admin/view/updatesp";
	}

	@RequestMapping("/addsanpham/save")
	public String add_sp(Model model, @Validated @ModelAttribute("sp") SanPham sp, Errors errors,
			@RequestParam("hinh_sp") MultipartFile img) {
		try {
			if (errors.hasErrors() || img.isEmpty()) {
				if (img.isEmpty()) {
					model.addAttribute("message_img", "Vui lòng chọn hình ảnh");
				}
				List<HangSanXuat> listhsx = hsxdao.findAll();
				model.addAttribute("listhsx", listhsx);
				return "admin/view/add_product";
			} else {
				LocalDateTime now = LocalDateTime.now();
				String filename = img.getOriginalFilename();
				File file = new File(app.getRealPath("/images/sanpham/" + filename));
				img.transferTo(file);
				sp.setHinhanh(filename);
				sp.setNgaynhap(now);
				// sp.setNgaynhap(now);
				// System.out.println(formattedDateTime);
				// System.out.println(sp.getMota());
				spdao.save(sp);
			}

			return "redirect:/admin/addsanpham?success=add";
		} catch (Exception e) {
			model.addAttribute("loitensp", "Tên sản phẩm đã tồn tại");
		}
		return null;

	}

	@RequestMapping("/addsanpham/themhang")
	public String add_hangsx(Model model, @RequestParam("hinh_hang") MultipartFile img,
			@Validated @ModelAttribute("hsx") HangSanXuat hsx, Errors errors)
			throws IllegalStateException, IOException {
		// if(errors.hasErrors() || img.isEmpty()){
		// if(img.isEmpty()){
		// model.addAttribute("message_img", "Vui lòng chọn hình ảnh");
		// }
		// return "admin/view/add_product";
		// }

		String filename = img.getOriginalFilename();
		File file = new File(app.getRealPath("/images/logohang/" + filename));
		img.transferTo(file);
		hsx.setLogo(filename);
		hsxdao.save(hsx);

		return "redirect:/admin/addsanpham";
	}

	@RequestMapping("/qlsanpham/deletesp/{masp}")
	public String deletesp(@PathVariable("masp") Integer masp, RedirectAttributes redirectAttributes) {
		try {
			// Gọi service hoặc repository để xóa sản phẩm dựa vào id
			spdao.deleteById(masp);

			// Chuyển hướng tới trang hiển thị thông báo xóa thành công
			redirectAttributes.addFlashAttribute("successMessage", "Đã xóa sản phẩm thành công!");
			return "redirect:/admin/qlsanpham?success=delete";
		} catch (Exception e) {
			// Chuyển hướng tới trang hiển thị thông báo xóa không thành công
			redirectAttributes.addFlashAttribute("errorMessage", "Xóa sản phẩm không thành công: " + e.getMessage());
			return "redirect:/admin/qlsanpham?fail=delete";
		}

	}

	@RequestMapping("/qlsanpham/updatesp")
	public String updatesp(HttpServletRequest request) {
		try {
			Integer masp = Integer.parseInt(request.getParameter("masp"));
			Integer soluong = Integer.parseInt(request.getParameter("soluong"));
			String giaspstr = request.getParameter("giasp");
			giaspstr = giaspstr.replace("đ", "").replace(".", "");
			Integer giasp = Integer.parseInt(giaspstr);
			String trangthai = request.getParameter("tinhtrang");
			Boolean tt = false;
			if (trangthai.equalsIgnoreCase("còn hàng")) {
				tt = true;
			}

			SanPham sp = spdao.findById(masp).get();
			sp.setMasp(sp.getMasp());
			sp.setTensp(request.getParameter("tensp"));
			sp.setSoluong(soluong);
			sp.setTrangthaisp(tt);
			sp.setGiasp(giasp);
			spdao.save(sp);
			// in kiểm tra thông tin trước khi update
			// System.out.println(masp);
			// System.out.println(request.getParameter("tensp"));
			// System.out.println(soluong);
			// System.out.println(tt);
			// System.out.println(giasp);
			return "redirect:/admin/qlsanpham?success=updatesp";
		} catch (Exception e) {

			return "redirect:/admin/qlsanpham?fail=updatesp";
		}

	}

	@RequestMapping("/updatesp/save")
	public String update(Model model, @Validated @ModelAttribute("sp") SanPham sp, Errors errors,
			@RequestParam("hinh_sp") MultipartFile img)
			throws IllegalStateException, IOException {
		if (errors.hasErrors() || img.isEmpty()) {
			if (img.isEmpty()) {
				model.addAttribute("message_img", "Vui lòng chọn hình ảnh");
			}
			return "admin/view/updatesp";
		} else {
			LocalDateTime now = LocalDateTime.now();
			String filename = img.getOriginalFilename();
			File file = new File(app.getRealPath("/images/sanpham/" + filename));
			SanPham sp2 = spdao.findById(sp.getMasp()).get();
			img.transferTo(file);

			sp2.setHinhanh(filename);
			sp2.setTensp(sp.getTensp());
			sp2.setSoluong(sp.getSoluong());
			sp2.setGiasp(sp.getGiasp());
			sp2.setTrangthaisp(sp.getTrangthaisp());
			sp2.setHangsanxuat(sp.getHangsanxuat());
			sp2.setXuatsu(sp.getXuatsu());
			sp2.setMota(sp.getMota());
			sp2.setNgaynhap(now);
			spdao.save(sp2);
			return "redirect:/admin/qlsanpham?success=updatesp";
		}

	}

	 @ModelAttribute
    public void globalModelAttributes(Model model) {
		
       List<SanPham> sp = spdao.findAll();
	   for (SanPham sanPham : sp) {
			if(sanPham.getSoluong() == 0){
				sanPham.setTrangthaisp(false);
				spdao.save(sanPham);
			}
	   }
    }
}
