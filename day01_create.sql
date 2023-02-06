-- yorum satiri
-- 2.yorum satiri
/*
yorum paragrafi
 */



USE sys;

/*========================================
    TABLO OLUSTURMA 1 (CRUD - Create)
========================================*/
-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler table'i olusturunuz.


CREATE TABLE ogrenciler(
id char(4),
isim varchar (25),
not_ortalamasi double,
adres varchar(100),
son_degistirme_tarihi date
);

 DROP TABLE ogrenciler; 
 
 SELECT * from ogrenciler;
 
/*------------------------------------------------------------
Q1: "tedarikciler" isminde bir tablo olusturun.
   "tedarikci_id", "tedarikci_ismi", "tedarikci_adres" ve 
   "ulasim_tarihi" field'lari olsun.
-------------------------------------------------------------*/

Create Table tedarikciler(
tedarikci_id char(5),
tedarikci_ismi varchar(20),
tedarikci_adres varchar(90),
ulasim_tarihi date
);

/*========================================
    VAROLAN TABLODAN TABLO OLUSTURMA  
========================================
------------------Syntax------------------
CREATE TABLE table_name
AS
SELECT field1,field2
FROM other_table_name
========================================*/
-- ogrenciler tablosundan "isim" ve "not_ortalamasi" field'larini
-- alarak ogrenci_derece isimli yeni bir tablo olusturun.

CREATE table ogrenci_derece
AS
SELECT isim, not_ortalamasi
From ogrenciler;

SELECT * FROM ogrenci_derece;

/*--------------------------------------------------------
Q2: "tedarikciler" table'indan "tedarikci_ismi" ve
 "ulasim_tarihi" field'lari olan "tedarikciler_son" 
 isimli yeni bir table olusturun.
---------------------------------------------------------*/


Create table tedarikciler_son
as 
Select tedarikci_ismi,ulasim_tarihi
from tedarikciler;

select * from tedarikciler_son;






