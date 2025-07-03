SET SERVEROUTPUT ON;

DECLARE
  v_min_ucret NUMBER;
  v_max_ucret NUMBER;
  v_kidem     VARCHAR2(100);
BEGIN
  SELECT ENDUSUC, ENYUKUC
  INTO v_min_ucret, v_max_ucret
  FROM UCRETORAN
  WHERE ROWNUM = 1;

  FOR isci_rec IN (
    SELECT isciadi, iscisoyadi, ucret, isbastar
    FROM isci
    WHERE ucret BETWEEN v_min_ucret AND v_max_ucret
  ) LOOP
    v_kidem := FLOOR(MONTHS_BETWEEN(SYSDATE, isci_rec.isbastar)/12) || ' yýl, ' ||
               MOD(FLOOR(MONTHS_BETWEEN(SYSDATE, isci_rec.isbastar)), 12) || ' ay';

    DBMS_OUTPUT.PUT_LINE(
      isci_rec.isciadi || ' ' || isci_rec.iscisoyadi ||
      ' - Ücret: ' || isci_rec.ucret ||
      ' - Kýdem: ' || v_kidem
    );
  END LOOP;
END;
/
SELECT * FROM UCRETORAN;