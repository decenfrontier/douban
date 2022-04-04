import 'package:douban/widgets/dash_line.dart';
import 'package:douban/widgets/star_rating.dart';
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
          buildFooter(),
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
        SizedBox(
          width: 8,
        ),
        buildContentLine(),
        SizedBox(
          width: 8,
        ),
        buildContentWish(),
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
    return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildContentInfoTitle(),
            SizedBox(
              height: 8,
            ),
            buildContentInfoRating(),
            SizedBox(
              height: 8,
            ),
            buildContentInfoDesc(),
          ],
        ));
  }

  // 内容-信息-标题
  Widget buildContentInfoTitle() {
    return Text.rich(TextSpan(children: [
      WidgetSpan(
          // baseline: TextBaseline.ideographic,
          alignment: PlaceholderAlignment.middle,
          child: Icon(
            Icons.play_circle_outline,
            color: Colors.redAccent,
            size: 24,
          )),
      WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Text(
          "${movieItem.title}",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Text(
          "(${movieItem.playDate})",
          style: TextStyle(color: Color(0xFF666666)),
        ),
      )
    ]));
  }

  // 内容-信息-评分
  Widget buildContentInfoRating() {
    return FittedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StarRating(
            rating: movieItem.rating!,
            size: 18,
            selectedColor: Colors.orangeAccent,
          ),
          SizedBox(
            width: 6,
          ),
          Text("${movieItem.rating}"),
        ],
      ),
    );
  }

  // 内容-信息-描述
  Widget buildContentInfoDesc() {
    final generes = movieItem.genres!.join(" ");
    final directors = movieItem.director!.name;
    final actors = movieItem.casts!.map((e) => e.name).toList().join(" ");

    return Text(
      "$generes / $directors / $actors",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  // 内容-竖线
  Widget buildContentLine() {
    return Container(
      height: 100,
      child: DashedLine(
        axis: Axis.vertical,
        dashedWidth: 1,
        dashedHeight: 4,
        count: 15,
      ),
    );
  }

  // 内容-想看
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/home/wish.png",
            height: 40,
          ),
          Text(
            "想看",
            style: TextStyle(fontSize: 16, color: Colors.orangeAccent),
          )
        ],
      ),
    );
  }

  // 尾部
  Widget buildFooter() {
    return Container(
      child: Text("${movieItem.originalTitle}"),
      width: double.infinity,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Color(0xffe2e2e2),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
