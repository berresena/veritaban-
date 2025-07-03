SET SERVEROUTPUT ON;

DECLARE
  v_derece    VARCHAR2(10) := 'B';  -- Kullan�c�dan al�nan derece
  v_min_ucret NUMBER;
  v_max_ucret NUMBER;
  v_kidem     VARCHAR2(100);
BEGIN
  -- Girilen dereceye ait �cret aral���
  SELECT ENDUSUC, ENYUKUC
  INTO v_min_ucret, v_max_ucret
  FROM UCRETORAN
  WHERE DERECE = v_derece;

  DBMS_OUTPUT.PUT_LINE('Derece: ' || v_derece || ' -> �cret Aral���: ' || v_min_ucret || ' - ' || v_max_ucret);

  -- Bu aral�kta kalan i��iler
  FOR isci_rec IN (
    SELECT isciadi, iscisoyadi, ucret, isbastar
    FROM isci
    WHERE ucret BETWEEN v_min_ucret AND v_max_ucret
  ) LOOP
    -- K�dem hesapla
    v_kidem := FLOOR(MONTHS_BETWEEN(SYSDATE, isci_rec.isbastar)/12) || ' y�l, ' ||
               MOD(FLOOR(MONTHS_BETWEEN(SYSDATE, isci_rec.isbastar)), 12) || ' ay';

    -- Sonu�lar� yazd�r
    DBMS_OUTPUT.PUT_LINE(
      isci_rec.isciadi || ' ' || isci_rec.iscisoyadi ||
      ' - �cret: ' || isci_rec.ucret ||
      ' - K�dem: ' || v_kidem
    );
  END LOOP;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Belirtilen derece i�in �cret aral��� bulunamad�.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Hata olu�tu: ' || SQLERRM);
END;
/
