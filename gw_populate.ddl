
-----------------uslugi_wet----------------------
INSERT INTO gw_usluga_wet (id_uslugi_wet, nazwa_uslugi, czas_uslugi, cena_uslugi)
VALUES (1, 'Badanie kontrolne', 30.0, 150);

INSERT INTO gw_usluga_wet (id_uslugi_wet, nazwa_uslugi, czas_uslugi, cena_uslugi)
VALUES (2, 'Szczepienie', 15.0, 80);

INSERT INTO gw_usluga_wet (id_uslugi_wet, nazwa_uslugi, czas_uslugi, cena_uslugi)
VALUES (3, 'Czyszczenie zebow', 45.0, 200);

INSERT INTO gw_usluga_wet (id_uslugi_wet, nazwa_uslugi, czas_uslugi, cena_uslugi)
VALUES (4, 'Usuniecie kleszcza', 10.0, 50);

INSERT INTO gw_usluga_wet (id_uslugi_wet, nazwa_uslugi, czas_uslugi, cena_uslugi)
VALUES (5, 'Sterylizacja', 90.0, 600);

INSERT INTO gw_usluga_wet (id_uslugi_wet, nazwa_uslugi, czas_uslugi, cena_uslugi)
VALUES (6, 'Konsultacja specjalistyczna', 60.0, 250);

INSERT INTO gw_usluga_wet (id_uslugi_wet, nazwa_uslugi, czas_uslugi, cena_uslugi)
VALUES (7, 'Badanie USG', 30.0, 180);

INSERT INTO gw_usluga_wet (id_uslugi_wet, nazwa_uslugi, czas_uslugi, cena_uslugi)
VALUES (8, 'RTG', 40.0, 300);

INSERT INTO gw_usluga_wet (id_uslugi_wet, nazwa_uslugi, czas_uslugi, cena_uslugi)
VALUES (9, 'Zabieg chirurgiczny', 120.0, 1200);

INSERT INTO gw_usluga_wet (id_uslugi_wet, nazwa_uslugi, czas_uslugi, cena_uslugi)
VALUES (10, 'Odrobaczanie', 20.0, 100);


-----------------------klienci-------------------
INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (1, 'Adam', 'Kowalski', 123456789);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (2, 'Ewa', 'Nowak', 987654321);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (3, 'Jan', 'Zielinski', 456123789);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (4, 'Anna', 'Mazur', 321654987);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (5, 'Tomasz', 'Baran', 654987123);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (6, 'Monika', 'Wiatr', 789123456);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (7, 'Piotr', 'Orzel', 159753456);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (8, 'Karolina', 'Wilk', 753951852);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (9, 'Pawel', 'Sokol', 852741369);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (10, 'Magdalena', 'Lis', 951357852);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (11, 'Marcin', 'Kruk', 741258963);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (12, 'Agnieszka', 'Kot', 369852147);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (13, 'Krzysztof', 'Wrona', 258963147);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (14, 'Joanna', 'Zajac', 147852369);

INSERT INTO gw_klient (id_klienta, imie, nazwisko, nr_telefonu)
VALUES (15, 'Bartlomiej', 'Lewandowski', 963258741);

---------------------pracownicy-------------------------

INSERT INTO gw_weterynarz (id_weterynarza, imie, nazwisko, nr_telefonu, specjalizacja)
VALUES (1, 'Anna', 'Kowalska', 123456789, 'Choroby wewnetrzne');

INSERT INTO gw_weterynarz (id_weterynarza, imie, nazwisko, nr_telefonu, specjalizacja)
VALUES (2, 'Tomasz', 'Nowak', 987654321, 'Chirurgia');

INSERT INTO gw_weterynarz (id_weterynarza, imie, nazwisko, nr_telefonu, specjalizacja)
VALUES (3, 'Ewa', 'Zielinska', 456123789, 'Dermatologia');

INSERT INTO gw_weterynarz (id_weterynarza, imie, nazwisko, nr_telefonu, specjalizacja)
VALUES (4, 'Jan', 'Baran', 321654987, 'Radiologia');

