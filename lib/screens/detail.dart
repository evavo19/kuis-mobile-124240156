import 'package:kuis_mobile_124240156/models/data.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Menu menu;

  const DetailScreen({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(menu.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  menu.image,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.fastfood,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                menu.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                menu.category,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 12),
              Text(
                menu.price,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Deskripsi",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                menu.description,
                style: const TextStyle(color: Colors.black87, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
