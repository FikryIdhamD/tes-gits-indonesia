import 'dart:io';
// Import file soal lainnya
import 'soal_1.dart' as soal1;
// import 'soal_2.dart' as soal2;
// import 'soal_3.dart' as soal3;

void main() {
  print('=== APLIKASI TES KERJA GITS INDONESIA ===');
  stdout.write('Pilih nomor soal (1-3): ');
  String? pilihan = stdin.readLineSync();

  switch (pilihan) {
    case '1':
      soal1.main(); // Memanggil fungsi main milik soal_1
      break;
    case '2':
      // soal2.main();
      print('Soal 2 belum diimplementasikan.');
      break;
    case '3':
      // soal3.main();
      print('Soal 3 belum diimplementasikan.');
      break;
    default:
      print('Pilihan tidak valid!');
  }
}
