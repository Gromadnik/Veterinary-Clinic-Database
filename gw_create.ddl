CREATE TABLE gw_kategoria (
    id_kategorii    NUMBER NOT NULL,
    nazwa_kategorii VARCHAR2(30)
);

ALTER TABLE gw_kategoria ADD CONSTRAINT gw_kategoria_pk PRIMARY KEY ( id_kategorii );

CREATE TABLE gw_klient (
    id_klienta  NUMBER(4) NOT NULL,
    imie        VARCHAR2(20),
    nazwisko    VARCHAR2(50) NOT NULL,
    nr_telefonu NUMBER(9)
);

ALTER TABLE gw_klient ADD CONSTRAINT gw_klient_pk PRIMARY KEY ( id_klienta );

CREATE TABLE gw_leki (
    id_leku                   NUMBER(4) NOT NULL,
    nazwa_leku                VARCHAR2(30) NOT NULL,
    cena_leku                 NUMBER(5),
    ilosc_magazyn             NUMBER(4),
    gw_kategoria_id_kategorii NUMBER NOT NULL
);

ALTER TABLE gw_leki ADD CONSTRAINT gw_leki_pk PRIMARY KEY ( id_leku );

CREATE TABLE gw_usluga_wet (
    id_uslugi_wet NUMBER(4) NOT NULL,
    nazwa_uslugi  VARCHAR2(30),
    czas_uslugi   NUMBER(5, 1),
    cena_uslugi   NUMBER(5)
);

ALTER TABLE gw_usluga_wet ADD CONSTRAINT gw_usluga_wet_pk PRIMARY KEY ( id_uslugi_wet );

CREATE TABLE gw_weterynarz (
    id_weterynarza NUMBER(4) NOT NULL,
    imie           VARCHAR2(20),
    nazwisko       VARCHAR2(50) NOT NULL,
    nr_telefonu    NUMBER(9),
    specjalizacja  VARCHAR2(30)
);

ALTER TABLE gw_weterynarz ADD CONSTRAINT gw_weterynarz_pk PRIMARY KEY ( id_weterynarza );

CREATE TABLE gw_wizyta_wet (
    id_wizyty                    NUMBER(4) NOT NULL,
    gw_klient_id_klienta         NUMBER(4) NOT NULL,
    gw_weterynarz_id_weterynarza NUMBER(4) NOT NULL,
    data_wizyty                  DATE,
    czas_wizyty                  NUMBER(5, 1),
    suma_cena_wizyty             NUMBER(8)
);

ALTER TABLE gw_wizyta_wet ADD CONSTRAINT gw_wizyta_wet_pk PRIMARY KEY ( id_wizyty );

CREATE TABLE gw_wybrana_usluga (
    wizyta_id_wizyty            NUMBER(4) NOT NULL,
    gw_usluga_wet_id_uslugi_wet NUMBER(4) NOT NULL
);

ALTER TABLE gw_wybrana_usluga ADD CONSTRAINT relation_16_pk PRIMARY KEY ( wizyta_id_wizyty,
                                                                          gw_usluga_wet_id_uslugi_wet );

CREATE TABLE gw_wybrany_lek (
    wizyta_id_wizyty NUMBER(4) NOT NULL,
    leki_id_leku     NUMBER(4) NOT NULL,
    liczba_leku      NUMBER(3)
);

ALTER TABLE gw_wybrany_lek ADD CONSTRAINT relation_13_pk PRIMARY KEY ( wizyta_id_wizyty,
                                                                       leki_id_leku );

ALTER TABLE gw_leki
    ADD CONSTRAINT gw_leki_gw_kategoria_fk FOREIGN KEY ( gw_kategoria_id_kategorii )
        REFERENCES gw_kategoria ( id_kategorii );

ALTER TABLE gw_wizyta_wet
    ADD CONSTRAINT gw_wizyta_wet_gw_klient_fk FOREIGN KEY ( gw_klient_id_klienta )
        REFERENCES gw_klient ( id_klienta );

ALTER TABLE gw_wizyta_wet
    ADD CONSTRAINT gw_wizyta_wet_gw_weterynarz_fk FOREIGN KEY ( gw_weterynarz_id_weterynarza )
        REFERENCES gw_weterynarz ( id_weterynarza );

