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
SET khachhang.id_loai_khach = 1
WHERE khachhang.id_loai_khach = 2 AND khachhang.id_khach_hang IN 
 (SELECT hopdong.id_khach_hang
 FROM hopdong
 LEFT JOIN dichvu on dichvu.id_dich_vu = hopdong.id_dich_vu
 LEFT JOIN hopdongchitiet on hopdongchitiet.id_hop_dong = hopdong.id_hop_dong
 LEFT JOIN dichvudikem on dichvudikem.id_dich_vu_di_kem = hopdongchitiet.id_dich_vu_di_kem
 WHERE year(hopdong.ngay_lam_hop_dong) = 2019
 GROUP BY hopdong.id_khach_hang
 HAVING sum((dichvu.chi_phi_thue + (hopdongchitiet.so_luong*dichvudikem.gia)))  >= 10000000
 );
 
 -- task 18: Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).
 
 DELETE FROM khachhang
 WHERE khachhang.id_khach_hang NOT IN (SELECT hopdong.id_khach_hang FROM hopdong WHERE year(hopdong.ngay_lam_hop_dong) >= 2016);
 
 -- task 19: Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.
 
 UPDATE dichvudikem
 SET dichvudikem.gia = dichvudikem.gia*10
 WHERE dichvudikem.id_dich_vu_di_kem IN 
 (SELECT dichvudikem.id_dich_vu_di_kem 
   FROM (SELECT dichvudikem.id_dich_vu_di_kem 
		 FROM dichvudikem
		 JOIN hopdongchitiet ON hopdongchitiet.id_dich_vu_di_kem = dichvudikem.id_dich_vu_di_kem
		 GROUP BY  dichvudikem.id_dich_vu_di_kem
		 HAVING SUM(hopdongchitiet.so_luong) >= 10) AS abc
         );

-- task 20: Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang),
--          HoTen, Email, SoDienThoai, NgaySinh, DiaChi.

 SELECT (nhanvien.id_nhan_vien) AS id, concat(nhanvien.ho," ",nhanvien.ten) AS ho_ten, nhanvien.email, nhanvien.sdt, 
 nhanvien.ngay_sinh, nhanvien.dia_chi
 FROM nhanvien
 UNION ALL
 SELECT (khachhang.id_khach_hang) AS id, concat(khachhang.ho," ",khachhang.ten) AS ho_ten, khachhang.email, khachhang.sdt, 
 khachhang.ngay_sinh, khachhang.dia_chi
 FROM khachhang;
 
 -- task 21: Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng 
 --          lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ với ngày lập hợp đồng là “12/12/2019”
 
 CREATE OR REPLACE VIEW v_nhanvien AS
 SELECT nhanvien.id_nhan_vien, nhanvien.ho, nhanvien.ten, nhanvien.id_vi_tri,nhanvien.id_bo_phan,nhanvien.id_trinh_do,nhanvien.ngay_sinh,
 nhanvien.luong,nhanvien.sdt,nhanvien.so_cmnd,nhanvien.dia_chi
 FROM nhanvien
 JOIN hopdong on hopdong.id_nhan_vien = nhanvien.id_nhan_vien
 WHERE nhanvien.dia_chi = "Hải Châu" AND hopdong.ngay_lam_hop_dong = "2019/12/12";

 SELECT * FROM v_nhanvien;
 
 -- task 22: Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các Nhân viên được nhìn thấy bởi 
 --          khung nhìn này.
 
 UPDATE v_nhanvien
 SET v_nhanvien.dia_chi = "Liên Chiểu";
 
 -- task 23: Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó với Id Khách hàng được truyền vào như là 1 tham số của SD
 
DELIMITER $$
CREATE PROCEDURE sp_1(id_khach_hang INT)
BEGIN
	DELETE FROM khachhang
    WHERE khachhang.id_khach_hang = id_khach_hang;
END;$$
DELIMITER ;
CALL sp_1(7);

-- task 24: Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với 
--          nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.
 
 DELIMITER $$
