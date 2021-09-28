USE ungdung_quanly_furama;
/*task 2 :Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
		  một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự. */
          
SELECT * FROM nhanvien
WHERE (ten LIKE 'H%' OR  ten LIKE "T%" OR ten LIKE "K%")  AND length(ten) <= 15;

-- task 3: Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và
--         có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

SELECT * FROM khachhang
WHERE (year(current_date()) - year(ngay_sinh)) >=18 AND (year(current_date()) - year(ngay_sinh)) <= 50 AND (dia_chi = "Đà Nẵng" OR dia_chi = "Quảng Trị");

-- task 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu
--         lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của
--         khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT khachhang.id_khach_hang,loaikhach.ten_loai_khach,khachhang.ho,khachhang.ten, COUNT(hopdong.id_khach_hang) AS so_lan_dat
FROM khachhang
JOIN hopdong on hopdong.id_khach_hang = khachhang.id_khach_hang
JOIN loaikhach on loaikhach.id_loai_khach = khachhang.id_loai_khach
WHERE loaikhach.ten_loai_khach = "Diamond"
GROUP BY khachhang.id_khach_hang
ORDER BY so_lan_dat;
-- task 5: Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (Với
--         TongTien được tính theo công thức như sau: ChiPhiThue+SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả
--         các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

SELECT khachhang.id_khach_hang,khachhang.ho,khachhang.ten,loaikhach.ten_loai_khach,hopdong.id_hop_dong,dichvu.ten_dich_vu,
hopdong.ngay_lam_hop_dong,hopdong.ngay_ket_thuc, sum(dichvu.chi_phi_thue + (hopdongchitiet.so_luong*dichvudikem.gia)) AS tong_tien
FROM khachhang
LEFT JOIN hopdong on khachhang.id_khach_hang = hopdong.id_khach_hang
JOIN loaikhach on loaikhach.id_loai_khach = khachhang.id_loai_khach
LEFT JOIN dichvu on dichvu.id_dich_vu = hopdong.id_dich_vu
LEFT JOIN hopdongchitiet on hopdongchitiet.id_hop_dong = hopdong.id_hop_dong
LEFT JOIN dichvudikem on dichvudikem.id_dich_vu_di_kem = hopdongchitiet.id_dich_vu_di_kem
GROUP BY hopdong.id_hop_dong;

-- task 6: Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng
--         thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

SELECT dichvu.id_dich_vu,dichvu.ten_dich_vu,dichvu.dien_tich,dichvu.chi_phi_thue,loaidichvu.ten_loai_dich_vu
FROM dichvu
JOIN loaidichvu on dichvu.id_loai_dich_vu = loaidichvu.id_loai_dich_vu
WHERE dichvu.id_dich_vu NOT IN ( SELECT hopdong.id_dich_vu FROM hopdong 
WHERE (year(hopdong.ngay_lam_hop_dong) = 2019) 
AND (month(hopdong.ngay_lam_hop_dong) = 1 OR month(hopdong.ngay_lam_hop_dong) = 2 OR month(hopdong.ngay_lam_hop_dong) = 3));

-- task 7: Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được
--         Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng trong năm 2019.

SELECT dichvu.id_dich_vu,dichvu.ten_dich_vu,dichvu.dien_tich,dichvu.chi_phi_thue,loaidichvu.ten_loai_dich_vu
FROM dichvu
JOIN loaidichvu on dichvu.id_loai_dich_vu = loaidichvu.id_loai_dich_vu
WHERE dichvu.id_dich_vu IN ( SELECT hopdong.id_dich_vu FROM hopdong 
WHERE (year(hopdong.ngay_lam_hop_dong) = 2018))
AND dichvu.id_dich_vu NOT IN( SELECT hopdong.id_dich_vu FROM hopdong 
WHERE (year(hopdong.ngay_lam_hop_dong) = 2019));

-- task 8: Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
--         Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên

-- Cách 1:
SELECT khachhang.ho, khachhang.ten
FROM khachhang
GROUP BY khachhang.ho, khachhang.ten;

-- Cách 2:
SELECT DISTINCT khachhang.ho, khachhang.ten
FROM  khachhang;

-- Cách 3:
SELECT khachhang.ho, khachhang.ten
FROM khachhang
UNION
SELECT khachhang.ho, khachhang.ten
FROM khachhang;

-- task 9: Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT month(ngay_lam_hop_dong) AS thang, COUNT(month(ngay_lam_hop_dong)) AS so_khach_hang
FROM hopdong
WHERE year(ngay_lam_hop_dong) = 2019
GROUP BY  month(ngay_lam_hop_dong)
ORDER BY month(ngay_lam_hop_dong);

-- task 10: Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong,
--          NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).

SELECT hopdong.id_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,COUNT(hopdongchitiet.id_hop_dong) AS soluongdichvudikem
FROM hopdong
JOIN hopdongchitiet on hopdong.id_hop_dong = hopdongchitiet.id_hop_dong
GROUP BY hopdongchitiet.id_hop_dong;

-- task 11: Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh”
--          hoặc “Quảng Ngãi”.

SELECT khachhang.ho,khachhang.ten,dichvudikem.ten_dich_vu_di_kem,dichvudikem.gia
FROM dichvudikem
JOIN hopdongchitiet on hopdongchitiet.id_dich_vu_di_kem = dichvudikem.id_dich_vu_di_kem
JOIN hopdong on hopdong.id_hop_dong = hopdongchitiet.id_hop_dong
JOIN khachhang on khachhang.id_khach_hang = hopdong.id_khach_hang
JOIN loaikhach on loaikhach.id_loai_khach = khachhang.id_loai_khach
WHERE loaikhach.ten_loai_khach = "Diamond" AND (khachhang.dia_chi = "Vinh" OR khachhang.dia_chi = "Quảng Ngãi");

