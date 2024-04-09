import 'package:flutter/material.dart';
import 'package:kayle/Infrastructure/Constants/color_constant.dart';
import 'package:kayle/Infrastructure/Constants/text_style_constant.dart';

commonTextField(
    {required BuildContext context,
    required String hint,
    bool obscureText = false,
    bool showOnFocusBorder = false,
    bool showBorder = true,
    bool addPadding = false,
    bool isDense = true,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool? suffixIconSpace,
    FocusNode? focusNode,
    bool readOnly = false,
    FormFieldValidator<String>? validator,
    TextCapitalization? textCapitalization,
    ValueChanged<String>? onChanged,
    void Function(String?)? onFieldSubmitted,
    Function()? onEditingComplete,
    GestureTapCallback? onTap,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
    int maxLine = 1,
    int minLine = 1,
    TextAlignVertical? textAlignVertical = TextAlignVertical.center,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    required TextEditingController controller}) {
  return Container(
    decoration: BoxDecoration(
        boxShadow: MediaQuery.of(context).platformBrightness == Brightness.dark
            ? []
            : [
                BoxShadow(
                    color: ThemeColors.primary(context).withOpacity(0.1),
                    blurRadius: 25,
                    offset: const Offset(0, 4),
                    spreadRadius: 1)
              ]),
    child: TextFormField(
      validator: validator,
      keyboardType: textInputType ?? TextInputType.text,
      obscuringCharacter: "*",
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      obscureText: obscureText,
      maxLines: maxLine,
      minLines: minLine,
      onFieldSubmitted: onFieldSubmitted,
      style: textStyle ??
          TextStyleConstant.commonStyle(
              context: context, fontWeight: FontWeight.w400, fontSize: 14),
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      onChanged: onChanged,
      textInputAction: textInputAction ?? TextInputAction.done,
      textAlignVertical: textAlignVertical ?? TextAlignVertical.bottom,
      decoration: InputDecoration(
          isDense: isDense,
          prefixIconConstraints: const BoxConstraints(
              minWidth: 26 + 20,
              maxWidth: 26 + 20,
              minHeight: 18,
              maxHeight: 18),
          suffixIconConstraints: const BoxConstraints(
              minWidth: 26 + 20,
              maxWidth: 26 + 20,
              minHeight: 18,
              maxHeight: 18),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: ThemeColors.inversePrimary(context),
          errorStyle: TextStyleConstant.commonStyle(
              context: context,
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.redAccent),
          focusedBorder: showBorder
              ? (showOnFocusBorder
                  ? enabledBorder(context)
                  : customBorder(context))
              : InputBorder.none,
          enabledBorder:
              showBorder ? (customBorder(context)) : InputBorder.none,
          disabledBorder:
              showBorder ? (customBorder(context)) : InputBorder.none,
          border: showBorder ? customBorder(context) : InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          hintText: hint,
          hintStyle: TextStyleConstant.commonStyle(
              color: ThemeColors.secondary(context),
              fontSize: 14,
              fontWeight: FontWeight.w300,
              context: context)),
      focusNode: focusNode,
    ),
  );
}

customBorder(BuildContext context) {
  return OutlineInputBorder(
      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(25));
}

enabledBorder(BuildContext context) {
  return OutlineInputBorder(
      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(12));
}
