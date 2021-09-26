USE ungdung_quanly_furama;

SELECT * FROM nhanvien
WHERE (Ten LIKE 'H%' OR  Ten LIKE "T%" OR Ten LIKE "K%")  AND length(Ten) <= 15;

SELECT * FROM khachhang
WHERE (year(current_date()) - year(NgaySinh)) >=18 AND (year(current_date()) - year(NgaySinh)) <= 50 AND (DiaChi = "Đà Nẵng" OR DiaChi = "Quảng Trị");