CREATE PROCEDURE sp_2(id_nhan_vien INT, id_khach_hang INT, id_dich_vu INT, ngay_lam_hop_dong DATE, ngay_ket_thuc DATE, tien_dat_coc DOUBLE)
BEGIN
	INSERT INTO hopdong(id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc)
    VALUES (id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc);
END;$$
DELIMITER ;
CALL sp_2(2,3,4,"2019/12/09","2019/12/10",5000000);

-- task 25: Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng HopDong ra giao diện
--          console của database

DELIMITER $$
CREATE TRIGGER tr_1 AFTER DELETE ON hopdong FOR EACH ROW
BEGIN
	SET @tong_so_ban_ghi_con_lai = (SELECT COUNT(hopdong.id_hop_dong) FROM hopdong);
    
END;$$
DELIMITER ;
DELETE FROM hopdong
WHERE hopdong.id_hop_dong = 1;
SELECT @tong_so_ban_ghi_con_lai;

-- task 26: Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không,
--          với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, 
 --         nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database

DELIMITER $$
CREATE TRIGGER tr_2 BEFORE UPDATE ON hopdong FOR EACH ROW
BEGIN
	SET @thoi_gian_kt = datediff(new.ngay_ket_thuc,old.ngay_lam_hop_dong);
   
    IF @thoi_gian_kt < 2 THEN 
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = "Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày";
    END IF;
END;$$
DELIMITER ;

UPDATE hopdong
SET ngay_ket_thuc = "2019/12/15"
WHERE id_hop_dong = 3;

-- task 27: Tạo user function thực hiện yêu cầu sau:
--          a. Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ.
--          b. Tạo user function Func_2: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà Khách hàng đã
--             thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần
--             làm hợp đồng). Mã của Khách hàng được truyền vào như là 1 tham số của function này.

-- câu a:
DELIMITER $$
CREATE FUNCTION func_1() 
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE tong_cac_dich_vu INT DEFAULT 0;
SELECT COUNT(id_dich_vu) INTO tong_cac_dich_vu
  FROM(
  SELECT hopdong.id_dich_vu,COUNT(hopdong.id_dich_vu) AS tong_dich_vu,dichvu.chi_phi_thue,dichvu.chi_phi_thue*COUNT(hopdong.id_dich_vu) AS tong_tien
  FROM hopdong
  JOIN dichvu ON dichvu.id_dich_vu = hopdong.id_dich_vu
  GROUP BY hopdong.id_dich_vu
  HAVING dichvu.chi_phi_thue*COUNT(hopdong.id_dich_vu) > 3000000
  ) AS a ;
  RETURN tong_cac_dich_vu;
END; $$
DELIMITER ;
SELECT func_1();

-- câu b:
DELIMITER $$
CREATE FUNCTION func_2(id_khach_hang INT) 
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE thoi_gian_max INT DEFAULT 0;
  SELECT MAX(khoang_thoi_gian) INTO thoi_gian_max
  FROM (
		SELECT datediff(ngay_ket_thuc,ngay_lam_hop_dong) AS khoang_thoi_gian
		FROM hopdong
		WHERE hopdong.id_khach_hang = id_khach_hang
		) AS a;
  RETURN thoi_gian_max;
END; $$
DELIMITER ; 
SELECT func_2(2);

-- task 28: Tạo Store procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 để xóa
--          thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng DichVu) và xóa những HopDong sử dụng dịch vụ liên quan (tức là phải xóa
--          những bản gi trong bảng HopDong) và những bản liên quan khá

 DELIMITER $$
CREATE PROCEDURE sp_3()
BEGIN
  DELETE FROM dichvu
  WHERE dichvu.id_loai_dich_vu = 3 AND dichvu.id_dich_vu IN (SELECT hopdong.id_dich_vu FROM hopdong WHERE year(ngay_lam_hop_dong) IN (2015,2016,2017,2018,2019));
END; $$
DELIMITER ;  
CALL sp_3();