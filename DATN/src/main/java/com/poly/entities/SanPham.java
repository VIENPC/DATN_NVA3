package com.poly.entities;


import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.time.LocalDateTime;


import lombok.Data;




@Data
@Entity
@Table(name ="Sanpham")
public class SanPham {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int masp;
 
	@NotNull(message = "Chọn hãng sản xuất")
	@ManyToOne
	@JoinColumn(name = "Mahang")
	HangSanXuat hangsanxuat;
	@JsonIgnore
	@OneToMany(mappedBy = "sanpham")
	List<HoaDonCT> hoadonct;
	@Column(name = "Ngaynhap")
	LocalDateTime ngaynhap;
	@NotBlank(message="Nhập tên sản phẩm")
	String tensp;
	@NotBlank(message="Nhập mô tả thông tin sản phẩm")
	String mota;
	@NotNull(message="Nhập số lượng")
	@Min(value = 0, message="Số lượng không được bé hơn 0")
	Integer soluong;
	@NotNull(message="Nhập giá sản phẩm")
	@Min(value = 0, message="Giá sản phẩm không được âm")
	Integer giasp;
	String hinhanh;
	@NotBlank(message="Chọn nơi xuất sứ!")
	String xuatsu;
	@NotNull(message="Chọn trạng thái!")
	Boolean trangthaisp;
	
	
}
