import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo e Nome
          Row(
            children: [
              const Icon(Icons.eco, color: Colors.green, size: 30),
              const SizedBox(width: 8),
              const Text(
                "Vegety",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          // Icone e Bottone
          Row(
            children: [
              const Icon(Icons.search, color: Colors.black54),
              const SizedBox(width: 20),
              const Icon(Icons.shopping_cart_outlined, color: Colors.black54),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text("Booking Now"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
