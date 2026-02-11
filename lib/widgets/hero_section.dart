import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Metà sinistra: Testi e Bottone
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Healthy food\nto live a\nhealthier life",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Enjoy a healthy life by eating healthy foods\nthat have extraordinary flavors that make\nyour life healthier for today and in the future",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                ),
                child: const Text("Get Started"),
              ),
            ],
          ),
        ),
        // Metà destra: Immagine
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                'assets/plans/pexels-daniela-elena-tentis-118658-1213710.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