INSERT INTO gw_weterynarz (id_weterynarza, imie, nazwisko, nr_telefonu, specjalizacja)
VALUES (5, 'Karolina', 'Wiatr', 654987123, 'Onkologia');

-------------------kategorie_lekow----------------------
INSERT INTO gw_kategoria (id_kategorii, nazwa_kategorii)
VALUES (1, 'Antybiotyki');

INSERT INTO gw_kategoria (id_kategorii, nazwa_kategorii)
VALUES (2, 'Sterydowe');

INSERT INTO gw_kategoria (id_kategorii, nazwa_kategorii)
VALUES (3, 'Narkotyczne');

INSERT INTO gw_kategoria (id_kategorii, nazwa_kategorii)
VALUES (4, 'Profilaktyczne');

INSERT INTO gw_kategoria (id_kategorii, nazwa_kategorii)
VALUES (5, 'Hormony');

----------------------leki-----------------------------


INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (1, 'Amoksycylina', 50, 100, 1);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (2, 'Cefaleksyna', 60, 120, 1);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (3, 'Enrofloksacyna', 70, 80, 1);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (4, 'Doksacyklina', 80, 90, 1);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (5, 'Klindamycyna', 100, 70, 1);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (6, 'Prednizon', 120, 60, 2);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (7, 'Deksametazon', 150, 75, 2);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (8, 'Metyloprednizolon', 110, 85, 2);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (9, 'Betametazon', 130, 95, 2);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (10, 'Hydrokortyzon', 140, 50, 2);


INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (11, 'Morfin', 200, 40, 3);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (12, 'Fentanyl', 250, 30, 3);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (13, 'Petydyna', 180, 45, 3);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (14, 'Oksykodon', 220, 35, 3);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (15, 'Hydromorfon', 230, 40, 3);


INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (16, 'Witamina C', 40, 100, 4);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (17, 'Levacid', 45, 120, 4);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (18, 'Fipronil', 50, 150, 4);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (19, 'Ivermectin', 60, 80, 4);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (20, 'Rimadyl', 70, 100, 4);


INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (21, 'Progesteron', 120, 95, 5);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (22, 'Testosteron', 150, 85, 5);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (23, 'Estrogen', 130, 110, 5);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (24, 'Insulina', 160, 70, 5);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (25, 'Hormony tarczycy', 180, 60, 5);


INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (26, 'Trimetoprim', 55, 110, 1);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (27, 'Spironolakton', 65, 90, 2);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (28, 'Deksametazon', 75, 80, 2);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (29, 'Ibuprofen', 25, 200, 4);

INSERT INTO gw_leki (id_leku, nazwa_leku, cena_leku, ilosc_magazyn, gw_kategoria_id_kategorii)
VALUES (30, 'Loperamid', 40, 150, 4);

-------------------wizyty-------------------------

INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (13, 1, '2024-06-24');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (6, 2, '2024-06-23');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (14, 5, '2024-06-28');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (9, 2, '2024-06-11');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (5, 5, '2024-06-14');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (2, 1, '2024-06-21');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (1, 5, '2024-06-11');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (4, 2, '2024-06-11');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (4, 3, '2024-06-25');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (8, 1, '2024-06-02');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (9, 1, '2024-06-18');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (2, 3, '2024-06-02');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (8, 4, '2024-06-23');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (5, 1, '2024-06-25');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (3, 3, '2024-06-07');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (6, 5, '2024-06-14');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (7, 5, '2024-06-27');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (12, 3, '2024-06-22');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (12, 4, '2024-06-09');
INSERT INTO GW_WIZYTA_WET (GW_KLIENT_ID_KLIENTA, GW_WETERYNARZ_ID_WETERYNARZA, DATA_WIZYTY) VALUES (5, 5, '2024-06-29');


