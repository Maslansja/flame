import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';

class Ship extends SpriteComponent {
  late Vector2 tujuan; //untuk menyimpan koordinat ketika kita mengklik/tap bagian dari layar, yang akan menjadi tujuan akhir dari ship
  late Vector2 arah; //untuk menyimpan arah pergerakan kapal
  double speed = 3.0; //kecepatan pergerakan kapal

  @override
  Ship() {
    arah = Vector2(0, 0); //memberikan nilai awal arah, jika tidak diberi maka akan muncul eror
    tujuan = position; //set tujuan awal ke posisi kapal saat ini
  }

  void setTujuan(DragUpdateInfo info){
    tujuan = info.eventPosition.global; //proses penyimpanan koordinat
    lookAt(tujuan); //mengarahkan kapal menuju tujuan
    angle += pi; //mengubah sudut kapal 180 derajat untuk menghadap tujuan
    arah = tujuan - position; //menghitung vektor arah menuju tujuan
    arah = arah.normalized(); //membuat pergerakan per satuan
  }

  @override
  FutureOr<void> onLoad() async {
    sprite = Sprite(await Flame.images.load("ships/spaceShips_001.png")); //memuat sprite kapal
    position = Vector2(100, 100); //mengatur posisi awal kapal
    angle = -pi / 2; //mengatur sudut awal kapal (menghadap ke atas)
    anchor = Anchor.center; //mengatur titik jangkar ke pusat kapal
  }

  @override
  void update(double dt) {
    if((tujuan-position).length < speed) {
      position = tujuan; //jika sudah dekat dengan tujuan, set posisi ke tujuan
      arah = Vector2(0, 0); //reset arah menjadi nol
    }
    position.add(arah * speed); //update posisi kapal berdasarkan arah dan kecepatan
    super.update(dt); //memanggil fungsi update dari superclass
  }
}