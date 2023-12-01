import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class TextFieldWidget extends StatelessWidget {
  final String? title, hint, prefixIconPath, suffixString;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validation;
  final Color? borderColor, fillColor, textColor, hintColor, errorColor,focusedBorderColor;
  final EdgeInsets? contentPadding;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final FontWeight? fontWeight;
  final Widget? suffixIcon, prefixWidget;
  final BoxConstraints? suffixIconConstraints;
  final int? maxLength;
  final double? width;
  final bool? enabled, obscureText, read, showAsterik;
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final double? borderRadius, hintFontSize, fontSize, borderWidth;

  TextFieldWidget({
    this.hint,
    this.title,
    this.onTap,
    this.width,
    this.prefixWidget,
    this.onChanged,
    this.prefixIconPath,
    this.controller,
    this.validation,
    this.maxLines,
    this.borderRadius,
    this.borderColor,
    this.textColor,
    this.fontWeight,
    this.hintColor,
    this.fillColor,
    this.suffixString,
    this.errorColor,
    this.inputFormatters,
    this.enabled = true,
    this.obscureText = false,
    this.contentPadding,
    this.hintFontSize,
    this.fontSize,
    this.textInputType,
    this.suffixIcon,
    this.borderWidth,
    this.read = false,
    this.showAsterik = false,
    this.maxLength,
    this.focusedBorderColor,
    this.suffixIconConstraints,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Text(
              //   title ?? hint ?? '',
              //   style:  TextStyle(
              //     color: hintColor,
              //     fontWeight: FontWeight.w400,
              //     fontSize: 14,
              //   ),
              // ),
              if (showAsterik == true)
                Text(
                  ' *',
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: width,
          child: TextFormField(
            enabled: enabled,
            onChanged: onChanged,
            readOnly: read!,
            maxLength: maxLength,
            onTap: onTap,
            style: TextStyle(
              fontSize: fontSize ?? 14.0,
              color: textColor ?? Colors.black,
              fontWeight: fontWeight ?? FontWeight.w400,
            ),
            obscureText: obscureText!,
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.done,
            keyboardType: textInputType ?? TextInputType.text,
            cursorColor: Colors.black,
            validator: validation,
            inputFormatters: inputFormatters,
            maxLines: maxLines ?? 1,
            decoration: _inputDecoration(),
            onTapOutside: (_) =>
                FocusScope.of(context).requestFocus(FocusNode()),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      suffixIconConstraints: suffixIconConstraints,
      contentPadding: contentPadding ??
          const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      filled: true,
      fillColor: fillColor,
      isDense: false,
      isCollapsed: true,
      hintStyle: TextStyle(
        color: hintColor,
      ),
      errorStyle: TextStyle(
        color: errorColor ?? Colors.red,
        fontSize: 10.0,
      ),
      hintText: hint,
      errorMaxLines: 3,
      prefixIconConstraints: BoxConstraints(minWidth: 50, maxHeight: 50),
      prefixIcon: prefixWidget ??
          (prefixIconPath == null
              ? null
              : Image(
            width: 18,
            height: 18,
            image: AssetImage(prefixIconPath!),
          )),
      suffixIcon: suffixIcon ?? null,
      suffixText: suffixString ?? null,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth ?? 1.0,
          color: Colors.red,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? 12.0,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth ?? 1.0,
          color: borderColor ?? Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? 12.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth ?? 1.0,
          color: focusedBorderColor ?? Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? 12.0,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth ?? 1.0,
          color: borderColor ?? Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? 12.0,
        ),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: borderWidth ?? 1.0,
          color: borderColor ?? Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius ?? 12.0,
        ),
      ),
    );
  }
}
