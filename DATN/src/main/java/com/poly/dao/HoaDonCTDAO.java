package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entities.HoaDonCT;

public interface HoaDonCTDAO extends JpaRepository<HoaDonCT, Integer> {
     @Query("SELECT o FROM HoaDonCT o where o.hoadon.mahd =?1")
    List<HoaDonCT> findChiTietHoaDonByMaHoaDon(Integer maHoaDon);
}
