import 'package:flutter/material.dart';

void main() => runApp(const CatalogApp());

class CatalogApp extends StatelessWidget {
  const CatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Catalog',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const CatalogScreen(),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String imageUrl;
  final Color color;

  const Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.color,
  });
}

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  // Sample data
  final List<Product> products = const [
    Product(
      name: 'Coffee Mug',
      price: '\$12.99',
      imageUrl: 'https://picsum.photos/id/1/200/200',
      color: Colors.brown,
    ),
    Product(
      name: 'Notebook',
      price: '\$5.99',
      imageUrl: 'https://picsum.photos/id/2/200/200',
      color: Colors.blue,
    ),
    Product(
      name: 'Pen Set',
      price: '\$8.49',
      imageUrl: 'https://picsum.photos/id/3/200/200',
      color: Colors.green,
    ),
    Product(
      name: 'Backpack',
      price: '\$49.99',
      imageUrl: 'https://picsum.photos/id/4/200/200',
      color: Colors.red,
    ),
    Product(
      name: 'Headphones',
      price: '\$89.99',
      imageUrl: 'https://picsum.photos/id/5/200/200',
      color: Colors.grey,
    ),
    Product(
      name: 'Smart Watch',
      price: '\$199.99',
      imageUrl: 'https://picsum.photos/id/6/200/200',
      color: Colors.black,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalog')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(  // this creates a scrolable grid. the .builder is efficien in that it biulds the visible parts only
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,   // heignt vs width ratio
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemCount: products.length, // total products so flutter knows when to stop calling the item builder
          itemBuilder: (context, index) {   // better than loops in that it only builds what it needs (when its only visible to the screen)
            final product = products[index];
            return Card(
              color: product.color.withOpacity(0.1),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('You selected ${product.name}')),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.network(product.imageUrl, fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(product.price),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
