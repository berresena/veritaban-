CREATE TABLE DEPARTMAN (
    dept_id NUMBER PRIMARY KEY,
    dept_ad VARCHAR2(50) NOT NULL
);

CREATE TABLE ISCI (
    isci_id NUMBER PRIMARY KEY,
    ad VARCHAR2(50),
    soyad VARCHAR2(50),
    pozisyon VARCHAR2(50),
    dept_id NUMBER,
    baslama_tarihi DATE,
    CONSTRAINT fk_isci_dept FOREIGN KEY (dept_id) REFERENCES DEPARTMAN(dept_id)
);

CREATE TABLE PROJE (
    proje_id NUMBER PRIMARY KEY,
    proje_ad VARCHAR2(100),
    baslangic DATE,
    bitis DATE
);

CREATE TABLE ISCI_PROJE (
    isci_id NUMBER,
    proje_id NUMBER,
    gorev_aciklama VARCHAR2(100),
    PRIMARY KEY (isci_id, proje_id),
    FOREIGN KEY (isci_id) REFERENCES ISCI(isci_id),
    FOREIGN KEY (proje_id) REFERENCES PROJE(proje_id)
);

CREATE TABLE UCRETORAN (
    isci_id NUMBER PRIMARY KEY,
    katsayi NUMBER(5,2),
    CONSTRAINT fk_ucret_isci FOREIGN KEY (isci_id) REFERENCES ISCI(isci_id)
);

-- Departman ekleme
INSERT INTO DEPARTMAN VALUES (1, 'Yaz�l�m');
INSERT INTO DEPARTMAN VALUES (2, '�nsan Kaynaklar�');

-- ���i ekleme
INSERT INTO ISCI VALUES (101, 'Ali', 'Y�lmaz', 'Yaz�l�mc�', 1, TO_DATE('2021-03-01','YYYY-MM-DD'));
INSERT INTO ISCI VALUES (102, 'Ay�e', 'Demir', '�K Uzman�', 2, TO_DATE('2022-06-15','YYYY-MM-DD'));

-- Proje ekleme
INSERT INTO PROJE VALUES (1001, 'ERP Sistemi', TO_DATE('2023-01-01','YYYY-MM-DD'), NULL);
INSERT INTO PROJE VALUES (1002, 'Mobil Uygulama', TO_DATE('2023-03-01','YYYY-MM-DD'), NULL);

-- �li�ki ekleme
INSERT INTO ISCI_PROJE VALUES (101, 1001, 'Backend geli�tirme');
INSERT INTO ISCI_PROJE VALUES (101, 1002, 'API geli�tirme');

-- �cret oranlar�
INSERT INTO UCRETORAN VALUES (101, 1.5);
INSERT INTO UCRETORAN VALUES (102, 1.2);
