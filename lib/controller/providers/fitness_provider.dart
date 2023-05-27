import 'package:flutter/cupertino.dart';
import 'package:practical_exam/models/Api_Helper.dart';
import 'package:practical_exam/models/fitness_model.dart';
import 'package:practical_exam/models/global.dart';

class FitnessProvider extends ChangeNotifier {
  search(String val) {
    Global.muscle = val;
    notifyListeners();
  }

  Future<List<FitnessModel>?> loadData(String name) {
    Future<List<FitnessModel>?> data = APIHelper.apiHelper.fetchData(name);
    return data;
  }
}
