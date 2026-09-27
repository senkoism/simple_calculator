// bin/main.dart
// Program utama: menangani input/output dan alur interaksi dengan pengguna.

import 'dart:io';
import 'package:pab/kalkulator.dart';

void main() {
  final kalkulator = Kalkulator();
  bool lanjut = true;

  print('=== Selamat Datang di Aplikasi Kalkulator Sederhana ===');

  while (lanjut) {
    double bilangan1 = bacaBilangan('Masukkan bilangan pertama: ');
    double bilangan2 = bacaBilangan('Masukkan bilangan kedua  : ');
    int pilihan = bacaPilihanOperasi();

    double hasil;
    try {
      switch (pilihan) {
        case 1:
          hasil = kalkulator.tambah(bilangan1, bilangan2);
          print('Hasil: $bilangan1 + $bilangan2 = $hasil');
          break;
        case 2:
          hasil = kalkulator.kurang(bilangan1, bilangan2);
          print('Hasil: $bilangan1 - $bilangan2 = $hasil');
          break;
        case 3:
          hasil = kalkulator.kali(bilangan1, bilangan2);
          print('Hasil: $bilangan1 * $bilangan2 = $hasil');
          break;
        case 4:
          hasil = kalkulator.bagi(bilangan1, bilangan2);
          print('Hasil: $bilangan1 / $bilangan2 = $hasil');
          break;
        default:
          print('Operasi tidak dikenali.');
      }
    } catch (e) {
      print('Terjadi kesalahan: $e');
    }

    lanjut = tanyaLanjut();
  }

  print('Terima kasih telah menggunakan aplikasi kalkulator. Sampai jumpa!');
}

/// Membaca input bilangan dari pengguna dengan validasi.
/// Akan terus meminta input sampai pengguna memasukkan angka yang valid.
double bacaBilangan(String label) {
  while (true) {
    stdout.write(label);
    String? input = stdin.readLineSync();
    double? nilai = double.tryParse(input ?? '');

    if (nilai == null) {
      print('Input tidak valid! Harap masukkan angka yang benar.');
    } else {
      return nilai;
    }
  }
}

/// Menampilkan menu operasi dan membaca pilihan pengguna dengan validasi.
int bacaPilihanOperasi() {
  while (true) {
    print('\nPilih operasi yang diinginkan:');
    print('[1] Tambah');
    print('[2] Kurang');
    print('[3] Kali');
    print('[4] Bagi');
    stdout.write('Masukkan pilihan (1-4): ');

    String? input = stdin.readLineSync();
    int? pilihan = int.tryParse(input ?? '');

    if (pilihan == null || pilihan < 1 || pilihan > 4) {
      print('Pilihan tidak valid! Harap masukkan angka 1-4.');
    } else {
      return pilihan;
    }
  }
}

/// Menanyakan kepada pengguna apakah ingin melakukan perhitungan lagi.
bool tanyaLanjut() {
  while (true) {
    stdout.write('\nApakah Anda ingin menghitung lagi? (Y/T): ');
    String? input = stdin.readLineSync()?.trim().toUpperCase();

    if (input == 'Y') {
      return true;
    } else if (input == 'T') {
      return false;
    } else {
      print('Input tidak valid! Harap masukkan "Y" atau "T".');
    }
  }
}
