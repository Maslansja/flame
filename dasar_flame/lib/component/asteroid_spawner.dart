import 'dart:async';  // Mengimpor pustaka untuk operasi asinkron
import 'dart:math' as math;  // Mengimpor pustaka matematik untuk menghasilkan angka acak

import 'package:dasar_flame/component/asteroid.dart';  // Mengimpor kelas Asteroid untuk membuat objek asteroid
import 'package:flame/components.dart';  // Mengimpor komponen Flame yang diperlukan untuk membuat komponen dalam game
import 'package:flame/experimental.dart';  // Mengimpor fitur eksperimental Flame seperti SpawnComponent

// Kelas AsteroidSpawner digunakan untuk memanage pembuatan asteroid dalam game
class AsteroidSpawner extends PositionComponent with HasGameRef {
  late SpawnComponent spawner;  // Deklarasi komponen spawn yang akan digunakan untuk membuat asteroid

  @override
  FutureOr<void> onLoad() {
    // Membuat objek Random untuk menghasilkan angka acak
    math.Random r = math.Random();

    // Membuat objek SpawnComponent yang mengelola spawn (kemunculan) asteroid
    spawner = SpawnComponent(
      factory: (idx) {
        // Fungsi factory untuk membuat asteroid baru dengan ukuran acak
        return Asteroid(ukuran: r.nextDouble() * 0.3 + 0.1);  // Ukuran asteroid acak antara 0.1 hingga 0.4
      },
      period: 0.5,  // Waktu interval antara setiap kemunculan asteroid (0.5 detik)
      autoStart: true,  // Secara otomatis memulai spawner begitu dimuat
      area: Rectangle.fromLTWH(0, 0, game.size.x, game.size.y),  // Area dimana asteroid akan dipanggil
      within: false,  // Menentukan apakah asteroid muncul di dalam area (false berarti di luar area juga bisa)
    );

    // Menambahkan komponen spawner ke dalam game
    gameRef.add(spawner);
    return super.onLoad();  // Memanggil onLoad dari PositionComponent untuk memastikan semuanya dimuat
  }
}
