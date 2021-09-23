DROP DATABASE quanlisanpham;
CREATE DATABASE quanlisanpham;
USE quanlisanpham;
CREATE TABLE nhaCC(
id INT AUTO_INCREMENT PRIMARY KEY,
maNCC VARCHAR(45) UNIQUE,
tenNCC VARCHAR(45),
diachi VARCHAR(45),
sdt VARCHAR(45)
);
CREATE TABLE donDH(
id INT AUTO_INCREMENT PRIMARY KEY,
soDH INT,
ngayDH DATE,
id_NCC INT,
FOREIGN KEY (id_NCC) REFERENCES nhaCC(id)
);
CREATE TABLE vattu(
id INT AUTO_INCREMENT PRIMARY KEY,
maVTu VARCHAR(45) UNIQUE,
tenVTu VARCHAR(45)
);
CREATE TABLE phieuxuat(
id INT AUTO_INCREMENT PRIMARY KEY,
soPX INT,
ngayxuat DATE
);
CREATE TABLE phieunhap(
id INT AUTO_INCREMENT PRIMARY KEY,
soPN INT,
ngaynhap DATE
);
CREATE TABLE donDH_vattu(
id_donDH INT,
id_vattu INT,
FOREIGN KEY (id_donDH) REFERENCES donDH(id),
FOREIGN KEY (id_vattu) REFERENCES vattu(id)
);
CREATE TABLE vattu_phieuxuat(
dgXuat DOUBLE,
slxuat INT,
id_vattu INT,
id_phieuxuat INT,
FOREIGN KEY (id_vattu) REFERENCES vattu(id),
FOREIGN KEY (id_phieuxuat) REFERENCES phieuxuat(id)
);
CREATE TABLE vattu_phieunhap(
dgnhap DOUBLE,
slnhap INT,
id_vattu INT,
id_phieunhap INT,
FOREIGN KEY (id_vattu) REFERENCES vattu(id),
FOREIGN KEY (id_phieunhap) REFERENCES phieunhap(id)
);


