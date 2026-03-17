USE Basdat2025_02_SI;
GO
-----------------------------------------------------------------------------------------
								--- Create Tabel ---
-----------------------------------------------------------------------------------------

	-- Tabel Mahasiswa
	CREATE TABLE Mahasiswa (
	  NIM VARCHAR(10) PRIMARY KEY, -- Unique identifier untuk Mahasiswa
	  Nama VARCHAR(100) NOT NULL,
	  Semester INT NOT NULL,
	  Prodi VARCHAR(50) NOT NULL,
	  Angkatan INT NOT NULL,
	  Email VARCHAR(100) NOT NULL,
	  Tanggal_lahir DATE NOT NULL,
	  Alamat VARCHAR(200) NOT NULL,
	  Agama VARCHAR(20) NOT NULL,
	  Status VARCHAR(20) NOT NULL,
	  Kelas VARCHAR(10) NOT NULL
	);
	GO

	-- Tabel Data Orang Tua
	CREATE TABLE Data_orang_tua (
	  Id_dataOrangtua VARCHAR(10) PRIMARY KEY, -- Unique identifier untuk Data Orang Tua
	  NIM VARCHAR(10) NOT NULL REFERENCES Mahasiswa(NIM),
	  Nama_Ayah VARCHAR(100),
	  Nama_Ibu VARCHAR(100),
	  NIK_Ayah VARCHAR(20),
	  NIK_Ibu VARCHAR(20),
	  Tgl_Lahir_Ayah DATE,
	  Tgl_Lahir_Ibu DATE,
	  Alamat_Orangtua VARCHAR(200),
	  Pendidikan_Ayah VARCHAR(10),
	  Pekerjaan_Ayah VARCHAR(50),
	  Keterangan_Pekerjaan_Ayah VARCHAR(200),
	  Rentang_Penghasilan_Ayah VARCHAR(50),
	  Penghasilan_Pasti_Ayah VARCHAR(20),
	  NoHP_Ayah VARCHAR(20),
	  Pendidikan_Ibu VARCHAR(10),
	  Pekerjaan_Ibu VARCHAR(50),
	  Keterangan_Pekerjaan_Ibu VARCHAR(200),
	  Rentang_Penghasilan_Ibu VARCHAR(50),
	  Penghasilan_Pasti_Ibu VARCHAR(20),
	  NoHP_Ibu VARCHAR(20),
	  Total_Penghasilan_Orangtua VARCHAR(20),
	  Jumlah_Tanggungan INT,
	  Nama_Wali VARCHAR(100),
	  Tgl_Lahir_Wali DATE,
	  Alamat_Wali VARCHAR(200),
	  Keterangan_Pekerjaan_Wali VARCHAR(200),
	  Rentang_Penghasilan_Wali VARCHAR(50),
	  Penghasilan_Pasti_Wali VARCHAR(20),
	  NoHP_Wali VARCHAR(20)
	); GO

	-- Tabel Data Pribadi 
	CREATE TABLE Data_pribadi (
	  id_data_pribadi VARCHAR(10) PRIMARY KEY, -- Unique identifier untuk Data Pribadi
	  NIM VARCHAR(10) NOT NULL REFERENCES Mahasiswa(NIM),
	  nama_lengkap VARCHAR(100),
	  NIK VARCHAR(20),
	  NISN VARCHAR(20),
	  No_HP1 VARCHAR(20),
	  No_HP2 VARCHAR(20),
	  Tempat_Lahir VARCHAR(50),
	  Tanggal_Lahir DATE,
	  jenis_kelamin VARCHAR(10),
	  agama VARCHAR(20),
	  golongan_darah CHAR(2),
	  alamat VARCHAR(200),
	  kelurahan1 VARCHAR(100),
	  kelurahan2 VARCHAR(100),
	  kecamatan VARCHAR(100),
	  kode_pos VARCHAR(10),
	  email_pribadi VARCHAR(100),
	  no_telepon VARCHAR(20),
	  anak_ke INT 
	); GO

	-- Tabel Data Akademik
	CREATE TABLE Data_akademik (
	  id_data_akademis VARCHAR(10) PRIMARY KEY, -- Unique identifier untuk Data Akademik
	  NIM VARCHAR(10) NOT NULL REFERENCES Mahasiswa(NIM),
	  status_akhir VARCHAR(20),
	  tanggal_masuk DATE,
	  username VARCHAR(20),
	  email_akademik VARCHAR(100),
	  program_studi VARCHAR(100),
	  kelas VARCHAR(10),
	  jalur_usm VARCHAR(50),
	  wali_mahasiswa VARCHAR(100),
	  nilai_mahasiswa VARCHAR(10)
	); GO

	-- Tabel Data Asal Sekolah
	CREATE TABLE Data_asal_sekolah (
	  id_data_asalSekolah VARCHAR(10) PRIMARY KEY, -- Unique identifier untuk Data Asal Sekolah
	  NIM VARCHAR(10) NOT NULL REFERENCES Mahasiswa(NIM),
	  NomorIjazah_SMA VARCHAR(20),
	  Nama_SMA VARCHAR(100),
	  Alamat_SMA VARCHAR(200),
	  Telepon_SMA VARCHAR(20)
	); GO

	-- Tabel Hasil Studi
	CREATE TABLE Hasil_studi (
	  id_hasil_studi VARCHAR(10) PRIMARY KEY, -- Unique identifier untuk Hasil Studi
	  NIM VARCHAR(10) NOT NULL REFERENCES Mahasiswa(NIM),
	  tahunAjaran VARCHAR(10),
	  nama_matkul VARCHAR(100),
	  Semester VARCHAR(10),
	  Total_SKS INT,
	  nilai VARCHAR(10),
	  IP DECIMAL(3,2)
	); GO

	-- Tabel DATA_ASRAMA_DAN_PERILAKU
	CREATE TABLE DATA_ASRAMA_DAN_PERILAKU (
	  ID_ASRAMA_MHS VARCHAR(10) PRIMARY KEY,
	  NIM VARCHAR(15),                       -- FK ke MAHASISWA
	  ID_ASRAMA VARCHAR(10),                 -- FK ke tabel ASRAMA
	  KAMAR INT,
	  ID_PENGURUS VARCHAR(10),               -- FK ke PENGURUS
	  TAHUN_AJARAN VARCHAR(10),
	  SEMESTER VARCHAR(10),
	  SKOR_AWAL INT,
	  AKUMULASI_SKOR INT,
	  NILAI_HURUF CHAR(1)
);


	--Tabel TEMAN_SEKAMAR
		CREATE TABLE TEMAN_SEKAMAR (
	  ID_TEMAN INT IDENTITY(1,1) PRIMARY KEY,
	  ID_ASRAMA_MHS VARCHAR(10),             -- FK ke DATA_ASRAMA_DAN_PERILAKU
	  NAMA_TEMAN VARCHAR(100),
	  PRODI VARCHAR(100),                    -- Program Studi Teman Sekamar
	  ANGKATAN INT,                         -- Tahun Angkatan Teman Sekamar
	  FOREIGN KEY (ID_ASRAMA_MHS) REFERENCES DATA_ASRAMA_DAN_PERILAKU(ID_ASRAMA_MHS)
	);

	--Tabel PELANGGARAN_MAHASISWA
		CREATE TABLE PELANGGARAN_MAHASISWA (
	  ID_PELANGGARAN INT IDENTITY(1,1) PRIMARY KEY,
	  ID_ASRAMA_MHS VARCHAR(10),             -- FK ke DATA_ASRAMA_DAN_PERILAKU
	  ID_UNIT VARCHAR(10),                   -- FK ke UNIT
	  TANGGAL DATE,
	  DESKRIPSI_PELANGGGARAN TEXT,
	  POINT INT,
	  TINDAKAN TEXT,
	  FOREIGN KEY (ID_ASRAMA_MHS) REFERENCES DATA_ASRAMA_DAN_PERILAKU(ID_ASRAMA_MHS)
	);

	-- Tabel KRS
	CREATE TABLE KRS (
	  Id_registrasiKRS VARCHAR(10) PRIMARY KEY, -- Unique identifier untuk Registrasi KRS
	  NIM VARCHAR(10) NOT NULL REFERENCES Mahasiswa(NIM),
	  Status_registrasi VARCHAR(20),
	  Tanggal_registrasi DATE,
	  Nama_mahasiswa VARCHAR(100),
	  Kelas VARCHAR(10),
	  Dosen_wali VARCHAR(100),
	  Total_sks INT,
	  Komentar_dosen VARCHAR(200),
	  Tanggal_review DATE,
	  Status_review VARCHAR(50)
	); GO

	-- Tabel Perkuliahan
	CREATE TABLE Perkuliahan (
	  Id_perkuliahan VARCHAR(10) PRIMARY KEY,
	  Kode_matkul VARCHAR(10),
	  dosen_pengampu VARCHAR(100),
	  Tahun_kurikulum VARCHAR(10),
	  Prodi_jenjang VARCHAR(5),
	  Semester VARCHAR(10),
	  Nama_matkul VARCHAR(100),
	  sks INT,
	  Tujuan_pembelajaran TEXT,
	  silabus TEXT,
	  rpp TEXT
	);

	-- Drop kolom dosen_pengampu dari tabel perkuliahan, supaya tidak melanggar 1 NF
	`ALTER TABLE Perkuliahan DROP COLUMN dosen_pengampu;


	--Tabel dosen_pengampu
	CREATE TABLE Dosen_pengampu(
	  Id_dosen VARCHAR(10) PRIMARY KEY,
	  Nama_dosen VARCHAR(100)
	);

	--Tabel Pemetaan_Perkuliahan_Dosen_Pengampu
		CREATE TABLE Pemetaan_Perkuliahan_Dosen_Pengampu (
	  Id_perkuliahan VARCHAR(10),
	  Id_dosen VARCHAR(10),
	  Peran VARCHAR(50), -- contoh: Koordinator, Pengampu, dsb.
	);
	
	-- Tabel Krs Perkuliahan
	CREATE TABLE krs_perkuliahan (
    Id_perkuliahan VARCHAR(10) NOT NULL,
    Id_registrasiKRS VARCHAR(10) NOT NULL,
    PRIMARY KEY (Id_perkuliahan, Id_registrasiKRS),
    FOREIGN KEY (Id_perkuliahan) REFERENCES Perkuliahan(Id_perkuliahan),
    FOREIGN KEY (Id_registrasiKRS) REFERENCES KRS(Id_registrasiKRS)
	); 
	GO

	-- Tabel Pengumuman 
	CREATE TABLE Pengumuman (
  id_pengumuman            VARCHAR(10)   PRIMARY KEY,
  id_kategori_pengumuman   VARCHAR(10)   NOT NULL,
  judul                    VARCHAR(255)  NOT NULL,
  isi                      TEXT          NOT NULL,
  tanggal_mulai            DATE          NOT NULL,
  tanggal_berakhir         DATE          NOT NULL,
  status                   VARCHAR(20)   NOT NULL,
  pinned                   VARCHAR(3)    NOT NULL,    
  nama_file                VARCHAR(200)  NOT NULL,
  jenis_file               VARCHAR(20)   NOT NULL,
  size                     VARCHAR(20)   NOT NULL     
);
GO

	-- Tabel mahasiswa_pengumuman ( M : M ) 
	CREATE TABLE mahasiswa_pengumuman (
  NIM             VARCHAR(10)   NOT NULL
      CONSTRAINT fk_mp_mhs FOREIGN KEY REFERENCES Mahasiswa(NIM),
  id_pengumuman   VARCHAR(10)   NOT NULL
      CONSTRAINT fk_mp_pgn FOREIGN KEY REFERENCES Pengumuman(id_pengumuman),
  CONSTRAINT pk_mahasiswa_pengumuman PRIMARY KEY (NIM, id_pengumuman)
);
GO

	-- Tabel Kategori Pengumuman
	CREATE TABLE Kategori_pengumuman (
  id_kategori_pengumuman VARCHAR(10) PRIMARY KEY,
  nama_kategori          VARCHAR(100) NOT NULL,
  deskripsi              TEXT         NOT NULL
);
GO

	-- Tabel Matkul
	CREATE TABLE Matkul (
  kode_matkul        VARCHAR(10) PRIMARY KEY,
  nama_matkul        VARCHAR(100) NOT NULL,
  semester           INT          NOT NULL,
  sks                INT          NOT NULL,
  tahun_kurikulum    VARCHAR(9)   NOT NULL,
  tujuan_pembelajaran TEXT        NOT NULL,
  silabus            TEXT        NOT NULL,
  rpp                TEXT        NOT NULL,
  jenis_matkul       VARCHAR(20)  NOT NULL
);
GO

	-- Tabel Mahasiswa_Matkul (M:M)
	CREATE TABLE Mahasiswa_Matkul (
  NIM          VARCHAR(10) NOT NULL
      CONSTRAINT fk_mm_mhs REFERENCES Mahasiswa(NIM),
  kode_matkul  VARCHAR(10) NOT NULL
      CONSTRAINT fk_mm_matkul REFERENCES Matkul(kode_matkul),
  semester     INT          NOT NULL,
  tahun_ajaran VARCHAR(9)    NOT NULL,
  nilai        INT          NOT NULL,
  CONSTRAINT pk_mahasiswa_matkul PRIMARY KEY (NIM, kode_matkul, semester, tahun_ajaran)
);
GO

	-- Tabel Dosen
CREATE TABLE Dosen (
  id_dosen        VARCHAR(10) PRIMARY KEY,
  nama            VARCHAR(100) NOT NULL,
  email           VARCHAR(100) NOT NULL,
  status_review   VARCHAR(20)  NOT NULL,
  tanggal_review  DATE         NOT NULL
);
GO

	-- Tabel Matkul_Dosen (relasi many-to-many)
CREATE TABLE Matkul_Dosen (
  kode_matkul VARCHAR(10) NOT NULL
      CONSTRAINT fk_md_matkul REFERENCES Matkul(kode_matkul),
  kode_dosen  VARCHAR(10) NOT NULL
      CONSTRAINT fk_md_dosen  REFERENCES Dosen(id_dosen),
  CONSTRAINT pk_matkul_dosen PRIMARY KEY (kode_matkul, kode_dosen)
);
GO


	-- Tabel Presensi_Mahasiswa
CREATE TABLE Presensi_Mahasiswa (
  id_presensi_mahasiswa VARCHAR(10) PRIMARY KEY,
  kode_matkul           VARCHAR(10) NOT NULL
      CONSTRAINT fk_pm_matkul REFERENCES Matkul(kode_matkul),
  tahun_ajaran          VARCHAR(9)    NOT NULL,
  semester              INT           NOT NULL,
  nama_matkul           VARCHAR(100)  NOT NULL,
  jumlah_sks            INT           NOT NULL,
  presentasi_kehadiran  VARCHAR(10)   NOT NULL
);
GO

	-- Tabel Sesi_Kuliah
CREATE TABLE Sesi_Kuliah (
  id_sesi       VARCHAR(10) PRIMARY KEY,
  kode_matkul   VARCHAR(10) NOT NULL
      CONSTRAINT fk_sk_matkul REFERENCES Matkul(kode_matkul),
  tanggal_sesi  DATE        NOT NULL,
  minggu_ke     INT         NOT NULL,
  sesi_ke       INT         NOT NULL,
  jenis_sesi    VARCHAR(20) NOT NULL
);
GO

	-- Tabel Sesi_Praktikum
CREATE TABLE Sesi_Praktikum (
  id_sesi_praktikum VARCHAR(10)  PRIMARY KEY,
  id_sesi           VARCHAR(10)  NOT NULL
      CONSTRAINT FK_SP_SesiKuliah REFERENCES Sesi_Kuliah(id_sesi),
  tanggal_sesi      DATE         NOT NULL,
  minggu_ke         INT          NOT NULL,
  topik             VARCHAR(100) NOT NULL,
  aktivitas         TEXT         NOT NULL,
  waktu_pengerjaan  VARCHAR(20)  NOT NULL,
  setoran           DATE         NOT NULL,    
  batas_akhir       DATE         NOT NULL,   
  tempat_penyerahan VARCHAR(100) NOT NULL,    
  tujuan            TEXT         NOT NULL,    
  nama_file         VARCHAR(100) NOT NULL,    
  size              VARCHAR(10)  NOT NULL     
);
GO

	-- Tabel Sesi_Kuliah_Teori
CREATE TABLE Sesi_Kuliah_Teori (
  id_sesiteori VARCHAR(10) PRIMARY KEY,
  id_sesi      VARCHAR(10) NOT NULL
      CONSTRAINT fk_skt_sesi REFERENCES Sesi_Kuliah(id_sesi),
  tanggal_sesi DATE        NOT NULL,
  minggu_ke    INT         NOT NULL,
  nama_file    VARCHAR(200) NOT NULL,
  size         VARCHAR(20)  NOT NULL
);
GO

	-- Tabel Modul_Mingguan
CREATE TABLE Modul_Mingguan (
  id_modul       VARCHAR(10) PRIMARY KEY,
  kode_matkul    VARCHAR(10) NOT NULL
      CONSTRAINT fk_mm_modul REFERENCES Matkul(kode_matkul),
  sesi_ke        INT         NOT NULL,
  jenis_modul    VARCHAR(20) NOT NULL,
  materi         TEXT        NOT NULL,
  tanggal_upload DATE        NOT NULL
);
GO

	-- Tabel Silabus
CREATE TABLE Silabus (
  id_silabus    VARCHAR(10) PRIMARY KEY,
  kode_matkul   VARCHAR(10) NOT NULL
      CONSTRAINT fk_sil_matkul REFERENCES Matkul(kode_matkul),
  nama_matkul   VARCHAR(100) NOT NULL,
  semester      INT          NOT NULL,
  tahun_ajaran  VARCHAR(9)    NOT NULL
);
GO

	-- Tabel RPP
	CREATE TABLE RPP (
  id_RPP      VARCHAR(20) PRIMARY KEY,
  kode_matkul VARCHAR(10) NOT NULL
     CONSTRAINT FK_RPP_Matkul REFERENCES Matkul(kode_matkul),
  minggu      INT         NOT NULL,
  sesi_ke     INT         NOT NULL,
  aktivitas   VARCHAR(200)NOT NULL,
  topik       VARCHAR(200)NOT NULL,
  sub_topik   TEXT        NOT NULL
);
GO

	-- Tabel Nilai
	CREATE TABLE Nilai (
  id_nilai       VARCHAR(10) PRIMARY KEY,
  kode_matkul    VARCHAR(10) NOT NULL
     CONSTRAINT FK_Nilai_Matkul REFERENCES Matkul(kode_matkul),
  nilai_akhir    INT         NOT NULL,
  grade          CHAR(2)     NOT NULL,
  praktikum      INT         NOT NULL,
  tugas          INT         NOT NULL,
  quis           INT         NOT NULL,
  UTS            INT         NOT NULL,
  UAS            INT         NOT NULL,
  nilai_tambahan INT         NOT NULL
);
GO

	-- Tabel Mahasiswa Pengambil Matkul
	CREATE TABLE Mahasiswa_pengambilMatkul (
  NIM          VARCHAR(10) NOT NULL
     CONSTRAINT FK_MPM_Mahasiswa REFERENCES Mahasiswa(NIM),
  kode_matkul  VARCHAR(10) NOT NULL
     CONSTRAINT FK_MPM_Matkul     REFERENCES Matkul(kode_matkul),
  nama         VARCHAR(100) NOT NULL,
  prodi        VARCHAR(100) NOT NULL,
  angkatan     INT          NOT NULL,
  CONSTRAINT PK_MPM PRIMARY KEY (NIM, kode_matkul)
);
GO

	-- Tabel Payment 
	CREATE TABLE payment (
  id_payment        VARCHAR(10) PRIMARY KEY,
  id_tagihan        VARCHAR(20) NOT NULL,
  tgl_pembayaran    DATE        NOT NULL,
  periode_payment   VARCHAR(50) NOT NULL,
  cash_amount       VARCHAR(20) NULL,  -- '-' jika tidak ada
  voucher_number    VARCHAR(50) NULL,
  voucher_amount    VARCHAR(20) NULL,
  debit_amount      VARCHAR(20) NULL,
  total_amount      VARCHAR(20) NULL,
  hutang            VARCHAR(20) NULL,
  jenis_pembayaran  VARCHAR(50) NOT NULL,
  status_pembayaran VARCHAR(20) NOT NULL
);
GO

	-- Tabel History Tagihan
	CREATE TABLE history_tagihan (
  id_history_tagihan VARCHAR(20) PRIMARY KEY,
  id_payment         VARCHAR(10) NOT NULL
     CONSTRAINT FK_HT_Payment REFERENCES payment(id_payment),
  tagihan            VARCHAR(20) NOT NULL,
  periode_payment    VARCHAR(50) NOT NULL,
  cash_amount        VARCHAR(20) NULL,
  voucher_number     VARCHAR(50) NULL,
  voucher_amount     VARCHAR(20) NULL,
  hutang             VARCHAR(20) NULL,
  debit_amount       VARCHAR(20) NULL,
  total_amount       VARCHAR(20) NULL,
  jenis_pembayaran   VARCHAR(50) NOT NULL,
  status_pembayaran  VARCHAR(20) NOT NULL
);
GO

	-- Tabel Postpone Payment
	CREATE TABLE postpone_payment (
  id_postpone        VARCHAR(10) PRIMARY KEY,
  id_payment         VARCHAR(10) NOT NULL
     CONSTRAINT FK_PP_Payment REFERENCES payment(id_payment),
  postpone_date      DATE        NULL,
  payment_status     VARCHAR(20) NOT NULL,
  postpone_comment   VARCHAR(200)NULL,
  aksi               VARCHAR(100)NULL
);
GO

	-- Tabel Request Penangguhan
	CREATE TABLE request_penangguhan (
  id_request_penangguhan VARCHAR(20) PRIMARY KEY,
  id_payment             VARCHAR(10) NOT NULL
     CONSTRAINT FK_RP_Payment REFERENCES payment(id_payment),
  tipe_penangguhan       VARCHAR(50) NOT NULL,
  status_request         VARCHAR(20) NOT NULL,
  tanggal_request        DATE        NOT NULL,
  aksi                   VARCHAR(100)
);
GO

	-- Tabel Voucher
	CREATE TABLE Voucher (
  id_voucher     VARCHAR(10) PRIMARY KEY,
  id_payment     VARCHAR(10) NOT NULL
      CONSTRAINT FK_Voucher_Payment REFERENCES payment(id_payment),
  nomor_voucher  VARCHAR(50) NOT NULL,
  nilai_voucher  VARCHAR(20) NOT NULL,
  status_voucher VARCHAR(20) NOT NULL
);
GO

	-- Tabel finance_staff
	CREATE TABLE Finance_Staff (
  id_staff         VARCHAR(10) PRIMARY KEY,
  id_voucher       VARCHAR(10) NOT NULL
      CONSTRAINT FK_FS_Voucher REFERENCES Voucher(id_voucher),
  nama_staff       VARCHAR(100) NOT NULL,
  tanggal_cetak_bukti DATE      NOT NULL
);
GO

	-- Tabel Payment Detail
	CREATE TABLE Payment_Detail (
  id_payment_detail VARCHAR(15) PRIMARY KEY,
  id_payment        VARCHAR(10) NOT NULL
      CONSTRAINT FK_PD_Payment REFERENCES payment(id_payment),
  fee_description   VARCHAR(50) NOT NULL,
  fee_amount        VARCHAR(20) NOT NULL,
  status_payment    VARCHAR(20) NOT NULL,
  min_payment       VARCHAR(20) NOT NULL,
  voucher_payment   VARCHAR(20) NOT NULL,
  cash_amount       VARCHAR(20) NOT NULL,
  total_pembayaran  VARCHAR(20) NOT NULL,
  total_pembayaran_VA VARCHAR(20) NOT NULL
);
GO

	-- Tabel Tagihan
	CREATE TABLE Tagihan (
  id_tagihan     VARCHAR(20) NOT NULL,
  NIM            VARCHAR(10) NOT NULL
      CONSTRAINT FK_Tagihan_Mahasiswa REFERENCES Mahasiswa(NIM),
  fee_name       VARCHAR(50) NOT NULL,
  fee_amount     VARCHAR(20) NOT NULL,
  minimum_pay    VARCHAR(20) NOT NULL,
  status_tagihan VARCHAR(20) NOT NULL,
  nomor_VA       VARCHAR(30) NOT NULL,
  CONSTRAINT PK_Tagihan PRIMARY KEY (id_tagihan, NIM)
);
GO



--------------------------------------------------------------------------------------------------
									--- Insert Data ---
--------------------------------------------------------------------------------------------------

	-- Data Mahasiswa 
	INSERT INTO Mahasiswa VALUES
	('12S24006','Margareth Sitompul',2,'Sistem Informasi',2024,'margarethsitompul@gmail.com','2007-03-31','Sibolga','Kristen','Aktif','11SI1'),
	('12S24012','Choqy Pananda Sirait',2,'Sistem Informasi',2024,'choqysirait@gmail.com','2006-06-14','Lubuk Pakam','Kristen','Aktif','11SI1'),
	('12S24041','Nikah Suchia Panjaitan',2,'Sistem Informasi',2024,'nikahpanjaitan@gmail.com','2006-08-06','Silaen','Kristen','Aktif','11SI2'),
	('12S24042','Ventyola Rohati Napitupulu',2,'Sistem Informasi',2024,'ventyolanapitupulu@gmail.com','2005-10-09','Balige','Kristen','Aktif','11SI2'),
	('12S24043','Desnita Pardosi',2,'Sistem Informasi',2024,'desnitapardosi@gmail.com','2005-12-25','Parsoburan','Kristen','Aktif','11SI2');
	SELECT* FROM  MAHASISWA

	-- Data Orang tua
	INSERT INTO Data_orang_tua VALUES
	('ORT001','12S24006','Parulian Sitompul','Tiurma Sinaga','123123','123321','1976-01-06','1980-10-07','Pancuran Kerambil, Sibolga','S1','PNS','Guru SMA Negeri di Medan','Rp. 5,000,000 - Rp. 10,000,000','Rp. 6,500,000','081234567890','S1','Guru','Mengajar di sekolah negeri atau swasta','Rp. 3,000,000 - Rp. 6,000,000','Rp. 4,500,000','082234567890','Rp. 11,000,000',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	('ORT002','12S24012','Hotman Sirait','Hotma Nababan','123456','123654','1978-02-12','1979-03-30','Petapahan, Lubuk Pakam','SMA','Wiraswasta','Pemilik toko sembako','Rp. 3,000,000 - Rp. 5,000,000','Rp. 4,200,000','082134567891','SMP','Tidak Bekerja','Tidak bekerja','Rp. 0 - Rp. 0','Rp. 0','082134567891','Rp. 5,500,000',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	('ORT003','12S24041','Mangatur Panjaitan','Marlina Tanjung','123789','123987','1975-03-11','1978-07-23','Siraja Hutagalung, Silaen','D3','Karyawan Swasta','Staf administrasi','Rp. 4,000,000 - Rp. 7,000,000','Rp. 5,500,000','083134567892','D3','Penjual','Menjual barang','Rp. 2,000,000 - Rp. 4,000,000','Rp. 3,000,000','082134567892','Rp. 8,500,000',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	('ORT004','12S24042','Binsar Napitupu','Duma Tumanggor','123012','123210','1969-08-18','1976-05-08','Gurgur Aek Raja, Balige','S2','Dosen','Dosen tetap','Rp. 7,000,000 - Rp. 15,000,000','Rp. 9,000,000','084134567893','S2','Dosen','Mengajar di perguruan tinggi','Rp. 5,000,000 - Rp. 10,000,000','Rp. 7,500,000','082134567893','Rp. 13,500,000',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	('ORT005','12S24043','Sahat Pardosi','Delima Naiborhu','123345','123543','1977-09-29','1981-10-08','Lumban Gaol, Parsoburan','SMA','PNS','Tata usaha kecamatan','Rp. 1,000,000 - Rp. 1,999,999','Rp. 1,000,000','085134567894','SMA','Wiraswasta','Toko kelontong','Rp. 3,000,000 - Rp. 5,000,000','Rp. 4,000,000','082134567894','Rp. 10,500,000',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
	SELECT* FROM  Data_orang_tua

	-- Data Pribadi
	INSERT INTO Data_pribadi VALUES
	('001','12S24006','Margareth Bungaran Sitompul','1223','00123','083191548629','083191548629','Sibolga','2007-03-31','Perempuan','Kristen','A','Jl. Pendidikan No.10, Sibolga','Pancuran Kerambil','Pancuran Kerambil','Sibolga Kota','22512','margarethsitompul@gmail.com','063121234',2),
	('002','12S24012','Choqy Pananda Sirait','1224','001224','083580235187','083580235187','Lubuk Pakam','2006-06-14','Laki-laki','Kristen','A','Jl. Cempaka No.7, Lubuk Pakam','Petapahan','Petapahan','Lubuk Pakam','20517','choqysirait@gmail.com','061794321',3),
	('003','12S24041','Nikah Suchia Panjaitan','1225','001225','081286403654','081286403654','Silaen','2006-08-06','Perempuan','Kristen','AB','Jl. Porsea No.1, Silaen','Siraja Hutagalung','Siraja Hutagalung','Silaen','22384','nikahpanjaitan@gmail.com','063623456',2),
	('004','12S24042','Ventyola Rohati Napitupulu','1226','001226','081439864863','081439864863','Balige','2005-10-09','Perempuan','Kristen','O','Jl. Gereja No.3, Balige','Gurgur Aek Raja','Gurgur Aek Raja','Tampahan','22312','ventyolanapitupulu@gmail.com','063324567',2),
	('005','12S24043','Desnita Pardosi','1227','001227','082655936652','082655936652','Parsoburan','2005-12-25','Perempuan','Kristen','B','Jl. Raya Habinsaran','Lumban Gaol','Lumban Gaol','Habinsaran','22392','desnitapardosi@gmail.com','063823456',2);
	SELECT* FROM  Data_pribadi

	-- Data Akademik
	INSERT INTO Data_akademik VALUES
	('0001','12S24006','Aktif','2024-09-20','iss24006','iss24006@students.del.ac.id','S1 Sistem Informasi','11SI1','PMDK','Humasak Simanjuntak',NULL),
	('0002','12S24012','Aktif','2024-09-20','iss24012','iss24012@students.del.ac.id','S1 Sistem Informasi','11SI1','JPSN','Humasak Simanjuntak',NULL),
	('0003','12S24041','Aktif','2024-09-20','iss24041','iss24041@students.del.ac.id','S1 Sistem Informasi','11SI2','PMDK','Rosni Lumbantoruan, M.SiD., Ph.D.',NULL),
	('0004','12S24042','Aktif','2024-09-20','iss24042','iss24042@students.del.ac.id','S1 Sistem Informasi','11SI2','PMDK','Rosni Lumbantoruan, M.SiD., Ph.D.',NULL),
	('0005','12S24043','Aktif','2024-09-20','iss24043','iss24043@students.del.ac.id','S1 Sistem Informasi','11SI2','PMDK','Rosni Lumbantoruan, M.SiD., Ph.D.',NULL);
	SELECT* FROM  Data_akademik

	-- Data Asal Sekolah
	INSERT INTO Data_asal_sekolah VALUES
	('00001','12S24006','2021-00001','SMAN 2 Sibolga','Jl. Pendidikan No. 10, Sibolga','061-12345678'),
	('00002','12S24012','2021-00002','SMAN 2 Lubuk Pakam','Jl. Raya No. 25, Lubuk Pakam','021-87654321'),
	('00003','12S24041','2021-00003','SMAN 1 Balige','Jl. Sukarno No. 45, Balige','022-13579113'),
	('00004','12S24042','2021-00004','SMAN 2 Balige','Jl. Pahlawan No. 55, Balige','0274-432198'),
	('00005','12S24043','2021-00005','SMAN 2 Balige','Jl. Merdeka No. 50, Balige','031-98765432');
	SELECT* FROM  Data_asal_sekolah
	

	-- Data Hasil Studi
	INSERT INTO Hasil_studi VALUES
	('000001','12S24006','2025','BASDAT','Genap',19,NULL,0.00),
	('000002','12S24012','2025','BASDAT','Genap',19,NULL,0.00),
	('000003','12S24041','2025','BASDAT','Genap',19,NULL,0.00),
	('000004','12S24042','2025','BASDAT','Genap',19,NULL,0.00),
	('000005','12S24043','2025','BASDAT','Genap',19,NULL,0.00);
	SELECT* FROM Hasil_studi

	-- Data Asrama dan Perilaku
	INSERT INTO DATA_ASRAMA_DAN_PERILAKU
	(ID_ASRAMA_MHS, NIM, ID_ASRAMA, KAMAR, ID_PENGURUS, TAHUN_AJARAN, SEMESTER, SKOR_AWAL, AKUMULASI_SKOR, NILAI_HURUF) VALUES
	('0000001', '12S24006', 'ASR001', 12, 'PENG001', '2024/2025', 'Genap', 0, 0, 'A'),
	('0000002', '12S24012', 'ASR002', 15, 'PENG002', '2024/2025', 'Genap', 0, 0, 'A'),
	('0000003', '12S24041', 'ASR001', 22, 'PENG001', '2024/2025', 'Genap', 0, 0, 'A'),
	('0000004', '12S24042', 'ASR001', 4,  'PENG001', '2024/2025', 'Genap', 0, 0, 'A'),
	('0000005', '12S24043', 'ASR001', 20, 'PENG001', '2024/2025', 'Genap', 0, 0, 'A');
	SELECT* FROM  Data_asrama_dan_perilaku 

	-- Data TEMAN_SEKAMAR
	-- Untuk ID_ASRAMA_MHS '0000001'
	INSERT INTO TEMAN_SEKAMAR (ID_ASRAMA_MHS, NAMA_TEMAN, PRODI, ANGKATAN) VALUES
	('0000001', 'Nessa', 'S1 Teknik Metalurgi', 2024),
	('0000001', 'Ridawati', 'S1 Teknik Bioproses', 2024),
	('0000001', 'Griselda', 'S1 Sistem Informasi', 2024),
	('0000001', 'Morina', 'D4 Teknik Bioproses', 2024),
	('0000001', 'Grace', 'S1 Teknologi Komputer', 2024);

	-- Untuk ID_ASRAMA_MHS '0000002'
	INSERT INTO TEMAN_SEKAMAR (ID_ASRAMA_MHS, NAMA_TEMAN, PRODI, ANGKATAN) VALUES
	('0000002', 'Nicholas', 'S1 Sistem Informasi', 2024),
	('0000002', 'Tristan', 'D4 TPPL', 2024),
	('0000002', 'Jamot', 'D4 TPPL', 2024),
	('0000002', 'Julian', 'S1 Sistem Informasi', 2024),
	('0000002', 'Nahesson', 'D4 TPPL', 2024);

	-- Untuk ID_ASRAMA_MHS '0000003'
	INSERT INTO TEMAN_SEKAMAR (ID_ASRAMA_MHS, NAMA_TEMAN, PRODI, ANGKATAN) VALUES
	('0000003', 'Putri', 'S1 Teknik Metalurgi', 2024),
	('0000003', 'Joe', 'S1 Teknik Metalurgi', 2024),
	('0000003', 'Joice', 'S1 Sistem Informasi', 2024),
	('0000003', 'Yusmita', 'DIII Teknologi Komputer', 2024);

	-- Untuk ID_ASRAMA_MHS '0000004'
	INSERT INTO TEMAN_SEKAMAR (ID_ASRAMA_MHS, NAMA_TEMAN, PRODI, ANGKATAN) VALUES
	('0000004', 'Indah', 'S1 Teknik Bioproses', 2024),
	('0000004', 'Ruth', 'S1 Teknik Metalurgi', 2024),
	('0000004', 'Medyana', 'S1 Teknik Metalurgi', 2024),
	('0000004', 'Geralda', 'S1 Sistem Informasi', 2024),
	('0000004', 'Gracia', 'DIII Teknologi Komputer', 2024),
	('0000004', 'Chelsea', 'S1 Teknik Bioproses', 2024);

	-- Untuk ID_ASRAMA_MHS '0000005'
	INSERT INTO TEMAN_SEKAMAR (ID_ASRAMA_MHS, NAMA_TEMAN, PRODI, ANGKATAN) VALUES
	('0000005', 'Etinica', 'S1 Teknik Metalurgi', 2024),
	('0000005', 'Romaito', 'S1 Teknik Metalurgi', 2024),
	('0000005', 'Rosalka', 'S1 Sistem Informasi', 2024),
	('0000005', 'Iren', 'DIII Teknologi Komputer', 2024),
	('0000005', 'Irene', 'S1 Teknik Bioproses', 2024);
	SELECT* FROM TEMAN_SEKAMAR


	--Data Pelanggaran_Mahasiswa
	INSERT INTO PELANGGARAN_MAHASISWA 
	(ID_ASRAMA_MHS, ID_UNIT, TANGGAL, DESKRIPSI_PELANGGGARAN, POINT, TINDAKAN) VALUES
	('0000001', NULL, NULL, NULL, 0, NULL),
	('0000002', NULL, NULL, NULL, 0, NULL),
	('0000003', NULL, NULL, NULL, 0, NULL),
	('0000004', NULL, NULL, NULL, 0, NULL),
	('0000005', NULL, NULL, NULL, 0, NULL);
	SELECT* FROM PELANGGARAN_MAHASISWA


	-- Data KRS
	INSERT INTO KRS VALUES
	('0000001','12S24006','Disetujui','2025-01-17','Margareth Sitompul','11SI1','Humasak Simanjuntak',19,'Disetujui','2025-01-20','Sudah direview'),
	('0000002','12S24012','Disetujui','2025-01-17','Choqy Pananda Sirait','11SI1','Humasak Simanjuntak',19,'Disetujui','2025-01-20','Sudah direview'),
	('0000003','12S24041','Disetujui','2025-01-17','Nikah Suchia Panjaitan','11SI2','Rosni Lumbantoruan, M.SiD., Ph.D.',19,'Disetujui','2025-01-20','Sudah direview'),
	('0000004','12S24042','Disetujui','2025-01-17','Ventyola Rohati Napitupulu','11SI2','Rosni Lumbantoruan, M.SiD., Ph.D.',19,'Disetujui','2025-01-20','Sudah direview'),
	('0000005','12S24043','Disetujui','2025-01-17','Desnita Pardosi','11SI2','Rosni Lumbantoruan, M.SiD., Ph.D.',19,'Disetujui','2025-01-20','Sudah direview');
	SELECT* FROM KRS

	-- Data Perkuliahan	
	ALTER TABLE Perkuliahan
	ALTER COLUMN dosen_pengampu VARCHAR(500);

	INSERT INTO Perkuliahan (
	  Id_perkuliahan, Kode_matkul, Tahun_kurikulum, Prodi_jenjang, Semester,
	  Nama_matkul, sks, Tujuan_pembelajaran, silabus, rpp
	) VALUES
	('PERK001', 'MAS1201', '2024/2025', 'S1', 'Genap', 'Matematika Dasar II', 4,
	 'Mahasiswa mampu menguasai konsep integral tentu dan geometri ruang.',
	 'Teknik integrasi; deret tak hingga; deret Fourier; persamaan vektor; kalkulus multivariable; integral lipat dua dan tiga.',
	 'CPMK: menerapkan kalkulus dalam konteks teknik; metode: ceramah, latihan soal; evaluasi: kuis, tugas, UTS, UAS.'
	),

	('PERK002', 'KUS1202', '2024/2025', 'S1', 'Genap', 'Pengantar Rekayasa dan Desain', 2,
	 'Memahami peran disiplin ilmu dalam rekayasa dan desain.',
	 'Peran disiplin; sifat multi aspek; prinsip desain; proyek kelompok.',
	 'CPMK: memahami proses desain teknik; metode: ceramah, studi kasus; evaluasi: presentasi, laporan, UTS, UAS.'
	),

	('PERK003', 'KUS0202', '2024/2025', 'S1', 'Genap', 'Agama', 2,
	 'Memahami nilai keagamaan dan etika profesional.',
	 'Konsep dasar agama; nilai keagamaan; etika profesional.',
	 'CPMK: menghayati nilai keagamaan; metode: ceramah; evaluasi: tugas, UTS, UAS.'
	),

	('PERK004', '10S1201', '2024/2025', 'S1', 'Genap', 'Pengantar Prosedural', 3,
	 'Menguasai dasar algoritma dan pemrograman prosedural.',
	 'Tipe data; kontrol alur; fungsi; array; file sederhana.',
	 'CPMK: mengembangkan program prosedural; metode: ceramah & praktikum; evaluasi: tugas coding, UTS, UAS.'
	),

	('PERK005', '10S1002', '2024/2025', 'S1', 'Genap', 'Arsitektur dan Organisasi Komputer', 3,
	 'Menganalisis arsitektur dasar komputer dan sistem I/O.',
	 'Evolusi komputer; CPU; memori; I/O; set instruksi; RISC.',
	 'CPMK: memahami organisasi komputer; metode: ceramah, praktikum; evaluasi: kuis, tugas, UTS, UAS.'
	),

	('PERK006', '10S1003', '2024/2025', 'S1', 'Genap', 'Basis Data', 3,
	 'Konsep basis data dan implementasi SQL.',
	 'DBMS; model data; SQL; normalisasi; transaksi; keamanan.',
	 'CPMK: perancangan dan implementasi SQL; metode: praktikum; evaluasi: tugas, UTS, UAS.'
	),

	('PERK007', 'KUS1001', '2024/2025', 'S1', 'Genap', 'Bahasa Indonesia', 2,
	 'Menulis bahasa ilmiah dengan struktur efektif.',
	 'Pengantar EYD; kalimat efektif; bibliografi.',
	 'CPMK: menulis ilmiah; metode: diskusi; evaluasi: UTS, UAS, proyek.'
	);

	SELECT* FROM PERKULIAHAN

	-- Insert data ke tabel Dosen
	DROP TABLE IF EXISTS Dosen_Pengampu;
	INSERT INTO Dosen_pengampu (Id_dosen, Nama_dosen) VALUES
	('DOS001', 'Asido Saragih, S.Pd, M.Sc.'),
	('DOS002', 'Pdt. Suandito Parlin, M.Si.'),
	('DOS003', 'Junita Amalia, S.Pd., M.Si.'),
	('DOS004', 'Regina A. Tarigan, S.Si., M.Sc.'),
	('DOS005', 'Andrew Roha Siagian, S.Pd, M.Pd.'),
	('DOS006', 'Samuel P. Tumangbolon, S.T., M.Sc.'),
	('DOS007', 'Jenna B. William, S.T., M.Ds.'),
	('DOS008', 'Laurent Siahoko, S.Si., M.Si.'),
	('DOS009', 'Bella W. Asril, S.T., M.T.'),
	('DOS010', 'Triumanto, S.Kom., M.Kom.'),
	('DOS011', 'Gogs F. Panggabean, ST., MT., Ph.D.'),
	('DOS012', 'Chandro Pardede, S.Kom., M.Sc.'),
	('DOS013', 'Febrian C. Sidjabatur, S.T.'),
	('DOS014', 'Morris Sirait, S.T.'),
	('DOS015', 'Indra H. Tambunan, Ph.D.'),
	('DOS016', 'Sarah K. Tambunan, S.Kom., M.Cs.'),
	('DOS017', 'Expel Lumbanturunan, M.SD., Ph.D.'),
	('DOS018', 'Sun E.M. Purba, S.Kom., M.C'),
	('DOS019', 'Turma Lumban Gaol, SP., MP.');
	select* from dosen_pengampu


	--Insert data ke pemetaan perkuliahan-dosen
	DROP TABLE IF EXISTS Pemetaan_Perkuliahan_Dosen_Pengampu;
	INSERT INTO Pemetaan_Perkuliahan_Dosen_Pengampu VALUES
	-- PERK001 - Matematika Dasar II
	('PERK001', 'DOS001', 'Koordinator'),
	('PERK001', 'DOS002', 'Pengampu'),
	('PERK001', 'DOS003', 'Pengampu'),
	('PERK001', 'DOS004', 'Pengampu'),
	('PERK001', 'DOS005', 'Pengampu'),

	-- PERK002 - Pengantar Rekayasa dan Desain
	('PERK002', 'DOS006', 'Pengampu'),
	('PERK002', 'DOS007', 'Pengampu'),
	('PERK002', 'DOS008', 'Pengampu'),

	-- PERK003 - Agama
	('PERK003', 'DOS009', 'Pengampu'),

	-- PERK004 - Pengantar Prosedural
	('PERK004', 'DOS010', 'Pengampu'),
	('PERK004', 'DOS011', 'Pengampu'),
	('PERK004', 'DOS012', 'Pengampu'),
	('PERK004', 'DOS013', 'Pengampu'),
	('PERK004', 'DOS014', 'Pengampu'),

	-- PERK005 - Arsitektur dan Organisasi Komputer
	('PERK005', 'DOS015', 'Pengampu'),
	('PERK005', 'DOS016', 'Pengampu'),

	-- PERK006 - Basis Data
	('PERK006', 'DOS017', 'Pengampu'),
	('PERK006', 'DOS018', 'Pengampu'),

	-- PERK007 - Bahasa Indonesia
	('PERK007', 'DOS019', 'Pengampu');

	SELECT* FROM  Pemetaan_Perkuliahan_Dosen_Pengampu;


	-- Data KRS Perkuliahan
	INSERT INTO krs_perkuliahan (Id_perkuliahan, Id_registrasiKRS) VALUES
	  ('PERK001', '0000001'),
	  ('PERK002', '0000002'),
	  ('PERK003', '0000003'),
	  ('PERK004', '0000004'),
	  ('PERK005', '0000005');
	  SELECT* FROM krs_perkuliahan

	-- Data Pengumuman
	INSERT INTO Pengumuman
	  (id_pengumuman,id_kategori_pengumuman,judul,isi,tanggal_mulai,tanggal_berakhir,
	   status,pinned,nama_file,jenis_file,size)
	VALUES
	  ('PENG001','KAT001',
	   '[BAA]Jadwal Perkuliahan Semester Genap T.A. 2024/2025',
	   'Semester Genap Berikut ini kami sampaikan Jadwal Perkuliahan Semester Genap Tahun Ajaran 2024/2025 yang dapat diakses pada tautan yang telah tercantum. https://bit.ly/JadwalPerkuliahenGenap2425.',
	   '2025-01-15','2025-06-30',
	   'Aktif','ya'   ,'JadwalGenap2425.pdf' ,'Pdf','200 kb'),

	  ('PENG002','KAT002',
	   '[INFO KOMPETISI] 6th Widyatama International Competition (WINACTION) 2025',
	   'Kompetisi internasional untuk pelajar dan mahasiswa IT Del. Kategori: Akademik & Non‑Akademik. Hadiah total: Rp. 122.500.000.',
	   '2025-04-06','2025-05-06',
	   'Aktif','tidak','WINACTION2025.pdf'   ,'png','300 kb'),

	  ('PENG003','KAT003',
	   '[Kemahasiswaan] [Update Info] Perubahan Sistem Makan Malam Mahasiswa',
	   'Mulai 7 April 2025, makan malam menggunakan sistem piket. Mahasiswa wajib mematuhi jadwal dan ketentuan yang berlaku.',
	   '2025-07-01','2025-08-01',
	   'Aktif','ya'   ,'SistemMakanMalam.pdf' ,'pdf','1 mb'),

	  ('PENG004','KAT004',
	   '[Info] POJOK STATISTIK HADIR KEMBALI',
	   'Pojok Statistik hadir kembali setiap Jumat (10.00‑12.00 WIB) di Perpustakaan IT Del Lt. 2. Layanan gratis untuk konsultasi statistik dan data penelitian.',
	   '2025-05-01','2025-12-31',
	   'Aktif','tidak','PojokStatistik.pdf'   ,'Pdf','2 mb'),

	  ('PENG005','KAT005',
	   '[INFO KOMPETISI] Kompetisi Indonesia Research and Innovation Fair (IRIF)',
	   'Kompetisi ilmiah tingkat nasional IRIF 2025. Terdapat tiga kategori: SRC, RPC, dan 3MRC. Pendaftaran: 10 Maret – 20 Juli 2025. Hadiah puluhan juta rupiah.',
	   '2025-06-10','2025-07-20',
	   'Aktif','tidak','IRIF2025.pdf'         ,'Png','1 mb');
	   SELECT* FROM Pengumuman


	   -- Data Mahasiswa_Pengumuman
	   INSERT INTO mahasiswa_pengumuman (NIM, id_pengumuman) VALUES
	  ('12S24006','PENG001'),
	  ('12S24012','PENG002'),
	  ('12S24041','PENG003'),
	  ('12S24042','PENG004'),
	  ('12S24043','PENG005');
	  SELECT* FROM  mahasiswa_pengumuman

	  -- Data Kategori Pengumuman
	  INSERT INTO Kategori_pengumuman VALUES
	  ('KAT001', 'Akademik','Pengumuman terkait jadwal kuliah, ujian, perubahan kurikulum, atau registrasi mata kuliah.'),
	  ('KAT002', 'Beasiswa', 'Informasi pendaftaran beasiswa, syarat, dan batas waktu pengajuan.'),
	  ('KAT003', 'Kegiatan Mahasiswa','Seminar, workshop, lomba, atau kegiatan kemahasiswaan.'),
	  ('KAT004', 'Fasilitas Kampus', 'Perubahan jam layanan perpustakaan, lab, atau pemeliharaan fasilitas.'),
	  ('KAT005', 'Bursar','Lowongan magang, rekrutmen perusahaan, dan peluang karier untuk mahasiswa.');
	  SELECT* FROM  Kategori_pengumuman 


	  -- Data Matkul
	  INSERT INTO Matkul VALUES
	  ('MAS1201', 'MADAS II',          2, 4, '2024/2025', 'Mahasiswa mampu memahami dan menerapkan konsep matematika dasar.', 'Kalkulus lanjut & aplikasinya', 'ada', 'wajib'),
	  ('10S1003','BASIS DATA',         2, 3, '2024/2025', 'Pahami dasar sistem basis data','ERD, SQL, Normalisasi','ada', 'Wajib'),
	  ('10S1002','AOK',                2, 3, '2024/2025', 'Paham struktur dasar komputer','CPU, Memori, I/O','ada', 'Wajib'),
	  ('10S1201','PEMPROS',            2, 3, '2024/2025', 'Pahami dan kuasai konsep prosedural','Variabel,Fungsi, Array, Loop', 'Ada', 'wajib');
	  ('KUS1001','BAHASA INDONESIA',   2, 2, '2024/2025', 'Mahasiswa mampu berbahasa Indonesia secara baik dan benar dalam konteks akademik', 'Tata bahasa, penulisan karya ilmiah, ejaan', 'Ada', 'Wajib');
	  SELECT* FROM  Matkul

	  -- Data Mahasiswa_Matkul (M:M)
	  INSERT INTO Mahasiswa_Matkul VALUES
	  ('12S24006','MAS1201',2,'2024/2025',85),
	  ('12S24012','10S1003',2,'2024/2025',87),
	  ('12S24041','10S1002',2,'2024/2025',90),
	  ('12S24042','10S1201',2,'2024/2025',86),
	  ('12S24043','KUS1001',2,'2024/2025',89);
	  SELECT* FROM  Mahasiswa_Matkul

	  -- Data Dosen
	  INSERT INTO Dosen VALUES
	  ('D001', 'Dr. Budi Santoso','budi.santoso@itdel.ac.id','Disetujui', '2025-04-08'),
	  ('D002', 'Ir. Sari Hutapea','sari.hutapea@itdel.ac.id','Disetujui', '2025-04-13'),
	  ('D003', 'Yulius Simanjuntak','yulius.simanjuntak@itdel.ac.id','Menunggu','2025-04-16'),
	  ('D004', 'Rina Marpaung, M.Kom','rina.marpaung@itdel.ac.id','Menunggu',  '2025-04-20'),
	  ('D005', 'Antonius Gultom, M.T','antonius.gultom@itdel.ac.id','Disetujui', '2025-04-25');
	 SELECT* FROM  Dosen

	  -- Data Matkul_Dosen (M:M)
	  INSERT INTO Matkul_Dosen VALUES
	  ('MAS1201','D001'),
	  ('10S1003','D002'),
	  ('10S1002','D003'),
	  ('10S1201','D004'),
	  ('KUS1001','D005');
	  SELECT* FROM  Matkul_Dosen

	  -- Data Presensi_Mahasiswa
	  INSERT INTO Presensi_Mahasiswa VALUES
	  ('PRES001','MAS1201','2024/2025',2,'MADAS II',4,'100%'),
	  ('PRES002','10S1003','2024/2025',2,'BASIS DATA',3,'100%'),
	  ('PRES003','10S1002','2024/2025',2,'AOK',3,'100%'),
	  ('PRES004','10S1201','2024/2025',2,'PEMPROS',3,'100%'),
	  ('PRES005','KUS1001','2024/2025',2,'BAHASA INDONESIA',2,'100%');
	  SELECT* FROM  Presensi_Mahasiswa

	  -- Data Sesi_Kuliah
	  INSERT INTO Sesi_Kuliah VALUES
	  ('SES001','MAS1201','2025-05-05',16,1,'Tatap muka'),
	  ('SES002','10S1003','2025-05-06',16,4,'Tatap muka'),
	  ('SES003','10S1002','2025-05-06',16,3,'Tatap muka'),
	  ('SES004','10S1201','2025-05-06',16,2,'Tatap muka'),
	  ('SES005','KUS1001','2025-05-06',16,1,'Tatap muka');
	  SELECT* FROM  Sesi_Kuliah

	  -- Data Sesi_Praktikum
	  INSERT INTO Sesi_Praktikum VALUES
	  ('PRK001','SES001','2025-04-24',15,'structure','Pemahaman Struktur Data','120 menit','2025-04-24',
	   '2025-04-24','Ecourse','Paham struktur data.','structure','5MB'),
	  ('PRK002','SES002','2025-04-25',15,'Normalisasi','Proses Normalisasi Database','120 menit','2025-04-25',
	   '2025-04-25','Ecourse','Desain database efisien.','Normalization','5MB'),
	  ('PRK003','SES003','2025-05-09',16,'Setting up','Konfigurasi Lingkungan Pengembangan','120 menit','2025-05-12',
	   '2025-05-12','Ecourse','Mampu mengkonfigurasi lingkungan pengembangan yang diperlukan.','M03 setting up','5MB'),
	  ('PRK004','SES001','2025-05-08',16,'function','Implementasi Fungsi-fungsi Dasar','120 menit','2025-05-08',
	   '2025-05-08','Ecourse','Bisa buat fungsi.','T06 function','5MB'),
	  ('PRK005','SES002','2025-05-09',16,'Indexing dan Query Optimasi','Optimasi Index dan Query Database','120 menit','2025-05-09',
	   '2025-05-09','Ecourse','Database lebih cepat.','Data base','5MB');
	   SELECT* FROM  Sesi_Praktikum


	  -- Data Sesi_kuliah_teori
	  INSERT INTO Sesi_Kuliah_Teori VALUES
	  ('TEORI001','SES001','2025-05-05',15,'Bab_13_2_integral_beluang.pptx','5MB'),
	  ('TEORI002','SES002','2025-05-06',15,'Week15_s01_SP_and_function.pptx','5MB'),
	  ('TEORI003','SES003','2025-05-06',15,'Pipelining.pdf','5MB'),
	  ('TEORI004','SES004','2025-05-06',15,'File_operation.pdf','5MB'),
	  ('TEORI005','SES005','2025-05-06',15,'Finalisasi_paper.pptx','5MB');
	  SELECT* FROM  Sesi_kuliah_teori

	  -- Data Modul_Mingguan
	  INSERT INTO Modul_Mingguan VALUES
	  ('MOD001','MAS1201',1,'Teori','Aturan rantai','2025-05-05'),
	  ('MOD002','10S1003',4,'Teori','Function and stored procedures','2025-05-05'),
	  ('MOD003','10S1002',3,'Teori','CICS AND RISC','2025-04-29'),
	  ('MOD004','KUS1001',2,'Teori','File operation','2025-04-22'),
	  ('MOD005','KUS1001',1,'Teori','Finalisasi PKM setelah di cek Turnitin','2025-04-29');
	  SELECT* FROM  Modul_Mingguan


	  -- Data Silabus
	  INSERT INTO Silabus VALUES
	  ('SIL-MAD2','MAS1201','MADAS II',2,'2024/2025'),
	  ('SIL-BD01','10S1003','BASIS DATA',2,'2024/2025'),
	  ('SIL-AOK02','10S1002','AOK',2,'2024/2025'),
	  ('SIL-PMP1','10S1201','PEMPROS',2,'2024/2025'),
	  ('SIL-BI05','KUS1001','BAHASA INDONESIA',2,'2024/2025');
	  SELECT* FROM  Silabus


	  -- Data RPP
		INSERT INTO RPP VALUES
	  ('MAS1201-15-1', 'MAS1201', 15, 1,
	   'Pengenalan Konsep Dasar',
	   'Pengantar Aljabar Linear',
	   'Vektor, Matriks, Sistem Persamaan Linear'),

	  ('10S1003-15-4', '10S1003', 15, 4,
	   'Praktikum Analisis Data',
	   'Analisis Data dengan Python',
	   'Manipulasi Data dengan Pandas, Visualisasi Data'),

	  ('10S1002-15-3', '10S1002', 15, 3,
	   'Diskusi Studi Kasus',
	   'Manajemen Proyek Perangkat Lunak',
	   'Perencanaan Proyek, Metodologi Agile'),

	  ('10S1001-15-2', '10S1001', 15, 2,
	   'Pemrograman Lanjutan',
	   'Struktur Data dan Algoritma Tingkat Lanjut',
	   'Graf, Pohon, Algoritma Pencarian dan Pengurutan'),

	  ('10S1001-15-1', '10S1001', 15, 1,
	   'Seminar Motivasi & Tujuan',
	   'Pengembangan Diri',
	   'Penetapan Tujuan, Manajemen Waktu, Motivasi Diri');
	   SELECT* FROM  RPP

	  -- Data Nilai
		INSERT INTO Nilai VALUES
	  ('NIL001','MAS1201',80,'A',95,90,60,65,65,5),
	  ('NIL002','10S1003',89,'A',90,90,69,76,69,0),
	  ('NIL003','10S1002',85,'A',95,90,78,87,60,10),
	  ('NIL004','10S1001',90,'A',85,90,85,69,75,5),
	  ('NIL005','10S1001',95,'A',97,90,70,60,90,5);
	  SELECT* FROM  Nilai

	  -- Data Mahasiswa_pengambilMatkul
		INSERT INTO Mahasiswa_pengambilMatkul VALUES
	  ('12S24006','MAS1201','Margareth sitompul','Sistem informasi',2024),
	  ('12S24012','10S1003','Choqy sirait','Sistem informasi',2024),
	  ('12S24041','10S1002','Suchia Panjaitan','Sistem informasi',2024),
	  ('12S24042','10S1001','Ventyola napitupulu','Sistem informasi',2024),
	  ('12S24043','10S1001','Desnita pardosi','Sistem informasi',2024);
	  SELECT* FROM   Mahasiswa_pengambilMatkul

	  -- Data Payment 
	  INSERT INTO payment VALUES
	 ('PYM001','INV20250502001','2025-01-10','2025/Genap/Januari','-','VCH20250502-01','100.000','2,540,500.00','2,440,500.00','0','Transfer & Voucher','VER'),
	 ('PYM002','INV20250502001','2025-02-10','2025/Genap/Februari','-','VCH-XYZ-456','200.000','3,098,000.00','2,898,000.00','0','Transfer & Voucher','VER'),
	 ('PYM003','INV20250502001','2025-03-10','2025/Genap/Maret','-','ABC-123-XYZ','300.000','2,633,000.00','2,333,000.00','0','Transfer & Voucher','VER'),
	 ('PYM004','INV20250502001','2025-04-10','2025/Genap/April','-','VCR-9876-54','100.000','2,268,000.00','2,168,000.00','0','Transfer & Voucher','VER'),
	 ('PYM005','INV20250502001','2025-05-10','2025/Genap/Mei','-','VCH-DEF-789','200.000','800,500.00','800,300.00','0','Transfer & Voucher','VER');
	 SELECT* FROM  payment

	  -- Data history_tagihan
	  INSERT INTO history_tagihan VALUES
	 ('IST-TAG-001','PYM001','2,540,500.00','2025/Genap/Januari','-','VCH20250502-01','100.000','0','2,540,500.00','2,440,500.00','Transfer & Voucher','VER'),
	 ('IST-TAG-002','PYM002','3,098,000.00','2025/Genap/Februari','-','VCH-XYZ-456','200.000','0','3,098,000.00','2,898,000.00','Transfer & Voucher','VER'),
	 ('IST-TAG-003','PYM003','2,633,000.00','2025/Genap/Maret','-','ABC-123-XYZ','300.000','0','2,633,000.00','2,333,000.00','Transfer & Voucher','VER'),
	 ('IST-TAG-004','PYM004','2,268,000.00','2025/Genap/April','-','VCR-9876-54','100.000','0','2,268,000.00','2,168,000.00','Transfer & Voucher','VER'),
	 ('IST-TAG-005','PYM005','800,500.00','2025/Genap/Mei','-','VCH-DEF-789','200.000','0','800,500.00','800,300.00','Transfer & Voucher','VER');
	 SELECT* FROM  history_tagihan

	  -- Data postpone_payment
	  INSERT INTO postpone_payment VALUES
	 ('POST001','PYM001',NULL,'VER',NULL,NULL),
	 ('POST002','PYM002',NULL,'VER',NULL,NULL),
	 ('POST003','PYM003',NULL,'VER',NULL,NULL),
	 ('POST004','PYM004',NULL,'VER',NULL,NULL),
	 ('POST005','PYM005',NULL,'VER',NULL,NULL);
	 SELECT* FROM   postpone_payment

	  -- Data request_penangguhan
	  INSERT INTO request_penangguhan VALUES
	 ('REQ-TGL-001','PYM001','Sebagian','Disetujui','2025-01-05',NULL),
	 ('REQ-TGL-002','PYM002','Penuh','Disetujui','2025-02-05',NULL),
	 ('REQ-TGL-003','PYM003','Sebagian','Menunggu','2025-03-05','Di proses'),
	 ('REQ-TGL-004','PYM004','Penuh','Menunggu','2025-04-05','Di proses'),
	 ('REQ-TGL-005','PYM005','Sebagian','Disetujui','2025-05-05',NULL);
	 SELECT* FROM  request_penangguhan

	  -- Data Voucher
	  INSERT INTO Voucher VALUES
	  ('VCH001','PYM001','VCH20250502-01','100.000','Terpakai'),
	  ('VCH002','PYM002','VCH-XYZ-456','200.000','Terpakai'),
	  ('VCH003','PYM003','ABC-123-XYZ','300.000','Terpakai'),		
	  ('VCH004','PYM004','VCR-9876-54','100.000','Terpakai'),
	  ('VCH005','PYM005','VCH-DEF-789','200.000','Tidak terpakai');
	  SELECT* FROM  Voucher

	  -- Data finance_staff
	  INSERT INTO Finance_Staff VALUES
	  ('FS001','VCH001','Amelia Putri','2025-01-07'),
	  ('FS002','VCH002','Bima Wijaya','2025-02-07'),
	  ('FS003','VCH003','Citra Lestari','2025-03-07'),
	  ('FS004','VCH004','Dedi Kurniawan','2025-04-07'),
	  ('FS005','VCH005','Erna Susanti','2025-05-07');
	  SELECT* FROM  Finance_Staff


	  -- Data payment_detail
	  INSERT INTO Payment_Detail VALUES
	  ('PYMDET001','PYM001','Uang kuliah','2,540,500.00','VER','2,540,500.00','100.000','0','2,440,500.00','2,440,500.00'),
	  ('PYMDET002','PYM002','Uang kuliah','3,098,000.00','VER','3,098,000.00','200.000','0','2,898,000.00','2,898,000.00'),
	  ('PYMDET003','PYM003','Uang kuliah','2,633,000.00','VER','2,633,000.00','300.000','0','2,333,000.00','2,333,000.00'),
	  ('PYMDET004','PYM004','Uang kuliah','2,268,000.00','VER','2,268,000.00','100.000','0','2,168,000.00','2,168,000.00'),
	  ('PYMDET005','PYM005','Uang kuliah','800,500.00','VER','800,500.00','200.000','0','800,300.00','800,300.00');
	  SELECT* FROM  Payment_Detail



	  -- Data Tagihan
	  INSERT INTO Tagihan VALUES
	  ('INV20250502001','12S24006','Uang kuliah','2,540,500.00','2,540,500.00','VER','8881234567890123'),
	  ('INV20250502001','12S24012','Uang kuliah','3,098,000.00','3,098,000.00','VER','8881234567890123'),
	  ('INV20250502001','12S24041','Uang kuliah','2,633,000.00','2,633,000.00','VER','8881234567890123'),
	  ('INV20250502001','12S24042','Uang kuliah','2,268,000.00','2,268,000.00','VER','8881234567890123'),
	  ('INV20250502001','12S24043','Uang kuliah','800,500.00','800,500.00','VER','8881234567890123');
	  SELECT* FROM  Tagihan


--------------------------------------------------------------------------------------------------
									--- Query Dasar ---
--------------------------------------------------------------------------------------------------
--SELECT
-- Menampilkan semua mahasiswa program “Sistem Informasi”
SELECT 
NIM,
Nama,
Prodi,
Angkatan
FROM Mahasiswa
WHERE Prodi = 'Sistem Informasi';

--Menampilkan pengumuman setelah tanggal 1 Mei 2025:
SELECT * 
FROM Pengumuman 
WHERE Tanggal_mulai > '2025-05-01';

--Menampilkan mata kuliah yang namanya mengandung "Basis":
SELECT * 
FROM Matkul 
WHERE Nama_Matkul LIKE '%Basis%';

-- Menampilkan jumlah mahasiswa per program studi
SELECT 
Prodi,
COUNT(*) AS jumlah_mahasiswa
FROM Mahasiswa
GROUP BY Prodi;

-- Menampilkan detail akademik (status + email akademik) tiap mahasiswa
SELECT 
m.NIM,
m.Nama,
da.status_akhir,
da.email_akademik
FROM Mahasiswa AS m
JOIN Data_akademik AS da
ON m.NIM = da.NIM;

-- Menampilkan presensi mahasiswa 100% kehadiran
SELECT 
id_presensi_mahasiswa,
nama_matkul,
presentasi_kehadiran
FROM Presensi_Mahasiswa
WHERE presentasi_kehadiran = '100%';


--UPDATE
-- Ubah alamat mahasiswa dengan NIM tertentu
UPDATE Mahasiswa
SET Alamat = 'Medan, Sumatera Utara'
WHERE NIM = '12S24012';

SELECT NIM, Alamat
FROM Mahasiswa
WHERE NIM = '12S24012';

---- Ubah anama Dosen_Pengampu tertentu
UPDATE Dosen_Pengampu
SET Nama_dosen = 'Dr. Asido Saragih, M.Sc.'
WHERE Id_dosen = 'DOS001';
Select* from dosen_pengampu

--Ubah nama mata kuliah 
UPDATE Matkul
SET Nama_matkul = 'MATEMATIKA DASAR II'
WHERE Kode_matkul = 'MAS1201';
select * from matkul

--Ubah modul mingguan
UPDATE Modul_Mingguan
SET materi = 'Function, Stored Procedures, dan Index'
WHERE kode_matkul = '10S1003' AND sesi_ke = 4;
select * from Modul_Mingguan

--ubah nilai akhir untuk mahasiswa dengan nilai_id tertentu
UPDATE Nilai
SET nilai_akhir = 92, tugas = 88
WHERE id_nilai = 'NIL004';
select* from nilai

--ubah metode pembayaran dan status pada pembayaran id tertentu
UPDATE payment
SET jenis_pembayaran = 'Transfer Bank', status_pembayaran = 'REQ'
WHERE id_payment = 'PYM005';
select* from payment

--SET OPERATORS
--Tampilkan semua nama mahasiswa dan dosen_pengampu tanpa duplikat
SELECT Nama FROM Mahasiswa
UNION
SELECT Nama_dosen FROM Dosen_pengampu;

--Ambil semua Kode_matkul semester Genap, termasuk yang duplikat
SELECT Kode_matkul FROM Perkuliahan WHERE Semester = 'Genap'
UNION ALL
SELECT Kode_matkul FROM Perkuliahan WHERE Tahun_kurikulum = '2024/2025';

--Mata kuliah yang hanya ada di semester Genap tapi tidak di Ganjil
SELECT Nama_matkul FROM Perkuliahan WHERE Semester = 'Genap'
EXCEPT
SELECT Nama_matkul FROM Perkuliahan WHERE Semester = 'Ganjil';

--Menampilkan data yang muncul di kedua tabel
SELECT ID_ASRAMA_MHS AS NIM, NAMA_TEMAN AS NAMA FROM TEMAN_SEKAMAR
INTERSECT
SELECT Id_registrasiKRS AS NIM, Nama_mahasiswa AS NAMA FROM KRS;

--Menampilkan daftar teman sekamar dan mahasiswa yang ada di tabel KRS termasuk duplikat
SELECT ID_ASRAMA_MHS AS NIM, NAMA_TEMAN AS NAMA FROM TEMAN_SEKAMAR
UNION ALL
SELECT Id_registrasiKRS AS NIM, Nama_mahasiswa AS NAMA FROM KRS;



--AGGREGATION FUNCTION
--Menampilkan jumlah total teman sekamar untuk semua asrama:
SELECT COUNT(*) AS total_semua_teman
FROM TEMAN_SEKAMAR;

--Menampilkan rata-rata SKS dari seluruh perkuliahan
SELECT AVG(sks) AS rata_rata_sks
FROM PERKULIAHAN;

--Jumlah Dosen Pengampu per Matakuliah
SELECT Id_perkuliahan, COUNT(*) AS Jumlah_Dosen
FROM Pemetaan_Perkuliahan_Dosen_Pengampu
GROUP BY Id_perkuliahan;

--Mata Kuliah dengan Nilai Tertinggi
SELECT kode_matkul, MAX(nilai_akhir) AS nilai_tertinggi
FROM Nilai
GROUP BY kode_matkul;

--Rata-rata nilai akhir semua matkul
SELECT AVG(nilai_akhir) AS rata_rata_nilai_akhir
FROM Nilai;

-- Nilai tertinggi dan terendah dalam satu mata kuliah
SELECT
MAX(nilai_akhir) AS nilai_tertinggi, 
MIN(nilai_akhir) AS nilai_terendah
FROM Nilai
WHERE kode_matkul = 'MAS1201';


--NULL VALUE
--Cek NULL dari Data_akademik
SELECT * FROM Data_akademik
WHERE wali_mahasiswa IS NULL;

-- Cek NULL dari Data_orang_tua
SELECT * FROM Data_orang_tua
WHERE total_penghasilan_orangtua IS NULL OR jumlah_tanggungan IS NULL;


--cek null data wali dari tabel data orangtua
SELECT *
FROM Data_orang_tua
WHERE Nama_Wali IS NULL;

--menampilkan baris dari tabel PELANGGARAN_MAHASISWA yang memiliki nilai NULL
SELECT *
FROM PELANGGARAN_MAHASISWA
WHERE ID_UNIT IS NULL
   OR TANGGAL IS NULL
   OR DESKRIPSI_PELANGGGARAN IS NULL
   OR TINDAKAN IS NULL;

--Mencari email mahasiswa yang null
SELECT * 
FROM Mahasiswa
WHERE Email IS NULL;

  
--------------------------------------------------------------------------------------------------
									--- Query Nested Subqueries & Join Tabel  ---
--------------------------------------------------------------------------------------------------
  --Query Nested Subqueries
-- Menampilkan daftar mahasiswa yang memiliki nilai rata-rata (dari tabel Mahasiswa_Matkul) di atas rata-rata semua mahasiswa.
SELECT m.NIM, m.Nama, AVG(mm.nilai) AS Rata_rata_Mahasiswa
FROM Mahasiswa m
JOIN Mahasiswa_Matkul mm ON m.NIM = mm.NIM
GROUP BY m.NIM, m.Nama
HAVING AVG(mm.nilai) > (
SELECT AVG(nilai)
FROM Mahasiswa_Matkul
);

--menampilkan daftar matakuliah yang memiliki SKS lebih besar dari rata-rata SKS semua matakuliah 
SELECT
    Kode_matkul,
    Nama_matkul,
    sks
FROM
    Perkuliahan
WHERE
    sks > (
        SELECT AVG(sks) FROM Perkuliahan
    );


--Menampilkan mahasiswa yang nilai rata-ratanya lebih besar dari mahasiswa dengan NIM = '12S24042'
SELECT m.NIM, m.Nama, AVG(mm.nilai) AS Rata_rata
FROM Mahasiswa m
JOIN Mahasiswa_Matkul mm ON m.NIM = mm.NIM
GROUP BY m.NIM, m.Nama
HAVING AVG(mm.nilai) > (
SELECT AVG(nilai)
FROM Mahasiswa_Matkul
WHERE NIM = '12S24042'
);

-- Mahasiswa dengan Nilai Tertinggi per Matkul
SELECT 
mm.kode_matkul,
m.nama_matkul,
mm.NIM,
mh.Nama,
mm.nilai
FROM Mahasiswa_Matkul mm
JOIN Mahasiswa mh ON mm.NIM = mh.NIM
JOIN Matkul m ON mm.kode_matkul = m.kode_matkul
JOIN (
SELECT 
    kode_matkul,
    MAX(nilai) AS nilai_maks
FROM Mahasiswa_Matkul
GROUP BY kode_matkul
) AS max_nilai
ON mm.kode_matkul = max_nilai.kode_matkul
AND mm.nilai = max_nilai.nilai_maks;

);

--Tampilkan data nilai matakuliah yang nilainya lebih besar dari rata-rata semua nilai di tabel Nilai
SELECT *
FROM Nilai
WHERE nilai_akhir > (
    SELECT AVG(nilai_akhir)
    FROM Nilai
);

-- mengambil semua data dari tabel Nilai yang nilai akhirnya termasuk dalam 3 nilai tertinggi
SELECT * 
FROM Nilai
WHERE nilai_akhir IN (
    SELECT DISTINCT TOP 3 nilai_akhir
    FROM Nilai
    ORDER BY nilai_akhir DESC
);


--JOIN TABEL
-- Mengambil Data Mahasiswa Berserta Informasi Orang Tua(Inner Join)
SELECT 
    Mahasiswa.NIM,
    Mahasiswa.Nama AS Nama_Mahasiswa,
    Mahasiswa.Semester,
    Mahasiswa.Prodi,
    Data_orang_tua.Nama_Ayah,
    Data_orang_tua.Nama_Ibu,
    Data_orang_tua.Total_Penghasilan_Orangtua
FROM 
    Mahasiswa
INNER JOIN 
    Data_orang_tua ON Mahasiswa.NIM = Data_orang_tua.NIM;


-- Mengambil Data Mahasiswa dan Data Orang Tua (LEFT OUTER JOIN)
SELECT Mahasiswa.NIM, Mahasiswa.Nama, Mahasiswa.Semester, Mahasiswa.Prodi, 
       Data_orang_tua.Nama_Ayah, Data_orang_tua.Nama_Ibu, Data_orang_tua.Pendidikan_Ayah, 
       Data_orang_tua.Pendidikan_Ibu
FROM Mahasiswa
LEFT OUTER JOIN Data_orang_tua
  ON Mahasiswa.NIM = Data_orang_tua.NIM;

--Menampilkan Data Mahasiswa dan Data Orang Tua (RIGHT OUTER JOIN)
SELECT Mahasiswa.NIM, Mahasiswa.Nama, Mahasiswa.Prodi, Data_orang_tua.Nama_Ayah, Data_orang_tua.Nama_Ibu
FROM Mahasiswa
RIGHT OUTER JOIN Data_orang_tua
ON Mahasiswa.NIM = Data_orang_tua.NIM;

-- Mencari pasangan mahasiswa yang berada di angkatan yang sama (Self Join)
SELECT m1.NIM AS NIM_Mahasiswa_1, 
       m1.Nama AS Nama_Mahasiswa_1, 
       m2.NIM AS NIM_Mahasiswa_2, 
       m2.Nama AS Nama_Mahasiswa_2
FROM Mahasiswa m1
JOIN Mahasiswa m2 
  ON m1.Angkatan = m2.Angkatan
WHERE m1.NIM != m2.NIM;

--Menggabungkan informasi dari tabel Mahasiswa, Data_pribadi, dan Data_akademik (Union)
SELECT Nama, Semester, Prodi
FROM Mahasiswa
UNION
SELECT Nama_Ayah AS Nama, NULL AS Semester, NULL AS Prodi
FROM Data_orang_tua
UNION
SELECT Nama_Ibu AS Nama, NULL AS Semester, NULL AS Prodi
FROM Data_orang_tua;


--Menampilkan mahasiswa beserta nama ayah dan ibu
SELECT m.NIM, m.Nama, d.Nama_Ayah, d.Nama_Ibu
FROM Mahasiswa m
JOIN Data_orang_tua d ON m.NIM = d.NIM;



--------------------------------------------------------------------------------------------------
									--- Query View ---
--------------------------------------------------------------------------------------------------
--- View Mahasiswa Di Atas Rata-Rata
CREATE VIEW V_Above_Average_Students AS
SELECT m.NIM, m.Nama, AVG(mm.nilai) AS Rata_rata_Mahasiswa
FROM Mahasiswa m
JOIN Mahasiswa_Matkul mm ON m.NIM = mm.NIM
GROUP BY m.NIM, m.Nama
HAVING AVG(mm.nilai) > (
SELECT AVG(nilai)
FROM Mahasiswa_Matkul
);
SELECT * FROM V_Above_Average_Students;

--View Daftar Mahasiswa dan Orang Tua
CREATE VIEW V_Student_Parents AS
SELECT m.NIM, m.Nama, d.Nama_Ayah, d.Nama_Ibu
FROM Mahasiswa m
JOIN Data_orang_tua d ON m.NIM = d.NIM;

SELECT * FROM V_Student_Parents;


--View Mahasiswa dengan Nilai Lebih Tinggi dari Mahasiswa Tertentu
CREATE VIEW V_Students_Above_Specific_Avg AS
SELECT m.NIM, m.Nama, AVG(mm.nilai) AS Rata_rata
FROM Mahasiswa m
JOIN Mahasiswa_Matkul mm ON m.NIM = mm.NIM
GROUP BY m.NIM, m.Nama
HAVING AVG(mm.nilai) > (
SELECT AVG(nilai)
FROM Mahasiswa_Matkul
WHERE NIM = '12S24042'
);
SELECT * FROM V_Students_Above_Specific_Avg;


--View Mahasiswa dengan Nilai Tertinggi per Mata Kuliah
CREATE VIEW V_Top_Students_Per_Course AS
SELECT
mm.kode_matkul,
m.nama_matkul,
mm.NIM,
mh.Nama,
mm.nilai
FROM Mahasiswa_Matkul mm
JOIN Mahasiswa mh ON mm.NIM = mh.NIM
JOIN Matkul m ON mm.kode_matkul = m.kode_matkul
JOIN (
SELECT
    kode_matkul,
    MAX(nilai) AS nilai_maks
FROM Mahasiswa_Matkul
GROUP BY kode_matkul
) AS max_nilai
ON mm.kode_matkul = max_nilai.kode_matkul
AND mm.nilai = max_nilai.nilai_maks;

SELECT * FROM V_Top_Students_Per_Course;


--View Pengumuman yang Belum Lewat Tanggal Mulainya
CREATE VIEW V_Active_Student_Announcements AS
SELECT m.Nama AS Nama_Mahasiswa,
    p.judul AS Nama_Pengumuman,
    p.status AS Status_Pengumuman
FROM Mahasiswa m
JOIN mahasiswa_pengumuman mp ON m.NIM = mp.NIM
JOIN Pengumuman p ON mp.id_pengumuman = p.id_pengumuman
WHERE p.tanggal_mulai > GETDATE();
SELECT * FROM V_Active_Student_Announcements;

--View Mahasiswa Aktif dan Informasi Orang Tua
CREATE VIEW V_Active_Student_Parent_Income AS
SELECT m.Nama AS Nama_Mahasiswa,
    d.Nama_Ayah,
    d.Penghasilan_Pasti_Ayah
FROM Mahasiswa m
JOIN Data_orang_tua d ON m.NIM = d.NIM
WHERE m.Status = 'Aktif';
SELECT * FROM V_Active_Student_Parent_Income;



--- View: Mahasiswa Sistem Informasi
CREATE VIEW vw_Mahasiswa_SI AS
SELECT
NIM,
Nama,
Semester,
Angkatan,
Email
FROM Mahasiswa
WHERE Prodi = 'Sistem Informasi';
GO

-- Cek
SELECT * FROM vw_Mahasiswa_SI;


--- View: Jumlah Mahasiswa per Prodi
CREATE VIEW vw_JumlahMahasiswaPerProdi AS
SELECT
Prodi,
COUNT(*) AS jumlah_mahasiswa
FROM Mahasiswa
GROUP BY Prodi;
GO

-- Cek
SELECT * FROM vw_JumlahMahasiswaPerProdi;


--- View: rata‑rata nilai per semester
CREATE VIEW vw_RataNilaiPerSemester AS
SELECT
mm.NIM,
m.Nama,
mm.semester,
ROUND(AVG(mm.nilai), 2) AS nilai_rata_rata
FROM Mahasiswa_Matkul AS mm
JOIN Mahasiswa AS m
ON mm.NIM = m.NIM
GROUP BY
mm.NIM, m.Nama, mm.semester;
GO

-- Cek
SELECT * FROM vw_RataNilaiPerSemester;


--- View: detail nilai matkul per mahasiswa per semester 
CREATE VIEW vw_NilaiMatkulSemester AS
SELECT
mm.NIM,
m.Nama       AS nama_mahasiswa,
mm.semester,
mm.kode_matkul,
mk.Nama_matkul,
mm.nilai
FROM Mahasiswa_Matkul AS mm
JOIN Mahasiswa   AS m  ON mm.NIM         = m.NIM
JOIN Matkul      AS mk ON mm.kode_matkul = mk.kode_matkul;
GO

-- Cek
SELECT * FROM vw_NilaiMatkulSemester;


--- View: Data Mahasiswa Lengkap (profil + data pribadi + orang tua)
CREATE VIEW vw_Mahasiswa_Lengkap AS
SELECT
m.NIM,
m.Nama                     AS nama_mahasiswa,
m.Prodi,
m.Angkatan,
dp.email_pribadi           AS email_pribadi,
dp.alamat                  AS alamat_pribadi,
dp.Tempat_Lahir            AS tempat_lahir,
dp.Tanggal_Lahir           AS tanggal_lahir_pribadi,
dop.Nama_Ayah              AS nama_ayah,
dop.Nama_Ibu               AS nama_ibu,
dop.Alamat_Orangtua        AS alamat_orangtua
FROM Mahasiswa AS m
LEFT JOIN Data_pribadi      AS dp  ON m.NIM = dp.NIM
LEFT JOIN Data_orang_tua    AS dop ON m.NIM = dop.NIM;
GO

-- Cek
SELECT * FROM vw_Mahasiswa_Lengkap;

--------------------------------------------------------------------------------------------------
									--- Query Function ---
--------------------------------------------------------------------------------------------------

--- Fungsi: Hitung jumlah mahasiswa per program studi
CREATE FUNCTION dbo.fn_CountMahasiswaPerProdi
(
@prodi VARCHAR(50)
)
RETURNS INT
AS
BEGIN
DECLARE @cnt INT;
SELECT @cnt = COUNT(*)
FROM Mahasiswa
WHERE Prodi = @prodi;
RETURN ISNULL(@cnt, 0);
END;
GO

-- Cek
SELECT 
dbo.fn_CountMahasiswaPerProdi('Sistem Informasi') 
AS jumlah_mahasiswa;


--- Fungsi: Cek kelulusan berdasarkan nilai akhir
CREATE FUNCTION dbo.fn_CekLulus
(
@nilai INT
)
RETURNS VARCHAR(20)
AS
BEGIN
RETURN CASE 
    WHEN @nilai >= 60 THEN 'Lulus'
    ELSE 'Tidak Lulus'
    END;
END;
GO

-- Cek 
SELECT dbo.fn_CekLulus(75) AS Status_; 


--- Fungsi: Ambil email akademik mahasiswa
CREATE FUNCTION dbo.fn_GetEmailAkademik
(
@nim VARCHAR(10)
)
RETURNS VARCHAR(100)
AS
BEGIN
DECLARE @email VARCHAR(100);
SELECT @email = email_akademik
FROM Data_akademik
WHERE NIM = @nim;
RETURN ISNULL(@email, '');
END;
GO

-- Cek 
SELECT dbo.fn_GetEmailAkademik('12S24006') AS Email;   ---> Hanya perlu mengganti NIM

--Function untuk Menghitung Rata-Rata Nilai Mahasiswa
CREATE FUNCTION fn_rata_rata_mahasiswa(@NIM VARCHAR(20))
RETURNS FLOAT
AS
BEGIN
DECLARE @rata_rata FLOAT;

SELECT @rata_rata = AVG(nilai)
FROM Mahasiswa_Matkul
WHERE NIM = @NIM;

RETURN @rata_rata;
END;
-- Menggunakan Function fn_rata_rata_mahasiswa untuk menghitung rata-rata nilai mahasiswa
SELECT dbo.fn_rata_rata_mahasiswa('12S24042') AS Rata_Rata_Mahasiswa;


--Function untuk Menghitung Rata-Rata Nilai Semua Mahasiswa
CREATE FUNCTION fn_rata_rata_semua_mahasiswa()
RETURNS FLOAT
AS
BEGIN
DECLARE @rata_rata FLOAT;

SELECT @rata_rata = AVG(nilai)
FROM Mahasiswa_Matkul;

RETURN @rata_rata;
END;
-- Menggunakan Function fn_rata_rata_semua_mahasiswa untuk menghitung rata-rata nilai seluruh mahasiswa
SELECT dbo.fn_rata_rata_semua_mahasiswa() AS Rata_Rata_Semua_Mahasiswa;









--------------------------------------------------------------------------------------------------
									--- Query Procedure ---
--------------------------------------------------------------------------------------------------

--- Procedure: Tambah Mahasiswa Baru
CREATE PROCEDURE dbo.sp_AddMahasiswa
@NIM            VARCHAR(10),
@Nama           VARCHAR(100),
@Semester       INT,
@Prodi          VARCHAR(50),
@Angkatan       INT,
@Email          VARCHAR(100),
@Tanggal_lahir  DATE,
@Alamat         VARCHAR(200),
@Agama          VARCHAR(20),
@Status         VARCHAR(20),
@Kelas          VARCHAR(10)
AS
BEGIN
SET NOCOUNT ON;

INSERT INTO Mahasiswa
(NIM, Nama, Semester, Prodi, Angkatan, Email, Tanggal_lahir, Alamat, Agama, Status, Kelas)
VALUES
(@NIM, @Nama, @Semester, @Prodi, @Angkatan, @Email, @Tanggal_lahir, @Alamat, @Agama, @Status, @Kelas);
END;
GO

-- Contoh Pemanggilan/Cek
EXEC dbo.sp_AddMahasiswa  @NIM = '12S24050',  @Nama = 'Andi Wijaya',  @Semester = 10,   @Prodi = 'Sistem Informasi',   @Angkatan = 2025,  @Email = 'andi.wijaya@men.com',   @Tanggal_lahir = '2005-05-10',  @Alamat = 'Jl. Merdeka No.1',   @Agama = 'Atheis',   @Status = 'Aktif',@Kelas = '11SI3';

SELECT * 
FROM Mahasiswa
WHERE NIM = '12S24050';


---  Procedure: Tambah Pengumuman Baru
CREATE PROCEDURE dbo.sp_AddPengumuman
@id_pengumuman          VARCHAR(10),
@id_kategori_pengumuman VARCHAR(10),
@judul                  VARCHAR(255),
@isi                    TEXT,
@tanggal_mulai          DATE,
@tanggal_berakhir       DATE,
@status                 VARCHAR(20),
@pinned                 VARCHAR(3),
@nama_file              VARCHAR(200),
@jenis_file             VARCHAR(20),
@size                   VARCHAR(20)
AS
BEGIN
SET NOCOUNT ON;

INSERT INTO Pengumuman
(id_pengumuman,
    id_kategori_pengumuman,
    judul,
    isi,
    tanggal_mulai,
    tanggal_berakhir,
    status,
    pinned,
    nama_file,
    jenis_file,
    size)
VALUES
(@id_pengumuman,
    @id_kategori_pengumuman,
    @judul,
    @isi,
    @tanggal_mulai,
    @tanggal_berakhir,
    @status,
    @pinned,
    @nama_file,
    @jenis_file,
    @size);
END;
GO

-- Contoh pemanggilan/cek
EXEC dbo.sp_AddPengumuman
@id_pengumuman = 'PENG006',   @id_kategori_pengumuman = 'KAT003',  @judu = '[EVENT] Seminar Data Science',   @isi = 'Seminar akan diadakan pada 10 Mei 2025 di Auditorium IT Del.',   @tanggal_mulai = '2025-05-10',
@tanggal_berakhir = '2025-05-10',@statu = 'Aktif', @pinned  = 'tidak', @nama_file = 'SeminarDS.pdf',  @jenis_file = 'pdf',   @size = '500kb';

SELECT * 
FROM Pengumuman
WHERE id_pengumuman = 'PENG006'; ---> Ganti Kondisi ( Where )

--Menampilkan Mahasiswa dengan Nilai di Atas Rata-Rata
CREATE PROCEDURE sp_mahasiswa_lebih_dari_rata_rata
AS
BEGIN
SELECT m.NIM, m.Nama, AVG(mm.nilai) AS Rata_rata_Mahasiswa
FROM Mahasiswa m
JOIN Mahasiswa_Matkul mm ON m.NIM = mm.NIM
GROUP BY m.NIM, m.Nama
HAVING AVG(mm.nilai) > (
    SELECT AVG(nilai)
    FROM Mahasiswa_Matkul
);
END;

-- Menjalankan Stored Procedure sp_mahasiswa_lebih_dari_rata_rata
EXEC sp_mahasiswa_lebih_dari_rata_rata;
SELECT dbo.fn_rata_rata_mahasiswa('12S24042') AS Rata_Rata;

---Menampilkan Mahasiswa dengan Nilai Lebih Tinggi Dari Mahasiswa Tertentu
CREATE PROCEDURE sp_mahasiswa_lebih_dari_mahasiswa_tentukan(@NIM VARCHAR(20))
AS
BEGIN
SELECT m.NIM, m.Nama, AVG(mm.nilai) AS Rata_rata
FROM Mahasiswa m
JOIN Mahasiswa_Matkul mm ON m.NIM = mm.NIM
GROUP BY m.NIM, m.Nama
HAVING AVG(mm.nilai) > (
    SELECT AVG(nilai)
    FROM Mahasiswa_Matkul
    WHERE NIM = @NIM
);
END;
EXEC sp_mahasiswa_lebih_dari_mahasiswa_tentukan @NIM = '12S24042';









