--ĆWICZENIE 1

--1Napisz polecenie select, za pomocą którego uzyskasz tytuł i numer książki
select title_no, title from title

--2Napisz polecenie, które wybiera tytuł o numerze 10
select title from title where title_no = 10

--3Napisz polecenie, które wybiera numer czytelnika i karę dla tych czytelników, którzy mają kary między $8 a $9
select member_no, fine_assessed from loanhist where fine_assessed between 8 and 9

--4Napisz polecenie select, za pomocą którego uzyskasz numer książki i autora dla wszystkich książek, których autorem jest Charles Dickens lub Jane Austen
select title_no, author from title where author = 'Charles Dickens' or author = 'Jane Austen'

--5Napisz polecenie, które wybiera numer tytułu i tytuł dla wszystkich rekordów zawierających string "adventures" gdzieś w tytule
select title_no, title from title where title like '%adventures%'

--6Napisz polecenie, które wybiera numer czytelnika, kare oraz zapłaconą karę dla wszystkich, którzy jeszcze nie zaapłacili
select member_no, fine_assessed, fine_paid from loanhist where isnull(fine_assessed, 0) > isnull(fine_paid, 0) + isnull(fine_waived, 0)

--7Napisz polecenie select, za pomocą którego uzyskasz wszystkie unikalne pary city i satte
select distinct city, state from adult

--ĆWICZENIE 2

--1Napisz polecenie, które wybiera wszystkie tytuły z tablicy title i wyświetla je w porządku alfabetycznym
select title from title order by title

--2
/*
 Napisz polecenie, które:
 -wybiera numer członka biblioteki, isbn książki i wartość naliczonej kary dla wszystkich wypożyczeń, dla których naliczono karę
 -stwórz kolumnę wyliczeniową zawierającą podwojoną wartość kolumny fin3_assessed
 -stwórzalias‘doublefine’dlatejkolumny
 */
select member_no, isbn, fine_assessed * 2 as 'double fine' from loanhist where isnull(fine_assessed, 0) > 0

--3
/*
 Napisz polecenie, które:
 -
 -
 -
 */
select firstname + ' ' + middleinitial + ' ' + lastname as 'email_name'from member where lastname = 'Anderson'

select lower(firstname + middleinitial + substring(lastname, 1, 2)) as 'email_name' from member where lastname = 'Anderson'

--4
select 'The title is: ' + title + ', title number ' + cast(title_no as varchar) from title
select 'The title is: ' + title + ', title number ' + str(title_no) from title

