import 'package:kuis_mobile_124240156/models/data.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Shoe shoe;

  const DetailScreen({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(shoe.shoeName)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  shoe.image,
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
                shoe.shoeName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                shoe.category,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 12),
              Text(
                shoe.price,
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              const Text(
                "Jumlah Produk",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const Text(
                "Ukuran",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              
              const Text(
                "Deskripsi",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                shoe.description,
                style: const TextStyle(color: Colors.black87, fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
