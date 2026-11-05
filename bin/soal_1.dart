import 'dart:io';

main() {
  int n = int.parse(stdin.readLineSync()!);
  generateDeretA000124(n);
}

void generateDeretA000124(int n) {
  int hasil = 1;
  List<int> deret = [];
  for (int i = 0; i < n; i++) {
    hasil = hasil + i;
    deret.add(hasil);
  }
  print(deret.join('-'));
}
