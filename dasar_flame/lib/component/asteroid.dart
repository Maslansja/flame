import 'dart:async'; // Digunakan untuk operasi asinkron seperti memuat sprite
import 'package:flame/components.dart'; // Mengimpor komponen Flame yang diperlukan untuk bekerja dengan sprite dan game components

// Kelas Asteroid mewarisi SpriteComponent untuk menggambar asteroid sebagai sprite dalam game
class Asteroid extends SpriteComponent with HasGameRef {
  // Variabel ukuran untuk mengatur ukuran asteroid
  double ukuran = 0.5;

  // Konstruktor untuk membuat asteroid dengan ukuran yang ditentukan
  Asteroid({required this.ukuran}) {
    scale = Vector2(ukuran, ukuran);  // Mengatur skala asteroid berdasarkan ukuran yang diberikan
  }

  // onLoad() dipanggil ketika asteroid dimuat dalam game
  @override
  FutureOr<void> onLoad() async {
    // Memuat sprite (gambar) yang akan digunakan untuk asteroid
    sprite = await game.loadSprite("meteor/spaceMeteors_001.png");

    // Mengatur anchor ke titik tengah asteroid (posisi referensi untuk rotasi dan penempatan)
    anchor = Anchor.center;

    // Tidak perlu mengubah scale karena sudah diatur di konstruktor
    // scale = Vector2(0.5, 0.5); // Bisa dihapus karena sudah diatur saat konstruksi
  }
}
