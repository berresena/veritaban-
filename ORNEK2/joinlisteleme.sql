SELECT i.ad, i.soyad, d.dept_ad
FROM ISCI i
JOIN DEPARTMAN d ON i.dept_id = d.dept_id;
--Her işçinin çalıştığı departmanı görelim 

SELECT i.ad, i.soyad, p.proje_ad, ip.gorev_aciklama
FROM ISCI i
JOIN ISCI_PROJE ip ON i.isci_id = ip.isci_id
JOIN PROJE p ON ip.proje_id = p.proje_id;
--İşçilerin projelerdeki görevleri:

--merge intersect ve minus için oluşturulan tablo
CREATE TABLE YEDEK_ISCI (
    isci_id NUMBER PRIMARY KEY,
    ad VARCHAR2(50),
    soyad VARCHAR2(50),
    pozisyon VARCHAR2(50),
    dept_id NUMBER
);
CREATE TABLE ISCI_YEDEKLIK (
    isci_id NUMBER PRIMARY KEY
);
INSERT INTO YEDEK_ISCI VALUES (101, 'Ali', 'Yılmaz', 'Kıdemli Yazılımcı', 1); -- Güncelleme yapılacak
INSERT INTO YEDEK_ISCI VALUES (104, 'Zeynep', 'Kaya', 'Stajyer', 2); -- Yeni eklenecek
INSERT INTO YEDEK_ISCI VALUES (105, 'Murat', 'Şahin', 'İK Uzmanı', 2); -- Yeni eklenecek

INSERT INTO ISCI_YEDEKLIK VALUES (101);
INSERT INTO ISCI_YEDEKLIK VALUES (104);


SELECT i.ad, p.proje_ad
FROM ISCI i
JOIN ISCI_PROJE ip ON i.isci_id = ip.isci_id
JOIN PROJE p ON ip.proje_id = p.proje_id;
--ortak olan verileri listeler.

SELECT i.ad, i.soyad, p.proje_ad
FROM ISCI i
LEFT JOIN ISCI_PROJE ip ON i.isci_id = ip.isci_id
LEFT JOIN PROJE p ON ip.proje_id = p.proje_id;
--projeye katılmayan işçileri de listeler

SELECT p.proje_ad, i.ad
FROM PROJE p
RIGHT JOIN ISCI_PROJE ip ON p.proje_id = ip.proje_id
RIGHT JOIN ISCI i ON ip.isci_id = i.isci_id;
--projesi var ama işçisi yok

MERGE INTO ISCI t
USING YEDEK_ISCI s
ON (t.isci_id = s.isci_id)
WHEN MATCHED THEN
    UPDATE SET t.pozisyon = s.pozisyon
WHEN NOT MATCHED THEN
    INSERT (isci_id, ad, soyad, pozisyon, dept_id)
    VALUES (s.isci_id, s.ad, s.soyad, s.pozisyon, s.dept_id);
SELECT * FROM ISCI;-- merge işlemi sonucunu çıktı veriyor.

SELECT ad, soyad FROM ISCI
UNION
SELECT ad, soyad FROM YEDEK_ISCI; -- 2 tabloyu birleştiriyor.

