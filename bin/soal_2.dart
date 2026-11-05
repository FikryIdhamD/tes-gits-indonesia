import 'dart:io';

main() {
  int jumlahPemain = int.parse(stdin.readLineSync()!);

  List<int> skorPemain = stdin
      .readLineSync()!
      .split(' ')
      .map((skor) => int.parse(skor))
      .toList();
  int jumlahGameGits = int.parse(stdin.readLineSync()!);

  List<int> skorGits = stdin
      .readLineSync()!
      .split(' ')
      .map((skor) => int.parse(skor))
      .toList();

  List<int> hasil = denseRanking(
    skorPemain,
    jumlahPemain,
    skorGits,
    jumlahGameGits,
  );

  print(hasil.join(' '));
}

denseRanking(
  List<int> skorPemain,
  int jumlahPemain,
  List<int> skorGits,
  int jumlahGameGits,
) {
  List<int> leaderboardUnik = [];

  int ukuranUnik = 0;

  for (int i = 0; i < jumlahPemain; i++) {
    int skorSekarang = skorPemain[i];

    bool sudahAda = false;

    for (int j = 0; j < ukuranUnik; j++) {
      if (leaderboardUnik[j] == skorSekarang) {
        sudahAda = true;
        break;
      }
    }

    if (!sudahAda) {
      leaderboardUnik.add(skorSekarang);
      ukuranUnik++;

      int k = ukuranUnik - 1;
      while (k > 0 && leaderboardUnik[k] > leaderboardUnik[k - 1]) {
        int temp = leaderboardUnik[k];
        leaderboardUnik[k] = leaderboardUnik[k - 1];
        leaderboardUnik[k - 1] = temp;
        k--;
      }
    }
  }

  List<int> hasilRanking = [];

  for (int i = 0; i < jumlahGameGits; i++) {
    int skorBaru = skorGits[i];
    int low = 0;
    int high = ukuranUnik - 1;
    int peringkat = -1;

    while (low <= high) {
      int mid = low + ((high - low) ~/ 2);

      if (skorBaru == leaderboardUnik[mid]) {
        peringkat = mid + 1;
        break;
      } else if (skorBaru > leaderboardUnik[mid]) {
        high = mid - 1;
      } else {
        low = mid + 1;
      }
    }

    if (peringkat == -1) {
      peringkat = low + 1;
    }

    hasilRanking.add(peringkat);
  }

  return hasilRanking;
}