ALTER TABLE gw_wybrany_lek
    ADD CONSTRAINT relation_13_gw_leki_fk FOREIGN KEY ( leki_id_leku )
        REFERENCES gw_leki ( id_leku );

ALTER TABLE gw_wybrany_lek
    ADD CONSTRAINT relation_13_gw_wizyta_wet_fk FOREIGN KEY ( wizyta_id_wizyty )
        REFERENCES gw_wizyta_wet ( id_wizyty );

ALTER TABLE gw_wybrana_usluga
    ADD CONSTRAINT relation_16_gw_usluga_wet_fk FOREIGN KEY ( gw_usluga_wet_id_uslugi_wet )
        REFERENCES gw_usluga_wet ( id_uslugi_wet );

ALTER TABLE gw_wybrana_usluga
    ADD CONSTRAINT relation_16_gw_wizyta_wet_fk FOREIGN KEY ( wizyta_id_wizyty )
        REFERENCES gw_wizyta_wet ( id_wizyty );



--------procedury-----------
create or replace procedure dodaj_wizyte_p
	(p_id_klienta INTEGER,
	p_id_weterynarza INTEGER,
	p_data DATE)
as 
begin
	insert into gw_wizyta_wet(gw_klient_id_klienta, gw_weterynarz_id_weterynarza
	,data_wizyty)
	values (p_id_klienta, p_id_weterynarza,p_data);
end;
/

create or replace procedure dodaj_usluge_do_wizyty_p
	(p_id_wizyty INTEGER,
	p_id_uslugi INTEGER)
as
p_czas NUMBER;
p_cena NUMBER;
p_suma_cena_wizyty NUMBER;
begin
	select czas_uslugi into p_czas from gw_usluga_wet where id_uslugi_wet = p_id_uslugi;
	select cena_uslugi into p_cena from gw_usluga_wet where id_uslugi_wet = p_id_uslugi;
	select suma_cena_wizyty into p_suma_cena_wizyty from gw_wizyta_wet where id_wizyty = p_id_wizyty;
	
	insert into gw_wybrana_usluga(wizyta_id_wizyty, gw_usluga_wet_id_uslugi_wet)
	values (p_id_wizyty, p_id_uslugi);
	
	if p_suma_cena_wizyty>0
	then 
		update gw_wizyta_wet set suma_cena_wizyty = suma_cena_wizyty+p_cena
		where id_wizyty = p_id_wizyty;
		update gw_wizyta_wet set czas_wizyty = czas_wizyty+p_czas
		where id_wizyty = p_id_wizyty;
	else 
		update gw_wizyta_wet set suma_cena_wizyty = p_cena
		where id_wizyty = p_id_wizyty;
		update gw_wizyta_wet set czas_wizyty = p_czas
		where id_wizyty = p_id_wizyty;
	end if;
	
end;
/

create or replace procedure dodaj_lek_do_wizyty_p
	(p_id_wizyty INTEGER,
	p_id_leku INTEGER,
	p_liczba_leku INTEGER)
as
p_stan_magazynu NUMBER;
p_suma_cena_wizyty NUMBER;
p_cena NUMBER;
begin
	select ilosc_magazyn into p_stan_magazynu from gw_leki where id_leku = p_id_leku;
	select cena_leku into p_cena from gw_leki where id_leku = p_id_leku;
	select suma_cena_wizyty into p_suma_cena_wizyty from gw_wizyta_wet where id_wizyty = p_id_wizyty;
	
	insert into gw_wybrany_lek(wizyta_id_wizyty, leki_id_leku, liczba_leku)
	values (p_id_wizyty, p_id_leku, p_liczba_leku);
	
	update gw_leki set ilosc_magazyn=p_stan_magazynu-p_liczba_leku where id_leku = p_id_leku;
	
	if p_suma_cena_wizyty>0
	then 
		update gw_wizyta_wet set suma_cena_wizyty = suma_cena_wizyty+ p_cena*p_liczba_leku
		where id_wizyty = p_id_wizyty;
		
	else 
		update gw_wizyta_wet set suma_cena_wizyty = p_cena * p_liczba_leku
		where id_wizyty = p_id_wizyty;
		
	end if;
end;
/

create or replace procedure dodaj_kategorie_p
	(p_nazwa_kategorii VARCHAR2)
