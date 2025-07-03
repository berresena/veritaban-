SET SERVEROUTPUT ON; 

--CREATE SEQUENCE isci_seq
--START WITH 1
--INCREMENT BY 1
--MINVALUE 1
--MAXVALUE 50000
--NOCYCLE
--NOCACHE;

BEGIN
  INSERT INTO isci (iscino, isciadi, iscisoyadi, isi, muduru, isbastar, ucret)
  VALUES (isci_seq.NEXTVAL, 'Zeynep', 'Kara', 'M�hendis', 'Ahmet', TO_DATE('2020-06-15', 'YYYY-MM-DD'), 32000);

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Zeynep Kara eklendi.');
END;
/

BEGIN
  INSERT INTO isci (iscino, isciadi, iscisoyadi, isi, muduru, isbastar, ucret)
  VALUES (isci_seq.NEXTVAL, 'Elif', 'Demir', 'Dan��man', 'Ali', TO_DATE('2019-09-25', 'YYYY-MM-DD'), 28000);

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Elif Demir eklendi.');
END;
/

BEGIN
  INSERT INTO isci (iscino, isciadi, iscisoyadi, isi, muduru, isbastar, ucret)
  VALUES (isci_seq.NEXTVAL, 'Mert', 'K�l��', 'Analist', 'Zeynep', TO_DATE('2020-05-01', 'YYYY-MM-DD'), 27000);

  INSERT INTO isci (iscino, isciadi, iscisoyadi, isi, muduru, isbastar, ucret)
  VALUES (isci_seq.NEXTVAL, 'Ay�e', '�etin', 'Yaz�l�mc�', 'Ahmet', TO_DATE('2021-11-11', 'YYYY-MM-DD'), 23000);

  INSERT INTO isci (iscino, isciadi, iscisoyadi, isi, muduru, isbastar, ucret)
  VALUES (isci_seq.NEXTVAL, 'Mehmet', 'Sar�', 'Veritaban� Uzman�', 'Ali', TO_DATE('2023-02-02', 'YYYY-MM-DD'), 34000);

  INSERT INTO isci (iscino, isciadi, iscisoyadi, isi, muduru, isbastar, ucret)
  VALUES (isci_seq.NEXTVAL, 'Canan', 'Ayd�n', 'Sistem Analisti', 'Elif', TO_DATE('2022-07-07', 'YYYY-MM-DD'), 29000);

  COMMIT;
  DBMS_OUTPUT.PUT_LINE('Yeni i��i kay�tlar� ba�ar�yla eklendi.');
END;
/
