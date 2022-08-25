import 'package:flutter/material.dart';
import 'package:test1111/MongoDBMain.dart';
import 'package:test1111/dbHelper/mongodb.dart';

class QueryDatabase extends StatefulWidget {
  QueryDatabase({Key? key}) : super(key: key);

  @override
  _QueryDatabaseState createState() => _QueryDatabaseState();
}

class _QueryDatabaseState extends State<QueryDatabase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: MongoDatabase.getQueryData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return displayData(
                        MongoDbModel.fromJson(snapshot.data[index]));
                  },
                );
              } else {
                return Center(
                  child: Text("Data not found"),
                );
              }
            }
          },
        ),
      ),
    );
  }

  Widget displayData(MongoDbModel data) {
    //var src12 = "https://drive.google.com/file/d/1u_9Jxej9f-stDf4wHuCtWFvMLiGFsLwu/view?usp=sharing";
    return Card(
      child: Column(
        children: [
          Text("Work Code: " "${data.workCode}"),
          Text("Accuracy: " "${data.accuracy}"),
          Text("MSE Officer Name: " "${data.mseName}"),
          Text("Panchayat: " "${data.Panchayat}"),
          Text("Time: " "${data.time}"),
          Text("Image: "),
          Image.network('https://drive.google.com/uc?id=${data.img}'),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
