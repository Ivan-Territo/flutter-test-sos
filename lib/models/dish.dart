class Piatto {
  final String id;
  final String name;
  final String price;
  final String rating;
  final String image;

  Piatto({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.image,
  });

  factory Piatto.fromMap(Map<String, dynamic> map) {
    // Gestiamo sia le chiavi in italiano (dal vecchio modello) che quelle in inglese
    final String rawImage = map['url_immagine'] ?? map['image'] ?? '';
    // Se l'immagine è un URL completo o vuota, gestiscila, altrimenti assumi sia un nome file in assets
    final String imagePath = rawImage.isNotEmpty ? 'assets/plans/$rawImage' : 'assets/plans/placeholder.png';

    return Piatto(
      id: map['id']?.toString() ?? '',
      name: map['piatto'] ?? map['name'] ?? 'Nome non disponibile',
      price: map['prezzo']?.toString() ?? map['price']?.toString() ?? '0.0',
      rating: map['rating']?.toString() ?? '4.5',
      image: imagePath,
    );
  }
}
