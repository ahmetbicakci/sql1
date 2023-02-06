/*================================== DELETE ============================================
DELETE FROM table_name komutu tablodaki tum recordlari siler.
Eger tum kayitlar silindikten sonra tabloyu gormek isterseniz size sadece bos bir tablo
gosterir. 
DELETE komutu sadece datalari siler, tabloyu silmez.
=======================================================================================*/
use sys;


DELETE FROM mart_satislar;
SELECT * FROM mart_satislar;


/*===============================================================================================
-- DELETE FROM tablo_adi;  Tablonun tum icerigini siler.
-- Bu komut bir DML komutudur. Dolayisiyla devaminda WHERE gibi cumlecikler
-- kullanilabilir.
    
    -- DELETE FROM tablo_adi
    -- WHERE field = veri;
    
--    DELETE FROM ogrenciler;     -- Tum verileri sil.
--    SAVEPOINT ABC;     -- Verilen konuma kodlari kaydeder.
--    ROLLBACK TO  ABC;  -- Silinen Verileri geri getir.
-- Bilgileri geri getirirken sikinti yasamamak icin ayarlar sql execution auto commit tiki kaldir
==================================================================================================*/ 


CREATE TABLE cucuklar
(
id char(3),
isim varchar(50),
veli_isim varchar(50),
yazili_notu int,
constraint cucuklar_pk Primary Key (id)
);


INSERT INTO cucuklar VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO cucuklar VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO cucuklar VALUES(125, 'Kemal Yasa', 'Ali',85);

SELECT * FROM cucuklar;

-- Veli Ismi Ali ya da Ayse olan kaydi siliniz


Delete from cucuklar
Where veli_isim = 'Ali'or veli_isim ='Ayse';

Delete from cucuklar
where veli_isim IN ('Ali', 'Ayse');

-- Yazili notu 84'ten buyuk olan cocuklari silin

Delete from cucuklar
where yazili_notu > 84;

-- Yazili notu 85'ten farkli olan cocuklari silin

Delete from cucuklar
where NOT yazili_notu = 85;

Delete from cucuklar
where yazili_notu != 85; -- yazili notu 85 olmayan

-- baska bir metot
Delete from cucuklar
where yazili_notu <> 85; -- 85 den buyuk ya da kucuk olanlar




CREATE TABLE cocuk
    (
        id CHAR(3),
        isim VARCHAR(50),
        veli_isim VARCHAR(50),
        yazili_notu int
    );
    INSERT INTO cocuk VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO cocuk VALUES(124, 'Merve Gul', 'Ayse',85);
	INSERT INTO cocuk VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO cocuk VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
	INSERT INTO cocuk VALUES(127, 'Mustafa Bak', 'Can',99);
    
    SAVEPOINT CICEK;
    SELECT * FROM COCUK;
    
    -- Id' si 124'ten buyuk olan kayitlari silin
    
    delete from cocuk
    where id > 124;
    
    ROLLBACK TO CICEK;
    
    
    








