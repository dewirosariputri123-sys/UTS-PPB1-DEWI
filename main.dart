import 'fitur.dart';
import 'input.dart';

void main() {
  print('=== Absensi Kelas ===');

  var berjalan = true;

  while (berjalan) {
    print('');
    print('1. Lihat daftar mahasiswa');
    print('2. Catat absensi pertemuan baru');
    print('3. Lihat absensi per pertemuan');
    print('4. Tambah mahasiswa');
    print('5. Cari mahasiswa berdasarkan nama');
    print('6. Ubah status absensi');
    print('7. Rekap per mahasiswa');
    print('8. Persentase kehadiran');
    print('9. Mahasiswa di bawah batas hadir');
    print('0. Keluar');

    final pilihan = bacaInt(
      'Pilih menu',
      min: 0,
      max: 9,
    );

    switch (pilihan) {
      case 1:
        tampilkanDaftar();
        break;
      case 2:
        catatAbsensi();
        break;
      case 3:
        tampilkanAbsensiPertemuan();
        break;
      case 4:
        tambahMahasiswa();
        break;
      case 5:
        cariMahasiswa();
        break;
      case 6:
        ubahStatus();
        break;
      case 7:
        tampilkanRekap();
        break;
      case 8:
        tampilkanPersentase();
        break;
      case 9:
        tampilkanDiBawahBatas();
        break;
      case 0:
        berjalan = false;
        break;
    }
  }

  print('Terima kasih.');
}