as
begin 
	insert into gw_kategoria(nazwa_kategorii)
	values(p_nazwa_kategorii);
end;
/

create or replace procedure dodaj_klienta_p
	(p_imie VARCHAR2,
	p_nazwisko VARCHAR2,
	p_numer_telefonu INTEGER)
as
begin
	insert into gw_klient(imie,nazwisko,nr_telefonu)
	values(p_imie, p_nazwisko, p_numer_telefonu);
end;
/

create or replace procedure dodaj_weterynarza_p
	(p_imie VARCHAR2,
	p_nazwisko VARCHAR2,
	p_numer_telefonu INTEGER,
	p_specjalizacja VARCHAR2)
as
begin
	insert into gw_weterynarz(imie,nazwisko,nr_telefonu,specjalizacja)
	values(p_imie, p_nazwisko, p_numer_telefonu,p_specjalizacja);
end;
/

create or replace procedure dodaj_usluge_p
	(p_nazwa_uslugi VARCHAR2,
	p_czas_uslugi INTEGER,
	p_cena_uslugi INTEGER)
as
begin 
	insert into gw_usluga_wet(nazwa_uslugi,czas_uslugi,cena_uslugi)
	values(p_nazwa_uslugi,p_czas_uslugi,p_cena_uslugi);
end;
/
create or replace procedure dodaj_lek_p
	(p_nazwa_leku VARCHAR2,
	p_cena_leku INTEGER,
	p_ilosc_magazyn INTEGER,
	p_kategoria INTEGER)
as
begin 
	insert into gw_leki(nazwa_leku,cena_leku,ilosc_magazyn,gw_kategoria_id_kategorii)
	values(p_nazwa_leku,p_cena_leku,p_ilosc_magazyn,p_kategoria);
end;
/
---------sekwencje--------------

CREATE SEQUENCE gw_wizyta_id_seq
START WITH 1
MINVALUE 1
MAXVALUE 999
NOCACHE
ORDER;
/
CREATE SEQUENCE gw_klient_id_seq 
START WITH 16
MINVALUE 1
MAXVALUE 999
NOCACHE
ORDER;
/
CREATE SEQUENCE gw_weterynarz_id_seq 
START WITH 6
MINVALUE 1
MAXVALUE 999
NOCACHE
ORDER;
/
CREATE SEQUENCE gw_kategoria_id_seq 
START WITH 6
MINVALUE 1
MAXVALUE 999
NOCACHE
ORDER;
/
CREATE SEQUENCE gw_leki_id_seq 
START WITH 31
MINVALUE 1
MAXVALUE 999
NOCACHE
ORDER;
/
CREATE SEQUENCE gw_usluga_id_seq 
START WITH 11
MINVALUE 1
MAXVALUE 999
NOCACHE
ORDER;
/

-----trigery----------
create or replace trigger gw_wizyta_id_trig
	before insert on gw_wizyta_wet
	for each row 
	when(new.id_wizyty is NULL)
begin
	:new.id_wizyty := gw_wizyta_id_seq.NEXTVAL;
end;
/
create or replace trigger gw_kategoria_id_trig
	before insert on gw_kategoria
	for each row 
	when(new.id_kategorii is NULL)
begin
	:new.id_kategorii := gw_kategoria_id_seq.NEXTVAL;
end;
/

create or replace trigger gw_klient_id_trig
	before insert on gw_klient
	for each row 
	when(new.id_klienta is NULL)
begin
	:new.id_klienta := gw_klient_id_seq.NEXTVAL;
end;
/

create or replace trigger gw_leki_id_trig
	before insert on gw_leki
	for each row 
	when(new.id_leku is NULL)
begin
	:new.id_leku := gw_leki_id_seq.NEXTVAL;
end;
/
create or replace trigger gw_usluga_wet_id_trig
	before insert on gw_usluga_wet
	for each row 
	when(new.id_uslugi_wet is NULL)
begin
	:new.id_uslugi_wet := gw_usluga_id_seq.NEXTVAL;
end;
/
create or replace trigger gw_weterynarz_id_trig
	before insert on gw_weterynarz
	for each row 
	when(new.id_weterynarza is NULL)
begin
	:new.id_weterynarza := gw_weterynarz_id_seq.NEXTVAL;
end;
/

------perspektywy----------

