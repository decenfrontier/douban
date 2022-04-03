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
          Text("111"),
          Text("222"),
          Text("333"),
        ],
      ),
    );
  }
}
