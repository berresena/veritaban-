SET SERVEROUTPUT ON;

DECLARE
  CURSOR cur_en_kucuk_isciler IS
    SELECT isciadi
    FROM (
      SELECT isciadi
      FROM isci
      ORDER BY ucret ASC
    )
    WHERE ROWNUM <= 5;

BEGIN
  FOR isci_rec IN cur_en_kucuk_isciler LOOP
    DBMS_OUTPUT.PUT_LINE(UPPER(isci_rec.isciadi));
  END LOOP;
END;
/
