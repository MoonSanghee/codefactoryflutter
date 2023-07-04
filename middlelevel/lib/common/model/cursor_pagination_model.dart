import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination_model.g.dart';

abstract class CursorPaginationBase {}

class CursorPaginationsError extends CursorPaginationBase {
  final String message;

  CursorPaginationsError({
    required this.message,
  });
}

class CursorPaginationLoading extends CursorPaginationBase {}

@JsonSerializable(
  genericArgumentFactories: true,
)
class CursorPagination<T> extends CursorPaginationBase {
  final CursorPagintionMeta meta;
  final List<T> data;

  CursorPagination({
    required this.meta,
    required this.data,
  });

  factory CursorPagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CursorPaginationFromJson(json, fromJsonT);
}

@JsonSerializable()
class CursorPagintionMeta {
  final int count;
  final bool hasMore;

  CursorPagintionMeta({
    required this.count,
    required this.hasMore,
  });

  factory CursorPagintionMeta.fromJson(Map<String, dynamic> json) =>
      _$CursorPagintionMetaFromJson(json);
}

class CursorPaginationRefetching extends CursorPagination {
  CursorPaginationRefetching({
    required super.meta,
    required super.data,
  });
}
// 새로고침 할 때

class CursorPaginationFetchingMore extends CursorPagination {
  CursorPaginationFetchingMore({
    required super.meta,
    required super.data,
  });
}
// 리스트의 맨 아래로 내려서
// 추가 데이터를 요청하는 중