create or replace view wid_lek_uslug_liczba_zlecenie as
select
    gw_wizyta_wet.id_wizyty,
    count(distinct gw_wybrany_lek.leki_id_leku) as "Liczba lekow",  
    count(distinct gw_wybrana_usluga.gw_usluga_wet_id_uslugi_wet) as "Liczba uslug"  
from gw_wizyta_wet
left join gw_wybrany_lek 
    on gw_wizyta_wet.id_wizyty = gw_wybrany_lek.wizyta_id_wizyty
left join gw_wybrana_usluga 
    on gw_wizyta_wet.id_wizyty = gw_wybrana_usluga.wizyta_id_wizyty
group by gw_wizyta_wet.id_wizyty
having count(distinct gw_wybrany_lek.leki_id_leku) > 0  
   and count(distinct gw_wybrana_usluga.gw_usluga_wet_id_uslugi_wet) > 0  
order by gw_wizyta_wet.id_wizyty asc;
/


create or replace view wid_najlepsi_weterynarze as
select
	gw_wizyta_wet.gw_weterynarz_id_weterynarza as "ID_weterynarza",
	gw_weterynarz.imie,
	gw_weterynarz.nazwisko,
	round(sum(czas_wizyty)/60, 0) as "przepracowane pełne godziny",
	count(gw_wybrana_usluga.gw_usluga_wet_id_uslugi_wet) as "liczba wykonanych uslug"
from gw_wizyta_wet 
join gw_weterynarz on gw_wizyta_wet.gw_weterynarz_id_weterynarza 
= gw_weterynarz.id_weterynarza
join gw_wybrana_usluga on gw_wizyta_wet.id_wizyty
= gw_wybrana_usluga.wizyta_id_wizyty
group by gw_wizyta_wet.gw_weterynarz_id_weterynarza,gw_weterynarz.imie,gw_weterynarz.nazwisko
order by 4 desc;
/

create or replace view wid_wizyta_lek_wet as
select
    gw_wizyta_wet.id_wizyty,  
    gw_weterynarz.imie || ' ' || gw_weterynarz.nazwisko as "weterynarz",  
    gw_leki.nazwa_leku,  
    gw_leki.cena_leku,  
    (gw_wybrany_lek.liczba_leku * gw_leki.cena_leku) as "Cena wszystkich sztuk w wizycie"  
from gw_wizyta_wet
join gw_weterynarz on gw_wizyta_wet.gw_weterynarz_id_weterynarza = gw_weterynarz.id_weterynarza 
left join gw_wybrany_lek on gw_wizyta_wet.id_wizyty = gw_wybrany_lek.wizyta_id_wizyty  
left join gw_leki on gw_wybrany_lek.leki_id_leku = gw_leki.id_leku  
order by gw_wizyta_wet.id_wizyty, gw_leki.nazwa_leku;
/


create or replace view wid_zarobki_weterynarzy as
select
    gw_weterynarz.id_weterynarza,
    gw_weterynarz.imie || ' ' || gw_weterynarz.nazwisko as weterynarz,
    sum(gw_wybrany_lek.liczba_leku * gw_leki.cena_leku) as zarobki_z_lekow,
	sum(gw_wybrany_lek.liczba_leku * gw_leki.cena_leku) * 0.3 as procent_dla_weterynarza
from
    gw_wizyta_wet
join
    gw_weterynarz
    on gw_wizyta_wet.gw_weterynarz_id_weterynarza = gw_weterynarz.id_weterynarza
left join
    gw_wybrany_lek
    on gw_wizyta_wet.id_wizyty = gw_wybrany_lek.wizyta_id_wizyty
left join
    gw_leki
    on gw_wybrany_lek.leki_id_leku = gw_leki.id_leku
group by
    gw_weterynarz.id_weterynarza,
    gw_weterynarz.imie,
    gw_weterynarz.nazwisko
order by
    zarobki_z_lekow desc;
/




----funkcja-----

create or replace function f_zysk_w_czasie
	(f_start DATE,
	f_koniec DATE)
return NUMBER
as
f_zysk NUMBER(10,3);
begin 
select sum(suma_cena_wizyty) into f_zysk
from gw_wizyta_wet
where gw_wizyta_wet.data_wizyty between f_start and f_koniec;
return f_zysk;
end;
/