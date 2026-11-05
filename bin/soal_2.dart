import 'dart:io';

void main() {
  // input pemain & skornya
  int jumlahPemain = int.parse(stdin.readLineSync()!);
  List<int> skorPemain = stdin
      .readLineSync()!
      .trim()
      .split(' ')
      .map((skor) => int.parse(skor))
      .toList();

  // input game gits & skornya
  int jumlahGame = int.parse(stdin.readLineSync()!);
  List<int> skorGits = stdin
      .readLineSync()!
      .trim()
      .split(' ')
      .map((skor) => int.parse(skor))
      .toList();

  // hitung ranking dense
  List<int> hasil = denseRanking(
    skorPemain,
    jumlahPemain,
    skorGits,
    jumlahGame,
  );

  print(hasil.join(' '));
}

// fungsi dense ranking
List<int> denseRanking(
  List<int> skorPemain,
  int jumlahPemain,
  List<int> skorGits,
  int jumlahGame,
) {
  // ambil skor unik (dense ranking: skor sama, rank sama)
  List<int> leaderboard = [];
  for (int i = 0; i < jumlahPemain; i++) {
    int skor = skorPemain[i];
    if (leaderboard.isEmpty || leaderboard.last != skor) {
      leaderboard.add(skor);
    }
  }

  List<int> hasil = [];

  // cari rank tiap skor gits pakai binary search
  for (int i = 0; i < jumlahGame; i++) {
    int skor = skorGits[i];
    int low = 0;
    int high = leaderboard.length - 1;
    int rank = -1;

    while (low <= high) {
      int mid = low + ((high - low) ~/ 2);

      // kalau skor sama persis, rank sesuai indeks + 1
      if (skor == leaderboard[mid]) {
        rank = mid + 1;
        break;
      } else if (skor > leaderboard[mid]) {
        // karena leaderboard urut turun (descending), angka lebih besar ada di kiri
        high = mid - 1;
      } else {
        // angka lebih kecil ada di kanan
        low = mid + 1;
      }
    }

    // kalau skor ga ada di leaderboard, low otomatis jadi jumlah skor yang lebih tinggi
    if (rank == -1) {
      rank = low + 1;
    }

    hasil.add(rank);
  }

  return hasil;
}
