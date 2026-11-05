# Tes Problem Solving - GITS Indonesia

Repository ini berisi solusi pengerjaan 3 soal tes problem solving menggunakan bahasa pemrograman Dart.

---

## Daftar Soal dan Solusi

### 1. Soal 1: A000124 of Sloane’s OEIS

- **File:** `bin/soal_1.dart`
- **Deskripsi:** Menghasilkan deret A000124 (Central Polygonal Numbers / Lazy Caterer's Sequence) berdasarkan input integer dinamis dengan rumus:
  $$a(n) = a(n-1) + i, \quad a(0) = 1$$
- **Format Input Terminal:**
  - Baris 1: Angka bulat `n` (jumlah angka dalam deret).
- **Contoh Test Case:**
  - **Case 1 (Sampel Soal):**
    - Input:
      ```text
      7
      ```
    - Output: `1-2-4-7-11-16-22`
  - **Case 2:**
    - Input:
      ```text
      5
      ```
    - Output: `1-2-4-7-11`
  - **Case 3:**
    - Input:
      ```text
      10
      ```
    - Output: `1-2-4-7-11-16-22-29-37-46`

---

### 2. Soal 2: Dense Ranking

- **File:** `bin/soal_2.dart`
- **Deskripsi:** Menentukan peringkat skor permainan arcade menggunakan aturan Dense Ranking (skor yang sama mendapat peringkat yang sama tanpa melompati nomor peringkat berikutnya).
- **Kompleksitas dan Optimasi:**
  - **Deduplikasi Leaderboard:** O(N) single-pass (memanfaatkan data pemain yang sudah terurut menurun).
  - **Pencarian Ranking:** O(log N) menggunakan Binary Search pada array terurut menurun.
- **Format Input Terminal (4 Baris):**
  - Baris 1: Bilangan bulat `jumlahPemain` (jumlah pemain di leaderboard).
  - Baris 2: Daftar skor pemain terurut menurun dipisah spasi.
  - Baris 3: Bilangan bulat `jumlahGame` (jumlah permainan yang diikuti GITS).
  - Baris 4: Daftar skor yang didapat GITS dipisah spasi.
- **Contoh Test Case:**
  - **Case 1 (Sampel Soal):**
    - Input:
      ```text
      7
      100 100 50 40 40 20 10
      4
      5 25 50 120
      ```
    - Output: `6 4 2 1`
  - **Case 2:**
    - Input:
      ```text
      6
      100 90 90 80 75 60
      5
      50 65 77 90 102
      ```
    - Output: `6 5 4 2 1`
  - **Case 3:**
    - Input:
      ```text
      3
      100 50 20
      4
      10 20 50 100
      ```
    - Output: `4 3 2 1`

---

### 3. Soal 3: Highest Palindrome

- **File:** `bin/soal_3.dart`
- **Deskripsi:** Menemukan nilai palindrom tertinggi yang bisa dibentuk dari string angka dengan batas maksimal `k` perubahan digit.
- **Batasan dan Aturan:**
  - Mengeluarkan output `-1` jika string tidak dapat dibentuk menjadi palindrom dalam kuota `k` perubahan, atau string tidak merepresentasikan angka (mengandung huruf/simbol non-digit).
  - Tidak menggunakan fungsi pencarian atau filter bawaan.
  - Tanpa perulangan (`for` / `while`), mengimplementasikan rekursif murni untuk penyamaan palindrom, maksimasi ke digit '9', dan validasi karakter angka.
- **Format Input Terminal (2 Baris):**
  - Baris 1: String angka (bisa dengan format `string: <angka>` atau langsung `<angka>`).
  - Baris 2: Kuota perubahan `k` (bisa dengan format `k: <angka>` atau langsung `<angka>`).
- **Contoh Test Case:**
  - **Case 1 (Sampel 1):**
    - Input:
      ```text
      string: 3943
      k: 1
      ```
    - Output: `3993`
  - **Case 2 (Sampel 2):**
    - Input:
      ```text
      string: 932239
      k: 2
      ```
    - Output: `992299`
  - **Case 3 (Kasus Kuota Kurang):**
    - Input:
      ```text
      string: 0011
      k: 1
      ```
    - Output: `-1`

---

## Cara Menjalankan Program

### 1. Eksekusi Per File

```bash
# Soal 1
dart run bin/soal_1.dart

# Soal 2
dart run bin/soal_2.dart

# Soal 3
dart run bin/soal_3.dart
```

### 2. Menu Interaktif

```bash
dart run
```

---

## Dokumentasi Screenshot Output

Bukti tangkapan layar terminal disimpan di dalam folder `screenshots/`:

```text
screenshots/
├── soal_1.png
├── soal_2.png
└── soal_3.png
```
