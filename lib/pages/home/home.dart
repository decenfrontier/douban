import 'package:flutter/material.dart';

import '../../network/home_request.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: HomeContent(),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    super.initState();
    HomeRequest.requestMovieList(0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("首页内容"),
      ),
    );
  }
}
