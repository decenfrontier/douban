import 'package:flutter/material.dart';

class MallPage extends StatelessWidget {
  const MallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mall"),
      ),
      body: MallContent(),
    );
  }
}

class MallContent extends StatefulWidget {
  const MallContent({Key? key}) : super(key: key);

  @override
  State<MallContent> createState() => _MallContentState();
}

class _MallContentState extends State<MallContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Mall"),
    );
  }
}
