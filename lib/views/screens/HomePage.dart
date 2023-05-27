import 'package:flutter/material.dart';
import 'package:practical_exam/models/Api_Helper.dart';
import 'package:practical_exam/models/fitness_model.dart';
import 'package:practical_exam/models/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fitness App"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<FitnessModel>? data = snapshot.data;
            ListView.builder(
              itemCount: Global.fitnessData.length,
              itemBuilder: (context, index) => Container(
                height: 300,
                width: 400,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("name : ${data![index].name}"),
                      Text("type : ${data![index].type}"),
                      Text("muscle : ${data![index].muscle}"),
                      Text("equipment : ${data![index].equipment}"),
                      Text("difficulty : ${data![index].difficulty}"),
                      Text("instructions : ${data![index].instructions}"),
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
