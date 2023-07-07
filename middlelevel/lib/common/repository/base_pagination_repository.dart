import 'package:middlelevel/common/model/cursor_pagination_model.dart';
import 'package:middlelevel/common/model/mode_with_id.dart';
import 'package:middlelevel/common/model/pagination_params.dart';

abstract class IBasePaginationRepository<T extends IModelWithId> {
  Future<CursorPagination<T>> paginate({
    PaginationParams? paginationParams = const PaginationParams(),
  });
}
