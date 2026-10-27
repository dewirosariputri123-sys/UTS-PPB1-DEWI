import 'data.dart';
import 'input.dart';

// ============================================================
// FUNGSI BANTU
// ============================================================

// Mencari mahasiswa berdasarkan NIM
Map<String, dynamic>? cariByNim(String nim) {
  for (final mhs in daftarMahasiswa) {
    if (mhs['nim'] == nim) return mhs;
  }
  return null;
}

// Mencetak data mahasiswa
void cetakMahasiswa(Map<String, dynamic> mhs) {
  print('${mhs['nim']} | ${mhs['nama']}');
}

// Memilih status kehadiran
StatusHadir bacaStatus(String label) {
  final pilihan = bacaInt(
    '$label (1=hadir, 2=izin, 3=sakit, 4=alpa)',
    min: 1,
    max: 4,
  );

  return switch (pilihan) {
    1 => StatusHadir.hadir,
    2 => StatusHadir.izin,
    3 => StatusHadir.sakit,
    _ => StatusHadir.alpa,
  };
}

// ============================================================
// FITUR 1: LIHAT DAFTAR MAHASISWA
// ============================================================

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

// ============================================================
// FITUR 2: CATAT ABSENSI
// ============================================================

void catatAbsensi() {
  final nomor = absensi.length + 1;

  print('\n=== Catat Absensi Pertemuan $nomor ===');

  final Map<String, StatusHadir> data = {};

  for (final mhs in daftarMahasiswa) {
    data[mhs['nim'] as String] =
        bacaStatus('Status ${mhs['nama']}');
  }

  absensi[nomor] = data;

  print('Absensi pertemuan $nomor tersimpan.');
}

// ============================================================
// FITUR 3: LIHAT ABSENSI PER PERTEMUAN
// ============================================================

void tampilkanAbsensiPertemuan() {
  print('\n=== Absensi per Pertemuan ===');

  if (absensi.isEmpty) {
    print('Belum ada absensi.');
    return;
  }

  final nomor = bacaInt(
    'Nomor pertemuan',
    min: 1,
    max: absensi.length,
  );

  final data = absensi[nomor]!;

  print('Pertemuan $nomor:');

  for (final mhs in daftarMahasiswa) {
    final status = data[mhs['nim']];

    print(
      '${mhs['nim']} | ${mhs['nama']} | ${status?.name ?? '-'}',
    );
  }
}

// ============================================================
// FITUR 4: TAMBAH MAHASISWA
// ============================================================

void tambahMahasiswa() {
  print('\n=== Tambah Mahasiswa ===');

  final nim = bacaTeks('NIM');

  if (cariByNim(nim) != null) {
    print('NIM $nim sudah terdaftar.');
    return;
  }

  final nama = bacaTeks('Nama');

  daftarMahasiswa.add({
    'nim': nim,
    'nama': nama,
  });

  print('Mahasiswa $nama berhasil ditambahkan.');
}

// ============================================================
// FITUR 5: CARI MAHASISWA BERDASARKAN NAMA
// ============================================================

void cariMahasiswa() {
  print('\n=== Cari Mahasiswa ===');

  final kataKunci = bacaTeks('Nama').toLowerCase();
  var ditemukan = false;

  for (final mhs in daftarMahasiswa) {
    final nama = mhs['nama'] as String;

    if (nama.toLowerCase().contains(kataKunci)) {
      cetakMahasiswa(mhs);
      ditemukan = true;
    }
  }

  if (!ditemukan) {
    print('Mahasiswa tidak ditemukan.');
  }
}

// ============================================================
// FITUR 6: UBAH STATUS ABSENSI
// ============================================================

void ubahStatus() {
  print('\n=== Ubah Status Absensi ===');

  if (absensi.isEmpty) {
    print('Belum ada data absensi.');
    return;
  }

  final nomor = bacaInt(
    'Nomor pertemuan',
    min: 1,
    max: absensi.keys.reduce((a, b) => a > b ? a : b),
  );

  if (!absensi.containsKey(nomor)) {
    print('Data pertemuan tidak ditemukan.');
    return;
  }

  final nim = bacaTeks('NIM');
  final mhs = cariByNim(nim);

  if (mhs == null) {
    print('Mahasiswa dengan NIM $nim tidak ditemukan.');
    return;
  }

  final statusBaru = bacaStatus('Status baru');

  absensi[nomor]![nim] = statusBaru;

  print(
    'Status ${mhs['nama']} pada pertemuan $nomor '
    'diubah menjadi ${statusBaru.name}.',
  );
}

// ============================================================
// FITUR 7: REKAP PER MAHASISWA (BELUM DIKERJAKAN)
// ============================================================

void tampilkanRekap() {
  print('Fitur belum tersedia.');
}

// ============================================================
// FITUR 8: PERSENTASE KEHADIRAN (BELUM DIKERJAKAN)
// ============================================================

void tampilkanPersentase() {
  print('Fitur belum tersedia.');
}

// ============================================================
// FITUR 9: DI BAWAH BATAS KEHADIRAN (BELUM DIKERJAKAN)
// ============================================================

void tampilkanDiBawahBatas() {
  print('Fitur belum tersedia.');
}