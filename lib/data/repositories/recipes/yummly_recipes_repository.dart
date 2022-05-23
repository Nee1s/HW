import 'package:dio/dio.dart';
import 'package:hw/constants/constants.dart' as consts;
import 'package:hw/data/dtos/recipes/yummly_json_recipes_dto.dart';
import 'package:hw/data/mappers/recipes/yummly_json_mapper.dart';
import 'package:hw/domain/content_model.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RecipesRepository {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

  Future<RecipesContentModel?> loadData({
    String searchTags = '',
    required int start,
    required int count,
  }) async {
    try {
      final Response<dynamic> response = await _dio.get<List<dynamic>>(
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

      final json = response.data as Map<String, dynamic>;
      final ContentDTO dto = ContentDTO.fromJson(json);
      final RecipesContentModel model = dto.toDomain();

      return model;
    } on DioError catch (error) {
      // todo отправка в Firebase Crashlytics

      final statusCode = error.response?.statusCode;
      //showErrorDialog(context, error: statusCode?.toString() ?? '');
      return null;
    }
  }
}
