import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foode/presentation/widgets/space.dart';
import 'package:foode/utils/theme_utils.dart';

enum MInputType{
  text, numeric, decimal, email, phone, password, visiblePassword
}

extension MInputTypeExtension on MInputType {
  TextInputType keyboardType(){
    switch(this){
      case MInputType.text: return TextInputType.name;
      case MInputType.numeric: return TextInputType.number;
      case MInputType.decimal: return const TextInputType.numberWithOptions(decimal: true);
      case MInputType.email: return TextInputType.emailAddress;
      case MInputType.phone: return TextInputType.phone;
      case MInputType.password: return TextInputType.visiblePassword;
      case MInputType.visiblePassword: return TextInputType.visiblePassword;
    }
  }
}

class MTextField extends StatelessWidget {
  final bool? enabled;
  final bool? readonly;
  final TextEditingController? controller;
  final String? initalValue;
  final Widget? suffixIcon, prefixIcon, labelWidget;
  final Function(String)? onChanged, onFieldSubmitted;
  final MInputType type;
  final VoidCallback? onComplete;
  final String? label, hint, value;
  final int maxLines, minLines;
  final int? maxLength;
  final bool required, autoFocus;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function()? ontap;
  final void Function(PointerDownEvent)? onTapOutside;
  const MTextField({this.controller,this.label,
    this.maxLines = 1, this.minLines = 1,
    this.focusNode,
    this.onComplete,
    this.onTapOutside,
    this.textInputAction,
    this.onFieldSubmitted,
    this.autoFocus = false,
    this.maxLength,
    this.initalValue,
    this.value, this.hint, this.type = MInputType.text, Key? key,this.labelWidget, this.onChanged, this.suffixIcon, this.prefixIcon, this.required = true, this.enabled = true, this.ontap, this.readonly = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly!,
      onTap: ontap,
      enabled: enabled,
      controller: controller,
      initialValue: initalValue ?? value,
      maxLines: maxLines,
      minLines: minLines,
      autofocus: autoFocus,
      onChanged: onChanged,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onEditingComplete: onComplete,
      onFieldSubmitted: onFieldSubmitted,
      onTapOutside: onTapOutside,
      keyboardType: type.keyboardType(),
      obscureText: type == MInputType.password,
      validator: (s){
        if(required && s!.isEmpty) return '$label is required.';
        if(type == MInputType.phone && s!.length != 10) return 'Invalid $label';
        if(type == MInputType.email){
          bool valid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(s!);
          if(!valid) return 'Invalid $label';
        }
        return null;
      },

      maxLength: type == MInputType.phone ? 10 : maxLength,
      inputFormatters: [
        if(type == MInputType.numeric || type == MInputType.phone)FilteringTextInputFormatter.digitsOnly,
        if(type == MInputType.decimal)FilteringTextInputFormatter.allow(RegExp('[[0-9]|\\.|[0-9]]'))
      ],
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon!= null ? Theme(data: ThemeData(
            iconTheme: IconThemeData(
              color: context.primary
            ),
            ),child: prefixIcon ?? const Space(0)) : null,

        contentPadding: minLines > 1 ? const EdgeInsets.symmetric(horizontal: 15, vertical: 24) : null,
        label: labelWidget ?? Text(label ?? ''),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
        counter: const SizedBox(height: 0,),
        alignLabelWithHint: false
      ),
    );
  }
}
