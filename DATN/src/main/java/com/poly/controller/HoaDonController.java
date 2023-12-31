package com.poly.controller;


import java.util.Date;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.HoaDonCTDAO;
import com.poly.dao.HoaDonDAO;
import com.poly.entities.HoaDon;
import com.poly.entities.HoaDonCT;

@Controller
@RequestMapping("admin")
public class HoaDonController {
    @Autowired
    HoaDonDAO hddao;
    @Autowired
    HoaDonCTDAO hdctdao;

    @RequestMapping("/qldonhang")
    public String qlhoadon(Model model) {

        model.addAttribute("listhd", hddao.findAll());

        return "admin/view/qloder";
    }

    @RequestMapping("/xemhoadonct/{mahd}")
    public String xemhdct(@PathVariable("mahd") Integer mahd, Model model) {
        List<HoaDonCT> itemhdct = hdctdao.findChiTietHoaDonByMaHoaDon(mahd);
        model.addAttribute("listhdct", itemhdct);

        return "admin/view/qlhoadonct";
    }

    @RequestMapping("/qldonhang/suatthd/{mahd}")
    public String edittthd(@PathVariable("mahd") Integer mahd) {
        System.out.println(mahd);
        HoaDon hd = hddao.findById(mahd).get();
        hd.setTrangthaihd(2);
        hddao.save(hd);
        return "redirect:/admin/qldonhang?success=updatesp";
    }

    @RequestMapping("/baocaohoadon")
    public String baocaohoadon() {

        return "admin/view/baocaohd";
    }

    @RequestMapping("/thongkehdtg")
    public String thongketg(Model model,
            @RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
            @RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {
     

        List<Object[]> listhd = hddao.thongkesptg(startDate, endDate);
        int tongcong = 0;
        for (Object[] itemsp : listhd) {
            tongcong += Integer.parseInt(itemsp[3].toString()) * Integer.parseInt(itemsp[4].toString());
        }
     
        model.addAttribute("listhd", listhd);
        model.addAttribute("tongcong", tongcong);
        // model.addAttribute("listhd", hddao.thongkehdtg(startDate, endDate));
        return "admin/view/baocaohd";
    }
    // @RequestMapping("xemhoadonct")
    // public String xemhdct(@RequestParam("mahd") Integer mahd, Model model){
    // System.out.println(mahd);
    // List<HoaDonCT> itemhdct = hdctdao.findChiTietHoaDonByMaHoaDon(mahd);
    // model.addAttribute("listhdct", itemhdct);
    // for (HoaDonCT it : itemhdct) {
    // System.out.println(it.getSanpham().getTensp());
    // }
    // return "admin/view/qloder";
    // }
}
