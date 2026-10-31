class Animo {
  final String nombre;
  final String emoji;
  final String descripcion;
  final List<String> peliculas;
  const Animo(this.nombre, this.emoji, this.descripcion, this.peliculas);
}

const animos = [
  Animo('Triste', '🌧️', 'Para sentir y sanar', [
    'Inside Out',
    'Coco',
    'La vida es bella',
    'Wonder',
  ]),
  Animo('Motivado', '🔥', 'Para seguir adelante', [
    'En busca de la felicidad',
    'Talentos ocultos',
    'Forrest Gump',
  ]),
  Animo('Pensativo', '🧠', 'Para cuestionar todo', [
    'El show de Truman',
    'WALL·E',
    'La sociedad de los poetas muertos',
    'Soul',
  ]),
  Animo('Alegre', '😄', 'Para sonreír y reflexionar', [
    'Zootopia',
    'Forrest Gump',
    'Soul',
  ]),
];
