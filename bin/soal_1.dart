import 'dart:io';

void main() {
  // baca input n langsung di-parse ke integer
  int n = int.parse(stdin.readLineSync()!);

  // cetak deret
  print(generateDeretA000124(n));
}

// rumus A000124: a(n) = a(n-1) + i
String generateDeretA000124(int n) {
  int hasil = 1;
  List<int> deret = [];

  for (int i = 0; i < n; i++) {
    hasil += i;
    deret.add(hasil);
  }

  return deret.join('-');
}
