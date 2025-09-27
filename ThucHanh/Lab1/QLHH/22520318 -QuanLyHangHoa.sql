CREATE DATABASE QuanLyHangHoa

USE QuanLyHangHoa
GO

-- 1) Tạo bảng (chưa có ràng buộc)
CREATE TABLE dbo.Nhacungcap (
    maNCC     VARCHAR(5)  NOT NULL,
    tenNCC    VARCHAR(20) NULL,
    trangthai NUMERIC(2,0) NULL,
    thanhpho  VARCHAR(30) NULL
);

CREATE TABLE dbo.Phutung (
    maPT      VARCHAR(5)  NOT NULL,
    tenPT     VARCHAR(10) NULL,
    mausac    VARCHAR(10) NULL,
    khoiluong FLOAT       NULL,
    thanhpho  VARCHAR(30) NULL
);

CREATE TABLE dbo.Vanchuyen (
    maNCC     VARCHAR(5)  NOT NULL,
    maPT      VARCHAR(5)  NOT NULL,
    soluong   NUMERIC(5,0) NULL
);

-- 2) Thêm khóa chính (PK)
ALTER TABLE dbo.Nhacungcap
ADD CONSTRAINT PK_Nhacungcap PRIMARY KEY (maNCC);

ALTER TABLE dbo.Phutung
ADD CONSTRAINT PK_Phutung PRIMARY KEY (maPT);

ALTER TABLE dbo.Vanchuyen
ADD CONSTRAINT PK_Vanchuyen PRIMARY KEY (maNCC, maPT);

-- 3) Thêm khóa ngoại (FK)
ALTER TABLE dbo.Vanchuyen
ADD CONSTRAINT FK_Vanchuyen_NCC
    FOREIGN KEY (maNCC) REFERENCES dbo.Nhacungcap(maNCC);

ALTER TABLE dbo.Vanchuyen
ADD CONSTRAINT FK_Vanchuyen_PT
    FOREIGN KEY (maPT)  REFERENCES dbo.Phutung(maPT);

INSERT INTO dbo.Nhacungcap(maNCC, tenNCC, trangthai, thanhpho) VALUES
('NCC01','AlphaCo', 20,'Hanoi'),
('NCC02','BetaLtd', 10,'HoChiMinh'),
('NCC03','GammaInc',30,'Danang'),
('NCC04','DeltaCo', 15,'Haiphong'),
('NCC05','Epsilon', 25,'CanTho'),
('NCC06','ZetaLtd',  5,'Hue'),
('NCC07','EtaCorp',  40,'QuyNhon'),
('NCC08','ThetaCo',  35,'Vinh'),
('NCC09','IotaInc',  20,'NhaTrang'),
('NCC10','KappaCo',  30,'DaLat'),
('NCC11','Lambda',   10,'BienHoa'),
('NCC12','MuGroup',  20,'BuonMaThuot');

INSERT INTO dbo.Phutung(maPT, tenPT, mausac, khoiluong, thanhpho) VALUES
('PT01','Bolt','Red',      0.10,'Hanoi'),
('PT02','Nut','Blue',      0.05,'HoChiMinh'),
('PT03','Screw','Green',   0.07,'Danang'),
('PT04','Washer','Yellow', 0.02,'Haiphong'),
('PT05','Clamp','Black',   0.30,'CanTho'),
('PT06','Valve','White',   1.20,'Hue'),
('PT07','Gear','Gray',     2.50,'QuyNhon'),
('PT08','Bearing','Orange',0.80,'Vinh'),
('PT09','Seal','Purple',   0.15,'NhaTrang'),
('PT10','Pipe','Brown',    3.40,'DaLat'),
('PT11','Cable','Silver',  1.00,'BienHoa'),
('PT12','Filter','Gold',   0.60,'BuonMaThuot');


INSERT INTO dbo.Vanchuyen(maNCC, maPT, soluong) VALUES
('NCC01','PT01',120),
('NCC01','PT03', 80),
('NCC02','PT02',150),
('NCC02','PT08', 60),
('NCC03','PT04',200),
('NCC03','PT10', 35),
('NCC04','PT05', 50),
('NCC05','PT06', 40),
('NCC06','PT07', 25),
('NCC07','PT09', 90),
('NCC08','PT11',110),
('NCC09','PT12', 70),
('NCC10','PT01', 55),
('NCC11','PT03', 65),
('NCC12','PT02',130);

SELECT * FROM [dbo].[Nhacungcap]