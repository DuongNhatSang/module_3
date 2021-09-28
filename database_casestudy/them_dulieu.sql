USE ungdung_quanly_furama;
INSERT INTO trinhdo (trinh_do)
VALUES ("Trung Cấp"),
 ("Cao đẳng"),
 ("Đại học"),
 ("Sau đại học");
 INSERT INTO vitri (ten_vi_tri)
 VALUES ("Lễ tân"),
 ("Phục vụ"),
 ("Giám sát"),
 ("Quản lý"),
 ("Giám đốc");
 INSERT INTO bophan (ten_bo_phan)
 VALUES ("Sale_Marketing"),
 ("Hành chính"),
 ("Phục vụ"),
 ("Quản lý");
 INSERT INTO nhanvien (ho,ten,id_vi_tri,id_trinh_do,id_bo_phan,ngay_sinh,so_cmnd,luong,sdt,email,dia_chi)
 VALUES ("Tran Văn","Anh",3,3,4,"1990/07/04",123456789,20000000,0901111111,"sang@gmail.com","Đà Nẵng"),
  ("Dương Nhật","Sang",3,3,4,"1994/07/04",123456789,20000000,0901111111,"sang@gmail.com","Đà Nẵng"),
  ("Nguyễn Văn","Huy",1,2,3,"1998/10/04",123456987,10000000,0901123441,"huy@gmail.com","Đà Nẵng"),
  ("Nguyễn Thị","Thúy",2,1,3,"1995/12/04",123645987,15000000,0901123841,"thuy@gmail.com","Gia Lai"),
  ("Nguyễn Văn","Khánh",2,1,3,"1995/12/04",123654879,15000000,0901129841,"khanh@gmail.com","Gia Lai");
  INSERT INTO loaikhach (ten_loai_khach)
  VALUES ("Diamond"),
  ("Platinium"),
  ("Gold"),
  ("Silver"),
  ("Member");
 INSERT INTO khachhang (id_loai_khach,ho,ten,ngay_sinh,so_cmnd,sdt,email,dia_chi)
 VALUES (1,"Nguyễn Văn","A","1995/12/04",123654879,0901129841,"A@gmail.com","Đà Nẵng"),
  (3,"Nguyễn Văn","B","1970/12/04",123654879,0901129841,"B@gmail.com","Gia Lai"),
  (4,"Nguyễn Văn","C","1980/12/04",123214879,0901134841,"C@gmail.com","Quảng Trị"),
  (2,"Nguyễn Văn","D","1968/12/04",123654879,0901176841,"D@gmail.com","Quảng Trị");
  INSERT INTO kieuthue (ten_kieu_thue)
  VALUES ("Năm"),
  ("Tháng"),
  ("Ngày"),
  ("Giờ");
  INSERT INTO loaidichvu (ten_loai_dich_vu)
  VALUES ("Villa"),
  ("House"),
  ("Room");
  INSERT INTO dichvu (ten_dich_vu,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,id_kieu_thue,id_loai_dich_vu,trang_thai)
  VALUES ("Villa1",30,3,20,7000000,3,1,"Còn"),
  ("House1",20,4,10,4000000,2,2,"Còn"),
  ("Room1",15,2,5,3000000,4,3,"Còn"),
  ("Villa2",40,3,25,3000000,4,1,"Còn");
  INSERT INTO dichvudikem (ten_dich_vu_di_kem,gia,don_vi,trang_thai_kha_dung)
  VALUES ("Massage",500000,3,"khả dụng"),
  ("Karaoke",100000,1,"khả dụng"),
  ("Thức ăn",50000,2,"khả dụng"),
  ("Nước uống",50000,2,"khả dụng"),
  ("Thuê xe tham quan",100000,4,"khả dụng");
  INSERT INTO hopdong (id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc)
  VALUES (1,1,1,"2021/09/01","2021/09/02",5000000),
  (2,2,2,"2021/09/03","2021/10/03",2000000),
  (3,3,3,"2021/08/07","2021/08/08",1500000),
  (4,4,4,"2021/08/10","2021/08/11",1500000);
  INSERT INTO khachhang (id_loai_khach,ho,ten,ngay_sinh,so_cmnd,sdt,email,dia_chi)
   VALUES (1,"Nguyễn Văn","E","1970/12/04",123344879,0907829841,"E@gmail.com","Quảng Nam");
  INSERT INTO hopdong (id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc)
   VALUES (1,1,1,"2021/10/01","2021/10/02",5000000),
   (2,5,1,"2021/11/01","2021/11/02",4000000);
   INSERT INTO hopdongchitiet (id_hop_dong,id_dich_vu_di_kem,so_luong)
   VALUES (3,5,2),
   (1,1,3),
   (2,2,2),
   (3,3,4),
   (4,4,4),
   (5,5,2),
   (6,5,1);
   INSERT INTO khachhang (id_loai_khach,ho,ten,ngay_sinh,so_cmnd,sdt,email,dia_chi)
   VALUES (2,"Nguyễn Văn","F","1980/10/04",123312879,0907099841,"F@gmail.com","Quảng Nam");
   INSERT INTO hopdong (id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc)
   VALUES (1,2,1,"2019/01/01","2019/01/02",5000000);
   INSERT INTO hopdong (id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc)
VALUES (1,2,1,"2018/01/01","2018/01/02",5000000),
(1,2,2,"2018/03/01","2018/03/02",5000000);
INSERT INTO khachhang (id_loai_khach,ho,ten,ngay_sinh,so_cmnd,sdt,email,dia_chi)
VALUES (1,"Nguyễn Văn","C","1990/08/04",123632879,0901549841,"Cc@gmail.com","Vinh");

