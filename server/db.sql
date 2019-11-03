SET NAMES UTF8;
DROP DATABASE IF EXISTS demo;
CREATE DATABASE demo CHARSET=UTF8;
USE demo;



-- 创建登录表
CREATE TABLE demo_login(
    id INT PRIMARY KEY AUTO_INCREMENT,
    phone CHAR(11),
    upwd VARCHAR(255)
);
INSERT INTO demo_login VALUES(null,'18136515334',md5('123'));
INSERT INTO demo_login VALUES(null,'18111111111',md5('321'));


-- 创建商品表
CREATE TABLE demo_laptop(
    lid INT PRIMARY KEY AUTO_INCREMENT,
    picture VARCHAR(255),
    lname VARCHAR(255),
    model VARCHAR(255),
    price VARCHAR(255)
);
INSERT INTO demo_laptop VALUES(null,'../../static/shouye/45.jpg','华为(HUAWEI)Mate30','麒麟990旗舰芯徕卡三摄','4299.00');
INSERT INTO demo_laptop VALUES(null,'../../static/shouye/45.jpg','华为(HUAWEI)Mate30','麒麟990旗舰芯徕卡三摄','4299.00');
INSERT INTO demo_laptop VALUES(null,'../../static/shouye/45.jpg','华为(HUAWEI)Mate30','麒麟990旗舰芯徕卡三摄','4299.00');
INSERT INTO demo_laptop VALUES(null,'../../static/shouye/45.jpg','华为(HUAWEI)Mate30','麒麟990旗舰芯徕卡三摄','4299.00');
INSERT INTO demo_laptop VALUES(null,'../../static/shouye/45.jpg','华为(HUAWEI)Mate30','麒麟990旗舰芯徕卡三摄','4299.00');

INSERT INTO demo_laptop VALUES(null,'../../static/shouye/96.jpg','华为(HUAWEI)Mate30','麒麟990旗舰芯徕卡三摄','4299.00');
INSERT INTO demo_laptop VALUES(null,'../../static/shouye/96.jpg','华为(HUAWEI)Mate30','麒麟990旗舰芯徕卡三摄','4299.00');
INSERT INTO demo_laptop VALUES(null,'../../static/shouye/96.jpg','华为(HUAWEI)Mate30','麒麟990旗舰芯徕卡三摄','4299.00');
INSERT INTO demo_laptop VALUES(null,'../../static/shouye/96.jpg','华为(HUAWEI)Mate30','麒麟990旗舰芯徕卡三摄','4299.00');
INSERT INTO demo_laptop VALUES(null,'../../static/shouye/96.jpg','华为(HUAWEI)Mate30','麒麟990旗舰芯徕卡三摄','4299.00');


CREATE TABLE demo_cart(
    id INT PRIMARY KEY AUTO_INCREMENT,
    lid INT,
    count INT,
    lname VARCHAR(255),
    price DECIMAL(10,2),
    uid INT
);
