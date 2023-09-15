package com.poly.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.HangSanXuatDAO;
import com.poly.dao.SanPhamDAO;

@Controller
@RequestMapping("admin")
public class ThongKeSPController {

    @Autowired
    SanPhamDAO spdao;

    @Autowired
    HangSanXuatDAO hsxdao;

    @RequestMapping("/baocaosanpham")
    public String baocaosanpham(Model model) {
        int totalTongGiaHang = 0;
        model.addAttribute("tongtien", totalTongGiaHang);
        model.addAttribute("listhxs", hsxdao.findAll());
        return "admin/view/baocaosp";
    }

    @PostMapping("/thongke")
    public String thongkehang(@RequestParam("mahang") Integer mahang, Model model) {

        model.addAttribute("listhxs", hsxdao.findAll());
        List<Object[]> listsp = spdao.thongkesph(mahang);
        int totalTongGiaHang = 0;
        for (Object[] itemsp : listsp) {
            totalTongGiaHang += Integer.parseInt(itemsp[3].toString()) * Integer.parseInt(itemsp[2].toString());
        }
        model.addAttribute("itemtksp", listsp);
        model.addAttribute("tongcong", totalTongGiaHang);

        return "admin/view/baocaosp";
    }

    @RequestMapping("/thongkesptg")
    public String thongketg(Model model,
            @RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
            @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate, RedirectAttributes redirectAttributes) {
        model.addAttribute("listhxs", hsxdao.findAll());

        List<Object[]> listsp = spdao.thongkesptg(startDate, endDate);
        int totalTongGiaHang = 0;
        for (Object[] itemsp : listsp) {
            totalTongGiaHang += Integer.parseInt(itemsp[3].toString()) * Integer.parseInt(itemsp[2].toString());
        }
        model.addAttribute("itemtksp", listsp);
        model.addAttribute("tongcong", totalTongGiaHang);
        return "admin/view/baocaosp";
    }
}
