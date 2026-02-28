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
    count(distinct gw_wybrany_lek.leki_id_leku) as "Liczba lekow",  -- Zliczaj unikalne leki
    count(distinct gw_wybrana_usluga.gw_usluga_wet_id_uslugi_wet) as "Liczba uslug"  -- Zliczaj unikalne usługi
from gw_wizyta_wet
left join gw_wybrany_lek 
    on gw_wizyta_wet.id_wizyty = gw_wybrany_lek.wizyta_id_wizyty
left join gw_wybrana_usluga 
    on gw_wizyta_wet.id_wizyty = gw_wybrana_usluga.wizyta_id_wizyty
group by gw_wizyta_wet.id_wizyty
having count(distinct gw_wybrany_lek.leki_id_leku) > 0  -- Tylko wizyty z co najmniej jednym unikalnym lekiem
   and count(distinct gw_wybrana_usluga.gw_usluga_wet_id_uslugi_wet) > 0  -- Tylko wizyty z co najmniej jedną unikalną usługą
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
    sum(gw_wybrany_lek.liczba_leku * gw_leki.cena_leku) as "zarobki z lekow",  
    sum(gw_wybrana_usluga.gw_usluga_wet_id_uslugi_wet * gw_usluga_wet.cena_uslugi) as "zarobki z uslug",  
    (sum(gw_wybrany_lek.liczba_leku * gw_leki.cena_leku) + sum(gw_wybrana_usluga.gw_usluga_wet_id_uslugi_wet * gw_usluga_wet.cena_uslugi)) as "łączne zarobki" 
from gw_wizyta_wet
join gw_weterynarz on gw_wizyta_wet.gw_weterynarz_id_weterynarza = gw_weterynarz.id_weterynarza  
left join gw_wybrany_lek on gw_wizyta_wet.id_wizyty = gw_wybrany_lek.wizyta_id_wizyty  -- Łączenie z tabelą wybranych leków
left join gw_leki on gw_wybrany_lek.leki_id_leku = gw_leki.id_leku  -- Łączenie z tabelą leków
left join gw_wybrana_usluga on gw_wizyta_wet.id_wizyty = gw_wybrana_usluga.wizyta_id_wizyty  -- Łączenie z tabelą wybranych usług
left join gw_usluga_wet on gw_wybrana_usluga.gw_usluga_wet_id_uslugi_wet = gw_usluga_wet.id_uslugi_wet  -- Łączenie z tabelą usług weterynaryjnych
group by
    gw_weterynarz.id_weterynarza, 
    gw_weterynarz.imie, 
    gw_weterynarz.nazwisko  
order by "łączne zarobki" desc;
/
	