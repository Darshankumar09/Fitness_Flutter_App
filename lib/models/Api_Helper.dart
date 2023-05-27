import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practical_exam/models/fitness_model.dart';
import 'package:practical_exam/models/global.dart';

class APIHelper {
  APIHelper._();

  static APIHelper apiHelper = APIHelper._();

  Future<List<FitnessModel>?> fetchData(String name) async {
    String baseURl = "https://api.api-ninjas.com/v1/exercises?muscle=";
    String endURL = name;

    String api = baseURl + endURL;

    http.Response res = await http.get(Uri.parse(api),
        headers: {'X-Api-Key': 'QP/w/XYDImy39/9qFJMa6g==4THc505FivI5bp5T'});

    if (res.statusCode == 200) {
      List decodedData = jsonDecode(res.body);

      Global.fitnessData =
          decodedData.map((e) => FitnessModel.fromMap(data: e)).toList();
      return Global.fitnessData;
    }
    return null;
  }
}
