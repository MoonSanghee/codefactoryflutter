import 'package:json_annotation/json_annotation.dart';

part 'cursor_pagination_model.g.dart';

@JsonSerializable(
  genericArgumentFactories: true,
)
class CursorPagination<T> {
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
