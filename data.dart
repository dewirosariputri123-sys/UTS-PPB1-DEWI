/// Bobot setiap komponen nilai akhir (total 1.0).
const double bobotTugas = 0.3;
const double bobotUts = 0.3;
const double bobotUas = 0.4;

/// Nilai akhir minimal agar mahasiswa dinyatakan lulus.
const double batasLulus = 55;

/// Data awal mahasiswa. Setiap mahasiswa disimpan sebagai Map.
final List<Map<String, dynamic>> daftarMahasiswa = [
  {'nim': '3042025001', 'nama': 'Lusy', 'tugas': 40, 'uts': 35, 'uas': 30},
  {'nim': '3042025007', 'nama': 'Amel', 'tugas': 60, 'uts': 45, 'uas': 50},
  {'nim': '3042025013', 'nama': 'Liza', 'tugas': 90, 'uts': 88, 'uas': 92},
  {'nim': '3042025015', 'nama': 'Dewi', 'tugas': 85, 'uts': 78, 'uas': 80},
  {'nim': '3042025016', 'nama': 'Sindi', 'tugas': 70, 'uts': 65, 'uas': 60},
];
