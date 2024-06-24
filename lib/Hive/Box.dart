import 'package:npac/Views/MothersList/MotherListModel.dart';
import 'package:hive/hive.dart';

class Boxes{
  static Box<MotherListModel>? mothorlist;


 static init() async {
   Hive.registerAdapter(MotherListModelAdapter());
    mothorlist = await Hive.openBox('MotherList');
  }

}