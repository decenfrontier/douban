import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Subject"),
      ),
      body: SubjectContent(),
    );
  }
}

class SubjectContent extends StatefulWidget {
  const SubjectContent({Key? key}) : super(key: key);

  @override
  State<SubjectContent> createState() => _SubjectContentState();
}

class _SubjectContentState extends State<SubjectContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Subject"),
    );
  }
}
