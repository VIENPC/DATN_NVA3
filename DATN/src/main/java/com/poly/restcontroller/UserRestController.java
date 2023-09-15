package com.poly.restcontroller;

import java.util.Optional;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poly.dao.KhachHangDAO;
import com.poly.entities.KhachHang;
import com.poly.service.CustomerService;

@RestController
@CrossOrigin(origins = "*")
public class UserRestController {
    @Autowired
    CustomerService customerServive;

    @Autowired
    KhachHangDAO khdao;

    @GetMapping("/rest/account")
    public ResponseEntity<Optional<KhachHang>> getAccount() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        Optional<KhachHang> account = customerServive.getAccount(username);
        if (account != null) {
            return ResponseEntity.ok(account);
        }
        return ResponseEntity.notFound().build();
    }

    @GetMapping("/rest/accountUser")
    public ResponseEntity<KhachHang> getKhachhangUser(
            @RequestParam("usernamekh") String usernamekh) {
        return ResponseEntity.ok(khdao.findById(usernamekh).get());
    }

    @PutMapping("/rest/updatepass")
    public ResponseEntity<KhachHang> updatepass(
            @RequestParam("usernamekh") String usernamekh,  @RequestBody KhachHang khachhang) {

        KhachHang existingkh = khdao.findById(usernamekh).get();
        if (existingkh == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        existingkh.setPasswordkh(khachhang.getPasswordkh());

        return new ResponseEntity<>(khdao.save(existingkh), HttpStatus.OK);
    }

    @PutMapping("/rest/account/{usernamekh}")
    public ResponseEntity<KhachHang> updateKhachHang(@PathVariable("usernamekh") String usernamekh,
            @RequestBody KhachHang khachhang) {

        KhachHang existingkh = khdao.findById(usernamekh).get();
        if (existingkh == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        existingkh.setHotenkh(khachhang.getHotenkh());
        existingkh.setEmail(khachhang.getEmail());
        existingkh.setDienthoai(khachhang.getDienthoai());
        existingkh.setGioitinh(khachhang.getGioitinh());
        existingkh.setDiachi(khachhang.getDiachi());
         existingkh.setTrangthaikh(1);

        return new ResponseEntity<>(khdao.save(existingkh), HttpStatus.OK);
    }
}