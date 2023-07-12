import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouterpractice/layout/default_layout.dart';

class PopReturnScreen extends StatelessWidget {
  const PopReturnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              context.pop('Code Factory');
            },
            child: const Text('Pop'),
          ),
        ],
      ),
    );
  }
}
