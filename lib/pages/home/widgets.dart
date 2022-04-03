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
          SizedBox(
            height: 4,
          ),
          buildContent(),
          SizedBox(
            height: 4,
          ),
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

  // 内容
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentImage(),
        SizedBox(
          width: 8,
        ),
        buildContentInfo(),
      ],
    );
  }

  // 内容-图片
  Widget buildContentImage() {
    return ClipRRect(
      child: Image.network(
        movieItem.imageURL!,
        height: 150,
      ),
      borderRadius: BorderRadius.circular(6),
    );
  }

  // 内容-信息
  Widget buildContentInfo() {
    return Column(
      children: [
        buildContentInfoTitle(),
      ],
    );
  }

  // 内容-信息-标题
  Widget buildContentInfoTitle() {
    return Row(
      children: [
        Icon(
          Icons.play_circle_outline,
          color: Colors.redAccent,
          size: 24,
        ),
        Text(
          "${movieItem.title}",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "(${movieItem.playDate})",
          style: TextStyle(color: Color(0xFF666666)),
        ),
      ],
    );
  }
}
