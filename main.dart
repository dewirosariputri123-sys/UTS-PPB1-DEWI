import 'fitur.dart';
import 'input.dart';

void main() {
  bool berjalan = true;

  while (berjalan) {
    print('\n=== Sistem Nilai Mahasiswa ===');
    print('1. Lihat Daftar Mahasiswa');
    print('2. Tambah Mahasiswa');
    print('3. Tampilkan Nilai Akhir');
    print('4. Cari Mahasiswa');
    print('5. Rata-rata Nilai Kelas');
    print('6. Ubah Nilai Mahasiswa');
    print('7. Hapus Mahasiswa');
    print('8. Tampilkan Kelulusan');
    print('9. Tampilkan Ranking');
    print('10. Statistik Huruf Mutu');
    print('0. Keluar');

    final pilihan = bacaInt('Pilih menu', min: 0, max: 10);
    print('Pilihan yang dimasukkan: $pilihan');

    switch (pilihan) {
      case 1:
        tampilkanDaftar();
        break;

      case 2:
        tambahMahasiswa();
        break;

      case 3:
        tampilkanNilaiAkhir();
        break;

      case 4:
        cariMahasiswa();
        break;

      case 5:
        tampilkanRataRata();
        break;

      case 6:
        ubahNilai();
        break;

      case 7:
        hapusMahasiswa();
        break;

      case 8:
        tampilkanKelulusan();
        break;

      case 9:
        tampilkanRanking();
        break;

      case 10:
        tampilkanStatistikHuruf();
        break;

      case 0:
        berjalan = false;
        break;
    }
  }

  print('Terima kasih.');
}