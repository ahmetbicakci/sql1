use sys;

CREATE TABLE isciler
(
id int,
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);

INSERT INTO isciler VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO isciler VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO isciler VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO isciler VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
INSERT INTO isciler VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO isciler VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
INSERT INTO isciler VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from isciler;



-- 1) Isme gore toplam maaslari bulun

Select isim, sum(maas) top_maas
from isciler
group by isim;


-- 2) Sehre gore toplam isci sayisini bulun

Select sehir, count(isim)
from isciler
group by sehir;

-- 3) sehre gore toplam isci sayisini, buyukten kucuge dogru yazdir

select sehir, count (isim) isci_sayisi
from isciler
group by sehir
order by isci_sayisi DESC;

-- 4) Sirketlere gore maasi 5000 liradan fazla olan isci sayisini bulun

select sirket, count (isim) isci_sayisi
from isciler
where maas > 5000
group by sirket;

-- 5) Her sirket icin Min ve Max maasi bulun

select sirket, max(maas)max_maas, min(maas)min_maas
from isciler
group by sirket;


/*======================== HAVING CLAUSE =======================
    HAVING, AGGREGATE FUNCTION'lar ile birlikte kullanilan 
FILTRELEME komutudur.
    Aggregate fonksiyonlar ile ilgili bir kosul koymak 
icin GROUP BY'dan sonra HAVING cumlecigi kullanilir.    
===============================================================*/

-- 1) sirketlere gore isci sayisini 1'den buyukse yazdir

select sirket, count(isim)isci_sayisi
from isciler
group by sirket
having isci_sayisi>1;

-- 2) toplam geliri 8000 den fazla olan isimleri gosteren sorgu yaziniz

select isim, sum(maas)toplam_maas
from isciler
group by isim
having toplam_maas> 8000;

-- 3) her sirketin MIN maaslarini eger 4000 den buyukse goster

-- once her sirketin min maaslarini gosterelim

select sirket, min(maas)min_maas
from isciler
group by sirket;

-- yeni create ettigmiz bir field uzerinden filtremleme yaptigimiz icin
-- WHERE ifadesini kullanamiyoruz; 
-- WHERE ifadesi sadece tabloda yer alan fieldler icin bir filtreleme yapar


select sirket, min(maas)min_maas
from isciler
group by sirket
having min_maas>4000;

-- 4) Eger bir sehirde alinan MAX maas 5000'den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz


select sehir, max(maas)max_maas
from isciler
group by sehir
having max_maas<5000;


--  5) Eger bir sehirde alinan MAX maas 5000'den buyukse sehir ismini ve MAX maasi, sehir ismi sirali

select sehir, max(maas)max_maas
from isciler
group by sehir
having max_maas>5000
order by sehir;

/*============================ LIMIT ===========================
>Tablodaki verilerin belli bir kismini listelemek icin LIMIT
 komutunu kullaniriz.
 
>LIMIT komutundan sonra kullandigimiz sayi kadar kaydi bize getirir.

>Eger belirli bir aralikta calismak istiyorsak bu durumda 
iki sayi gireriz, ancak bu sayilardan ilki baslangic noktamizi 
ifade ederken, ikincisi kac kayit getirecegimizi belirtir. 

>Baslangic noktasi dahil edilmez!
===============================================================*/

-- 1)isciler tablosindan ilk 5 kaydi getirin

select *
from isciler
limit 5;

-- 2) isim sirali tablodan ilk 3 kaydi listele

select *
from isciler
order by isim
limit 3;

-- 3) maas sirali tablodan 4.kayittan 6.kayda kadar olan kayitlarin isim ve sehir bilgilerini listele

select isim, sehir
from isciler
order by maas
limit 3,3; 

-- 4) Maasi en yuksek 3 kisinin bilgilerini listeleyen bir sorgu yazdir
select *
from isciler
order by maas desc
limit 3;

-- 5) Maasi en dusuk 3 kisinin sadece isimlerini listele

select isim
from isciler
order by maas
limit 3;

-- 6) Maasi en dusuk 3 kisinin sadece isimlerini, isim sirali listele

select isim, sehir
from isciler
order by maas,isim
limit 3;

-- 7) Maasi en dusuk 3 kisinin sadece isimlerini, isim ve sehir sirali listeleyen sorguyu yaziniz.

SELECT isim,sehir
FROM isciler
ORDER BY maas,isim,sehir
LIMIT 3;

-- 8) Maas'i 4000'den buyuk olan 3 kisinin sehrini listeleyin.

SELECT sehir,isim
FROM isciler
WHERE maas > 4000 
LIMIT 3;

-- 9) Maas'i 4000'den buyuk olan 3 kisinin sehrini, maas sirali listeleyiniz.

SELECT sehir,isim
FROM isciler
WHERE maas > 4000 
ORDER BY maas
LIMIT 3;



/*============================ DISTINCT ===========================
    DISTINCT cumlecigi bir Sorgu ifadesinde benzer olan kayitlari
    filtrelemek icin kullanilir. Dolayisiyla secilen sutun veya 
    sutunlar icin benzersiz veri iceren satirlar olusturmaya yarar.
    
    Syntax :
    --------
    SELECT DISTINCT field_name1, field_name2,...
    FROM table_name
    
===============================================================*/


-- 1) Iscilerin yasadigi sehirleri listeleyin

select distinct sehir,isim
from isciler;


-- GROUP BY'da bir fielda gore gruplama yapip, Aggregate Function'lar
-- yardimiyla baska bir field'da islem yapip bize islem yaptigi field'i
-- yeni bir field olarak donduruyor.

-- DISTINCT cumlecigi bir Sorgu ifadesinde
-- benzer olan kayitlari filtrelemek icin kullanilir. DISTINCT komutu bize
-- bir field'daki kayitlarin tek bir ornegini dondurur.



CREATE TABLE manav (
    isim VARCHAR(50),
    urun_adi VARCHAR(50),
    urun_miktar INT
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);
INSERT INTO manav VALUES( 'Ali', null, 2);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 1);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 4);
INSERT INTO manav VALUES( 'Ayse', null, 3);

select *  from manav;

-- manava tablosudnan satilan farkli meyve turlerini listeleyen bir query yaziniz

select distinct urun_adi
from manav;

-- Satilan farkli meyve turlerini NULL olmayanlari isim sirali
--  listeleyen bir query yaziniz

select distinct urun_adi
from manav
where urun_adi is not null;

-- Satilan farkli meyve turlerini NULL olmayanlari isim sirali
-- listeleyen bir query yaziniz


select distinct urun_adi
from manav
where urun_adi is not null
order by urun_adi;

-- Manavda kac cesit meyve satildigini listeleyen bir query yaz

select count(distinct urun_adi)urun_sayisi
from manav;



select distinct isim, urun_adi
from manav;

























