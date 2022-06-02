import 'package:dio/dio.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/data/dtos/recipes/yummly_json_recipes_dto.dart';
import 'package:hw/data/mappers/recipes/yummly_json_recipes_mapper.dart';
import 'package:hw/domain/content_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptors/interceptor.dart';

class RecipesRepository {
  RecipesRepository({required this.onErrorHandler}) {
    _dio = Dio()
      ..interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
        ErrorInterceptor(onErrorHandler),
      ]);
  }

  late final Dio _dio;
  final Function(String, String) onErrorHandler;

  Future<RecipesContentModel?> loadData({
    String searchTags = '',
    required int start,
    required int count,
  }) async {
    final Response<dynamic> response = await _dio.get<Map<String, dynamic>>(
      consts.linkAllRecipes,
      queryParameters: <String, dynamic>{
        'limit': count.toString(),
        'start': start.toString(),
        'tag': searchTags,
      },
      options: Options(
        method: 'GET',
        //receiveTimeout: 7000,
        headers: {
          consts.prefixHost: consts.hostUrl,
          consts.prefixApiKey: consts.apiKey,
        },
      ),
    );

    final json = response.data; // as Map<String, dynamic>;
    final ContentDTO dto = ContentDTO.fromJson(json);
    final RecipesContentModel model = dto.toDomain();

    return model;
  }

  Future<RecipesContentModel?> searchData({
    required String search,
    required int start,
    required int count,
  }) async {
    final Response<dynamic> response = await _dio.get<Map<String, dynamic>>(
      consts.linkSearchRecipes,
      queryParameters: <String, dynamic>{
        'start': start.toString(),
        'max': count.toString(),
        'q': search,

        ///возможно в дальнейшем...
        // 'meatyMin': meatMin,
        // 'meatyMax': meatMax,
        // 'saltyMin': saltMin,
        // 'saltyMax': saltMax,
        // 'piquantMin': spicyMin,
        // 'piquantMax': spicyMax,
        // 'sweetMin': sweetMin,
        // 'sweetMax': sweetMax,
        // 'FATMax' fatMax,
        // 'SUGARMax' : sugarMax,
        // 'allowedAttribute' : tags,
      },
      options: Options(
        method: 'GET',
        receiveTimeout: 7000,
        headers: {
          consts.prefixHost: consts.hostUrl,
          consts.prefixApiKey: consts.apiKey,
        },
      ),
    );

    final Map<String, dynamic> json = response.data;
    final ContentDTO dto = ContentDTO.fromJson(json);
    final RecipesContentModel model = dto.toDomain();

    return model;
  }
}
