import 'data.dart';
import 'input.dart';

// ============================================================
// Fungsi bantu
// ============================================================

/// Menghitung nilai akhir dari nilai tugas, UTS, dan UAS.
double hitungNilaiAkhir(Map<String, dynamic> mhs) {
final tugas = (mhs['tugas'] as num).toDouble();
final uts = (mhs['uts'] as num).toDouble();
final uas = (mhs['uas'] as num).toDouble();
  return tugas * bobotTugas + uts * bobotUts + uas * bobotUas;
}

/// Mengubah nilai akhir menjadi huruf mutu.
String hurufMutu(double nilai) => switch (nilai) {
  >= 85 => 'A',
  >= 70 => 'B',
  >= 55 => 'C',
  >= 40 => 'D',
  _ => 'E',
};

/// Mencari mahasiswa berdasarkan NIM. Mengembalikan null jika tidak ada.
Map<String, dynamic>? cariByNim(String nim) {
  for (final mhs in daftarMahasiswa) {
    if (mhs['nim'] == nim) return mhs;
  }
  return null;
}

/// Mencetak satu baris data mahasiswa.
void cetakMahasiswa(Map<String, dynamic> mhs) {
  print(
    '${mhs['nim']} | ${mhs['nama']} | '
    'Tugas ${mhs['tugas']} | UTS ${mhs['uts']} | UAS ${mhs['uas']}',
  );
}

/// Mencetak nilai akhir dan huruf mutu satu mahasiswa.
void cetakNilaiAkhir(Map<String, dynamic> mhs) {
  final akhir = hitungNilaiAkhir(mhs);
  print(
    '${mhs['nim']} | ${mhs['nama']} | '
    '${akhir.toStringAsFixed(1)} | ${hurufMutu(akhir)}',
  );
}

// ============================================================
// Fitur yang sudah jadi
// ============================================================

/// Menu 1: menampilkan semua mahasiswa.
void tampilkanDaftar() {
  print('\n=== Daftar Mahasiswa ===');
  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }
  for (final mhs in daftarMahasiswa) {
    cetakMahasiswa(mhs);
  }
}

/// Menu 2: menambah mahasiswa baru.
void tambahMahasiswa() {
  print('\n=== Tambah Mahasiswa ===');
  final nim = bacaTeks('NIM');
  if (cariByNim(nim) != null) {
    print('NIM $nim sudah terdaftar.');
    return;
  }
  final nama = bacaTeks('Nama');
  final tugas = bacaInt('Nilai tugas', min: 0, max: 100);
  final uts = bacaInt('Nilai UTS', min: 0, max: 100);
  final uas = bacaInt('Nilai UAS', min: 0, max: 100);

  daftarMahasiswa.add({
    'nim': nim,
    'nama': nama,
    'tugas': tugas,
    'uts': uts,
    'uas': uas,
  });
  print('Mahasiswa $nama berhasil ditambahkan.');
}

/// Menu 3: menampilkan nilai akhir dan huruf mutu semua mahasiswa.
void tampilkanNilaiAkhir() {
  print('\n=== Nilai Akhir ===');
  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }
  for (final mhs in daftarMahasiswa) {
    cetakNilaiAkhir(mhs);
  }
}

// ============================================================
// Fitur pilihan
// ============================================================

/// Menu 4 [Mudah]: mencari mahasiswa berdasarkan NIM.
void cariMahasiswa() {
  print('\n=== Cari Mahasiswa ===');

  final nim = bacaTeks('Masukkan NIM');
  Map<String, dynamic>? hasilPencarian;

  for (final mahasiswa in daftarMahasiswa) {
    if (mahasiswa['nim'] == nim) {
      hasilPencarian = mahasiswa;
      break;
    }
  }

  if (hasilPencarian != null) {
    print('Mahasiswa ditemukan:');
    cetakMahasiswa(hasilPencarian);
    cetakNilaiAkhir(hasilPencarian);
  } else {
    print('Mahasiswa dengan NIM $nim tidak ditemukan.');
  }
}

/// Menu 5 [Mudah]: menampilkan rata-rata nilai akhir kelas.
void tampilkanRataRata() {
  print('\n=== Rata-rata Nilai Kelas ===');

  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }

  double totalNilai = 0;

  for (final mahasiswa in daftarMahasiswa) {
    totalNilai += hitungNilaiAkhir(mahasiswa);
  }

  final rataRata = totalNilai / daftarMahasiswa.length;

  print('Jumlah mahasiswa: ${daftarMahasiswa.length}');
  print('Rata-rata nilai kelas: ${rataRata.toStringAsFixed(2)}');
}

