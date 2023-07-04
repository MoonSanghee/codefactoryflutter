import 'package:flutter/material.dart';
import 'package:riverpodpractice/layout/default_layout.dart';
import 'package:riverpodpractice/screen/auto_dispose_modifier_screen.dart';
import 'package:riverpodpractice/screen/family_modifier_screen.dart';
import 'package:riverpodpractice/screen/futuer_provider_screen.dart';
import 'package:riverpodpractice/screen/listen_provider_screen.dart';
import 'package:riverpodpractice/screen/provider_screen.dart';
import 'package:riverpodpractice/screen/select_provider_screen.dart';
import 'package:riverpodpractice/screen/state_notifier_provider_screen.dart';
import 'package:riverpodpractice/screen/state_provider_screen.dart';
import 'package:riverpodpractice/screen/stream_provider_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: 'HomeScreen',
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StateProviderScreen(),
                ),
              );
            },
            child: const Text(
              'StateProviederScreen',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StateNotifierProviderScreen(),
                ),
              );
            },
            child: const Text(
              'StateNotifierProviderScreen',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FutureProviderScreen(),
                ),
              );
            },
            child: const Text(
              'FutureProviderScreen',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const StreamProviderScreen(),
                ),
              );
            },
            child: const Text(
              'StreamProviderScreen',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const FamilyModifierScreen(),
                ),
              );
            },
            child: const Text(
              'FamilyModifierScreen',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const AutoDisposeModefireScreen(),
                ),
              );
            },
            child: const Text(
              'AutoDisposeModefireScreen',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ListenProviderScreen(),
                ),
              );
            },
            child: const Text(
              'ListenProviderScreen',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SelectProviderScreen(),
                ),
              );
            },
            child: const Text(
              'SelectProviderScreen',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ProviderScreen(),
                ),
              );
            },
            child: const Text(
              'ProviderScreen',
            ),
          ),
        ],
      ),
    );
  }
}
