package com.poly.dao;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entities.HoaDon;


public interface HoaDonDAO  extends JpaRepository<HoaDon, Integer>{ 
     @Query("SELECT o FROM HoaDon o where o.trangthaihd= ?1")
     List<HoaDon> findHdTt(Integer tthd);

     @Query("SELECT o FROM HoaDon o JOIN KhachHang kh ON kh.usernamekh = o.khachhang.usernamekh where o.trangthaihd= ?1 AND kh.usernamekh =?2")
     List<HoaDon> findHd(Integer tthd, String username);

    // @Query("SELECT NEW com.poly.entities.HoaDonTT(o.mahd,sp.tensp, sp.hinhanh, ct.soluong, sp.giasp, o.tongtien) FROM HoaDon o JOIN KhachHang kh ON kh.usernamekh = o.khachhang.usernamekh JOIN HoaDonCT ct ON ct.hoadon.mahd=o.mahd JOIN SanPham sp ON sp.masp = ct.sanpham.masp where o.trangthaihd= ?1 AND kh.usernamekh= ?2 AND o.mahd= ?3")
    //  List<HoaDonTT> findHdAndct(Integer tthd, String user, int mahd);
     

     @Query("SELECT COUNT(o) FROM HoaDon o where o.trangthaihd= ?1")
     Integer countDontt(Integer tthd);

    @Query("SELECT SUM(hd.tongtien) FROM HoaDon hd where hd.trangthaihd = 2")
    Long getTongTienTatCaHoaDon();

   
    @Query("SELECT  hd.mahd,hd.tennguoinhan, sp.tensp,SUM(hdct.soluong),hd.tongtien FROM HoaDon hd JOIN HoaDonCT hdct ON hdct.hoadon.mahd =hd.mahd JOIN SanPham sp ON sp.masp = hdct.sanpham.masp JOIN HangSanXuat hsx on hsx.mahang = sp.hangsanxuat.mahang WHERE hd.ngaymua BETWEEN ?1 AND ?2 GROUP BY  hd.mahd, hd.tennguoinhan, sp.tensp,SUM(hdct.soluong),hd.tongtien")
    List<Object[]> thongkehdtg(Date startDate,Date endDate);

     @Query("SELECT hd.mahd, hd.tennguoinhan,sp.tensp,SUM(hdct.soluong), sp.giasp FROM HoaDon hd JOIN HoaDonCT hdct ON hdct.hoadon.mahd =hd.mahd JOIN SanPham sp ON sp.masp = hdct.sanpham.masp JOIN HangSanXuat hsx on hsx.mahang = sp.hangsanxuat.mahang WHERE hd.ngaymua BETWEEN ?1 AND ?2 GROUP BY hd.mahd, hd.tennguoinhan,sp.tensp, sp.giasp ")
    List<Object[]> thongkesptg(Date startDate,Date endDate);

    @Query("SELECT o FROM HoaDon o WHERE o.khachhang.usernamekh=?1")
	List<HoaDon> findByUsername(String username);
}

