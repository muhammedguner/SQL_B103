CREATE TABLE ogrenciler5
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,   -- real / ondalıklı sayılar için kullanılır double gibi
kayit_tarih date  --bitirirken virgül koyma öyle bitir
);
-- varolan tablodan yeni bir tablo oluşturma
create table notlar
as
select isim,not_ort from ogrenciler;
select * from notlar;

-- ınsert tablo içine veri ekleme
INSERT INTO notlar values ('fatma',80.5)

-- CONSTRAINT
-- UNIQUE 
CREATE TABLE ogrenciler6
(
ogrenci_no char(7)UNIQUE,
isim varchar(20)NOT null,
soyisim varchar(25),
not_ort real,   
kayit_tarih date  
);
select * from ogrenciler6
-- unique yaptık
INSERT INTO ogrenciler6 values ('1234567','muhammed','güner',75.5,now());
insert into ogrenciler6 (ogrenci_no,soyisim,not_ort) values ('1234568','evren',85.5);
-- not null kısıtlaması olduğu için bu veri eklenemez

-- primary key ataması
CREATE TABLE ogrenciler7
(
ogrenci_no char(7) primary key,
isim varchar(20),
soyisim varchar(25),
not_ort real,  
kayit_tarih date  
);

-- primary key ataması 2. yol
CREATE TABLE ogrenciler8
(
ogrenci_no char(7) ,
isim varchar(20),
soyisim varchar(25),
not_ort real,  
kayit_tarih date,
CONSTRAINT ogr primary key(ogrenci_no)
);

-- FOREIGN KEY
/*
Practice 4:
“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, “iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/
create table tedarikciler3
(
tedarikci_id char (5) primary key,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)
);
create table urunler
(
tedarikci_id char(5),
urun_ıd char(5),
foreign key(tedarikci_id) references tedarikciler3 (tedarikci_id)
);
select * from tedarikciler3;

/*
“calisanlar” isimli bir Tablo olusturun. 
Icinde “id”, “isim”, “maas”, “ise_baslama” field’lari olsun. 
“id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.
Icinde “adres_id”, “sokak”, “cadde” ve “sehir” fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.
*/
create table calisanlar
(
id char(5) primary key,
isim varchar(20)unique,
maas int not null,
ise_baslama date
);

create table adresler
(
adres_id char (5),
sokak varchar(15),
cadde varchar(15),
sehir varchar(15),
foreign key (adres_id) references calisanlar (id)

);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14');
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- NOT NULL CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14');-- string hatası hiçlik var
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14'); -- primary key hiçliği kabul eder
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- PRIMARY KEY 2. hiçliği kabul etmez
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- PRIMARY KEY
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY


INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');

-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

select * from adresler;
select * from calisanlar;

-- CHECK CONSTRAINT
CREATE TABLE calisanlar1(
id varchar(15) PRIMARY KEY,
isim varchar(30) unique,
maas int CHECK (maas>10000),
ise_baslama date
);
INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14');
select * from calisanlar1;


-- DQL -- WHERE KULLANIMI
SELECT * FROM calisanlar;
SELECT isim from calisanlar;

-- Calisanlar tablosundan maasi 5000'den buyuk olan isimleri listeleyiniz
Select isim from calisanlar WHERE maas>5000;

-- Calisanlar tablosundan ismi Veli Han olan tum verileri listeleyiniz.
select * from calisanlar WHERE isim='Veli Han';


-- Calisanlar tablosundan maasi 5000 olan tum verileri listeleyiniz
Select * from calisanlar WHERE maas=5000;


-- DML -- DELETE KOMUTU
Delete from calisanlar; -- Eger parent table baska bir child tablo ile iliskili ise once child tablo silinmelidir
Delete from adresler;
SELECT * FROM adresler;


-- Adresler tablosundan sehri Antep olan verileri silelim
DELETE FROM adresler WHERE sehir='Antep';

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
CREATE TABLE ogrenciler11
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
INSERT INTO ogrenciler11 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler11 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler11 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler11 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler11 VALUES(127, 'Mustafa Bak', 'Ali', 99);















