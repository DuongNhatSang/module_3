USE quanlybanhang;
INSERT INTO customer
VALUES (1,"Minh Quân",10),
(2,"Ngoc Oanh",20),
(3,"Hong Ha",50);
INSERT INTO `order`(oID,cID,oDate)
VALUES (1,1,3/21/2006),
(2,2,3/23/2006),
(3,1,3/16/2006);
INSERT INTO product
VALUES (1,"May Giat",3),
(2,"Tu Lanh",5),
(3,"Dieu Hoa",7),
(4,"Quat",1),
(5,"Bep Dien",2);
INSERT INTO order_detail
VALUES (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(2,5,4),
(2,3,3);
SELECT  oID, oDate, oTotalPrice FROM `order`;
SELECT customer.cName,product.pName
FROM order_detail
INNER JOIN product on order_detail.pID = product.pID
INNER JOIN `order` on `order`.oID = order_detail.oID
INNER JOIN customer on customer.cID = `order`.cID;
SELECT customer.cName
FROM customer
WHERE customer.cID NOT IN (
SELECT `order`.cID
FROM `order`);