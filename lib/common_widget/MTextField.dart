import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:npac/utils/theme_utils.dart';
import 'package:npac/widgets/space.dart';

class MTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final bool? enabled;
  final bool? readOnly;
  final TextEditingController? controller;
  final String? initalValue;
  final Widget? suffixIcon, prefixIcon, labelWidget;
  final Function(String)? onChanged, onFieldSubmitted;
  final MInputType type;
  final VoidCallback? onComplete;
  final String? label, hint;
  final int maxLines, minLines;
  final int? maxLength;
  final bool required, autoFocus;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;

  const MTextField(
      {super.key,
      this.enabled,
      this.readOnly,
      this.controller,
      this.initalValue,
      this.suffixIcon,
      this.prefixIcon,
      this.labelWidget,
      this.onChanged,
      this.onFieldSubmitted,
       this.type = MInputType.text,
      this.onComplete,
      this.label,
      this.hint,
       this.maxLines =2,
       this.minLines =1,
      this.maxLength,
       this.required = false,
       this.autoFocus =false,
      this.focusNode,
      this.textInputAction,
      this.onTap,
      this.onTapOutside, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      onTap: onTap,
      enabled: enabled,
      controller: controller,
      initialValue: initalValue,
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
      validator:validator ?? (s) {
        if (required && s!.isEmpty) return '$label is required.';
        if (type == MInputType.phone && s!.length != 10)
          return 'Invalid $label';
        if (type == MInputType.email) {
          bool valid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(s!);
          if (!valid) return 'Invalid $label';
        }
        return null;
      },
      maxLength: type == MInputType.phone ? 10 : maxLength,
      inputFormatters: [
        if (type == MInputType.numeric || type == MInputType.phone)
          FilteringTextInputFormatter.digitsOnly,
        if (type == MInputType.decimal)
          FilteringTextInputFormatter.allow(RegExp('[[0-9]|\\.|[0-9]]'))
      ],
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon != null
              ? Theme(
                  data: ThemeData(
                    iconTheme: IconThemeData(color: context.primary),
                  ),
                  child: prefixIcon ?? const Space(0))
              : null,
          contentPadding: minLines > 1
              ? const EdgeInsets.symmetric(horizontal: 15, vertical: 24)
              : null,
          label: labelWidget ?? Text(label ?? ''),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade500),
          counter: const SizedBox(
            height: 0,
          ),
          alignLabelWithHint: false),
    );
  }
}

enum MInputType {
  text,
  numeric,
  decimal,
  email,
  phone,
  password,
  visiblePassword
}

extension MInputTypeExtension on MInputType {
  TextInputType keyboardType() {
    switch (this) {
      case MInputType.text:
        return TextInputType.name;
      case MInputType.numeric:
        return TextInputType.number;
      case MInputType.decimal:
        return const TextInputType.numberWithOptions(decimal: true);
      case MInputType.email:
        return TextInputType.emailAddress;
      case MInputType.phone:
        return TextInputType.phone;
      case MInputType.password:
        return TextInputType.visiblePassword;
      case MInputType.visiblePassword:
        return TextInputType.visiblePassword;
    }
  }
}
