import 'package:flutter/material.dart';

class FormFieldContent extends StatelessWidget {
  const FormFieldContent({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    required TextInputType keyboardType,
    required TextInputAction inputAction,
    required String label,
    required String hint,
    required Function(String value) Validator,
    this.isObscure = false,
    this.isCapitalized = false,
    this.maxLines = 1,
    this.isLabelEnabled = true,
    }):
      _keyboardType = keyboardType,
      _inputAction = inputAction,
      _label = label,
      _hint = hint,
      _validator = Validator,
      super(key: key);

    final TextInputType _keyboardType;
    final TextInputAction _inputAction;
    final String _label;
    final String _hint;
    final bool isObscure;
    final bool isCapitalized;
    final int maxLines;
    final bool isLabelEnabled;
    final Function(String) _validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: _keyboardType,
      obscureText: isObscure,
      textCapitalization:
      isCapitalized ? TextCapitalization.words : TextCapitalization.none,
      textInputAction: _inputAction,
      cursorColor: Colors.green,
      validator: (value) => _validator(value!),
      decoration: InputDecoration(
        labelText: isLabelEnabled ? _label : null,
        labelStyle: TextStyle(color: Colors.blueGrey),
        hintText: _hint,
        hintStyle: TextStyle(
          color: Colors.blueGrey,
        ),
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.lightGreenAccent,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.brown,
            width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
      ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: Colors.redAccent,
            width: 2,
      ),
      )
      )
    );
  }
}