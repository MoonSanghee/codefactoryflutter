// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _RestaurantRepository implements RestaurantRepository {
  _RestaurantRepository(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CursorPagination<RestaurantModel>> paginate() async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'accessToken': 'true'};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CursorPagination<RestaurantModel>>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CursorPagination<RestaurantModel>.fromJson(
      result.data!,
      (json) => RestaurantModel.fromJson(json as Map<String, dynamic>),
    );
    return value;
  }

  @override
  Future<RestaurantDetailModel> getRestaurantDetail({required id}) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final headers = <String, dynamic>{r'accessToken': 'true'};
    headers.removeWhere((k, v) => v == null);
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RestaurantDetailModel>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/${id}',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RestaurantDetailModel.fromJson(result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
