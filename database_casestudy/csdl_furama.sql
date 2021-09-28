CREATE DATABASE ungdung_quanly_furama;
USE ungdung_quanly_furama;
CREATE TABLE kieuthue(
id_kieu_thue INT AUTO_INCREMENT PRIMARY KEY,
ten_kieu_thue VARCHAR(45),
gia INT

);

CREATE TABLE loaidichvu(
id_loai_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
ten_loai_dich_vu VARCHAR(45)
);

CREATE TABLE dichvu(
id_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
ten_dich_vu VARCHAR(45),
dien_tich INT,
so_tang INT,
so_nguoi_toi_da INT,
chi_phi_thue DOUBLE,
id_kieu_thue INT,
id_loai_dich_vu INT,
trang_thai VARCHAR(45),
FOREIGN KEY (id_kieu_thue) REFERENCES kieuthue (id_kieu_thue)
on update cascade on delete cascade,
FOREIGN KEY (id_loai_dich_vu) REFERENCES loaidichvu (id_loai_dich_vu)
on update cascade on delete cascade
);

CREATE TABLE vitri(
id_vi_tri INT AUTO_INCREMENT PRIMARY KEY,
ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinhdo(
id_trinh_do INT AUTO_INCREMENT PRIMARY KEY,
trinh_do VARCHAR(45)
);

CREATE TABLE bophan(
id_bo_phan INT AUTO_INCREMENT PRIMARY KEY,
ten_bo_phan VARCHAR(45)
);

CREATE TABLE nhanvien(
id_nhan_vien INT AUTO_INCREMENT PRIMARY KEY,
ho VARCHAR(45),
ten VARCHAR(45),
id_vi_tri INT,
id_trinh_do INT,
id_bo_phan INT,
ngay_sinh DATE,
so_cmnd INT,
luong DOUBLE,
sdt INT,
email VARCHAR(45),
dia_chi VARCHAR(45),
FOREIGN KEY (id_vi_tri) REFERENCES vitri(id_vi_tri)
on update cascade on delete cascade,
FOREIGN KEY (id_trinh_do) REFERENCES trinhdo(id_trinh_do)
on update cascade on delete cascade,
FOREIGN KEY (id_bo_phan) REFERENCES bophan(id_bo_phan)
on update cascade on delete cascade
);
CREATE TABLE loaikhach(
id_loai_khach INT AUTO_INCREMENT PRIMARY KEY,
ten_loai_khach VARCHAR(45)
);
CREATE TABLE khachhang(
id_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
id_loai_khach INT,
ho VARCHAR(45),
ten VARCHAR(45),
ngay_sinh DATE,
so_cmnd INT,
sdt INT,
email VARCHAR(45),
dia_chi VARCHAR(45),
FOREIGN KEY (id_loai_khach) REFERENCES loaikhach(id_loai_khach)
on update cascade on delete cascade
);
CREATE TABLE hopdong(
id_hop_dong INT AUTO_INCREMENT PRIMARY KEY,
id_nhan_vien INT,
id_khach_hang INT,
id_dich_vu INT,
ngay_lam_hop_dong DATE,
ngay_ket_thuc DATE,
tien_dat_coc DOUBLE,
tong_tien DOUBLE,
FOREIGN KEY (id_nhan_vien) REFERENCES nhanvien(id_nhan_vien)
on update cascade on delete cascade,
FOREIGN KEY (id_khach_hang) REFERENCES khachhang(id_khach_hang)
on update cascade on delete cascade,
FOREIGN KEY (id_dich_vu) REFERENCES dichvu(id_dich_vu)
on update cascade on delete cascade
);
CREATE TABLE dichvudikem(
id_dich_vu_di_kem INT AUTO_INCREMENT PRIMARY KEY,
ten_dich_vu_di_kem VARCHAR(45),
gia INT,
don_vi INT,
trang_thai_kha_dung VARCHAR(45)
);
CREATE TABLE hopdongchitiet(
id_hop_dong_chi_tiet INT AUTO_INCREMENT PRIMARY KEY,
id_hop_dong INT,
id_dich_vu_di_kem INT,
so_luong INT,
FOREIGN KEY (id_hop_dong) REFERENCES hopdong(id_hop_dong)
on update cascade on delete cascade,
FOREIGN KEY (id_dich_vu_di_kem) REFERENCES dichvudikem(id_dich_vu_di_kem)
on update cascade on delete cascade
);