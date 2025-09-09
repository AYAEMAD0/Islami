
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class KeySharedPreference{
  static const String mostRecentlyKey='most_recently';
}

class SharedPreferenceHelper{

  void saveMostRecently(int newMostRecently)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
       List<String> valueMost =prefs.getStringList(KeySharedPreference.mostRecentlyKey)??[];

       //remove because duplicate
       if(valueMost.contains('$newMostRecently')){
         valueMost.remove('$newMostRecently');
       }
       valueMost.insert(0,'$newMostRecently');

       // length 5 only
       if(valueMost.length >5){
         valueMost=valueMost.sublist(0,5);
         //valueMost.removeLast()
       }
       await prefs.setStringList(KeySharedPreference.mostRecentlyKey,valueMost);
  }


  Future<List<int>> readMostRecently()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> value =prefs.getStringList(KeySharedPreference.mostRecentlyKey)??[];
    List<int> mostRecentlyListInt=value.map((element)=>int.parse(element)).toList();
    //mostRecentlyListInt.reverse.toList()
    return mostRecentlyListInt;
  }

}