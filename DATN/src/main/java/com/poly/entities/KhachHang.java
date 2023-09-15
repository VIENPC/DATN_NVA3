package com.poly.entities;

import java.util.Date;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.*;

import lombok.Data;

@Data
@Entity
@Table(name = "Khachhang")
public class KhachHang {
	@Id
	String usernamekh;
    String hotenkh;
	String passwordkh;
	String diachi;
    String email;
	String dienthoai;

	@Temporal(TemporalType.DATE)
	@Column(name = "Ngaydk")
    Date ngaydk = new Date();
	Boolean gioitinh;
	Integer trangthaikh;
	
	@JsonIgnore
	@OneToMany(mappedBy = "khachhang")
	List<HoaDon> hoadon;
	
	@JsonIgnore
	@OneToMany(mappedBy = "khachhang", fetch = FetchType.EAGER)
	List<Authority> authorities;
	

	
}
