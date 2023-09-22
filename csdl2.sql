use master
create database WebDongHo
use WebDongHo
CREATE TABLE [dbo].[Hangsanxuat](
	[Mahang] [int] IDENTITY(1,1) primary key NOT NULL,
	[Tenhang] [nvarchar](50) NULL,
	[Logo] [varchar](200) NULL,
	[Trangthai] [bit] NULL,
)
create table Nhomsanpham(
	Manhom [int] IDENTITY(1,1) primary key NOT NULL,
	Tennhom nvarchar(100) not null,
	Trangthai bit not null,
)
CREATE TABLE [dbo].[Sanpham](
	[Masp] [int] IDENTITY(1,1) primary key NOT NULL,
	[Mahang] [int] NULL,
	[Manhom] [int] NULL,
	[Tensp] [nvarchar](255) UNIQUE NULL,
	[Mota] [nvarchar](max) NULL,
	[Thongtin] [nvarchar](max) NULL,
	[Thongsokythuat] [nvarchar](max) NULL,
	[Soluong] [int] NULL,
	[Giasp] [int] NULL,
	[Hinhanh] [nvarchar](200) NULL,
	[Ngaynhap] [datetime] NULL,
	[Ngaycapnhat] [datetime] NULL,
	[Trangthaisp] [bit] NULL,
)
CREATE TABLE Hinhanhsanpham(
	Id int IDENTITY(1,1) primary key NOT NULL,
	Masp int not null,
	Hinh nvarchar(max) not null,
)
	CREATE TABLE Chitietgh(
	Id int IDENTITY(1,1) primary key NOT NULL,
	Magh int not null,
	Masp int not null,
	Soluong int not null,
	Giasp int not null,
)
	CREATE TABLE Giohang(
	Magh int IDENTITY(1,1) primary key not null,
	Makh [varchar](20) not null,
)	

CREATE TABLE Hoadonct(
	Id int IDENTITY(1,1) primary key NOT NULL,
	Mahd int not null,
	Masp int not null,
	Mavandon bigint not null,
	Soluong int not null,
)
CREATE TABLE [dbo].[Hoadon](
	[Mahd] [int] IDENTITY(1,1)primary key NOT NULL,
	[Idgiam] [int] NOT NULL,
	[Usernamekh] [varchar](20) NULL,
	[Ngaymua] [date] NULL,
	[Trangthaihd] [tinyint] NULL,
	[Tennguoinhan] [nvarchar](30) NULL,
	[Diachinn] [nvarchar](100) NULL,
	[Dienthoainn] [varchar](11) NULL,
	[Tienvc] [bigint] NULL,
	[Tongtien] [bigint] NULL,
	[Trangthautt] tinyint null,
	[Ghichu] [nvarchar](max) NULL,
	)

	CREATE TABLE Giamgia(
	Idgiam int IDENTITY(1,1) primary key NOT NULL,
	MaGiam nvarchar(100) not null,
	Soluong int not null,
	Tiengiam int not null,
)




CREATE TABLE [dbo].[Khachhang](
	[Usernamekh] [varchar](20) primary key NOT NULL,
	[Passwordkh] [varchar](30) NULL,
	[Hotenkh] [nvarchar](50) NULL,
	[Diachi] [nvarchar](150) NULL,
	[Email] [varchar](50) NULL,
	[Dienthoai] [varchar](11) NULL,
	[Gioitinh] [bit] NULL,
	[Ngaydk] [datetime] NULL,
	[Trangthaikh] [tinyint] NULL,
	)
CREATE TABLE [dbo].[Vaitronguoidung](
	[Id] [int] IDENTITY(1,1)primary key NOT NULL,
	[Username] [varchar](20) NULL,
	[Roleid] [varchar](10) NULL,
	)
CREATE TABLE [dbo].[Vaitro](
	[Id] [varchar](10)primary key NOT NULL,
	[Name] [nvarchar](50) NULL,
	)

CREATE TABLE [dbo].[Tintuc](
	[Id] [int] IDENTITY(1,1)primary key NOT NULL,
	Masp [int] not null,
	Nguoitao varcr(20) not null,
	Tieude nvarchar(500) NULL,
	Noidung nvarchar(max) not null,
	Ngaydangbai Date not null,

)

CREATE TABLE [dbo].[Danhgia](
	[Id] [int] IDENTITY(1,1) primary key NOT NULL,
	Masp [int] not null,
	Makh [varchar](20) not null,
	Sodanhgia int not null,
	Noidungdg nvarchar(max) not null,
	Ngaydangbai Datetime not null,

)
create table Lienhe(
	Hotenkh nvarchar(50)  primary key ,
	Ngaylienhe date,
	Email varchar(50),
	Dienthoai varchar(11),
	Noidung nvarchar(max),
	Traloilh nvarchar(max),
	Trangthailh tinyint,

)
ALTER TABLE Sanpham
ADD CONSTRAINT FK_Sanpham_Nhomsanpham
FOREIGN KEY (Manhom) REFERENCES Nhomsanpham(Manhom);

ALTER TABLE Sanpham
ADD CONSTRAINT FK_Sanpham_Hangsanxuat
FOREIGN KEY (Mahang) REFERENCES Hangsanxuat(Mahang);


ALTER TABLE Vaitronguoidung
ADD CONSTRAINT FK_Vaitronguoidung_Khachhang FOREIGN KEY (Username)
REFERENCES Khachhang(Usernamekh);

ALTER TABLE	Vaitronguoidung
ADD CONSTRAINT FK_Vaitronguoidung_Vaitro FOREIGN KEY (Roleid)
REFERENCES Vaitro(Id);

--Giỏ hàng
ALTER TABLE	Giohang
ADD CONSTRAINT FK_Giohang_Khachhang FOREIGN KEY (Makh)
REFERENCES Khachhang(Usernamekh);

ALTER TABLE	Chitietgh
ADD CONSTRAINT FK_Chitietgh_Giohang FOREIGN KEY (Magh)
REFERENCES Giohang(Magh);

ALTER TABLE	Chitietgh
ADD CONSTRAINT FK_Chitietgh_Sanpham FOREIGN KEY (Masp)
REFERENCES Sanpham(Masp);

--hóa đơn--
ALTER TABLE	Hoadon
ADD CONSTRAINT FK_Hoadon_Khachhang FOREIGN KEY (Usernamekh)
REFERENCES Khachhang(Usernamekh);



ALTER TABLE	Hoadon
ADD CONSTRAINT FK_Hoadon_Giamgia FOREIGN KEY (Idgiam)
REFERENCES Giamgia (Idgiam);



ALTER TABLE	Hinhanhsanpham
ADD CONSTRAINT FK_Hinhsanpham_Sanpham FOREIGN KEY (Masp)
REFERENCES Sanpham(Masp);