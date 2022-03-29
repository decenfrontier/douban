import 'package:douban/models/home_models.dart';

import 'http_request.dart';

class HomeRequest {
  static void requestMovieList(int start) async {
    const movieURL = "http://101.42.134.18:8080/movie_list";
    final result = await HttpRequest.request(movieURL);
    final subjects = result['subjects'];
    // 将map转为model
    List<MovieItem> movies = [];
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }
    print(movies);
  }
}
