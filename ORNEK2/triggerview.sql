CREATE TABLE ISCI_LOG (
    log_id NUMBER PRIMARY KEY,
    isci_id NUMBER,
    tarih DATE,
    islem_tipi VARCHAR2(20)
);
--LOG KAYDI ICIN TABLO
CREATE SEQUENCE log_id_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
--LOG_ID ICIN SEQUENCE, SUREKLI OTOMARIK ARTISI SAGLAR 
CREATE OR REPLACE TRIGGER trg_log_id
BEFORE INSERT ON ISCI_LOG
FOR EACH ROW
BEGIN
    SELECT log_id_seq.NEXTVAL INTO :NEW.log_id FROM dual;
END;
--TRIGGER OLUSTURUR
CREATE OR REPLACE TRIGGER trg_isci_insert
AFTER INSERT ON ISCI
FOR EACH ROW
BEGIN
    INSERT INTO ISCI_LOG (isci_id, tarih, islem_tipi)
    VALUES (:NEW.isci_id, SYSDATE, 'EKLEME');
END;
--TRIGGERI LOG TABLOSUNA KAYITLAR
CREATE OR REPLACE VIEW VW_ISCI_PROJE_GORUNUM AS
SELECT i.isci_id, i.ad, i.soyad, p.proje_ad, ip.gorev_aciklama
FROM ISCI i
JOIN ISCI_PROJE ip ON i.isci_id = ip.isci_id
JOIN PROJE p ON p.proje_id = ip.proje_id;
-- INSERT komutunun noktalý virgülünü kaldýr (SQL Developer/TOAD dýþýnda çalýþtýrýyorsan)
--INSERT INTO ISCI VALUES (121, 'Tuna', 'Demir', 'Analist', 1, SYSDATE);

SELECT * FROM ISCI_LOG;
--EKLENEN KAYDI GORUNTULER