package com.poly.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entities.KhachHang;

public interface KhachHangDAO extends JpaRepository<KhachHang, String> {
	@Query("SELECT kh FROM KhachHang kh WHERE kh.ngaydk >= :fiveDaysAgo")
	List<KhachHang> findNewCustomers(Date fiveDaysAgo);

	
	
	@Query("SELECT COUNT(kh) FROM KhachHang kh WHERE kh.trangthaikh = ?1")
	long countKhachhangByTrangthaikh2(Integer ttkh);
	
	


	

}
