import 'dart:convert';
import 'package:http/http.dart' as http;
import 'config.dart';

class Pelicula {
  final String titulo;
  final String sinopsis;
  final String? poster;
  final double calificacion;
  final String anio;

  Pelicula(this.titulo, this.sinopsis, this.poster, this.calificacion, this.anio);

  factory Pelicula.fromJson(Map<String, dynamic> j) {
    final fecha = (j['release_date'] ?? '') as String;
    return Pelicula(
      j['title'] ?? '',
      (j['overview'] ?? '').toString().isEmpty
          ? 'Sin sinopsis disponible.'
          : j['overview'],
      j['poster_path'] != null
          ? 'https://image.tmdb.org/t/p/w500${j['poster_path']}'
          : null,
      (j['vote_average'] ?? 0).toDouble(),
      fecha.length >= 4 ? fecha.substring(0, 4) : '',
    );
  }
}

class TmdbService {
  Future<Pelicula?> buscar(String titulo) async {
    final url = Uri.parse(
      'https://api.themoviedb.org/3/search/movie'
      '?api_key=$tmdbApiKey&language=es-MX&query=${Uri.encodeComponent(titulo)}',
    );
    final r = await http.get(url);
    if (r.statusCode != 200) {
      throw Exception('Error ${r.statusCode}. Revisa tu API key en config.dart');
    }
    final lista = jsonDecode(r.body)['results'] as List;
    return lista.isEmpty ? null : Pelicula.fromJson(lista.first);
  }
}
