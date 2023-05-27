import 'package:flutter/material.dart';
import 'package:practical_exam/controller/providers/fitness_provider.dart';
import 'package:practical_exam/models/fitness_model.dart';
import 'package:practical_exam/models/global.dart';
import 'package:provider/provider.dart';

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
        future: Provider.of<FitnessProvider>(context).loadData(Global.muscle),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text("Error : ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<FitnessModel>? data = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: Global.searchController,
                      decoration: InputDecoration(
                        labelText: "Search muscle name",
                        border: const OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            Global.searchController.clear();
                          },
                          icon: const Icon(Icons.cancel),
                        ),
                      ),
                      onSubmitted: (val) {
                        if (val.isNotEmpty) {
                          Provider.of<FitnessProvider>(context, listen: false)
                              .search(val);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ...List.generate(
                      Global.fitnessData.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Card(
                          color: Colors.primaries[index % 18].shade100,
                          child: ListTile(
                            leading: Text(
                              "${index + 1}",
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            title: Text(
                                "Exercise : ${data![index].name}\nMuscle : ${data[index].muscle}\nType : ${data[index].type}\nEquipment : ${data[index].equipment}\nDifficulty :  ${data[index].difficulty}"),
                            subtitle: Text(
                                "\nInstructions : ${data[index].instructions}"),
                            // height: 300,
                            // width: MediaQuery.of(context).size.width,
                            // child: SingleChildScrollView(
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text("name : ${data![index].name}"),
                            //       Text("type : ${data[index].type}"),
                            //       Text("muscle : ${data[index].muscle}"),
                            //       Text("equipment : ${data[index].equipment}"),
                            //       Text("difficulty : ${data[index].difficulty}"),
                            //       Text(
                            //           "instructions : ${data[index].instructions}"),
                            //     ],
                            //   ),
                            // ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
