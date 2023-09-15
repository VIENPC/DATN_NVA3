package com.poly.dao;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entities.SanPham;

public interface SanPhamDAO extends JpaRepository<SanPham, Integer> {
    @Query("SELECT o FROM SanPham o JOIN HangSanXuat hsx ON hsx.mahang = o.hangsanxuat.mahang WHERE hsx.mahang =?1 AND o.trangthaisp = true")
    List<SanPham> findByMahang(Integer mahang);

    @Query("SELECT o FROM SanPham o WHERE o.trangthaisp = true")
    List<SanPham> findAlltt();
     
    SanPham findByMasp(Integer masp);

    List<SanPham> findTop7ByNgaynhapAfterAndTrangthaispOrderByNgaynhapDesc(LocalDateTime newdata, Boolean trangThai);
    
//    @Query("SELECT sp FROM SanPham sp WHERE sp.ngaynhap >= ?1  AND sp.trangthaisp =?2  ORDER BY sp.ngaynhap DESC LIMIT 7 ")
//    List<SanPham> findNewProduct7(LocalDateTime newdata, Boolean tt);

    @Query("SELECT sp FROM SanPham sp WHERE sp.ngaynhap >= ?1 AND sp.trangthaisp =?2 ORDER BY sp.ngaynhap DESC ")
    List<SanPham> findNewProduct(LocalDateTime newdata, Boolean tt);

    @Query("SELECT o FROM SanPham o WHERE o.trangthaisp =?1")
    List<SanPham> findByTtsp(Boolean ttsp);

    long countByTrangthaisp(Boolean tt);

    @Query("SELECT sp.masp, sp.tensp,sp.giasp, SUM(hdct.soluong), sp.hangsanxuat.tenhang FROM SanPham sp JOIN HoaDonCT hdct ON sp.masp = hdct.sanpham.masp JOIN HoaDon hd ON hd.mahd = hdct.hoadon.mahd JOIN HangSanXuat hsx on hsx.mahang = sp.hangsanxuat.mahang GROUP BY sp.masp, sp.tensp, sp.giasp, sp.hangsanxuat.tenhang  HAVING SUM(hdct.soluong) >= 5  ORDER BY SUM(hdct.soluong)  DESC")
    List<Object[]> findSanPhamBanChay();

    @Query("SELECT sp.masp, sp.tensp,SUM(hdct.soluong), sp.giasp,sp.hangsanxuat.tenhang FROM HoaDon hd JOIN HoaDonCT hdct ON hdct.hoadon.mahd =hd.mahd JOIN SanPham sp ON sp.masp = hdct.sanpham.masp JOIN HangSanXuat hsx on hsx.mahang = sp.hangsanxuat.mahang WHERE hd.ngaymua BETWEEN ?1 AND ?2 AND hd.trangthaihd = 4 GROUP BY sp.masp, sp.tensp, sp.giasp, sp.hangsanxuat.tenhang ")
    List<Object[]> thongkesptg(Date startDate, Date endDate);

    @Query("SELECT sp.masp, sp.tensp,SUM(hdct.soluong), sp.giasp,sp.hangsanxuat.tenhang FROM HoaDon hd JOIN HoaDonCT hdct ON hdct.hoadon.mahd =hd.mahd JOIN SanPham sp ON sp.masp = hdct.sanpham.masp JOIN HangSanXuat hsx on hsx.mahang = sp.hangsanxuat.mahang WHERE hsx.mahang=?1 AND hd.trangthaihd = 4 GROUP BY sp.masp, sp.tensp, sp.giasp, sp.hangsanxuat.tenhang ")
    List<Object[]> thongkesph(int mahang);
}
