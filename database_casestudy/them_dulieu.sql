USE ungdung_quanly_furama;
INSERT INTO trinhdo (TrinhDo)
VALUES ("Trung Cấp"),
 ("Cao đẳng"),
 ("Đại học"),
 ("Sau đại học");
 INSERT INTO vitri (TenViTri)
 VALUES ("Lễ tân"),
 ("Phục vụ"),
 ("Giám sát"),
 ("Quản lý"),
 ("Giám đốc");
 INSERT INTO bophan (TenBoPhan)
 VALUES ("Sale_Marketing"),
 ("Hành chính"),
 ("Phục vụ"),
 ("Quản lý");
 INSERT INTO nhanvien (Ho,Ten,IDViTri,IDTrinhDo,IDBoPhan,NgaySinh,SoCMND,Luong,SDT,Email,DiaChi)
 VALUES ("Dương Nhật","Sang",3,3,4,"1994/07/04",123456789,20000000,0901111111,"sang@gmail.com","Đà Nẵng"),
  ("Nguyễn Văn","Huy",1,2,3,"1998/10/04",123456987,10000000,0901123441,"huy@gmail.com","Đà Nẵng"),
  ("Nguyễn Thị","Thúy",2,1,3,"1995/12/04",123645987,15000000,0901123841,"thuy@gmail.com","Gia Lai"),
  ("Nguyễn Văn","Khánh",2,1,3,"1995/12/04",123654879,15000000,0901129841,"khanh@gmail.com","Gia Lai");
  INSERT INTO loaikhach (TenLoaiKhach)
  VALUES ("Diamond"),
  ("Platinium"),
  ("Gold"),
  ("Silver"),
  ("Member");
 INSERT INTO khachhang (IDLoaiKhach,Ho,Ten,NgaySinh,SoCMND,SDT,Email,DiaChi)
 VALUES (1,"Nguyễn Văn","A","1995/12/04",123654879,0901129841,"A@gmail.com","Đà Nẵng"),
  (3,"Nguyễn Văn","B","1970/12/04",123654879,0901129841,"B@gmail.com","Gia Lai"),
  (4,"Nguyễn Văn","C","1980/12/04",123214879,0901134841,"C@gmail.com","Quảng Trị"),
  (2,"Nguyễn Văn","D","1968/12/04",123654879,0901176841,"D@gmail.com","Quảng Trị");
  INSERT INTO kieuthue (TenKieuThue)
  VALUES ("Năm"),
  ("Tháng"),
  ("Ngày"),
  ("Giờ");
  INSERT INTO loaidichvu (TenLoaiDichVu)
  VALUES ("Villa"),
  ("House"),
  ("Room");
  INSERT INTO dichvu (TenDichVu,DienTich,SoTang,SoNguoiToiDa,ChiPhiThue,IDKieuThue,IDLoaiDichVu,TrangThai)
  VALUES ("Villa1",30,3,20,7000000,3,1,"Còn"),
  ("House1",20,4,10,4000000,2,2,"Còn"),
  ("Room1",15,2,5,3000000,4,3,"Còn"),
  ("Villa2",40,3,25,3000000,4,1,"Còn");
  INSERT INTO dichvudikem (TenDichVuDiKem,Gia,DonVi,TrangThaiKhaDung)
  VALUES ("Massage",500000,3,"khả dụng"),
  ("Karaoke",100000,1,"khả dụng"),
  ("Thức ăn",50000,2,"khả dụng"),
  ("Nước uống",50000,2,"khả dụng"),
  ("Thuê xe tham quan",100000,4,"khả dụng");
  INSERT INTO hopdong (IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc,TongTien)
  VALUES (1,1,1,"2021/09/01","2021/09/02",5000000,7000000),
  (2,2,2,"2021/09/03","2021/10/03",2000000,4000000),
  (3,3,3,"2021/08/07","2021/08/08",1500000,3000000),
  (4,4,4,"2021/08/10","2021/08/11",1500000,3000000);