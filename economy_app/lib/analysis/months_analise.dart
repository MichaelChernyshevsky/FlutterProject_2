import 'package:project/models/money.dart';

Map<String, List<Money>> analiseMonth(List<Money> months) {
  print(true);
  Map<String, List<Money>> analisedmonths = {};
  analisedmonths[months[0].wastedDate.toString()]?.add(months[0]);
  for (var element in months) {
    if (analisedmonths.containsKey(element.wastedDate.toString())) {
      analisedmonths[element.wastedDate.toString()]?.add(element);
    } else {
      analisedmonths[element.wastedDate.toString()] = [element];
    }
  }
  print(analisedmonths);
  return analisedmonths;
}
