import 'dart:io';

void main() {
  String rawInputNumber = stdin.readLineSync()!;
  String s = clean(rawInputNumber, 'string: ');

  String rawInputKuota = stdin.readLineSync()!;
  int k = int.parse(clean(rawInputKuota, 'k: '));

  String hasil = highestPalindrome(s, k);
  print(hasil);
}

String highestPalindrome(String s, int k) {
  if (k < 0 || s.isEmpty) return "-1";

  List<String> chars = s.split('');
  if (!isNumeric(chars, 0)) return "-1";

  int n = chars.length;
  List<bool> isChanged = List<bool>.filled(n, false);

  int sisaKuota = palindrome(chars, isChanged, 0, n - 1, k);
  if (sisaKuota < 0) return "-1";

  nilaiTertinggi(chars, isChanged, 0, n - 1, sisaKuota);

  return chars.join('');
}

int palindrome(
  List<String> chars,
  List<bool> isChanged,
  int left,
  int right,
  int k,
) {
  if (left >= right) return k;

  if (chars[left] != chars[right]) {
    if (k <= 0) return -1;

    if (chars[left].compareTo(chars[right]) > 0) {
      chars[right] = chars[left];
      isChanged[right] = true;
    } else {
      chars[left] = chars[right];
      isChanged[left] = true;
    }
    k--;
  }

  return palindrome(chars, isChanged, left + 1, right - 1, k);
}

void nilaiTertinggi(
  List<String> chars,
  List<bool> isChanged,
  int left,
  int right,
  int k,
) {
  if (k <= 0 || left > right) return;

  if (left == right) {
    if (chars[left] != '9' && k >= 1) {
      chars[left] = '9';
    }
    return;
  }

  if (chars[left] != '9') {
    int biaya = (isChanged[left] || isChanged[right]) ? 1 : 2;

    if (k >= biaya) {
      chars[left] = '9';
      chars[right] = '9';
      k -= biaya;
    }
  }

  nilaiTertinggi(chars, isChanged, left + 1, right - 1, k);
}

bool isNumeric(List<String> chars, int index) {
  if (index >= chars.length) return true;
  int code = chars[index].codeUnitAt(0);
  if (code < 48 || code > 57) return false;
  return isNumeric(chars, index + 1);
}

String clean(String rawInput, String prefix) {
  return rawInput.replaceFirst(prefix, '').trim();
}
