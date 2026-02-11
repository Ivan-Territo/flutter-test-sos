import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/dish.dart';

class PopularMenu extends StatefulWidget {
  const PopularMenu({super.key});

  @override
  State<PopularMenu> createState() => _PopularMenuState();
}

class _PopularMenuState extends State<PopularMenu> {
  final ApiService _apiService = ApiService();
  List<Piatto> _menuItems = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchMenu();
  }

  Future<void> _fetchMenu() async {
    try {
      final items = await _apiService.getMenu();
      if (mounted) {
        setState(() {
          _menuItems = items;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildDishCard(Piatto piatto) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  piatto.image,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 180,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: Icon(Icons.image_not_supported, color: Colors.grey[400]),
                    );
                  },
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        piatto.rating,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                piatto.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                '\$${piatto.price}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Piatto> displayItems = [];
    if (_menuItems.length >= 3) {
      // Copia i primi 3 piatti e sostituisci le loro immagini
      displayItems = [
        Piatto(id: _menuItems[0].id, name: _menuItems[0].name, price: _menuItems[0].price, rating: _menuItems[0].rating, image: 'assets/plans/pexels-mikhail-nilov-8245038.jpg'),
        Piatto(id: _menuItems[1].id, name: _menuItems[1].name, price: _menuItems[1].price, rating: _menuItems[1].rating, image: 'assets/plans/pexels-capturedbyaugustine-14630307.jpg'),
        Piatto(id: _menuItems[2].id, name: _menuItems[2].name, price: _menuItems[2].price, rating: _menuItems[2].rating, image: 'assets/plans/pexels-daniela-elena-tentis-118658-1213710.jpg'),
      ];
    }

    return Column(
      children: [
        const Text(
          'Our Popular Menu',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Made with premium ingredients',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 40),
        _isLoading
            ? const CircularProgressIndicator()
            : _menuItems.isEmpty
            ? const Text('Nessun piatto trovato.')
            : Wrap(
          spacing: 30,
          runSpacing: 30,
          alignment: WrapAlignment.center,
          children: displayItems.map((piatto) => _buildDishCard(piatto)).toList(),
        ),
        const SizedBox(height: 50),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Load more menu'),
              SizedBox(width: 8),
              Icon(Icons.play_arrow, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}