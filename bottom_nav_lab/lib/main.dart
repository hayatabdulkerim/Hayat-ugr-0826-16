import 'package:flutter/material.dart';

void main() => runApp(const BottomNavApp());

class BottomNavApp extends StatelessWidget {
  const BottomNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bottom Navigation Demo')),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            // index 0
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            // index 1
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            // index 2
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,  // to highlight the selected tab
        onTap: onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('Go to Details'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DetailsScreen()),
          );
        },
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Go Back'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Your favorite items appear here.'));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('User profile information.'));
  }
}


// // same example with NavigationBar instead of BottomNavigationBar  (the more modern way)

// import 'package:flutter/material.dart';

// void main() => runApp(const ModernBottomNavApp());

// class ModernBottomNavApp extends StatelessWidget {
//   const ModernBottomNavApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Modern Bottom Nav',
//       theme: ThemeData(colorSchemeSeed: Colors.green, useMaterial3: true),
//       home: const MainScreen(),
//     );
//   }
// }

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int selectedIndex = 0;

//   final List<Widget> screens = const [
//     HomeScreen(),
//     FavoritesScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Modern Navigation')),
//       body: screens[selectedIndex],

//       bottomNavigationBar: NavigationBar(
//         selectedIndex: selectedIndex,
//         onDestinationSelected: (index) {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//         destinations: const [
//           NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
//           NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorites'),
//           NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: ElevatedButton(
//         child: const Text('Go to Details'),
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const DetailsScreen()),
//           );
//         },
//       ),
//     );
//   }
// }

// class DetailsScreen extends StatelessWidget {
//   const DetailsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Details')),
//       body: Center(
//         child: ElevatedButton(
//           child: const Text('Go Back'),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//     );
//   }
// }

// class FavoritesScreen extends StatelessWidget {
//   const FavoritesScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Your favorite items appear here.'));
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('User profile information.'));
//   }
// }
