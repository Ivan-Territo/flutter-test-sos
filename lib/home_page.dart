import 'package:flutter/material.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/popular_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Column(
            children: [
              const Navbar(),
              const SizedBox(height: 40),
              SizedBox(
                height: 550,
                child: const HeroSection(),
              ),
              const SizedBox(height: 80),
              const PopularMenu(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}