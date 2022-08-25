import 'package:flutter/material.dart';
import 'package:test1111/dbHelper/mongodb.dart';
import 'package:test1111/display.dart';
import 'package:test1111/insert.dart';
import 'package:test1111/query.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: QueryDatabase(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(body: SafeArea(child: Text("Hello")));
  }
}

