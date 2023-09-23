package com.poly.controller;

import org.apache.commons.math3.stat.descriptive.summary.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.SanPhamDAO;
import com.poly.entities.SanPham;

@Controller
public class HomeController {
	
	@Autowired
	SanPhamDAO spdao;

<<<<<<< Updated upstream
	@GetMapping("/index")
=======
	@GetMapping("")
    public String getindex(){
        return "banhang/view/index";
    }
	
	@RequestMapping("/index")
>>>>>>> Stashed changes
    public String index(){
        return "banhang/view/index";
    }
	
	@RequestMapping("watches")
	public String watches() {
		return "banhang/view/watches";
	}
	@RequestMapping("about")
	public String about() {
		return "banhang/view/about";
	}

    @RequestMapping("contact")
	public String contact() {
		return "banhang/view/contact";
	}

	@RequestMapping("/watches/detail/{masp}")
	public String detail(Model model, @PathVariable("masp") Integer id) {
		SanPham item = spdao.findById(id).get();
		model.addAttribute("item", item);



		return "banhang/view/detailproduct";
	}
	@RequestMapping("/cart")
	public String cart(){

		return "banhang/view/cart";

	}

	// @RequestMapping("/c")

	@RequestMapping("checkout")
	public String checkout(){
		
		return "banhang/view/checkout";
	}

	@RequestMapping("account")
	public String account(){
		return "banhang/view/account";
	}
}
