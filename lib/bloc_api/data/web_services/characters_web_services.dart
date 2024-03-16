import 'package:dio/dio.dart';
import 'package:my_subjects_lessons_2/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout:  const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try{
      Response response = await dio.get('character', /* queryParameters: {'paramName: ': name} */ );
      print(response.data["results"].toString());
      return response.data["results"];
    }catch(ex){
      print(ex.toString());
      return [];
    }
  }
}