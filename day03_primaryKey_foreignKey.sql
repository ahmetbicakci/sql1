
/*
*====================================== PRIMARY KEY ==============================================
1) Primary Key bir record'u tanimlayan bir field veya birden fazla field'in kombinasyonudur. 
2) Primary Key Unique'dir. 
3) Bir tabloda en fazla bir Primary Key olabilir .
4) Primary Key field'inda hic bir data NULL olamaz.


-----Syntax-----
 "id" field'ini "primary key" yapmak icin 2 yol var.
1) Data Type'dan sonra "PRIMARY KEY" yazarak.
 
 CREATE TABLE students_table 
( id int PRIMARY KEY,
 name varchar(50) NOT NULL,
 grade int,
 adres varchar(100),
 last_update date 
);

2) CONSTRAINT Keyword Kullanilarak Primary Key Tanimlanabilir; 
"CONSTRAINT constraintName PRIMARY KEY(column1, column2, ... column_n)" 
CREATE TABLE students 
(
id int,
name varchar(50) NOT NULL,
grade int,
address varchar(100),
last_modification date, 
CONSTRAINT id_pk PRIMARY KEY (id) 
);
================================================================================================*/

use sys;

create table students 
(
id int primary key,
student_name varchar(20) not null,
adres varchar (50),
phone varchar (11) unique

);

/*---------------------------------------------------------------------
"sehirler" isimli bir Table olusturun. 
Tabloda "alan_kodu", "isim", "nufus" field'lari olsun. 
Isim field'i bos birakilamasin. 
1.Yontemi kullanarak "alan_kodu" field'ini "Primary Key" yapin
-----------------------------------------------------------------------*/


create table sehirler (
alan_kodu char(4) primary key,
isim varchar (20) not null,
nufus int
);

/*------------------------------------------------------------------------------
"ogretmenler" isimli bir Table olusturun. 
Tabloda "id", "isim", "brans", "cinsiyet" field'lari olsun. 
Id field'i tekrarli deger kabul etmesin. 
2.Yontemi kullanarak "id ve isim" field'lerinin birlesimini "primary key" yapin 
-------------------------------------------------------------------------------*/
create table ogretmenler (
id int unique,
isim varchar (25),
brans varchar (10),
cinsiyet varchar (5),
Constraint id_isim PRIMARY KEY (id, isim)
 );
 
 
 /*====================================== PRIMARY KEY ==============================================
1) Primary Key bir record'u tanimlayan bir field veya birden fazla field'in kombinasyonudur.
2) Primary Key Unique'dir.
3) Bir tabloda en fazla bir Primary Key olabilir .
4) Primary Key field'inda hic bir data NULL olamaz.
-----Syntax-----
 "id" field'ini "primary key" yapmak icin 2 yol var.
1) Data Type'dan sonra "PRIMARY KEY" yazarak.
 CREATE TABLE students_table
(
 id int PRIMARY KEY,
 name varchar(50) NOT NULL,
 grade int,
 adres varchar(100),
 last_update date
);
2) CONSTRAINT Keyword Kullanilarak Primary Key Tanimlanabilir;
"CONSTRAINT constraintName PRIMARY KEY(column1, column2, ... column_n)"
CREATE TABLE students
(
id int,
name varchar(50) NOT NULL,
grade int,
address varchar(100),
last_modification date,
CONSTRAINT id_pk PRIMARY KEY (id)
);
================================================================================================*/

-- foreign key icin en az iki tablo olmasi gereklidir

create table tedarikci (
tedarikci_id int,
tedarikci_ismi varchar (15),
iletisim_isim varchar (20),

CONSTRAINT tedarikci_pk Primary Key (tedarikci_id)
);

create table urunler (
tedarikci_id int,
urun_id int, 
Constraint urunler_fk Foreign Key (tedarikci_id)
REFERENCEs tedarikci (tedarikci_id)
);

select * from tedarikci;
select * from urunler;



create table bebeler (
id int,
isim varchar(10),
iletisim varchar (20),
CONSTRAINT bebeler_pk primary key (id)

);


create table notlar (
bebe_id int,
puan int,
constraint notlar_fk foreign key (bebe_id)
references bebeler (id)
);

/*------------------------------------------------------------------------------
"universite_ogrenci_bilgi_sistemi" isimli bir Table olusturun. 
Tabloda "giris yili", "giris siralamasi", "isim", "bolum" field'lari olsun. 
isim field'i null deger kabul etmesin. 
2.Yontemi kullanarak "giris yili ve giris siralamasi" field'lerinin birlesimini
 "primary key" yapin 
-------------------------------------------------------------------------------*/

create table universite_ogrenci_bilgi_sistemi (
);





