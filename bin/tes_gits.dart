import 'dart:io';
import 'soal_1.dart' as soal1;
import 'soal_2.dart' as soal2;
import 'soal_3.dart' as soal3;

void main() {
  print('=== APLIKASI TES KERJA GITS INDONESIA ===');
  stdout.write('Pilih nomor soal (1-3): ');
  String? pilihan = stdin.readLineSync();

  switch (pilihan) {
    case '1':
      soal1.main();
      break;
    case '2':
      soal2.main();
      break;
    case '3':
      soal3.main();
      break;
    default:
      print('Pilihan tidak valid!');
  }
}
