import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final List<String> backStack = [];

extension NavigatorUtils on BuildContext{
  ///Used to push a route
  Future push(String name, [Object? args]){
    if(kDebugMode){
      print('push $name');
    }
    backStack.add(name);
    return Navigator.of(this).pushNamed(name, arguments: args);
  }
  ///Used to push a route
  Future pushDialog(String name, [Object? args]){
    if(kDebugMode){
      print('pushDialog $name');
    }
    return Navigator.of(this).pushNamed(name, arguments: args);
  }

  ///This method used to push a route without duplicate push, used in bottom navigation
  Future managedPush(String name, [Object? args]){

    if(backStack.contains(name)){
      Navigator.of(this).popUntil((route){
        final n = route.settings.name;
        if(n != name) {
          backStack.remove(n);
        }

        ///TODO: test in release build
        final b = n == name && Navigator.of(this).canPop();
        if(kDebugMode){
          print('pop until $name $b');
        }
        return b;
      });

      return Future(() => null);
    } else {
      if(kDebugMode){
        print('push until $name');
      }
      backStack.add(name);
      return Navigator.of(this).pushNamed(name, arguments: args);
    }

  }

  ///used to replace current route
  Future replace(String name, [Object? args]){
    if(backStack.isNotEmpty) {
      backStack.removeLast();
    }
    if(kDebugMode){
      print('replace $name');
    }
    backStack.add(name);
    return Navigator.of(this).pushReplacementNamed(name, arguments: args);
  }
  ///pops current route or dialog
  void pop([Object? result]){
    if(backStack.isNotEmpty && ModalRoute.of(this)?.settings.name != null) {
      backStack.removeLast();
    }
    if(kDebugMode){
      print('pop ${ModalRoute.of(this)?.settings.name}');
    }
    return Navigator.of(this).pop(result);
  }

  void popDialog([Object? result]){
    return Navigator.of(this).pop(result);
  }
  bool canPop(){
    return Navigator.of(this).canPop();
  }

  FutureOr<void> showSnackBar(String message) async {
    // if(!kIsWeb && Platform.isMacOS){
    //   ScaffoldMessenger.of(this).showSnackBar(SnackBar(
    //       behavior: SnackBarBehavior.floating,
    //       content: Text(message)));
    //   return;
    // }
    await Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.grey.shade300,
      textColor: Colors.black,
      fontSize: 16.0,
    );
    return;

  }

  ///pops all route until predicate callback returns true and push new route
  Future pushAndRemoveUntil(String name, bool Function(Route) predicate, [Object? args]) => Navigator.of(this).pushNamedAndRemoveUntil(name, predicate, arguments: args);
}