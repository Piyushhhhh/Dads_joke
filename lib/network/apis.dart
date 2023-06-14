import 'package:dads_joke/models/joke_search_result.dart';
import 'package:dio/dio.dart';

class API {
  Future<JokeSearchResult> getSearchedJokes(
      {int? pageId, String? query}) async {
    try {
      var response = await Dio().get(
        'https://icanhazdadjoke.com/search?',
        queryParameters: {
          'term': query == null ? '' : query.toString(),
          'page': pageId == null ? '1' : pageId.toString(),
          'limit': '10'.toString(),
        },
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );
      JokeSearchResult jokeSearchResult =
          JokeSearchResult.fromJson(response.data);
      return jokeSearchResult;
    } catch (e) {
      rethrow;
    }
  }
}
