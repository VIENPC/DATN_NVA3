package com.poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.KhachHangDAO;
import com.poly.entities.KhachHang;
import com.poly.service.CustomerService;
import com.poly.service.MailerServiceImpl;
import com.poly.service.SessionService;

@Controller
public class TaiKhoanController {

	@Autowired
	CustomerService customerServive;
	@Autowired
	KhachHangDAO khdao;

	@Autowired
	SessionService service;

	@Autowired
	MailerServiceImpl mailer;

	@RequestMapping("/auth/login/form")
	public String form(Model model) {
		KhachHang kh = new KhachHang();
		model.addAttribute("kh", kh);
		return "auth/login";
	}

	@RequestMapping("/auth/login/success")
	public String success(Model model) {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		List<String> authList = new ArrayList<>();

		// Check if the user is authenticated
		if (authentication != null && authentication.isAuthenticated()) {
			List<String> roleNames = customerServive.getRolesByUsername(authentication.getName());

			for (String roleName : roleNames) {
				authList.add("ROLE_" + roleName);
			}
		}

		if (authList.contains("ROLE_ADMIN")) {
			return "redirect:/admin/home";
		} else {

			return "redirect:/index";
		}

	}

	@RequestMapping("/auth/access/denied")
	public String denied(Model model) {

		return "error404";
	}

	@RequestMapping("/auth/login/error")
	public String error(Model model) {
		model.addAttribute("message", "Sai thông tin đăng nhập!");
		return "forward:/auth/login/form";
	}

	@RequestMapping("/auth/logoff/success")
	public String logoff(Model model) {

		return "forward:/auth/login/form";
	}

	@RequestMapping("/auth/sign-up")
	public String signup(Model model, @ModelAttribute("kh") KhachHang kh, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		try {
			List<KhachHang> khh = khdao.findAll();
			for (KhachHang itkh : khh) {
				if (itkh.getUsernamekh().equals(kh.getUsernamekh())) {

					return "redirect:/auth/login/form?fail=dk";
				}
			}
			String url = "http://localhost:8080/home#!/upaccount";

			String body = "<html>"
					+ "<body style='font-family: Arial, sans-serif; line-height: 1.6em;'>"
					+ "<h2>Xin chào,</h2>"
					+ "<p>Cảm ơn bạn đã đăng ký tài khoản."				
					+ "<p>Vui lòng truy cập đường dẫn này<a href=\"" + url + "\">" + url + "</a>để cập nhật thông tin hoàn thành đang kí tài khoản.</p>"
					+ "<p>Trân trọng,<br>Đội ngũ hỗ trợ</p>"
					+ "</body>"
					+ "</html>";

			mailer.send(kh.getEmail(), "MAIL ĐĂNG KÍ TỪ WEBSITE ĐỒNG HỒ", body);
			kh.setTrangthaikh(1);
			khdao.save(kh);
			Cookie usernameCookie = new Cookie("username", kh.getUsernamekh());
			usernameCookie.setMaxAge(30 * 24 * 60 * 60); // Thời gian tồn tại của cookie (30 ngày)
			usernameCookie.setPath("/"); // Đặt path cho cookie, "/" nghĩa là sẽ được áp dụng trên toàn bộ trang web
			response.addCookie(usernameCookie);
		} catch (Exception e) {
			System.out.println(e);
		}

		return "auth/login";
	}

	/*
	 * OAuth2
	 */

	@RequestMapping("/oauth2/login/success")
	public String success(OAuth2AuthenticationToken oauth2) {
		customerServive.loginFromOAuth2(oauth2);
		return "redirect:/index";
	}
}