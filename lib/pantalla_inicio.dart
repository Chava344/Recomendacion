import 'package:flutter/material.dart';
import 'animos.dart';
import 'colores.dart';
import 'pantalla_resultado.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('¿Cómo te sientes hoy?',
                  style: TextStyle(
                      color: Colores.crema,
                      fontSize: 26,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Text('Películas que cambian tu forma de pensar',
                  style: TextStyle(color: Colores.durazno, fontSize: 14)),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: animos.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, i) {
                    final a = animos[i];
                    return InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PantallaResultado(animo: a)),
                      ),
                      child: Container(
                        height: 110,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          gradient: Colores.degradado,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(a.nombre,
                                      style: const TextStyle(
                                          color: Colores.crema,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Text(a.descripcion,
                                      style: const TextStyle(
                                          color: Colores.fondo, fontSize: 13)),
                                ],
                              ),
                            ),
                            Text(a.emoji, style: const TextStyle(fontSize: 44)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
