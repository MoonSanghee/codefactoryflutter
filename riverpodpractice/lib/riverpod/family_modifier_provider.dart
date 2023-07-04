import 'package:flutter_riverpod/flutter_riverpod.dart';

final familModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(const Duration(seconds: 2));

  return List.generate(5, (index) => index * data);
});
