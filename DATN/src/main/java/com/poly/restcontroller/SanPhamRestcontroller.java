package com.poly.restcontroller;

import java.time.LocalDateTime;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RestController;

import com.poly.dao.HangSanXuatDAO;
import com.poly.dao.SanPhamDAO;
import com.poly.entities.HangSanXuat;
import com.poly.entities.SanPham;

@RestController
@CrossOrigin(origins = "*")

public class SanPhamRestcontroller {
	@Autowired
	SanPhamDAO spdao;

	@Autowired
	HangSanXuatDAO hsxdao;
	@GetMapping("/rest/sanpham")
	public ResponseEntity<List<SanPham>> findAll() {

		return ResponseEntity.ok(spdao.findAlltt());
	}

	@GetMapping("/rest/sanphamnew")
	public ResponseEntity<List<SanPham>> findAllNew7() {
		LocalDateTime localDate = LocalDateTime.now();
		LocalDateTime fiveDaysAgo = localDate.minusDays(7);
		return ResponseEntity.ok(spdao.findTop7ByNgaynhapAfterAndTrangthaispOrderByNgaynhapDesc(fiveDaysAgo, true));
	}
	@GetMapping("/rest/sanphamnewall")
	public ResponseEntity<List<SanPham>> findAllNew() {
		LocalDateTime localDate = LocalDateTime.now();
		LocalDateTime fiveDaysAgo = localDate.minusDays(7);
		return ResponseEntity.ok(spdao.findNewProduct(fiveDaysAgo,true));
	}

	@GetMapping("/rest/sanpham/{masp}")
	public ResponseEntity<SanPham> getOne(@PathVariable("masp") Integer masp) {
		if (!spdao.existsById(masp)) {
			return ResponseEntity.notFound().build();
		}
		return ResponseEntity.ok(spdao.findById(masp).get());
	}

	@GetMapping("/rest/hangsanxuat/{mahang}")
	public ResponseEntity<List<SanPham>> gethang(@PathVariable("mahang") Integer mahang) {
		return ResponseEntity.ok(spdao.findByMahang(mahang));
	}

	@GetMapping("/rest/hangsanxuat")
	public ResponseEntity<List<HangSanXuat>> loadhangsx(){
		return ResponseEntity.ok(hsxdao.findAll());
	}
}
