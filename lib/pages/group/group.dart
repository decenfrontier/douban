import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Group"),
      ),
      body: GroupContent(),
    );
  }
}

class GroupContent extends StatefulWidget {
  const GroupContent({Key? key}) : super(key: key);

  @override
  State<GroupContent> createState() => _GroupContentState();
}

class _GroupContentState extends State<GroupContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Group"),
    );
  }
}
