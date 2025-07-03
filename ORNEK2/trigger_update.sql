CREATE OR REPLACE TRIGGER trg_log_id
BEFORE INSERT ON ISCI_LOG
FOR EACH ROW
BEGIN
    SELECT log_id_seq.NEXTVAL INTO :NEW.log_id FROM dual;
END;

CREATE OR REPLACE TRIGGER trg_isci_update
AFTER UPDATE ON ISCI
FOR EACH ROW
BEGIN
    INSERT INTO ISCI_LOG (
        isci_id,
        tarih,
        islem_tipi,
        eski_deger,
        yeni_deger
    )
    VALUES (
        :OLD.isci_id,
        SYSDATE,
        'GÜNCELLEME',
        'POZISYON: ' || :OLD.pozisyon,
        'POZISYON: ' || :NEW.pozisyon
    );
END;
UPDATE ISCI
SET pozisyon = 'Kýdemli Yazýlýmcý'
WHERE isci_id = 101;
COMMIT;
SELECT * FROM ISCI_LOG ORDER BY tarih DESC;