import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: 0,
        children: [],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 显示文字
        items: [
          buildBottomNavigationBarItem("首页", "home"),
          buildBottomNavigationBarItem("书影音", "subject"),
          buildBottomNavigationBarItem("小组", "group"),
          buildBottomNavigationBarItem("市集", "mall"),
          buildBottomNavigationBarItem("我的", "profile"),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(String title, name) {
    return BottomNavigationBarItem(
      label: title,
      icon: Image.asset(
        "assets/images/tabbar/$name.png",
        width: 30,
      ),
      activeIcon: Image.asset(
        "assets/images/tabbar/${name}_active.png",
        width: 30,
      ),
    );
  }
}
