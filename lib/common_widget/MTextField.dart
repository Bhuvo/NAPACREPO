import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:npac/utils/theme_utils.dart';
import 'package:npac/widgets/space.dart';

class MTextField extends StatefulWidget {
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

   MTextField(
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
  State<MTextField> createState() => _MTextFieldState();
}

class _MTextFieldState extends State<MTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      enabled: widget.enabled,
      controller: widget.controller,
      initialValue: widget.initalValue,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      autofocus: widget.autoFocus,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      onEditingComplete: widget.onComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      onTapOutside: widget.onTapOutside,
      keyboardType: widget.type.keyboardType(),
      obscureText: widget.type == MInputType.password ? _obscureText : false,
      validator:widget.validator ?? (s) {
        if (widget.required && s!.isEmpty) return 'Field is required.';
        if (widget.type == MInputType.phone && s!.length != 10)
          return 'Invalid Phone Number';
        if (widget.type == MInputType.email) {
          bool valid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(s!);
          if (!valid) return 'Invalid Email Address';
        }
        return null;
      },
      maxLength: widget.type == MInputType.phone ? 10 : widget.maxLength,
      inputFormatters: [
        if (widget.type == MInputType.numeric || widget.type == MInputType.phone)
          FilteringTextInputFormatter.digitsOnly,
        if (widget.type == MInputType.decimal)
          FilteringTextInputFormatter.allow(RegExp('[[0-9]|\\.|[0-9]]'))
      ],
      decoration: InputDecoration(
          suffixIcon: widget.type == MInputType.password
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : widget.suffixIcon,
          prefixIcon: widget.prefixIcon != null
              ? Theme(
                  data: ThemeData(
                    iconTheme: IconThemeData(color: context.primary),
                  ),
                  child: widget.prefixIcon ?? const Space(0))
              : null,
          contentPadding: widget.minLines > 1
              ? const EdgeInsets.symmetric(horizontal: 15, vertical: 24)
              : null,
          label: widget.labelWidget ?? Text(widget.label ?? ''),
          hintText: widget.hint,
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
