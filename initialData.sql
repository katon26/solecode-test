-- Create the Kategori table
CREATE TABLE Kategori (
    id_kategori INT PRIMARY KEY AUTO_INCREMENT,
    nama_kategori VARCHAR(255) NOT NULL
);

-- Insert data into Kategori
INSERT INTO Kategori (nama_kategori) VALUES
('Fiksi'), ('Non-Fiksi'), ('Ilmiah'), ('Sejarah'), ('Teknologi');

-- Create the Pengguna table
CREATE TABLE Pengguna (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    nama_user VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Insert data into Pengguna
INSERT INTO Pengguna (nama_user, email) VALUES
('User 1', 'user1@example.com'),
('User 2', 'user2@example.com'),
('User 3', 'user3@example.com'),
('User 4', 'user4@example.com'),
('User 5', 'user5@example.com');

-- Create the Buku table
CREATE TABLE Buku (
    id_buku INT PRIMARY KEY AUTO_INCREMENT,
    judul VARCHAR(255) NOT NULL,
    penulis VARCHAR(255) NOT NULL,
    tahun_terbit INT NOT NULL,
    id_kategori INT,
    FOREIGN KEY (id_kategori) REFERENCES Kategori(id_kategori)
);

-- Insert data into Buku
INSERT INTO Buku (judul, penulis, tahun_terbit, id_kategori) VALUES
('Buku 1', 'Penulis 1', 2001, 1),
('Buku 2', 'Penulis 2', 2002, 2),
('Buku 3', 'Penulis 3', 2003, 3),
('Buku 4', 'Penulis 4', 2004, 4),
('Buku 5', 'Penulis 5', 2005, 5),
('Buku 6', 'Penulis 6', 2006, 1),
('Buku 7', 'Penulis 7', 2007, 2),
('Buku 8', 'Penulis 8', 2008, 3),
('Buku 9', 'Penulis 9', 2009, 4),
('Buku 10', 'Penulis 10', 2010, 5);

-- Create the Peminjaman table
CREATE TABLE Peminjaman (
    id_peminjaman INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT,
    id_buku INT,
    tanggal_pinjam DATE,
    tanggal_kembali DATE,
    denda INT DEFAULT 0,
    FOREIGN KEY (id_user) REFERENCES Pengguna(id_user),
    FOREIGN KEY (id_buku) REFERENCES Buku(id_buku)
);

-- Insert data into Peminjaman
INSERT INTO Peminjaman (id_user, id_buku, tanggal_pinjam, tanggal_kembali, denda) VALUES
(1, 1, '2024-05-01', '2024-05-10', 0),
(1, 2, '2024-05-02', '2024-05-12', 0),
(1, 3, '2024-05-03', '2024-05-14', 0),
(2, 4, '2024-05-04', '2024-05-15', 0),
(2, 5, '2024-05-05', '2024-05-16', 0),
(2, 6, '2024-05-06', '2024-05-17', 0),
(3, 7, '2024-05-07', '2024-05-18', 0),
(3, 8, '2024-05-08', '2024-05-19', 0),
(3, 9, '2024-05-09', '2024-05-24', 5000);  -- Terlambat 5 hari dengan denda 5000
