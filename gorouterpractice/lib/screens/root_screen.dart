import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouterpractice/layout/default_layout.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
              onPressed: () {
                context.go('/basic');
              },
              child: const Text('Go Basic')),
          ElevatedButton(
              onPressed: () {
                context.goNamed('named_screen');
              },
              child: const Text('Go Named')),
          ElevatedButton(
              onPressed: () {
                context.go('/push');
              },
              child: const Text('Go Push')),
          ElevatedButton(
              onPressed: () {
                context.go('/pop');
              },
              child: const Text('Go Pop')),
        ],
      ),
    );
  }
}
