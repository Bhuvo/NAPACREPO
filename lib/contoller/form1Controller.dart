import 'package:get/get.dart';
import 'package:npac/Table%20Json/form1Json.dart';
import 'package:npac/model/form1Model.dart';

class form1Controller extends GetxController {
  Rx<form1> form = form1().obs;

  Future<void> getForm1() async{
      var result = form1.fromJson(form1Json);
      form.value = result;
      print(result.form1List);
  }

}