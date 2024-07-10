import 'package:intl/intl.dart';

export 'package:flutter/cupertino.dart';
export 'package:npac/common_widget/MAppBar.dart';
export 'package:npac/common_widget/MFormBody.dart';
export 'package:npac/common_widget/MRowTextRadioWidget.dart';
export 'package:npac/common_widget/MTextField.dart';
export 'package:npac/common_widget/MSmallText.dart';
export 'package:npac/common_widget/TwoTextField.dart';
export 'package:npac/common_widget/MrowTextDatePicker.dart';
export 'package:npac/common_widget/MrowTextOptionPickerwidget.dart';
export 'package:npac/common_widget/MrowTextTextfieldWidget.dart';
export 'package:npac/common_widget/MRowTextCheckBox.dart';
export 'package:npac/widgets/m_scaffold.dart';
export 'package:npac/widgets/space.dart';
export 'package:npac/Const/List.dart';
export 'package:npac/common_widget/MDivider.dart';
export 'package:npac/common_widget/MFilledButton.dart';
export 'package:npac/common_widget/MText.dart';
export 'package:npac/Forms/FormE/Widget/FormE2Common.dart';
export 'package:npac/Forms/FormH/widget/FormH3Common.dart';
export 'package:npac/Route/routes.dart';
export 'package:npac/utils/navigator_utils.dart';
export 'package:npac/common_widget/MRowTextWidget.dart';
export 'package:flutter/foundation.dart';
export 'package:npac/API/api.dart';
export 'package:npac/SharedPreference/sharedPreference_helper.dart';
export 'package:npac/common_widget/MRowTextSingleOption.dart';
export 'package:get/get.dart';
export 'package:npac/common_widget/SingleImageViewer.dart';



var apiHeader = {
  'Content-Type': 'application/json'
};

String calculateAge(DateTime dob) {
  print('coming inside');
  DateTime currentDate = DateTime.now();

  int age = currentDate.year - dob.year;
  int month1 = currentDate.month;
  int month2 = dob.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = dob.day;
    if (day2 > day1) {
      age--;
    }
  }
  print('Age is $age');

  return age.toString();
}



Map<String, dynamic> removeNulls(Map<String, dynamic> original) {
  return Map.fromEntries(original.entries.where((entry) => entry.value != null));
}


DateTime? stringToDate(String dateString) {
  if(dateString == ''||dateString.isEmpty) return null;
  DateTime date = DateFormat("dd/MM/yyyy").parse(dateString);
  return date;
}

String dateToString(DateTime date) {
  String dateString ='${date.day}/${date.month}/${date.year}';
  return dateString;
}

void checkVal(List<String> val, String key, Function(bool) setStateCallback) {
  setStateCallback(val.contains(key));
}

void checkStringVal(String val, String key, Function(bool) setStateCallback) {
  setStateCallback(val.contains(key));
}




