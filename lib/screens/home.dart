import 'package:kuis_mobile_124240156/models/data.dart';
import 'package:kuis_mobile_124240156/screens/detail.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1. untuk nangkep ketikan di kolom Search
  final TextEditingController _searchController = TextEditingController();

  // 2. buat nampung hasil pencarian
  List<Shoe> _filteredShoe = [];

  @override
  void initState() {
    super.initState();
    // awalan dibuka, tampilkan semua menu
    _filteredShoe = shoeCatalog;
  }

  // 3. untuk menyaring (filter) menu berdasarkan ketikan user
  void _filterShoe(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredShoe = shoeCatalog;
      } else {
        _filteredShoe = shoeCatalog
            .where(
              (shoeCatalog) => shoeCatalog.shoeName.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterShoe, // manggil fungsi penyaring saat diketik
              decoration: InputDecoration(
                hintText: "Cari Favoritemu...",
                prefixIcon: const Icon(Icons.search, color: Colors.purple),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Colors.grey),
                        onPressed: () {
                          _searchController.clear();
                          _filterShoe('');
                        },
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.purple.shade200),
                ),
              ),
            ),
          ),

          Expanded(
            child: _filteredShoe.isEmpty
                ? const Center(
                    child: Text(
                      "Sepatu yang Kamu Cari Gak Ada, Maaf yaa :)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredShoe.length,
                    itemBuilder: (context, index) {
                      final shoeCatalog = _filteredShoe[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(shoe: shoeCatalog,),
                            ),
                          );
                        },
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            shoeCatalog.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                  width: 50,
                                  height: 50,
                                  color: Colors.grey[300],
                                  child: const Icon(
                                    Icons.fastfood,
                                    color: Colors.grey,
                                  ),
                                ),
                          ),
                        ),
                        title: Text(
                          shoeCatalog.shoeName,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text("${shoeCatalog.price}"),
                        trailing: const Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
