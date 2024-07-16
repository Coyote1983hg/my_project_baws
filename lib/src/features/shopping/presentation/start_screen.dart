import 'package:flutter/material.dart';
import 'package:my_project_baws/src/features/authentification/presentation/signin_screen.dart';
import 'package:my_project_baws/src/features/shopping/presentation/home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 5)).then((_) => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen())));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('We are here for you !'),
      ),
      body: Stack(
        children: [
          const AnimatedWawbaws(),
          Positioned(
            right: 16,
            bottom: 16,
            child: TextButton(
              onPressed: () {
                // Navigare către HomePage
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: const Text(
                'Go to Home',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Adăugăm o clasă simplă pentru HomePage
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: const Center(
        child: Text('Welcome to the Home Page!'),
      ),
    );
  }
}

class AnimatedWawbaws extends StatefulWidget {
  const AnimatedWawbaws({super.key});

  @override
  _AnimatedWawbawsState createState() => _AnimatedWawbawsState();
}

class _AnimatedWawbawsState extends State<AnimatedWawbaws>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllersWelcome;
  late List<AnimationController> _controllersTo;
  late List<AnimationController> _controllersWawbaws;
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
  ];

  @override
  void initState() {
    super.initState();
    _controllersWelcome = List.generate(
      'Welcome'.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      )..repeat(reverse: true),
    );
    _controllersTo = List.generate(
      'to'.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      )..repeat(reverse: true),
    );
    _controllersWawbaws = List.generate(
      'Wawbaws'.length,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 1500),
        vsync: this,
      )..repeat(reverse: true),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllersWelcome) {
      controller.dispose();
    }
    for (var controller in _controllersTo) {
      controller.dispose();
    }
    for (var controller in _controllersWawbaws) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 'Welcome'.split('').asMap().entries.map((entry) {
              int idx = entry.key;
              String char = entry.value;
              return AnimatedBuilder(
                animation: _controllersWelcome[idx],
                builder: (context, child) {
                  return Transform.scale(
                    scale: 0.5 + 1.0 * _controllersWelcome[idx].value,
                    child: Text(
                      char,
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: colors[idx % colors.length],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 'to'.split('').asMap().entries.map((entry) {
              int idx = entry.key;
              String char = entry.value;
              return AnimatedBuilder(
                animation: _controllersTo[idx],
                builder: (context, child) {
                  return Transform.scale(
                    scale: 0.5 + 1.0 * _controllersTo[idx].value,
                    child: Text(
                      char,
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: colors[idx % colors.length],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 'Wawbaws'.split('').asMap().entries.map((entry) {
              int idx = entry.key;
              String char = entry.value;
              return AnimatedBuilder(
                animation: _controllersWawbaws[idx],
                builder: (context, child) {
                  return Transform.scale(
                    scale: 0.5 + 1.0 * _controllersWawbaws[idx].value,
                    child: Text(
                      char,
                      style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                        color: colors[idx % colors.length],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
