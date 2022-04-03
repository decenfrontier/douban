import 'package:douban/models/home_models.dart';

import 'http_request.dart';

class HomeRequest {
  // 获取电影top列表
  Future<List<MovieItem>> getMovieTopList(int start) async {
    String movieURL = "/movie_list";
    // 发送请求
    final result = await HttpRequest.request(movieURL);
    final subjects = result['subjects'];
    // 将map转为model
    List<MovieItem> movies = [];
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }
    return movies;
  }
}
