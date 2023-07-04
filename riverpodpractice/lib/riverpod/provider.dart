import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpodpractice/model/shopping_item_model.dart';
import 'package:riverpodpractice/riverpod/state_notifier_provider.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);

    if (filterState == FilterState.all) {
      return shoppingListState;
    }
    return shoppingListState
        .where((element) => filterState == FilterState.Spicy
            ? element.isSpicy
            : !element.isSpicy)
        .toList();
  },
);

enum FilterState {
  notSpicy,
  // 안 매움
  Spicy,
  // 매움
  all,
  // 전부
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
