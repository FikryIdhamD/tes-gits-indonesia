import 'dart:io';

void main() {
  int n = int.parse(stdin.readLineSync()!);
  print(generateDeretA000124(n));
}

String generateDeretA000124(int n) {
  int hasil = 1;
  List<int> deret = [];
  for (int i = 0; i < n; i++) {
    hasil = hasil + i;
    deret.add(hasil);
  }
  return deret.join('-');
}
