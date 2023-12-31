USE [master]
GO
/****** Object:  Database [WebBanHang]    Script Date: 9/20/2023 1:48:55 PM ******/
CREATE DATABASE [WebBanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebBanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\WebBanHang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebBanHang_log', FILENAME = N'C:\P
rogram Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\WebBanHang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WebBanHang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebBanHang] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [WebBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebBanHang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [WebBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebBanHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [WebBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebBanHang] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WebBanHang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WebBanHang] SET QUERY_STORE = OFF
GO
USE [WebBanHang]
GO
/****** Object:  Table [dbo].[Employeroles]    Script Date: 9/20/2023 1:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employeroles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](20) NULL,
	[Roleid] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hangsanxuat]    Script Date: 9/20/2023 1:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hangsanxuat](
	[Mahang] [int] IDENTITY(1,1) NOT NULL,
	[Tenhang] [nvarchar](50) NULL,
	[Logo] [varchar](200) NULL,
	[Trangthai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Mahang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hoadon]    Script Date: 9/20/2023 1:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoadon](
	[Mahd] [int] IDENTITY(1,1) NOT NULL,
	[Usernamekh] [varchar](20) NULL,
	[Ngaymua] [date] NULL,
	[Trangthaihd] [tinyint] NULL,
	[Tennguoinhan] [nvarchar](30) NULL,
	[Diachinn] [nvarchar](100) NULL,
	[Dienthoainn] [varchar](11) NULL,
	[Tongtien] [bigint] NULL,
	[Ghichu] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Mahd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hoadonchitiet]    Script Date: 9/20/2023 1:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hoadonchitiet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Mahd] [int] NULL,
	[Masp] [int] NULL,
	[Soluong] [int] NULL,
	[Giasp] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Khachhang]    Script Date: 9/20/2023 1:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Khachhang](
	[Usernamekh] [varchar](20) NOT NULL,
	[Hotenkh] [nvarchar](50) NULL,
	[Passwordkh] [varchar](30) NULL,
	[Diachi] [nvarchar](150) NULL,
	[Email] [varchar](50) NULL,
	[Dienthoai] [varchar](11) NULL,
	[Gioitinh] [bit] NULL,
	[Ngaydk] [datetime] NULL,
	[Trangthaikh] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Usernamekh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lienhe]    Script Date: 9/20/2023 1:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lienhe](
	[Hotenkh] [nvarchar](50) NOT NULL,
	[Ngaylienhe] [date] NULL,
	[Email] [varchar](50) NULL,
	[Dienthoai] [varchar](11) NULL,
	[Noidung] [nvarchar](max) NULL,
	[Traloilh] [nvarchar](max) NULL,
	[Trangthailh] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Hotenkh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 9/20/2023 1:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [varchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sanpham]    Script Date: 9/20/2023 1:48:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sanpham](
	[Masp] [int] IDENTITY(1,1) NOT NULL,
	[Mahang] [int] NULL,
	[Manhom] [int] NULL,
	[Ngaynhap] [datetime] NULL,
	[Tensp] [nvarchar](255) NULL,
	[Mota] [nvarchar](max) NULL,
	[Thongtin] [nvarchar](max) NULL,
	[Thongsokythuat] [nvarchar](max) NULL,
	[Soluong] [int] NULL,
	[Giasp] [int] NULL,
	[Hinhanh] [nvarchar](200) NULL,
	[Trangthaisp] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employeroles] ON 

INSERT [dbo].[Employeroles] ([Id], [Username], [Roleid]) VALUES (1, N'vienpc25', N'ADMIN')
INSERT [dbo].[Employeroles] ([Id], [Username], [Roleid]) VALUES (2, N'vinh', N'USER')
INSERT [dbo].[Employeroles] ([Id], [Username], [Roleid]) VALUES (3, N'vienpc25', N'ADMIN')
SET IDENTITY_INSERT [dbo].[Employeroles] OFF
GO
SET IDENTITY_INSERT [dbo].[Hangsanxuat] ON 

INSERT [dbo].[Hangsanxuat] ([Mahang], [Tenhang], [Logo], [Trangthai]) VALUES (1, N'Apple', N'637340508272454264_Watch-Apple@2x.webp', 1)
INSERT [dbo].[Hangsanxuat] ([Mahang], [Tenhang], [Logo], [Trangthai]) VALUES (2, N'GarMin', N'637340494666861275_Garmin@2x.webp', 1)
INSERT [dbo].[Hangsanxuat] ([Mahang], [Tenhang], [Logo], [Trangthai]) VALUES (3, N'SamSung', N'637340490904217021_Samsung@2x.webp', 1)
INSERT [dbo].[Hangsanxuat] ([Mahang], [Tenhang], [Logo], [Trangthai]) VALUES (4, N'XiaoMi', N'637582325361253577_Xiaomi@2x.webp', 1)
INSERT [dbo].[Hangsanxuat] ([Mahang], [Tenhang], [Logo], [Trangthai]) VALUES (5, N'Amazfit', N'638061900254544365_amazfit@2x.webp', 1)
INSERT [dbo].[Hangsanxuat] ([Mahang], [Tenhang], [Logo], [Trangthai]) VALUES (6, N'Masstel', N'637340491898901930_Masstel@2x.webp', 1)
INSERT [dbo].[Hangsanxuat] ([Mahang], [Tenhang], [Logo], [Trangthai]) VALUES (7, N'Huawei', N'637340494667486283_Huawei@2x.webp', 1)
INSERT [dbo].[Hangsanxuat] ([Mahang], [Tenhang], [Logo], [Trangthai]) VALUES (8, N'OPPO', N'637390711269805103_Oppo@2x.webp', 1)
SET IDENTITY_INSERT [dbo].[Hangsanxuat] OFF
GO
SET IDENTITY_INSERT [dbo].[Hoadon] ON 

INSERT [dbo].[Hoadon] ([Mahd], [Usernamekh], [Ngaymua], [Trangthaihd], [Tennguoinhan], [Diachinn], [Dienthoainn], [Tongtien], [Ghichu]) VALUES (17, N'vien', CAST(N'2023-08-09' AS Date), 5, N'Nguyễn Văn Viễn', N'253,Phường Xuân Khánh,Quận Ninh Kiều,Thành phố Cần Thơ', N'026578941', 11690000, N'giao sớm')
INSERT [dbo].[Hoadon] ([Mahd], [Usernamekh], [Ngaymua], [Trangthaihd], [Tennguoinhan], [Diachinn], [Dienthoainn], [Tongtien], [Ghichu]) VALUES (18, N'vien', CAST(N'2023-08-10' AS Date), 5, N'Nguyễn Văn Viễn', N'222,Xã Nam Quan,Huyện Lộc Bình,Tỉnh Lạng Sơn', N'026578941', 16490000, N'giao sớm')
INSERT [dbo].[Hoadon] ([Mahd], [Usernamekh], [Ngaymua], [Trangthaihd], [Tennguoinhan], [Diachinn], [Dienthoainn], [Tongtien], [Ghichu]) VALUES (19, N'vien', CAST(N'2023-08-10' AS Date), 1, N'Nguyễn Văn Viễn', N'5,Phường Thống Nhất,Thành phố Hòa Bình,Tỉnh Hoà Bình', N'026578941', 38980000, N'yn')
INSERT [dbo].[Hoadon] ([Mahd], [Usernamekh], [Ngaymua], [Trangthaihd], [Tennguoinhan], [Diachinn], [Dienthoainn], [Tongtien], [Ghichu]) VALUES (20, N'vien', CAST(N'2023-08-10' AS Date), 5, N'Nguyễn Văn Viễn', N'253,Phường Mỹ Long,Thành phố Long Xuyên,Tỉnh An Giang', N'026578941', 94900000, N'Giao ban ngày')
INSERT [dbo].[Hoadon] ([Mahd], [Usernamekh], [Ngaymua], [Trangthaihd], [Tennguoinhan], [Diachinn], [Dienthoainn], [Tongtien], [Ghichu]) VALUES (21, N'vienpc25', CAST(N'2023-09-07' AS Date), 5, N'Nguyễn Văn Viễn', N'99,Xã Kim Ngọc,Huyện Bắc Quang,Tỉnh Hà Giang', N'0766949790', 23380000, N'giao ngày chủ nhật')
INSERT [dbo].[Hoadon] ([Mahd], [Usernamekh], [Ngaymua], [Trangthaihd], [Tennguoinhan], [Diachinn], [Dienthoainn], [Tongtien], [Ghichu]) VALUES (22, N'vienpc25', CAST(N'2023-09-14' AS Date), 5, N'Nguyễn Văn Viễn', N'undefined,', N'0766949790', 112450000, NULL)
SET IDENTITY_INSERT [dbo].[Hoadon] OFF
GO
SET IDENTITY_INSERT [dbo].[Hoadonchitiet] ON 

INSERT [dbo].[Hoadonchitiet] ([ID], [Mahd], [Masp], [Soluong], [Giasp]) VALUES (21, 17, 3, 1, 11690000)
INSERT [dbo].[Hoadonchitiet] ([ID], [Mahd], [Masp], [Soluong], [Giasp]) VALUES (22, 18, 2, 1, 16490000)
INSERT [dbo].[Hoadonchitiet] ([ID], [Mahd], [Masp], [Soluong], [Giasp]) VALUES (23, 19, 1, 1, 22490000)
INSERT [dbo].[Hoadonchitiet] ([ID], [Mahd], [Masp], [Soluong], [Giasp]) VALUES (24, 19, 2, 1, 16490000)
INSERT [dbo].[Hoadonchitiet] ([ID], [Mahd], [Masp], [Soluong], [Giasp]) VALUES (25, 20, 9, 5, 6990000)
INSERT [dbo].[Hoadonchitiet] ([ID], [Mahd], [Masp], [Soluong], [Giasp]) VALUES (26, 20, 10, 5, 11990000)
INSERT [dbo].[Hoadonchitiet] ([ID], [Mahd], [Masp], [Soluong], [Giasp]) VALUES (27, 21, 3, 2, 11690000)
INSERT [dbo].[Hoadonchitiet] ([ID], [Mahd], [Masp], [Soluong], [Giasp]) VALUES (28, 22, 1, 5, 22490000)
SET IDENTITY_INSERT [dbo].[Hoadonchitiet] OFF
GO
INSERT [dbo].[Khachhang] ([Usernamekh], [Hotenkh], [Passwordkh], [Diachi], [Email], [Dienthoai], [Gioitinh], [Ngaydk], [Trangthaikh]) VALUES (N'jonguyen', N'Nguyễn Thị Bảo Trân', N'jonguyen', N'TPHCM', N'baotranvv2520@gmail.com', N'0703222331', 1, CAST(N'2023-08-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Khachhang] ([Usernamekh], [Hotenkh], [Passwordkh], [Diachi], [Email], [Dienthoai], [Gioitinh], [Ngaydk], [Trangthaikh]) VALUES (N'nghiep', N'Trần Minh Nghiệp', N'122', N'Thoại sơn', N'nghiep@gami.com', N'8520963741', 1, CAST(N'2023-08-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Khachhang] ([Usernamekh], [Hotenkh], [Passwordkh], [Diachi], [Email], [Dienthoai], [Gioitinh], [Ngaydk], [Trangthaikh]) VALUES (N'vien', N'Nguyễn Văn Viễn', N'111', N'An Giang', N'vanvien2520@gmail.com', N'026578941', 1, CAST(N'2023-08-03T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Khachhang] ([Usernamekh], [Hotenkh], [Passwordkh], [Diachi], [Email], [Dienthoai], [Gioitinh], [Ngaydk], [Trangthaikh]) VALUES (N'vien11', N'Nguyễn Văn B', N'111', N'An Giang', N'viennvpc25@gmail.com', N'012369875', 1, CAST(N'2023-08-04T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Khachhang] ([Usernamekh], [Hotenkh], [Passwordkh], [Diachi], [Email], [Dienthoai], [Gioitinh], [Ngaydk], [Trangthaikh]) VALUES (N'vienpc25', N'Nguyễn Văn Viễn', N'123', N'An Giang', N'viennvpc25@gmail.com', N'0766949790', 1, CAST(N'2023-07-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Khachhang] ([Usernamekh], [Hotenkh], [Passwordkh], [Diachi], [Email], [Dienthoai], [Gioitinh], [Ngaydk], [Trangthaikh]) VALUES (N'vinh', N'Nguyễn Quốc Vinh', N'111', N'Cần Thơ', N'vinh@gmail.com', N'0123456789', 1, CAST(N'2023-08-03T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'ADMIN', N'Administrators')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (N'USER', N'Users')
GO
SET IDENTITY_INSERT [dbo].[Sanpham] ON 

INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (1, 2, CAST(N'2023-08-14T12:21:35.997' AS DateTime), N'Garmin Fenix 7 Sapphire 47mm Đen', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.3 inch, MIP Chống ch&oacute;i, 260 x 260 Pixels</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Mặt k&iacute;nh: Power Sapphire - Khung m&aacute;y: Titanium</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android, iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>Khoảng 18 ng&agrave;y Chế độ b&igrave;nh thường</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>GarminXem th&ocirc;ng tin h&atilde;ng</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 25, 22490000, N'1.png', N'Hoa Kỳ', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (2, 2, CAST(N'2023-07-30T18:29:18.480' AS DateTime), N'Garmin Forerunner 965 47.2mm', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.4 inch, AMOLED, 454 x 454 Pixels</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>32 GB</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Mặt k&iacute;nh: K&iacute;nh Gorilla Glass DX - D&acirc;y: Silicone - Viền m&aacute;y: Titanium</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android, iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>Tối đa 24 ng&agrave;y Chế độ b&igrave;nh thường, Tối đa 31 giờ Chế độ GNSS-Chỉ d&ugrave;ng GPS</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>GarminXem th&ocirc;ng tin h&atilde;ng</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 25, 16490000, N'2.png', N'Hoa Kỳ', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (3, 2, CAST(N'2023-08-14T12:22:46.583' AS DateTime), N'Garmin Forerunner 265 Music 46.1mm', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.1 inch, AMOLED, 360 x 360 Pixels</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>8 GB</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>D&acirc;y: Silicone - Mặt k&iacute;nh: K&iacute;nh Gorilla Glass 3 - Khung m&aacute;y: Polymer gia cố bằng sợi</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android, iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>15 ng&agrave;y Chế độ b&igrave;nh thường, 24 giờ Chế độ GNSS-Chỉ d&ugrave;ng GPS</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>GarminXem th&ocirc;ng tin h&atilde;ng</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>1</td>
		</tr>
	</tbody>
</table>
', 20, 11690000, N'3.png', N'Hoa Kỳ', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (4, 5, CAST(N'2023-07-30T18:31:50.357' AS DateTime), N'Amazfit GTS 4 42.7mm', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.77 inch, AMOLED, 390 x 390 Pixels</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Vỏ th&acirc;n m&aacute;y: Hợp kim nh&ocirc;m</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>iOS, Android</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>15 ng&agrave;y Chế độ b&igrave;nh thường</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Amazfit</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 30, 4290000, N'5.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (5, 3, CAST(N'2023-08-14T12:20:36.273' AS DateTime), N'Samsung Galaxy Watch5 40mm', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.4 inch, Super AMOLED, 450 x 450 Pixels</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>16 GB</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Mặt k&iacute;nh: K&iacute;nh Sapphire</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>One UI Watch</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>Khoảng 1.5 ng&agrave;y</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>SamsungXem th&ocirc;ng tin h&atilde;ng</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 20, 5990000, N'8.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (6, 3, CAST(N'2023-07-30T18:36:23.203' AS DateTime), N'Samsung Galaxy Watch 4 40mm', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.2 inch, Super AMOLED, 396 x 396 Pixels</td>
		</tr>
		<tr>
			<td>CPU</td>
			<td>Exynos W920</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>16 GB</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Mặt k&iacute;nh: K&iacute;nh Gorilla Glass Dx+ - D&acirc;y: Silicone</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>One UI Watch</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>Khoảng 1.5 ng&agrave;y</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>SamsungXem th&ocirc;ng tin h&atilde;ng</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 30, 3990000, N'9.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (7, 2, CAST(N'2023-07-30T18:37:37.117' AS DateTime), N'Garmin Instinct 2, Phiên bản hoạ tiết Camo ', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.4 inch, MIP Chống ch&oacute;i</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Polymer</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>iOS, Android</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>14 ng&agrave;y</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>GarminXem th&ocirc;ng tin h&atilde;ng</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 30, 9990000, N'11.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (8, 2, CAST(N'2023-07-30T18:38:56.283' AS DateTime), N'Garmin vivosmart 5', N'<table>
	<tbody>
		<tr>
		</tr>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.0 inch, OLED</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Silicone</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>iOS, Android</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>Tối đa 7 ng&agrave;y</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>GarminXem th&ocirc;ng tin h&atilde;ng</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
		</tr>
	</tbody>
</table>
', 30, 3990000, N'12.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (9, 1, CAST(N'2023-08-14T12:20:49.700' AS DateTime), N'Apple Watch SE 2022 44mm viền nhôm', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.61 inch, Retina</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Nh&ocirc;m</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>watchOS</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>18 giờ</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Apple</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 50, 6990000, N'13.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (10, 1, CAST(N'2023-08-14T12:21:07.277' AS DateTime), N'Apple Watch S8 LTE 41mm viền nhôm', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.9 inch, Retina, 484 x 396 Pixels</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>D&acirc;y: Cao su - Viền m&aacute;y: Nh&ocirc;m</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>watchOS</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>18 giờ</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Apple</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 30, 11990000, N'14.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (11, 1, CAST(N'2023-08-14T12:21:22.383' AS DateTime), N'Apple Watch Ultra LTE 49mm viền Titanium', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.92 inch, LTPO OLED, 502 x 410 Pixels</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Viền m&aacute;y: Titanium</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>watchOS</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>36 giờ</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Apple</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 25, 19990000, N'15.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (12, 4, CAST(N'2023-07-30T19:05:44.827' AS DateTime), N'Xiaomi Redmi Band 2 dây TPU', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.47 inch, TFT LCD, 172 x 320 Pixels</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>8 MB</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>D&acirc;y: TPU - Khung m&aacute;y: Nhựa</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android, iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>14 ng&agrave;y Chế độ b&igrave;nh thường</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>XiaomiXem th&ocirc;ng tin h&atilde;ng</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 30, 3990000, N'19.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (13, 1, CAST(N'2023-07-30T19:10:23.397' AS DateTime), N'Apple Watch S8 LTE 45mm dây thép', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.9 inch, Retina, 484 x 396 Pixels</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Viền m&aacute;y: Th&eacute;p kh&ocirc;ng gỉ</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>watchOS</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>18 giờ</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Apple</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 30, 18990000, N'apple-watch-s8-lte-45mm-day-thep-den-tn-600x600-removebg-preview.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (14, 1, CAST(N'2023-07-30T19:12:34.783' AS DateTime), N'Apple Watch SE 2022 LTE 40mm', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.9 inch, Retina, 484 x 396 Pixels</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Nh&ocirc;m</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>watchOS</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>18 giờ</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Apple</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 30, 7190000, N'apple-watch-se-2022-lte-40mm-trang-kem-tn-600x600-removebg-preview.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (15, 1, CAST(N'2023-07-30T19:16:58.277' AS DateTime), N'Samsung Galaxy Watch5 Pro LTE 45mm Đen', N'<ul>
	<li>
	<p>M&agrave;n h&igrave;nh:</p>

	<p>SUPER AMOLED1.4 inch</p>
	</li>
	<li>
	<p>Thời lượng pin:</p>

	<p>Khoảng 3.3 ng&agrave;y</p>
	</li>
	<li>
	<p>Kết nối với hệ điều h&agrave;nh:</p>

	<p>Android 8.0 trở l&ecirc;n d&ugrave;ng Google Mobile Service</p>
	</li>
	<li>
	<p>Mặt:</p>

	<p>K&iacute;nh Sapphire45 mm</p>
	</li>
	<li>
	<p>T&iacute;nh năng cho sức khỏe:</p>

	<p>Đo huyết &aacute;p (chỉ hỗ trợ khi kết nối với điện thoại Samsung)Điện t&acirc;m đồ (chỉ hỗ trợ khi kết nối với điện thoại Samsung)Chế độ luyện tậpĐo nhịp timTheo d&otilde;i mức độ stressT&iacute;nh qu&atilde;ng đường chạyĐo nồng độ oxy (SpO2)Theo d&otilde;i giấc ngủT&iacute;nh lượng calories ti&ecirc;u thụĐếm số bước ch&acirc;n</p>
	</li>
	<li>
	<p>H&atilde;ng</p>

	<p>Samsung.</p>
	</li>
</ul>
', 20, 12990000, N'samsung-galaxy-watch5-pro-lte-tn-600x600-removebg-preview.png', N'Việt Nam', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (16, 3, CAST(N'2023-07-30T19:18:50.473' AS DateTime), N'Samsung Galaxy Watch6 Classic BT 43mm', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.4 inch, Super AMOLED, 450 x 450 Pixels</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>16 GB</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Mặt k&iacute;nh: K&iacute;nh Sapphire</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>One UI Watch</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>Khoảng 1.5 ng&agrave;y</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>SamsungXem th&ocirc;ng tin h&atilde;ng</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 28, 8990000, N'samsung-galaxy-watch6-classic-47mm-290723-094052-600x600-removebg-preview.png', N'Việt Nam', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (17, 3, CAST(N'2023-07-30T19:20:40.717' AS DateTime), N'Samsung Galaxy Watch5 Pro 45mm ', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.4 inch, Super AMOLED, 450 x 450 Pixels</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>16 GB</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Mặt k&iacute;nh: K&iacute;nh Sapphire</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>One UI Watch</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>Khoảng 1.5 ng&agrave;y</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>SamsungXem th&ocirc;ng tin h&atilde;ng</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 30, 10990000, N'samsung-galaxy-watch5-pro-tn-600x600-removebg-preview.png', N'Việt Nam', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (18, 4, CAST(N'2023-08-14T12:21:56.217' AS DateTime), N'Mi Band 7 Đen ', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.62 inch, AMOLED</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>D&acirc;y: Nhựa TPE - Mặt lưng m&aacute;y: Nhựa</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android, iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>14 ng&agrave;y</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>XiaomiXem th&ocirc;ng tin h&atilde;ng</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 20, 890000, N'23.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (19, 4, CAST(N'2023-07-30T19:24:44.850' AS DateTime), N'Xiaomi Watch S1 46.5mm ', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.43 inch, AMOLED, 466 x 466 pixels</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>4 GB</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Mặt k&iacute;nh: K&iacute;nh Gorilla Glass 3 - D&acirc;y: Da</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>RTOS</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>iOS, Android</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>Khoảng 18 ng&agrave;y</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>XiaomiXem th&ocirc;ng tin h&atilde;ng</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 10, 3990000, N'20.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (20, 5, CAST(N'2023-07-30T19:27:23.930' AS DateTime), N'Amazfit GTS 4 Mini', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.65 inch, AMOLED, 336 x 384 Pixels</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Mặt k&iacute;nh: K&iacute;nh cường lực - D&acirc;y: Silicone - Khung m&aacute;y: Kim loại v&agrave; nhựa</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>ZeppOS</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android, iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>45 ng&agrave;y Chế độ tiết kiệm pin, 15 ng&agrave;y Chế độ b&igrave;nh thường</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Amazfit</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 20, 2290000, N'amazfit-gts-4-mini-hong-tn-600x600-removebg-preview.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (21, 5, CAST(N'2023-08-14T12:22:14.497' AS DateTime), N'Amazfit T-Rex 2 ', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.39 inch, AMOLED, 454 x 454 Pixels</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Mặt k&iacute;nh: K&iacute;nh cường lực - D&acirc;y: Silicone - Khung m&aacute;y: Polymer</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>ZeppOS</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android, iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>24 ng&agrave;y Chế độ b&igrave;nh thường, 45 ng&agrave;y Chế độ tiết kiệm pin</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Amazfit</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 20, 4390000, N'amazfit-t-rex-2-den-thumb-3-600x600-removebg-preview.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (22, 5, CAST(N'2023-07-30T19:29:43.820' AS DateTime), N'Amazfit GTR Mini', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.28 inch Ch&iacute;nh:, AMOLED Ch&iacute;nh:, 416 x 416 Pixels M&agrave;n h&igrave;nh ch&iacute;nh:</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>64 MB</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Mặt k&iacute;nh: K&iacute;nh cường lực - D&acirc;y: Silicone - Khung m&aacute;y: Th&eacute;p kh&ocirc;ng gỉ</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>ZeppOS</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android, iOS</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>14 ng&agrave;y Chế độ b&igrave;nh thường, Tối đa 28 ng&agrave;y Chế độ tiết kiệm pin</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Amazfit</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>12</td>
		</tr>
	</tbody>
</table>
', 10, 3090000, N'amazfit-gtr-mini-den-thumb-10-600x600-removebg-preview.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (23, 6, CAST(N'2023-07-30T19:31:22.033' AS DateTime), N'Masstel Smart Hero 10 4G', N'<table>
	<tbody>
		<tr>
			<td>M&agrave;n h&igrave;nh</td>
			<td>1.4 inch, TFT LCD, 240 x 240 Pixels</td>
		</tr>
		<tr>
			<td>Bộ nhớ trong</td>
			<td>128 MB</td>
		</tr>
		<tr>
			<td>Chất liệu</td>
			<td>Cao su</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh</td>
			<td>Kh&ocirc;ng</td>
		</tr>
		<tr>
			<td>Hệ điều h&agrave;nh tương th&iacute;ch</td>
			<td>Android</td>
		</tr>
		<tr>
			<td>Thời gian sử dụng pin</td>
			<td>60 giờ</td>
		</tr>
		<tr>
			<td>Thương hiệu</td>
			<td>Masstel</td>
		</tr>
		<tr>
			<td>Thời gian bảo h&agrave;nh (th&aacute;ng)</td>
			<td>1</td>
		</tr>
	</tbody>
</table>
', 20, 1520000, N'7.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (24, 8, CAST(N'2023-07-30T19:33:53.163' AS DateTime), N'Oppo Band 2', N'<ul>
	<li>
	<p>M&agrave;n h&igrave;nh:</p>

	<p>AMOLED1.57 inch</p>
	</li>
	<li>
	<p>Thời lượng pin:</p>

	<p>Khoảng 14 ng&agrave;yKhoảng 5 ng&agrave;y (Sử dụng cường độ cao)</p>
	</li>
	<li>
	<p>Kết nối với hệ điều h&agrave;nh:</p>

	<p>iOS 13 trở l&ecirc;nAndroid 6.0 trở l&ecirc;n</p>
	</li>
	<li>
	<p>Mặt:</p>

	<p>K&iacute;nh cường lực45.3 mm</p>
	</li>
	<li>
	<p>T&iacute;nh năng cho sức khỏe:</p>

	<p>Theo d&otilde;i nhịp tim 24hTheo d&otilde;i mức độ căng thẳng 24hNhắc nhở uống nướcĐo nhịp timT&iacute;nh qu&atilde;ng đường chạyĐo nồng độ oxy (SpO2)Theo d&otilde;i giấc ngủT&iacute;nh lượng calories ti&ecirc;u thụĐếm số bước ch&acirc;nĐo lượng ti&ecirc;u thụ oxy tối đa (VO2 Max)</p>
	</li>
	<li>
	<p>H&atilde;ng</p>

	<p>Oppo.</p>
	</li>
</ul>
', 20, 1790000, N'dong-ho-thong-minh-oppo-trang-xanh-tn-600x600-removebg-preview.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (25, 2, CAST(N'2023-07-30T19:40:13.577' AS DateTime), N'Garmin Golf Approach S70 dây silicone', N'<ul>
	<li>
	<p>M&agrave;n h&igrave;nh:</p>

	<p>AMOLED1.4 inch</p>
	</li>
	<li>
	<p>Thời lượng pin:</p>

	<p>Khoảng 16 ng&agrave;y (ở chế độ đồng hồ th&ocirc;ng minh)Khoảng 20 giờ khi sử dụng GPS</p>
	</li>
	<li>
	<p>Kết nối với hệ điều h&agrave;nh:</p>

	<p>iOS 14 trở l&ecirc;nAndroid 7.0 trở l&ecirc;n</p>
	</li>
	<li>
	<p>Mặt:</p>

	<p>K&iacute;nh cường lực Gorilla Glass 347 mm</p>
	</li>
	<li>
	<p>T&iacute;nh năng cho sức khỏe:</p>

	<p>Theo d&otilde;i nhịp thởChấm điểm giấc ngủTheo d&otilde;i mức độ căng thẳng 24hNhắc nhở nhịp tim cao, thấpĐo nhịp timĐo lượng ti&ecirc;u thụ oxy tối đa (VO2 Max)Theo d&otilde;i chu kỳ kinh nguyệtT&igrave;nh trạng HRV (Heart Rate Variability)T&iacute;nh qu&atilde;ng đường chạyT&iacute;nh tuổi thể chấtĐo nồng độ oxy (SpO2)Theo d&otilde;i giấc ngủT&iacute;nh lượng calories ti&ecirc;u thụĐếm số bước ch&acirc;nĐo chỉ số năng lượng cơ thể (Body Battery)</p>
	</li>
	<li>
	<p>H&atilde;ng</p>

	<p>Garmin.</p>
	</li>
</ul>
', 10, 18290000, N'garmin-golf-approach-s70-day-silicone-tb-1-600x600-removebg-preview.png', N'Trung Quốc', 1)
INSERT [dbo].[Sanpham] ([Masp], [Mahang], [Ngaynhap], [Tensp], [Mota], [Soluong], [Giasp], [Hinhanh], [Xuatsu], [Trangthaisp]) VALUES (26, 4, CAST(N'2023-08-14T12:23:10.280' AS DateTime), N'Xiaomi Redmi Watch 3 42.6mm', N'<p>M&agrave;n h&igrave;nh:AMOLED1.75 inch</p>

<p>Thời lượng pin:Khoảng 12 ng&agrave;y</p>

<p>Kết nối với hệ điều h&agrave;nh:iOS 12 trở l&ecirc;nAndroid 6.0 trở l&ecirc;n</p>

<p>Mặt:K&iacute;nh cường lực42.6 mm</p>

<p>T&iacute;nh năng cho sức khỏe:Theo d&otilde;i nhịp thởTheo d&otilde;i nhịp tim 24hNhắc nhở nhịp tim cao, thấpTheo d&otilde;i mức độ stressĐo nồng độ oxy (SpO2)Theo d&otilde;i giấc ngủĐếm số bước ch&acirc;nTheo d&otilde;i chu kỳ kinh nguyệt</p>

<p>&nbsp;</p>
', 0, 2590000, N'18.png', N'Trung Quốc', 0)
SET IDENTITY_INSERT [dbo].[Sanpham] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Sanpham__4CE6D81CD04AF7C6]    Script Date: 9/20/2023 1:48:56 PM ******/
ALTER TABLE [dbo].[Sanpham] ADD UNIQUE NONCLUSTERED 
(
	[Tensp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employeroles]  WITH CHECK ADD  CONSTRAINT [FK_Employeroles_Khachhang] FOREIGN KEY([Username])
REFERENCES [dbo].[Khachhang] ([Usernamekh])
GO
ALTER TABLE [dbo].[Employeroles] CHECK CONSTRAINT [FK_Employeroles_Khachhang]
GO
ALTER TABLE [dbo].[Employeroles]  WITH CHECK ADD  CONSTRAINT [FK_Employeroles_Roles] FOREIGN KEY([Roleid])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Employeroles] CHECK CONSTRAINT [FK_Employeroles_Roles]
GO
ALTER TABLE [dbo].[Hoadon]  WITH CHECK ADD  CONSTRAINT [FK_Hoadon_Khachhang] FOREIGN KEY([Usernamekh])
REFERENCES [dbo].[Khachhang] ([Usernamekh])
GO
ALTER TABLE [dbo].[Hoadon] CHECK CONSTRAINT [FK_Hoadon_Khachhang]
GO
ALTER TABLE [dbo].[Hoadonchitiet]  WITH CHECK ADD  CONSTRAINT [FK_Hoadonchitiet_Hoadon] FOREIGN KEY([Mahd])
REFERENCES [dbo].[Hoadon] ([Mahd])
GO
ALTER TABLE [dbo].[Hoadonchitiet] CHECK CONSTRAINT [FK_Hoadonchitiet_Hoadon]
GO
ALTER TABLE [dbo].[Hoadonchitiet]  WITH CHECK ADD  CONSTRAINT [FK_Hoadonchitiet_Sanpham] FOREIGN KEY([Masp])
REFERENCES [dbo].[Sanpham] ([Masp])
GO
ALTER TABLE [dbo].[Hoadonchitiet] CHECK CONSTRAINT [FK_Hoadonchitiet_Sanpham]
GO
ALTER TABLE [dbo].[Sanpham]  WITH CHECK ADD  CONSTRAINT [FK_Sanpham_Hangsanxuat] FOREIGN KEY([Mahang])
REFERENCES [dbo].[Hangsanxuat] ([Mahang])
GO
ALTER TABLE [dbo].[Sanpham] CHECK CONSTRAINT [FK_Sanpham_Hangsanxuat]
GO
USE [master]
GO
ALTER DATABASE [WebBanHang] SET  READ_WRITE 
GO