------wizyta a uslugi-------
BEGIN
   dodaj_usluge_do_wizyty_p(1, 2);
   dodaj_usluge_do_wizyty_p(2, 5);
   dodaj_usluge_do_wizyty_p(2, 8);
   dodaj_usluge_do_wizyty_p(3, 7);
   dodaj_usluge_do_wizyty_p(4, 4);
   dodaj_usluge_do_wizyty_p(5, 3);
   dodaj_usluge_do_wizyty_p(5, 6);
   dodaj_usluge_do_wizyty_p(6, 9);
   dodaj_usluge_do_wizyty_p(6, 1);
   dodaj_usluge_do_wizyty_p(6, 7);
   dodaj_usluge_do_wizyty_p(7, 4);
   dodaj_usluge_do_wizyty_p(8, 3);
   dodaj_usluge_do_wizyty_p(8, 8);
   dodaj_usluge_do_wizyty_p(9, 2);
   dodaj_usluge_do_wizyty_p(10, 5);
   dodaj_usluge_do_wizyty_p(10, 9);
   dodaj_usluge_do_wizyty_p(11, 6);
   dodaj_usluge_do_wizyty_p(12, 1);
   dodaj_usluge_do_wizyty_p(12, 3);
   dodaj_usluge_do_wizyty_p(13, 4);
   dodaj_usluge_do_wizyty_p(14, 8);
   dodaj_usluge_do_wizyty_p(15, 10);
   dodaj_usluge_do_wizyty_p(15, 7);
   dodaj_usluge_do_wizyty_p(16, 9);
   dodaj_usluge_do_wizyty_p(17, 5);
   dodaj_usluge_do_wizyty_p(17, 1);
   dodaj_usluge_do_wizyty_p(18, 2);
   dodaj_usluge_do_wizyty_p(19, 6);
   dodaj_usluge_do_wizyty_p(19, 4);
   dodaj_usluge_do_wizyty_p(20, 8);
   dodaj_usluge_do_wizyty_p(20, 10);
END;
/

-----wizyta_a_lek-------

BEGIN
   dodaj_lek_do_wizyty_p(1, 5, 3);
   dodaj_lek_do_wizyty_p(2, 10, 7);
   dodaj_lek_do_wizyty_p(2, 15, 2);
   dodaj_lek_do_wizyty_p(3, 7, 4);
   dodaj_lek_do_wizyty_p(3, 20, 6);
   dodaj_lek_do_wizyty_p(4, 4, 5);
   dodaj_lek_do_wizyty_p(5, 12, 9);
   dodaj_lek_do_wizyty_p(5, 25, 1);
   dodaj_lek_do_wizyty_p(5, 30, 7);
   dodaj_lek_do_wizyty_p(6, 8, 7);
   dodaj_lek_do_wizyty_p(6, 14, 4);
   dodaj_lek_do_wizyty_p(7, 3, 8);
   dodaj_lek_do_wizyty_p(8, 18, 2);
   dodaj_lek_do_wizyty_p(8, 27, 5);
   dodaj_lek_do_wizyty_p(8, 21, 3);
   dodaj_lek_do_wizyty_p(9, 2, 6);
   dodaj_lek_do_wizyty_p(10, 22, 8);
   dodaj_lek_do_wizyty_p(10, 16, 3);
   dodaj_lek_do_wizyty_p(11, 29, 7);
   dodaj_lek_do_wizyty_p(12, 1, 9);
   dodaj_lek_do_wizyty_p(13, 11, 4);
   dodaj_lek_do_wizyty_p(13, 19, 5);
   dodaj_lek_do_wizyty_p(14, 13, 2);
   dodaj_lek_do_wizyty_p(15, 26, 6);
   dodaj_lek_do_wizyty_p(15, 9, 4);
   dodaj_lek_do_wizyty_p(16, 23, 8);
   dodaj_lek_do_wizyty_p(16, 20, 7);
   dodaj_lek_do_wizyty_p(17, 28, 3);
   dodaj_lek_do_wizyty_p(18, 17, 1);
   dodaj_lek_do_wizyty_p(18, 3, 9);
   dodaj_lek_do_wizyty_p(19, 6, 10);
   dodaj_lek_do_wizyty_p(20, 30, 5);
   dodaj_lek_do_wizyty_p(20, 24, 2);
END;

/