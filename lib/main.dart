import 'package:douban/pages/group/group.dart';
import 'package:douban/pages/home/home.dart';
import 'package:douban/pages/mall/mall.dart';
import 'package:douban/pages/profile/profile.dart';
import 'package:douban/pages/subject/subject.dart';
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
        primarySwatch: Colors.green, // 主题色
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent, // 按下时的水波纹
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
  int _cur_idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _cur_idx,
        children: [
          HomePage(),
          SubjectPage(),
          GroupPage(),
          MallPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cur_idx,
        selectedFontSize: 13,
        // 选中项字体大小
        unselectedFontSize: 13,
        // 未选中项字体大小
        type: BottomNavigationBarType.fixed,
        // 显示文字
        items: [
          buildBottomNavigationBarItem("首页", "home"),
          buildBottomNavigationBarItem("书影音", "subject"),
          buildBottomNavigationBarItem("小组", "group"),
          buildBottomNavigationBarItem("市集", "mall"),
          buildBottomNavigationBarItem("我的", "profile"),
        ],
        onTap: (index) {
          setState(() {
            _cur_idx = index;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(String title, name) {
    return BottomNavigationBarItem(
      label: title,
      icon: Image.asset(
        "assets/images/tabbar/$name.png",
        width: 30,
        gaplessPlayback: true,
      ),
      activeIcon: Image.asset(
        "assets/images/tabbar/${name}_active.png",
        width: 30,
        gaplessPlayback: true,
      ),
    );
  }
}
