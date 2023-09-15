package com.poly.entities;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import javax.validation.constraints.*;

import lombok.Data;

@Data
@Entity
@Table(name = "Hangsanxuat")
public class HangSanXuat implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int mahang;
	@NotBlank(message = "Vui lòng nhập tên hãng")
	String tenhang;
	String logo;
	@NotNull(message = "Vui lòng chọ trạng thái ")
	Boolean trangthai;
	@JsonIgnore
	@OneToMany(mappedBy = "hangsanxuat")
	List<SanPham> sanpham;
}
