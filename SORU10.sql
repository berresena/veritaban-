SET SERVEROUTPUT ON;

DECLARE
  v_sayac NUMBER := 0;
BEGIN
  FOR rec IN (
    SELECT i.isciadi, i.iscisoyadi
    FROM isci i
    JOIN bolum_isci bi ON i.iscino = bi.iscino
    JOIN bolum b ON bi.bno = b.bolumno -- D�ZELT�LD�!
    WHERE LOWER(b.bolumadi) = 'bilgi i�lem'
  ) LOOP
    v_sayac := v_sayac + 1;

    DBMS_OUTPUT.PUT_LINE(
      INITCAP(rec.isciadi) || ' ' || UPPER(rec.iscisoyadi)
    );
  END LOOP;

  IF v_sayac = 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Bilgi ��lem b�l�m�nde �al��an bulunamad�.');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('HATA: ' || SQLERRM);
END;
/
