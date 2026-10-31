import 'package:flutter/material.dart';

class Colores {
  static const fondo = Color(0xFF15122B);
  static const superficie = Color(0xFF241E4A);
  static const violeta = Color(0xFF7B5CE0);
  static const durazno = Color(0xFFF7C28B);
  static const crema = Color(0xFFFFF4E6);

  static const degradado = LinearGradient(
    colors: [violeta, durazno],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
