import 'package:flutter/material.dart';
import 'colores.dart';
import 'pantalla_inicio.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recomendador de Películas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colores.fondo,
        colorScheme: const ColorScheme.dark(
          primary: Colores.violeta,
          secondary: Colores.durazno,
          surface: Colores.superficie,
        ),
      ),
      home: const PantallaInicio(),
    );
  }
}
