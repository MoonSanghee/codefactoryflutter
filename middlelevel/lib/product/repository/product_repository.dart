import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middlelevel/common/const/data.dart';
import 'package:middlelevel/common/dio/dio.dart';
import 'package:middlelevel/common/model/cursor_pagination_model.dart';
import 'package:middlelevel/common/model/model_with_id.dart';
import 'package:middlelevel/common/model/pagination_params.dart';
import 'package:middlelevel/common/repository/base_pagination_repository.dart';
import 'package:middlelevel/product/model/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'product_repository.g.dart';

final ProductRepositoryProvider = Provider<ProductRepository>(
  (ref) {
    final dio = ref.watch(dioProvider);

    return ProductRepository(dio, baseUrl: 'http://$ip/product');
  },
);

@RestApi()
abstract class ProductRepository
    implements IBasePaginationRepository<ProductModel> {
  factory ProductRepository(Dio dio, {String baseUrl}) = _ProductRepository;

  @GET('/')
  @Headers({'accessToken': 'true'})
  @override
  Future<CursorPagination<ProductModel>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}
