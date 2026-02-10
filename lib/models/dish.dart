class Dish {
  // TODO: Aggiungi qui le variabili della classe
  // Suggerimento: guarda la struttura JSON nel README.md

  Dish() {
    // TODO: Inizializza le variabili della classe usando i parametri del costruttore
  }

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      piatto: json['piatto'],
      categoria: json['categoria'],
      prezzo: json['prezzo'].toDouble(),
      ingredienti: List<String>.from(json['ingredienti']),
      isVegan: json['is_vegan'],
      disponibile: json['disponibile'],
      urlImmagine: json['url_immagine'],
    );
  }
}
