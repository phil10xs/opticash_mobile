import 'dart:ui';

final appColor = PoColors();

class PoColors {
  static PoColors? _instance;

  factory PoColors() {
    return _instance ??= PoColors._internal();
  }

  PoColors._internal();

  // background: #46531F;
  final primary = const Color(0xff46531F);
  final secondary = const Color(0xff94C419);
  final newGrey = const Color(0xffF4F4F4);
  final secondary2 = const Color(0xffCDFF00);
  final tertiary = const Color(0xff749000);
  final white = const Color(0xffFFFFFF);
  final black = const Color(0xff0B0B0B);
  final subTextColor = const Color(0xff9E9E9E);
  final bodySmallColor = const Color(0xff273240);
  // background: #273240;
}
