import 'package:employee_app/src/ui/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomDefaultTextFormField extends StatelessWidget {
  final bool enabled;
  final String placeHolderString;
  final TextEditingController textController;
  final FocusNode ownFocusNode;
  final FocusNode nextFocusNode;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final int maxTextCount;
  final int multiLine;
  final bool isObscureText;
  final bool readOnly;
  final inputFormatters;
  final TextCapitalization textCapitalization;
  final Widget suffixIcon;
  Function validationFunc;

  CustomDefaultTextFormField({
    this.enabled = true,
    this.placeHolderString = '',
    this.textController,
    this.ownFocusNode,
    this.nextFocusNode,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.maxTextCount,
    this.multiLine,
    this.isObscureText = false,
    this.readOnly = false,
    this.inputFormatters,
    this.textCapitalization,
    this.suffixIcon,
    this.validationFunc,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      enabled: enabled,
      decoration: getInputDecoration(placeHolderString: placeHolderString),
      style: TextStyle(
        fontSize: 13,
      ),
      obscureText: isObscureText,
      cursorColor: Colour.silver,
      cursorWidth: 0.5,
      textInputAction: textInputAction,
      controller: textController,
      focusNode: ownFocusNode,
      keyboardType: textInputType,
      maxLength: maxTextCount,
      textCapitalization: textCapitalization ?? TextCapitalization.sentences,
      maxLines: multiLine != null ? multiLine : null,
      inputFormatters: inputFormatters,
      onFieldSubmitted: (_) {
        if (nextFocusNode != null) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        } else {
          FocusScope.of(context).unfocus();
        }
      },
      validator: validationFunc,
    );
  }

  InputDecoration getInputDecoration({String placeHolderString}){
    return InputDecoration(
      counterText: '',
      contentPadding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 8,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[800], width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[800], width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[800], width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      errorStyle: TextStyle(
        color: Colors.red,
        fontSize: 11,
        fontWeight: FontWeight.w400,
      ),
      labelText: placeHolderString ?? "",
      labelStyle: TextStyle(
        color: Colors.grey[800],
        fontSize: 13,
        fontWeight: FontWeight.w400,
      ),
      suffixIcon: suffixIcon,
    );
  }
}