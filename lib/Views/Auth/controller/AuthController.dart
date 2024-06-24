import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:npac/app/export.dart';
import 'package:npac/model/UserModel.dart';

class AuthController extends GetxController {

  Future<void> login(BuildContext context ,String Phone , String Password)async{
    var response = await http.post(Uri.parse('${Api.baseUrl}${Api.login}Username=${Phone}&Password=${Password}'));
    if(response.statusCode == 200){
     var result  = jsonDecode(response.body);
     if(result['Response_Code'] == 1){
       await SharePreferencesHelper.setUserString(SharePreferencesHelper.User, UserModel(id: result['User_Id'],isLogin: true));
       context.push(Routes.Home);
     }else if(result['Response_Code'] == 0){
       context.showSnackBar('Enter correct Phone or Password');
     }
    }else{
      context.showSnackBar('Error occurred while logging in');
    }
  }

}