-- task 12: Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (được
--          tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 
--          2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.

SELECT hopdong.id_hop_dong,concat(nhanvien.ho," ",nhanvien.ten) AS tennhanvien,concat(khachhang.ho," ",khachhang.ten) AS tenkhachhang,
khachhang.sdt, dichvu.ten_dich_vu, COUNT(hopdongchitiet.id_hop_dong) AS soluongdichvudikem,hopdong.tien_dat_coc
FROM hopdong
JOIN nhanvien on nhanvien.id_nhan_vien = hopdong.id_nhan_vien
JOIN hopdongchitiet on hopdong.id_hop_dong = hopdongchitiet.id_hop_dong
JOIN khachhang on khachhang.id_khach_hang = hopdong.id_khach_hang
JOIN dichvu on dichvu.id_dich_vu = hopdong.id_dich_vu
WHERE (month(hopdong.ngay_lam_hop_dong) IN (10,11,12)) AND (month(hopdong.ngay_lam_hop_dong) NOT IN (1,2,3,4,5,6)) AND
 year(hopdong.ngay_lam_hop_dong) = 2019
GROUP BY hopdongchitiet.id_hop_dong;

-- task 13: Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều 
--          dịch vụ có số lần sử dụng nhiều như nhau).

SELECT dichvudikem.ten_dich_vu_di_kem, COUNT(hopdongchitiet.so_luong) AS so_lan_su_dung
FROM dichvudikem
JOIN hopdongchitiet on hopdongchitiet.id_dich_vu_di_kem = dichvudikem.id_dich_vu_di_kem
GROUP BY dichvudikem.id_dich_vu_di_kem
HAVING so_lan_su_dung = (SELECT COUNT(hopdongchitiet.so_luong) AS so_lan_su_dung
						FROM dichvudikem
						JOIN hopdongchitiet on hopdongchitiet.id_dich_vu_di_kem = dichvudikem.id_dich_vu_di_kem
						GROUP BY dichvudikem.id_dich_vu_di_kem
						ORDER BY so_lan_su_dung DESC
						LIMIT 1);


-- task 14: Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu,
--          TenDichVuDiKem, SoLanSuDung.

SELECT hopdong.id_hop_dong, loaidichvu.ten_loai_dich_vu,dichvudikem.ten_dich_vu_di_kem, COUNT(hopdongchitiet.so_luong) AS so_lan_su_dung
FROM hopdong
JOIN dichvu on dichvu.id_dich_vu = hopdong.id_dich_vu
JOIN loaidichvu on loaidichvu.id_loai_dich_vu = dichvu.id_loai_dich_vu
JOIN hopdongchitiet on hopdong.id_hop_dong = hopdongchitiet.id_hop_dong
JOIN dichvudikem on dichvudikem.id_dich_vu_di_kem = hopdongchitiet.id_dich_vu_di_kem
GROUP BY dichvudikem.id_dich_vu_di_kem
HAVING so_lan_su_dung = 1;

-- task 15: Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3
--          hợp đồng từ năm 2018 đến 2019.

SELECT nhanvien.id_nhan_vien, concat(nhanvien.ho," ",nhanvien.ten) AS ho_ten_nv, trinhdo.trinh_do,bophan.ten_bo_phan,
 nhanvien.sdt, nhanvien.dia_chi
 FROM nhanvien
 JOIN trinhdo on trinhdo.id_trinh_do = nhanvien.id_trinh_do
 JOIN bophan on bophan.id_bo_phan = nhanvien.id_bo_phan
 JOIN hopdong on hopdong.id_nhan_vien = nhanvien.id_nhan_vien 
 WHERE year(hopdong.ngay_lam_hop_dong) IN (2018,2019) OR (nhanvien.id_nhan_vien NOT IN (SELECT hopdong.id_nhan_vien FROM hopdong WHERE year(hopdong.ngay_lam_hop_dong) IN (2018,2019)))
 GROUP BY nhanvien.id_nhan_vien
 HAVING COUNT(hopdong.id_nhan_vien) <= 3; 
 
-- task 16: Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.

DELETE FROM nhanvien
WHERE nhanvien.id_nhan_vien NOT IN (SELECT hopdong.id_nhan_vien FROM hopdong WHERE year(hopdong.ngay_lam_hop_dong) IN (2017,2018,2019));

-- task 17: Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng đặt
--          phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.

UPDATE khachhang
JOIN hopdong on khachhang.id_khach_hang = hopdong.id_khach_hang
SET khachhang.id_loai_khach = 1
WHERE khachhang.id_loai_khach = 2 AND
 (SELECT sum(dichvu.chi_phi_thue + (hopdongchitiet.so_luong*dichvudikem.gia)) AS tong_tien
 FROM khachhang
 JOIN hopdong on khachhang.id_khach_hang = hopdong.id_khach_hang
 JOIN dichvu on dichvu.id_dich_vu = hopdong.id_dich_vu
 JOIN hopdongchitiet on hopdongchitiet.id_hop_dong = hopdong.id_hop_dong
 JOIN dichvudikem on dichvudikem.id_dich_vu_di_kem = hopdongchitiet.id_dich_vu_di_kem
 GROUP BY
 );
 
 -- task 18: Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).
 
 DELETE FROM khachhang
 WHERE khachhang.id_khach_hang NOT IN (SELECT hopdong.id_khach_hang FROM hopdong WHERE year(hopdong.ngay_lam_hop_dong) >= 2016);
 
 -- task 19: Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
 
 
		
 