SET SERVEROUTPUT ON;

DECLARE
  v_derece    VARCHAR2(10) := 'B';  -- Kullanýcýdan alýnan derece
  v_min_ucret NUMBER;
  v_max_ucret NUMBER;
  v_kidem     VARCHAR2(100);
BEGIN
  -- Girilen dereceye ait ücret aralýðý
  SELECT ENDUSUC, ENYUKUC
  INTO v_min_ucret, v_max_ucret
  FROM UCRETORAN
  WHERE DERECE = v_derece;

  DBMS_OUTPUT.PUT_LINE('Derece: ' || v_derece || ' -> Ücret Aralýðý: ' || v_min_ucret || ' - ' || v_max_ucret);

  -- Bu aralýkta kalan iþçiler
  FOR isci_rec IN (
    SELECT isciadi, iscisoyadi, ucret, isbastar
    FROM isci
    WHERE ucret BETWEEN v_min_ucret AND v_max_ucret
  ) LOOP
    -- Kýdem hesapla
    v_kidem := FLOOR(MONTHS_BETWEEN(SYSDATE, isci_rec.isbastar)/12) || ' yýl, ' ||
               MOD(FLOOR(MONTHS_BETWEEN(SYSDATE, isci_rec.isbastar)), 12) || ' ay';

    -- Sonuçlarý yazdýr
    DBMS_OUTPUT.PUT_LINE(
      isci_rec.isciadi || ' ' || isci_rec.iscisoyadi ||
      ' - Ücret: ' || isci_rec.ucret ||
      ' - Kýdem: ' || v_kidem
    );
  END LOOP;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Belirtilen derece için ücret aralýðý bulunamadý.');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Hata oluþtu: ' || SQLERRM);
END;
/
