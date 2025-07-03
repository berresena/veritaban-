SET SERVEROUTPUT ON;

DECLARE
  v_ad       VARCHAR2(50) := 'Ali';
  v_soyad    VARCHAR2(50) := 'Demir';
  v_ortalama_ucret NUMBER;
  v_sayac NUMBER := 0;
BEGIN
  SELECT AVG(ucret) INTO v_ortalama_ucret FROM isci;

  FOR rec IN (
    SELECT * FROM isci
    WHERE isciadi = v_ad AND iscisoyadi = v_soyad
  ) LOOP
    IF rec.ucret < v_ortalama_ucret THEN
      UPDATE isci
      SET ucret = v_ortalama_ucret
      WHERE iscino = rec.iscino;
      v_sayac := v_sayac + 1;
    END IF;
  END LOOP;

  COMMIT;
  IF v_sayac > 0 THEN
    DBMS_OUTPUT.PUT_LINE(v_sayac || ' iþçinin maaþý güncellendi.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Güncellenecek maaþ bulunamadý.');
  END IF;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('GENEL HATA: ' || SQLERRM);
END;
/
select * from isci