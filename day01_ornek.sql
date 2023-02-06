-- file kaydi ornegi
-- yorum satiri
-- 2.yorum satiri
/*

yorum paragrafi

*/

use sys;

/*========================================
    TABLO OLUSTURMA 1 (CRUD - Create)
========================================*/
-- id, isim, not ortalamasi, adres ve son degistirme tarihi
-- fieldlari iceren bir ogrenciler table'i olusturunuz.

Create Table ogrenciler1(
id char(4),
isim varchar(25),
not_ortalamasi double,
adres varchar(100),
son_degistirm_tarihi date);

drop table ogrenciler1;

select * from ogrenciler1;

/*------------------------------------------------------------
Q1: "tedarikciler" isminde bir tablo olusturun.
   "tedarikci_id", "tedarikci_ismi", "tedarikci_adres" ve 
   "ulasim_tarihi" field'lari olsun.
-------------------------------------------------------------*/anadolu_lisesipersonel


CREATE table tedarikciler2(
tedarikci_id char(4),
tedarikci_ismi varchar(25),
tedarikci_adres varchar(100),
ulasim_tarihi date
);


select * from tedarikciler2;

/*========================================
    VAROLAN TABLODAN TABLO OLUSTURMA  
========================================
------------------Syntax------------------
CREATE TABLE table_name
AS
SELECT field1,field2
FROM other_table_name
========================================*/
-- ogrenciler1 tablosundan "isim" ve "not_ortalamasi" field'larini
-- alarak ogrenci_derece isimli yeni bir tablo olusturun.

create table ogrenci_der
as
select isim, not_ortalamasi
from ogrenciler;

/*--------------------------------------------------------
Q2: "tedarikciler" table'indan "tedarikci_ismi" ve
 "ulasim_tarihi" field'lari olan "tedarikciler_son" 
 isimli yeni bir table olusturun.
---------------------------------------------------------*/

create table tedarikciler_sonx
as
select tedarikci_ismi,ulasim_tarihi
from tedarikciler;

select * from tedarikciler;







