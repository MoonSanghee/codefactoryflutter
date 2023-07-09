import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middlelevel/common/model/cursor_pagination_model.dart';
import 'package:middlelevel/common/provider/pagination_provider.dart';
import 'package:middlelevel/product/model/product_model.dart';
import 'package:middlelevel/product/repository/product_repository.dart';

final productProvider =
    StateNotifierProvider<ProductStateNotifier, CursorPaginationBase>((ref) {
  final repo = ref.watch(ProductRepositoryProvider);

  return ProductStateNotifier(repository: repo);
});

class ProductStateNotifier
    extends PaginationProvider<ProductModel, ProductRepository> {
  ProductStateNotifier({required super.repository});
}
