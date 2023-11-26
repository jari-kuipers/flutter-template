import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScaffold(child: HomeContent());
  }
}

class HomeScaffold extends StatelessWidget {
  final HomeContent child;

  const HomeScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.blue,
            alignment: Alignment.topLeft,
            child: const Text('1'),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                  alignment: Alignment.topLeft,
                  child: const Text('2'),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellow,
                  alignment: Alignment.topLeft,
                  child: const Text('3'),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.orange,
            alignment: Alignment.topLeft,
            child: const Text('4'),
          ),
        ),
      ].animate(interval: 100.ms).fadeIn(duration: 200.ms).slideX(),
    );
  }
}
