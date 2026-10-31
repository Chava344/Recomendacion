import 'package:flutter/material.dart';
import 'animos.dart';
import 'colores.dart';
import 'tmdb_service.dart';

class PantallaResultado extends StatefulWidget {
  final Animo animo;
  const PantallaResultado({super.key, required this.animo});

  @override
  State<PantallaResultado> createState() => _PantallaResultadoState();
}

class _PantallaResultadoState extends State<PantallaResultado> {
  final _servicio = TmdbService();
  late Future<Pelicula?> _futuro;
  late List<String> _titulos;
  int _indice = 0;

  @override
  void initState() {
    super.initState();
    _titulos = List.of(widget.animo.peliculas)..shuffle();
    _futuro = _servicio.buscar(_titulos[_indice]);
  }

  void _otra() {
    setState(() {
      _indice = (_indice + 1) % _titulos.length;
      _futuro = _servicio.buscar(_titulos[_indice]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colores.fondo,
        foregroundColor: Colores.crema,
        elevation: 0,
        title: Text('${widget.animo.emoji}  ${widget.animo.nombre}'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<Pelicula?>(
                  future: _futuro,
                  builder: (context, snap) {
                    if (snap.connectionState != ConnectionState.done) {
                      return const Center(
                          child: CircularProgressIndicator(
                              color: Colores.durazno));
                    }
                    if (snap.hasError) {
                      return Center(
                          child: Text('${snap.error}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colores.crema)));
                    }
                    final p = snap.data;
                    if (p == null) {
                      return const Center(
                          child: Text('No se encontró la película 😕',
                              style: TextStyle(color: Colores.crema)));
                    }
                    return _TarjetaPelicula(p: p);
                  },
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton.icon(
                  onPressed: _otra,
                  icon: const Icon(Icons.casino_rounded),
                  label: const Text('Otra película'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colores.violeta,
                    foregroundColor: Colores.crema,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TarjetaPelicula extends StatelessWidget {
  final Pelicula p;
  const _TarjetaPelicula({required this.p});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Colores.degradado,
        borderRadius: BorderRadius.circular(28),
      ),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        child: Column(
          children: [
            if (p.poster != null)
              Image.network(p.poster!,
                  height: 380, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p.titulo,
                      style: const TextStyle(
                          color: Colores.crema,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('⭐ ${p.calificacion.toStringAsFixed(1)}   ${p.anio}',
                      style: const TextStyle(
                          color: Colores.fondo, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  Text(p.sinopsis,
                      style: const TextStyle(color: Colores.fondo, height: 1.4)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
