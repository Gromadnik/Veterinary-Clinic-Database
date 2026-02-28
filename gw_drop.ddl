DROP TABLE gw_kategoria CASCADE CONSTRAINTS;

DROP TABLE gw_klient CASCADE CONSTRAINTS;

DROP TABLE gw_leki CASCADE CONSTRAINTS;

DROP TABLE gw_usluga_wet CASCADE CONSTRAINTS;

DROP TABLE gw_weterynarz CASCADE CONSTRAINTS;

DROP TABLE gw_wizyta_wet CASCADE CONSTRAINTS;

DROP TABLE gw_wybrana_usluga CASCADE CONSTRAINTS;

DROP TABLE gw_wybrany_lek CASCADE CONSTRAINTS;

------sekwencje----

DROP SEQUENCE gw_wizyta_id_seq;
DROP SEQUENCE gw_klient_id_seq;
DROP SEQUENCE gw_weterynarz_id_seq;
DROP SEQUENCE gw_kategoria_id_seq;
DROP SEQUENCE gw_leki_id_seq;
DROP SEQUENCE gw_usluga_id_seq;



---procedury----

DROP PROCEDURE dodaj_wizyte_p;
DROP PROCEDURE dodaj_usluge_do_wizyty_p;
DROP PROCEDURE dodaj_lek_do_wizyty_p;
DROP PROCEDURE dodaj_kategorie_p;
DROP PROCEDURE dodaj_klienta_p;
DROP PROCEDURE dodaj_weterynarza_p;
DROP PROCEDURE dodaj_usluge_p;
DROP PROCEDURE dodaj_lek_p;


----perspektywy----

drop view wid_lek_uslug_liczba_zlecenie;
drop view wid_najlepsi_weterynarze;
drop view wid_wizyta_lek_wet;
drop view wid_zarobki_weterynarzy;

---funkcja----
drop function f_zysk_w_czasie;