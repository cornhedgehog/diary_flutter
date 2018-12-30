import 'package:flutter/material.dart';
import 'package:diary_flutter/question_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Typography.englishLike2018,
      ),
      home: QuestionPage(title: 'Flutter Demo Home Page'),
    );
  }
}