/// Menu 6 [Sedang]: mengubah nilai tugas, UTS, dan UAS seorang mahasiswa.
void ubahNilai() {
  print('\n=== Ubah Nilai Mahasiswa ===');

  final nim = bacaTeks('Masukkan NIM mahasiswa');
  Map<String, dynamic>? mahasiswa;

  for (final data in daftarMahasiswa) {
    if (data['nim'] == nim) {
      mahasiswa = data;
      break;
    }
  }

  if (mahasiswa == null) {
    print('Mahasiswa dengan NIM $nim tidak ditemukan.');
    return;
  }

  print('\nData mahasiswa sebelum diubah:');
  cetakMahasiswa(mahasiswa);

  print('\nMasukkan nilai baru (0-100):');

  final tugas = bacaDouble('Nilai Tugas');
  final uts = bacaDouble('Nilai UTS');
  final uas = bacaDouble('Nilai UAS');

  if (tugas < 0 || tugas > 100 ||
      uts < 0 || uts > 100 ||
      uas < 0 || uas > 100) {
    print('Gagal mengubah nilai. Nilai harus antara 0 sampai 100.');
    return;
  }

  mahasiswa['tugas'] = tugas;
  mahasiswa['uts'] = uts;
  mahasiswa['uas'] = uas;

  print('\nNilai mahasiswa berhasil diubah.');
  cetakMahasiswa(mahasiswa);
  cetakNilaiAkhir(mahasiswa);
}

/// Menu 7 [Sedang]: menghapus mahasiswa berdasarkan NIM.
void hapusMahasiswa() {
  print('\n=== Hapus Mahasiswa ===');
  final nim = bacaTeks('NIM');
  final mhs = cariByNim(nim);
  if (mhs == null) {
    print('Mahasiswa dengan NIM $nim tidak ditemukan.');
    return;
  }
  daftarMahasiswa.remove(mhs);
  print('Mahasiswa ${mhs['nama']} berhasil dihapus.');
}

/// Menu 8 [Sedang]: memisahkan mahasiswa yang lulus dan tidak lulus.
void tampilkanKelulusan() {
  print('\n=== Daftar Kelulusan (batas ${batasLulus.toStringAsFixed(0)}) ===');
  final lulus = daftarMahasiswa
      .where((mhs) => hitungNilaiAkhir(mhs) >= batasLulus)
      .map((mhs) => mhs['nama'])
      .toList();
  final tidakLulus = daftarMahasiswa
      .where((mhs) => hitungNilaiAkhir(mhs) < batasLulus)
      .map((mhs) => mhs['nama'])
      .toList();
  print('Lulus (${lulus.length}): $lulus');
  print('Tidak lulus (${tidakLulus.length}): $tidakLulus');
}

/// Menu 9 [Sulit]: mengurutkan mahasiswa dari nilai akhir tertinggi.
void tampilkanRanking() {
  print('\n=== Ranking Nilai Akhir ===');
  // Salin dulu agar urutan daftarMahasiswa asli tidak berubah.
  final urut = [...daftarMahasiswa];
  urut.sort((a, b) => hitungNilaiAkhir(b).compareTo(hitungNilaiAkhir(a)));
  for (var i = 0; i < urut.length; i++) {
    cetakRanking(i + 1, urut[i]);
  }
}

/// Mencetak satu baris ranking.
void cetakRanking(int peringkat, Map<String, dynamic> mhs) {
  final akhir = hitungNilaiAkhir(mhs);
  print(
    '$peringkat. ${mhs['nama']} | '
    '${akhir.toStringAsFixed(1)} | ${hurufMutu(akhir)}',
  );
}

/// Menu 10 [Sulit]: menghitung jumlah mahasiswa untuk setiap huruf mutu.
void tampilkanStatistikHuruf() {
  print('\n=== Statistik Huruf Mutu ===');
  final jumlah = {'A': 0, 'B': 0, 'C': 0, 'D': 0, 'E': 0};
  for (final mhs in daftarMahasiswa) {
    final huruf = hurufMutu(hitungNilaiAkhir(mhs));
    jumlah[huruf] = jumlah[huruf]! + 1;
  }
  jumlah.forEach((huruf, n) => print('$huruf: $n mahasiswa'));
}
