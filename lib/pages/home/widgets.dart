import 'package:flutter/material.dart';

import '../../models/home_models.dart';

class HomeMovieItem extends StatelessWidget {
  const HomeMovieItem({Key? key, required this.movieItem}) : super(key: key);
  final MovieItem movieItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 8, color: Color(0xffdddddd)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(),
          Text("222"),
          Text("333"),
        ],
      ),
    );
  }

  // 头部排名
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        "No.${movieItem.rank}",
        style: TextStyle(fontSize: 14, color: Color.fromARGB(255, 131, 95, 36)),
      ),
    );
  }
}
