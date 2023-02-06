
use sys;

/* ====================================== UPDATE ========================================
Tabloda varolan herhangi bir record'a ait verinin degistirilmesi icin kullanilir.
-----Syntax-----
UPDATE table_name
SET field1=''
WHERE condition;




========================================================================================*/

/* You also can disable safe mode in MySQL Workbench, 
go to Edit -> Preferences -> SQL Editor, and 
uncheck "Safe Updates" check box. 
Then reconnect to MySQL server by going to Query -> Reconnect to Server. */

/*--------------------------------------------------------------------------------------
1) Bir firmalar tablosu olusturun icinde id,
isim ve iletisim_isim field'lari olsun. 
Id ve isim'i beraber Primary Key yapin.
---------------------------------------------------------------------------------------*/

create table firmalar (

id int,
isim varchar (10),
iletisim_isim varchar (20),
Constraint firmalar_pk Primary Key(id,isim)
);

/*--------------------------------------------------------------------------------------
2) Icine 3 kayit ekleyin :
(1, 'ACB', 'Ali Can'), 
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez').
---------------------------------------------------------------------------------------*/

insert into firmalar 
values (1, 'ACB', 'Ali Can'),
(2, 'RDB', 'Veli Gul'), 
(3, 'KMN', 'Ayse Gulmez');

select * from firmalar;
drop table firmalar;

-- id'si 3 olan firmamin ismini 'KRM'

update firmalar 
set isim='KRM'
where id=3;

-- Iletisim ismi Veli Gul olan firmanin id'sini 4, ismini FDS olarak guncelleyiniz.

-- ++++++++++++1.yol++++++++++++++++++
 
 update firmalar
 set id = 4 
 where iletisim_isim = 'Veli Gul';
 
update firmalar
set isim = 'FDS' 
where iletisim_isim = 'Veli Gul';

-- +++++++2.yol++++++++++++++++++++

update firmalar
 set id = 4, isim ='FDS'
 where iletisim_isim = 'Veli Gul';



