import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size; // 每个图形的宽高
  final Color unselectedColor;
  final Color selectedColor;
  final Widget unselectedImage;
  final Widget selectedImage;

  StarRating(
      {required this.rating,
      this.maxRating = 10,
      this.count = 5,
      this.size = 30,
      this.unselectedColor = const Color(0xffbbbbbb),
      this.selectedColor = Colors.orange,
      Widget? unselectedImage,
      Widget? selectedImage})
      : this.unselectedImage = unselectedImage ??
            Icon(
              Icons.star,
              color: unselectedColor,
              size: size,
            ),
        this.selectedImage = selectedImage ??
            Icon(
              Icons.star,
              color: selectedColor,
              size: size,
            );

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildUnselectedStar(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectedStar(),
        ),
      ],
    );
  }

  // 构建满填充的star
  List<Widget> buildSelectedStar() {
    // star列表
    List<Widget> stars = [];
    // 先算出一个star值几分
    double oneValue = widget.maxRating / widget.count;
    // 填充整星
    int entireCount = (widget.rating / oneValue).floor();
    final star = Icon(
      Icons.star,
      color: widget.selectedColor,
      size: widget.size,
    );
    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }
    // 填充零星
    double leftCount = (widget.rating / oneValue) - entireCount;
    double leftSize = leftCount * widget.size;
    final part = ClipRect(
      child: star,
      clipper: StarClipper(leftSize),
    );
    stars.add(part);
    // 边界判断
    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }
    return stars;
  }

  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return Icon(Icons.star_border,
          color: widget.unselectedColor, size: widget.size);
    });
  }
}

class StarClipper extends CustomClipper<Rect> {
  double width;

  StarClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(StarClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}
