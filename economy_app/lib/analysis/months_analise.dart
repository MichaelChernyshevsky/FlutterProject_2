import 'dart:ffi';
import 'dart:io';

import 'package:project/models/money.dart';

Map<String, Map<String, Double>> analiseNameMonth(List<Money> months) {
  print(true);
  Map<String, Map<String, Double>> moneysTypesOnMonths = {};
  for (var element in months) {
    if (moneysTypesOnMonths.isEmpty) {
      moneysTypesOnMonths[element.wastedDate.toString()] = {
        
      };
    } else if (moneysTypesOnMonths.containsKey(element.wastedDate.toString())) {
      Map<String, Double> dataMap =
          moneysTypesOnMonths[element.wastedDate.toString()]
              as Map<String, Double>;
      if (!dataMap.containsKey(element.type.toString())) {
        dataMap[element.type.toString()] =
            (element.waste / element.dollar) as Double;
      } else {
        Double newWalue = (element.waste / element.dollar) as Double;
        Double oldWalue = dataMap[element.type.toString()] as Double;
        dataMap[element.type.toString()] = (oldWalue + newWalue) as Double;
      }
    }
  }
  
  return moneysTypesOnMonths;
}
