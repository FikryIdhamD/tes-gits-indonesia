import 'dart:io';

void main() {
  // baca input string dan kuota ubah
  String rawString = stdin.readLineSync()!;
  String stringAngka = clean(rawString, 'string: ');

  String rawKuota = stdin.readLineSync()!;
  int kuota = int.parse(clean(rawKuota, 'k: '));

  print(highestPalindrome(stringAngka, kuota));
}

// fungsi utama cari highest palindrome
String highestPalindrome(String stringAngka, int kuota) {
  if (kuota < 0 || stringAngka.isEmpty) return "-1";

  List<String> chars = stringAngka.split('');

  // pastikan semua karakter adalah angka
  if (!isNumeric(chars, 0)) return "-1";

  int panjang = chars.length;
  List<bool> isChanged = List<bool>.filled(panjang, false);

  // bikin palindrom dulu dengan ubahan minimal
  int sisaKuota = palindrome(chars, isChanged, 0, panjang - 1, kuota);
  if (sisaKuota < 0) return "-1";

  // pakai sisa kuota buat maksimalkan angka ke 9 dari luar
  nilaiTertinggi(chars, isChanged, 0, panjang - 1, sisaKuota);

  return chars.join('');
}

// rekursif cek apakah semua karakter digit 0-9
bool isNumeric(List<String> chars, int index) {
  if (index >= chars.length) return true;
  int code = chars[index].codeUnitAt(0);
  if (code < 48 || code > 57) return false;
  return isNumeric(chars, index + 1);
}

// samakan karakter kiri dan kanan
int palindrome(
  List<String> chars,
  List<bool> isChanged,
  int left,
  int right,
  int kuota,
) {
  if (left >= right) return kuota;

  if (chars[left] != chars[right]) {
    if (kuota <= 0) return -1;

    if (chars[left].compareTo(chars[right]) > 0) {
      chars[right] = chars[left];
      isChanged[right] = true;
    } else {
      chars[left] = chars[right];
      isChanged[left] = true;
    }
    kuota--;
  }

  return palindrome(chars, isChanged, left + 1, right - 1, kuota);
}

// maksimalkan digit ke '9'
void nilaiTertinggi(
  List<String> chars,
  List<bool> isChanged,
  int left,
  int right,
  int kuota,
) {
  if (kuota <= 0 || left > right) return;

  // digit tengah kalau panjang ganjil
  if (left == right) {
    if (chars[left] != '9' && kuota >= 1) {
      chars[left] = '9';
    }
    return;
  }

  if (chars[left] != '9') {
    // kalau salah satu udah pernah diubah, cukup butuh 1 kuota lagi
    int biaya = (isChanged[left] || isChanged[right]) ? 1 : 2;

    if (kuota >= biaya) {
      chars[left] = '9';
      chars[right] = '9';
      kuota -= biaya;
    }
  }

  nilaiTertinggi(chars, isChanged, left + 1, right - 1, kuota);
}

// bersihkan prefix kayak 'string: ' atau 'k: '
String clean(String raw, String prefix) {
  return raw.replaceFirst(prefix, '').trim();
}
