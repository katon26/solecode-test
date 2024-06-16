// Definisi kelas Buku
class Buku {
    constructor(judul, pengarang) {
      this.judul = judul;
      this.pengarang = pengarang;
    }
  }
  
  // Fungsi untuk menghitung denda
  function hitungDenda(options) {
    // Mendestrukturisasi objek options untuk mendapatkan nilai yang diperlukan
    const { tanggalKembali, tanggalPinjam, daftarBuku, batasMaxPinjaman, dendaHarian, dendaMaximum } = options;
  
    // Mengubah tanggal dari string ke objek Date
    const dateKembali = new Date(tanggalKembali);
    const datePinjam = new Date(tanggalPinjam);
  
    // Mendapatkan selisih hari
    const diffTime = Math.abs(dateKembali - datePinjam);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
  
    // Inisialisasi total denda dan array denda per buku
    let totalDenda = 0;
    let dendaPerBuku = [];
  
    // Perulangan untuk setiap buku
    daftarBuku.forEach((buku) => {
      let denda = 0;
      if (diffDays > batasMaxPinjaman) {
        denda = (diffDays - batasMaxPinjaman) * dendaHarian;
      }
  
      // Memastikan denda tidak melebihi denda maksimum
      denda = Math.min(denda, dendaMaximum);
  
      // Menambahkan denda ke total denda
      totalDenda += denda;
  
      // Menyimpan denda per buku
      dendaPerBuku.push(denda);
    });
  
    // Mengembalikan hasil
    return {
      totalDenda: totalDenda,
      dendaPerBuku: dendaPerBuku
    };
  }
  
  /*
   * Note:
   * tanggalKembali dan tanggalPinjam tidak diinputkan manual karena sudah coba pakai
   * readline dan prompt namun tidak bisa dijalankan di console log, jadi di-hardcode
   * tanggalKembali dan tanggalPinjam di options. 
   *
   * Dapat diganti sebelum run debuggernya untuk melihat hasil perhitungan denda.
   *
   */

  // Contoh penggunaan fungsi dengan objek options
  const options = {
    tanggalKembali: '2024-06-15',
    tanggalPinjam: '2024-07-01',
    daftarBuku: [
      new Buku("Poet Anderson", "Tom DeLonge"),
      new Buku("Tinker Tailor Soldier Spy", "John le Carre"),
      new Buku("Lord of the Rings", "J.R.R. Tolkien")
    ],
    batasMaxPinjaman: 14,
    dendaHarian: 1000,
    dendaMaximum: 30000
  };
  
  // options sebagai parameter untuk fungsi hitungDenda, hasilnya disimpan di variabel hasilPerhitungan
  const hasilPerhitungan = hitungDenda(options);
  
  // cobaa
  console.log("Tanggal Kembali:", options.tanggalKembali); // Menampilkan tanggal kembali
  console.log("Tanggal Pinjam:", options.tanggalPinjam); // Menampilkan tanggal pinjam
  console.log("Daftar Buku Dipinjam:"); // Header untuk daftar buku dipinjam
  options.daftarBuku.forEach((buku, index) => {
    console.log(`- ${buku.judul} oleh ${buku.pengarang}, Denda: Rp ${hasilPerhitungan.dendaPerBuku[index]}`); // Menampilkan setiap buku dan denda per buku
  });
  console.log("Total Denda yang Harus Dibayar: Rp", hasilPerhitungan.totalDenda); // Menampilkan total denda yang harus dibayar
  