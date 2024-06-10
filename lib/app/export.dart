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




void checkVal(List<String> val, String key, Function(bool) setStateCallback) {
  setStateCallback(val.contains(key));
}

void checkStringVal(String val, String key, Function(bool) setStateCallback) {
  setStateCallback(val.contains(key));
}




