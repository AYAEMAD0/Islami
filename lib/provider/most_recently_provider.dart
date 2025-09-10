import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/utils/shared_preferences_helper.dart';

class MostRecentlyProvider extends ChangeNotifier{
  List<int> mostRecentlyList = [];


  void readMostRecently()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> value =prefs.getStringList(KeySharedPreference.mostRecentlyKey)??[];
    mostRecentlyList=value.map((element)=>int.parse(element)).toList();
    notifyListeners();
  }
}