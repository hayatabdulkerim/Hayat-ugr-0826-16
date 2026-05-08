import 'dart:math';
import 'package:flutter/material.dart';
import '../services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String message = 'Press the button to make API request';

  Future<void> getSingleAlbum() async {
    int randomId = Random().nextInt(100) + 1;
    final album = await ApiService.getAlbum(randomId);

    setState(() {
      message = 'Fetched Album ${album.id}: ${album.title}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: getSingleAlbum,
              child: const Text('Fetch Album'),
            ),
            const SizedBox(height: 20),
            Text(message),
          ],
        ),
      ),
    );
  }
}
