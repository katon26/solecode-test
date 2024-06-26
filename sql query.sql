-- 1. Tampilkan daftar buku yang tidak pernah dipinjam oleh siapapun
SELECT b.judul AS Buku
FROM Buku b
LEFT JOIN Peminjaman pm ON b.id_buku = pm.id_buku
WHERE pm.id_buku IS NULL;


-- 2. Tampilkan user yang pernah mengembalikan buku terlambat beserta dendanya
SELECT p.nama_user AS User, pm.denda AS Denda
FROM Pengguna p
JOIN Peminjaman pm ON p.id_user = pm.id_user
WHERE pm.denda > 0;


-- 3. Tampilkan user dengan daftar buku yang dipinjamnya
SELECT ROW_NUMBER() OVER (ORDER BY p.id_user) AS No, p.nama_user AS User, 
       GROUP_CONCAT(b.judul ORDER BY b.judul SEPARATOR ', ') AS Buku
FROM Pengguna p
JOIN Peminjaman pm ON p.id_user = pm.id_user
JOIN Buku b ON pm.id_buku = b.id_buku
GROUP BY p.id_user;

CREATE TEMPORARY TABLE TempUserBooks (
    No INT,
    User VARCHAR(255),
    Buku VARCHAR(255)
);

INSERT INTO TempUserBooks (No, User, Buku)
SELECT p.id_user AS No, p.nama_user AS User, b.judul AS Buku
FROM Pengguna p
JOIN Peminjaman pm ON p.id_user = pm.id_user
JOIN Buku b ON pm.id_buku = b.id_buku
ORDER BY p.id_user, b.judul DESC;

SELECT No, User, GROUP_CONCAT(Buku SEPARATOR ', ') AS Buku
FROM TempUserBooks
GROUP BY No, User
ORDER BY No;