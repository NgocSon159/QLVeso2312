USE [master]
GO
/****** Object:  Database [QLVESO]    Script Date: 23/12/2018 1:54:16 PM ******/
CREATE DATABASE [QLVESO]

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLVESO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLVESO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLVESO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLVESO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLVESO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLVESO] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLVESO] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLVESO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLVESO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLVESO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLVESO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLVESO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLVESO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLVESO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLVESO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLVESO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLVESO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLVESO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLVESO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLVESO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLVESO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLVESO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLVESO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLVESO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLVESO] SET  MULTI_USER 
GO
ALTER DATABASE [QLVESO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLVESO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLVESO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLVESO] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLVESO] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLVESO]
GO
/****** Object:  Table [dbo].[DaiLy]    Script Date: 23/12/2018 1:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DaiLy](
	[MaDaiLy] [varchar](20) NOT NULL,
	[TenDaiLy] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](100) NOT NULL,
	[SDT] [varchar](15) NOT NULL,
	[Flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDaiLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Giai]    Script Date: 23/12/2018 1:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Giai](
	[MaGiai] [varchar](20) NOT NULL,
	[TenGiai] [nvarchar](30) NULL,
	[SoTienNhan] [decimal](19, 3) NULL,
	[Flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGiai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KetQuaSoXo]    Script Date: 23/12/2018 1:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KetQuaSoXo](
	[ID] [int] NOT NULL,
	[MaLoaiVeSo] [varchar](20) NULL,
	[MaGiai] [varchar](20) NULL,
	[NgaySo] [date] NULL,
	[SoTrung] [varchar](10) NULL,
	[Flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiVeso]    Script Date: 23/12/2018 1:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoaiVeso](
	[MaLoaiVeSo] [varchar](20) NOT NULL,
	[Tinh] [nvarchar](20) NULL,
	[Flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiVeSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhatHanh]    Script Date: 23/12/2018 1:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhatHanh](
	[MaPH] [varchar] (20)NOT NULL,
	[MaDaiLy] [varchar](20),
	[MaLoaiVeSo] [varchar](20),
	[SoLuong] [int] NULL,
	[NgayNhan] [date] NULL,
	[SLBan] [int] NULL,
	[DoanhThuDPH] [decimal](19, 3) NULL,
	[HoaHong] [decimal](2, 0) NULL,
	[TienThanhToan] [decimal](19, 3) NULL,
	[Flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPH] ASC
	
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuChi]    Script Date: 23/12/2018 1:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuChi](
	[MaPhieuChi] [varchar](20) NOT NULL,
	[Ngay] [date] NULL,
	[NoiDung] [nvarchar](200) NULL,
	[SoTien] [decimal](19, 3) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuChi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhieuThu]    Script Date: 23/12/2018 1:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhieuThu](
	[MaPhieuThu] [varchar](20) NOT NULL,
	[MaDaiLy] [varchar](20) NULL,
	[NgayNop] [date] NULL,
	[SoTienNop] [decimal](19, 3) NULL,
	[Flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuThu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SoLuongDK]    Script Date: 23/12/2018 1:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SoLuongDK](
	[ID] [varchar](20) NOT NULL,
	[MaDaiLy] [varchar](20) NULL,
	[NgayDK] [date] NULL,
	[SoLuongDK] [int] NULL,
	[Flag] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[DaiLy] ([MaDaiLy], [TenDaiLy], [DiaChi], [SDT], [Flag]) VALUES (N'DL01', N'Đại lý vé số Phương Trang', N'93 Phan Đình Phùng, Phường 17, Quận Phú Nhuận, TP.Hồ Chí Minh', N'098 877 7444', 1)
INSERT [dbo].[DaiLy] ([MaDaiLy], [TenDaiLy], [DiaChi], [SDT], [Flag]) VALUES (N'DL02', N'Đại lý vé số Đổi Đời', N'155 Vạn Kiếp, Phường 3, Quận Bình Thạnh, TP.Hồ Chí Minh', N'090 364 2129', 1)
INSERT [dbo].[DaiLy] ([MaDaiLy], [TenDaiLy], [DiaChi], [SDT], [Flag]) VALUES (N'DL03', N'Đại lý vé số Xuân', N'30 Phan Văn Trị, Phường 11, Quận Bình Thạnh, TP.Hồ Chí Minh', N'090 398 0280', 1)
INSERT [dbo].[DaiLy] ([MaDaiLy], [TenDaiLy], [DiaChi], [SDT], [Flag]) VALUES (N'DL04', N'Đại lý vé số Bình An', N'92 Bà Huyện Thanh Quan, Phường 9, Quận 3, TP.Hồ Chí Minh', N'096 772 9729', 1)
INSERT [dbo].[DaiLy] ([MaDaiLy], [TenDaiLy], [DiaChi], [SDT], [Flag]) VALUES (N'DL05', N'Đại lý vé số Phát Tài', N'329 Phan Đình Phùng, Phường 1, Quận Phú Nhuận, TP.Hồ Chí Minh', N'093 412 8268', 1)
INSERT [dbo].[DaiLy] ([MaDaiLy], [TenDaiLy], [DiaChi], [SDT], [Flag]) VALUES (N'DL06', N'Đại lý vé số Hòa Phát', N'14 Xô Viết Nghệ Tĩnh, Phường 19, Quận Bình Thạnh, TP.Hồ Chí Minh', N'090 398 0280', 1)
INSERT [dbo].[Giai] ([MaGiai], [TenGiai], [SoTienNhan], [Flag]) VALUES (N'GI01', N'Giải nhất', CAST(30000000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[Giai] ([MaGiai], [TenGiai], [SoTienNhan], [Flag]) VALUES (N'GI02', N'Giải nhì', CAST(15000000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[Giai] ([MaGiai], [TenGiai], [SoTienNhan], [Flag]) VALUES (N'GI03', N'Giải ba', CAST(10000000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[Giai] ([MaGiai], [TenGiai], [SoTienNhan], [Flag]) VALUES (N'GI04', N'Giải tư', CAST(3000000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[Giai] ([MaGiai], [TenGiai], [SoTienNhan], [Flag]) VALUES (N'GI05', N'Giải năm', CAST(1000000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[Giai] ([MaGiai], [TenGiai], [SoTienNhan], [Flag]) VALUES (N'GI06', N'Giải sáu', CAST(400000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[Giai] ([MaGiai], [TenGiai], [SoTienNhan], [Flag]) VALUES (N'GI07', N'Giải bảy', CAST(200000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[Giai] ([MaGiai], [TenGiai], [SoTienNhan], [Flag]) VALUES (N'GI08', N'Giải tám', CAST(100000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[Giai] ([MaGiai], [TenGiai], [SoTienNhan], [Flag]) VALUES (N'GIDB', N'Giải đặc biệt', CAST(2000000000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[Giai] ([MaGiai], [TenGiai], [SoTienNhan], [Flag]) VALUES (N'GIKK', N'Giải Khuyến khích', CAST(6000000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[Giai] ([MaGiai], [TenGiai], [SoTienNhan], [Flag]) VALUES (N'GIPDB', N'Giải phụ đặc biệt', CAST(50000000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (1, N'TP32-T08', N'GI01', CAST(N'2018-10-06' AS Date), N'77282', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (2, N'TP32-T08', N'GI02', CAST(N'2018-10-06' AS Date), N'75104', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (3, N'TP32-T08', N'GI03', CAST(N'2018-10-06' AS Date), N'42663', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (4, N'TP32-T08', N'GI03', CAST(N'2018-10-06' AS Date), N'30772', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (5, N'TP32-T08', N'GI04', CAST(N'2018-10-06' AS Date), N'35641', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (6, N'TP32-T08', N'GI04', CAST(N'2018-10-06' AS Date), N'15591', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (7, N'TP32-T08', N'GI04', CAST(N'2018-10-06' AS Date), N'03619', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (8, N'TP32-T08', N'GI04', CAST(N'2018-10-06' AS Date), N'30705', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (9, N'TP32-T08', N'GI04', CAST(N'2018-10-06' AS Date), N'99993', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (10, N'TP32-T08', N'GI04', CAST(N'2018-10-06' AS Date), N'36204', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (11, N'TP32-T08', N'GI04', CAST(N'2018-10-06' AS Date), N'74553', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (12, N'TP32-T08', N'GI05', CAST(N'2018-10-06' AS Date), N'9840', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (13, N'TP32-T08', N'GI06', CAST(N'2018-10-06' AS Date), N'7076', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (14, N'TP32-T08', N'GI06', CAST(N'2018-10-06' AS Date), N'5152', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (15, N'TP32-T08', N'GI06', CAST(N'2018-10-06' AS Date), N'2296', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (16, N'TP32-T08', N'GI07', CAST(N'2018-10-06' AS Date), N'279', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (17, N'TP32-T08', N'GI08', CAST(N'2018-10-06' AS Date), N'38', 1)
INSERT [dbo].[KetQuaSoXo] ([ID], [MaLoaiVeSo], [MaGiai], [NgaySo], [SoTrung], [Flag]) VALUES (18, N'TP32-T08', N'GIDB', CAST(N'2018-10-06' AS Date), N'075811', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'AG67-T03', N'An Giang', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'BD53-T12', N'Bình Dương', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'BL31-T07', N'Bạc Liêu', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'BPH93-T04', N'Bình Phước', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'BTH86-T10', N'Bình Thuận', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'BTRE34-T08', N'Bến Tre', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'CM69-T13', N'Cà Mau', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'CT65-T14', N'Cần Thơ', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'DL49-T15', N'Đà Lạt', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'DNAI22-T05', N'Đồng Nai', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'DT25-T06', N'Đồng Tháp', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'HG95-T16', N'Hậu Giang', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'KG68-T17', N'Kiên Giang', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'LA01-T01', N'Long An', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'STR45-T11', N'Sóc Trăng', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'TG08-T02', N'Tiền Giang', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'TN39-T09', N'Tây Ninh', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'TP32-T08', N'Thành Phố HCM', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'TV84-T18', N'Trà Vinh', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'VL64-T19', N'Vĩnh Long', 1)
INSERT [dbo].[LoaiVeso] ([MaLoaiVeSo], [Tinh], [Flag]) VALUES (N'VT72-T20', N'Vũng Tàu', 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0001',N'DL01', N'AG67-T03', 100, CAST(N'2018-10-04' AS Date), 90, CAST(900000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(810000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0002',N'DL01', N'BD53-T12', 90, CAST(N'2018-10-05' AS Date), 70, CAST(700000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(630000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0003',N'DL01', N'BTH86-T10', 100, CAST(N'2018-10-04' AS Date), 100, CAST(1000000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(900000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0004',N'DL01', N'TN39-T09', 100, CAST(N'2018-10-04' AS Date), 80, CAST(800000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(720000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0005',N'DL01', N'VL64-T19', 90, CAST(N'2018-10-05' AS Date), 80, CAST(800000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(720000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0006',N'DL02', N'AG67-T03', 150, CAST(N'2018-10-04' AS Date), 140, CAST(1400000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(1260000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0007',N'DL02', N'BD53-T12', 135, CAST(N'2018-10-05' AS Date), 130, CAST(1300000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(1170000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0008',N'DL02', N'LA01-T01', 145, CAST(N'2018-10-06' AS Date), 140, CAST(1400000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(1260000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0009',N'DL02', N'TN39-T09', 150, CAST(N'2018-10-04' AS Date), 130, CAST(1300000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(1170000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0010',N'DL02', N'TP32-T08', 145, CAST(N'2018-10-06' AS Date), 145, CAST(1450000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(1305000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0011',N'DL02', N'VL64-T19', 135, CAST(N'2018-10-05' AS Date), 135, CAST(1350000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(1215000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0012',N'DL03', N'BTH86-T10', 100, CAST(N'2018-10-04' AS Date), 95, CAST(950000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(855000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0013',N'DL05', N'BTH86-T10', 200, CAST(N'2018-10-04' AS Date), 180, CAST(1800000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(1620000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0014',N'DL05', N'TN39-T09', 200, CAST(N'2018-10-04' AS Date), 190, CAST(1900000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(1710000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0015',N'DL06', N'AG67-T03', 300, CAST(N'2018-10-04' AS Date), 250, CAST(2500000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(2250000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhatHanh] ([MaPH],[MaDaiLy], [MaLoaiVeSo], [SoLuong], [NgayNhan], [SLBan], [DoanhThuDPH], [HoaHong], [TienThanhToan], [Flag]) VALUES ('PH0016',N'DL06', N'BD53-T12', 250, CAST(N'2018-10-05' AS Date), 240, CAST(2400000.000 AS Decimal(19, 3)), CAST(10 AS Decimal(2, 0)), CAST(2160000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhieuChi] ([MaPhieuChi], [Ngay], [NoiDung], [SoTien]) VALUES (N'PCH0001', CAST(N'2018-10-05' AS Date), N'Trúng giải đặc biệt', CAST(2000000000.000 AS Decimal(19, 3)))
INSERT [dbo].[PhieuChi] ([MaPhieuChi], [Ngay], [NoiDung], [SoTien]) VALUES (N'PCH0002', CAST(N'2018-10-06' AS Date), N'Trúng 8 giải tám', CAST(8000000.000 AS Decimal(19, 3)))
INSERT [dbo].[PhieuChi] ([MaPhieuChi], [Ngay], [NoiDung], [SoTien]) VALUES (N'PCH0003', CAST(N'2018-11-06' AS Date), N'1qweqwe', CAST(999.000 AS Decimal(19, 3)))
INSERT [dbo].[PhieuThu] ([MaPhieuThu], [MaDaiLy], [NgayNop], [SoTienNop], [Flag]) VALUES (N'PTH0001', N'DL02', CAST(N'2018-10-05' AS Date), CAST(1000000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhieuThu] ([MaPhieuThu], [MaDaiLy], [NgayNop], [SoTienNop], [Flag]) VALUES (N'PTH0002', N'DL05', CAST(N'2018-10-05' AS Date), CAST(500000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhieuThu] ([MaPhieuThu], [MaDaiLy], [NgayNop], [SoTienNop], [Flag]) VALUES (N'PTH0003', N'DL01', CAST(N'2018-10-06' AS Date), CAST(1000000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhieuThu] ([MaPhieuThu], [MaDaiLy], [NgayNop], [SoTienNop], [Flag]) VALUES (N'PTH0004', N'DL02', CAST(N'2018-10-06' AS Date), CAST(1000000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhieuThu] ([MaPhieuThu], [MaDaiLy], [NgayNop], [SoTienNop], [Flag]) VALUES (N'PTH0005', N'DL03', CAST(N'2018-10-06' AS Date), CAST(500000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[PhieuThu] ([MaPhieuThu], [MaDaiLy], [NgayNop], [SoTienNop], [Flag]) VALUES (N'PTH0006', N'DL06', CAST(N'2018-10-06' AS Date), CAST(500000.000 AS Decimal(19, 3)), 1)
INSERT [dbo].[SoLuongDK] ([ID], [MaDaiLy], [NgayDK], [SoLuongDK], [Flag]) VALUES (N'DK001', N'DL01', CAST(N'2018-02-23' AS Date), 100, 1)
INSERT [dbo].[SoLuongDK] ([ID], [MaDaiLy], [NgayDK], [SoLuongDK], [Flag]) VALUES (N'DK002', N'DL02', CAST(N'2018-03-22' AS Date), 150, 1)
INSERT [dbo].[SoLuongDK] ([ID], [MaDaiLy], [NgayDK], [SoLuongDK], [Flag]) VALUES (N'DK003', N'DL03', CAST(N'2018-04-21' AS Date), 100, 1)
INSERT [dbo].[SoLuongDK] ([ID], [MaDaiLy], [NgayDK], [SoLuongDK], [Flag]) VALUES (N'DK004', N'DL04', CAST(N'2018-05-26' AS Date), 150, 1)
INSERT [dbo].[SoLuongDK] ([ID], [MaDaiLy], [NgayDK], [SoLuongDK], [Flag]) VALUES (N'DK005', N'DL05', CAST(N'2018-06-27' AS Date), 200, 1)
INSERT [dbo].[SoLuongDK] ([ID], [MaDaiLy], [NgayDK], [SoLuongDK], [Flag]) VALUES (N'DK006', N'DL06', CAST(N'2018-07-29' AS Date), 300, 1)
INSERT [dbo].[SoLuongDK] ([ID], [MaDaiLy], [NgayDK], [SoLuongDK], [Flag]) VALUES (N'DK007', N'DL02', CAST(N'2018-08-23' AS Date), 200, 1)
ALTER TABLE [dbo].[KetQuaSoXo]  WITH CHECK ADD FOREIGN KEY([MaGiai])
REFERENCES [dbo].[Giai] ([MaGiai])
GO
ALTER TABLE [dbo].[KetQuaSoXo]  WITH CHECK ADD FOREIGN KEY([MaLoaiVeSo])
REFERENCES [dbo].[LoaiVeso] ([MaLoaiVeSo])
GO

ALTER TABLE [dbo].[PhieuThu]  WITH CHECK ADD FOREIGN KEY([MaDaiLy])
REFERENCES [dbo].[DaiLy] ([MaDaiLy])
GO
ALTER TABLE [dbo].[SoLuongDK]  WITH CHECK ADD FOREIGN KEY([MaDaiLy])
REFERENCES [dbo].[DaiLy] ([MaDaiLy])
GO
USE [master]
GO
ALTER DATABASE [QLVESO] SET  READ_WRITE 
GO
