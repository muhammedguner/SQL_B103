-- DATABASE (veritabanı )oluşturma
Create dataBase evren;

-- DDL - DATA DEFİNİTİON LANGUAGE
-- CREATE - TABLO OLUŞTURMA
CREATE TABLE ogrenciler1
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,   -- real / ondalıklı sayılar için kullanılır double gibi
kayit_tarih date  --bitirirken virgül koyma öyle bitir
);

-- VAR OLAN TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE TABLE ogrenci_notlari
as -- benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için normal tablo
   -- oluştururkenki parantezler yerine askullanıp select yapıp variablerı getirip from lanerden geleceğini yazarız
select isim, soyisim, not_ort from ogrenciler;

-- DML DATA MANİPULATİON LANG.
-- INSERT (DATABASE'E VERİ EKLEME)
INSERT INTO ogrenciler Values ('1234567','said','ilhan',85.5,now());
INSERT INTO ogrenciler Values ('1234567','said','ilhan',85.5,'2020-12-11');

-- BİR TABLOYA PARÇALI VERİ EKLEMEK İSTERSEK
INSERT INTO ogrenciler (isim,soyisim) values ('erol','evren');

-- DQL DATA QUARY LANG.
-- SELECT
select * from ogrenciler;










