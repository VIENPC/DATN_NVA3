package com.poly.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.poly.dao.HoaDonCTDAO;
import com.poly.dao.HoaDonDAO;
import com.poly.dao.SanPhamDAO;
import com.poly.entities.HoaDon;
import com.poly.entities.HoaDonCT;
import com.poly.entities.SanPham;
import com.poly.service.OrderService;

@CrossOrigin(origins = "*")
@RestController
public class HoaDonRestcontroller {

	@Autowired
	HoaDonDAO hddao;
	@Autowired
	SanPhamDAO spdao;
	@Autowired
	HoaDonCTDAO hdctdao;
	@Autowired
	OrderService orderService;

	@PostMapping("/rest/hoadon")
	public HoaDon create(@RequestBody JsonNode orderData) {
		return orderService.create(orderData);
	}

	@PutMapping("/rest/hoadonhuy")
	public ResponseEntity<HoaDon> huydon(
			@RequestParam("mahd") Integer mahd, @RequestBody HoaDon hd) {
		HoaDon hdexist = hddao.findById(mahd).get();
		if (hdexist == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		List<HoaDonCT> hdct = hdctdao.findChiTietHoaDonByMaHoaDon(hdexist.getMahd());
		for (HoaDonCT detail : hdct) {
			Integer masp = detail.getSanpham().getMasp();
			int quantity = detail.getSoluong();
			SanPham product = spdao.findByMasp(masp);
			if (product != null) {
				int currentQuantity = product.getSoluong();
				int newQuantity = currentQuantity + quantity;
				product.setSoluong(newQuantity);
				spdao.save(product);
			}
		}
		hdexist.setTrangthaihd(hd.getTrangthaihd());
		return new ResponseEntity<>(hddao.save(hdexist), HttpStatus.OK);

	}

	@GetMapping("/rest/hoadontt")
	public ResponseEntity<List<HoaDon>> getHoaDonByTTHD(
			@RequestParam("tthd") Integer tthd,
			@RequestParam("usernamekh") String usernamekh) {

		return ResponseEntity.ok(hddao.findHd(tthd, usernamekh));
	}

	@GetMapping("/rest/hoadonct")
	public ResponseEntity<List<HoaDonCT>> getHoaDonByHDCT(
			@RequestParam("mahd") Integer mahd) {

		return ResponseEntity.ok(hdctdao.findChiTietHoaDonByMaHoaDon(mahd));
	}

}
